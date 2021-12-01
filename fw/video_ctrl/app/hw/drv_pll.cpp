#include "drv_pll.h"
#include "hil.h"
#include "xprintf.h"
#ifdef DEBUG
#include "shell.h"
#endif
#include "utils.h"
#include <cstring>

#define PLL_CTRL_BASE_ADDR 0x20
#define PLL_UPDATE_OFFSET 0x11

typedef union
{
    struct
    {
        // byte 0
        uint32_t lfc        : 2;
        uint32_t lfr        : 5;
        uint32_t vco        : 1;
        // byte 1
        uint32_t cp         : 2;
        uint32_t n_odd      : 1;
        uint32_t n_bp       : 1;
        uint32_t m_odd      : 1;
        uint32_t m_bp       : 1;
        uint32_t c0_odd     : 1;
        uint32_t c0_bp      : 1;
        // byte 2
        uint32_t c1_odd     : 1;
        uint32_t c1_bp      : 1;
        uint32_t c2_odd     : 1;
        uint32_t c2_bp      : 1;
        uint32_t c3_odd     : 1;
        uint32_t c3_bp      : 1;
        uint32_t c4_odd     : 1;
        uint32_t c4_bp      : 1;
        // byte 4
        uint32_t n_high     : 8;
        uint32_t n_low      : 8;
        uint32_t m_high     : 8;
        uint32_t m_low      : 8;
        uint32_t c0_high    : 8;
        uint32_t c0_low     : 8;
        uint32_t c1_high    : 8;
        uint32_t c1_low     : 8;
        uint32_t c2_high    : 8;
        uint32_t c2_low     : 8;
        uint32_t c3_high    : 8;
        uint32_t c3_low     : 8;
        uint32_t c4_high    : 8;
        uint32_t c4_low     : 8;
    };
    uint32_t    dw[5];
    uint8_t     bt[20];
} pll_regs_t;

uint32_t _pll_n, _pll_m, _pll_c, _pll_freq;
int32_t _pll_dist;

#define PLL_ODD(val) ((val==0) ? (uint32_t)0 : (((val%2)==0) ? (uint32_t)0 : (uint32_t)1))
#define PLL_BP(val) ((val==0) ? (uint32_t)1 : (uint32_t)0)
#define PLL_HI(val) ((val%2)==0 ? (val/2) : ((val/2)+1))
#define PLL_LO(val) (val/2)
#define CALC_PLL_CONST(n, m, c0, c1, c2, c3, c4) \
    PLL_ODD(n), PLL_BP(n), PLL_ODD(m), PLL_BP(m), PLL_ODD(c0), PLL_BP(c0), \
    PLL_ODD(c1), PLL_BP(c1), PLL_ODD(c2), PLL_BP(c2), PLL_ODD(c3), PLL_BP(c3), \
    PLL_ODD(c4), PLL_BP(c4), PLL_HI(n), PLL_LO(n), PLL_HI(m), PLL_LO(m), \
    PLL_HI(c0), PLL_LO(c0), PLL_HI(c1), PLL_LO(c1), PLL_HI(c2), PLL_LO(c2), \
    PLL_HI(c3), PLL_LO(c3), PLL_HI(c4), PLL_LO(c4)

static const struct
{
    int32_t    freq_khz;
    pll_regs_t  regs;
} pll_table[] = 
{
    /*freq    c  r  vco cp                 N   M  C0  C1  C2  C3  C4 */
    148438, { 0, 27, 0, 0, CALC_PLL_CONST( 4, 95,  4,  0,  0,  0,  0)},
};

#define PLL_TABLE_SIZE (sizeof(pll_table) / sizeof(pll_table[0]))

void CPLL::init()
{
    //
}

void CPLL::set_freq(uint32_t freq)
{
    /*int32_t best_dist = 100 * 1000;
    uint32_t best_idx = 0;
    for (uint32_t i=0 ; i<PLL_TABLE_SIZE ; ++i)
    {
        int32_t dist = freq - pll_table[i].freq_khz;
        if (dist < best_dist)
        {
            best_dist = dist;
            best_idx = i;
        }
        if (dist == 0)
        {
            break;
        }
    }*/
    find_best(freq);
    set_pll_regs();
    update_pll();
}

void CPLL::set_pll_regs()
{
    pll_regs_t  regs =
    {
     /* c  r  vco cp                     N       M       C0       C1  C2  C3  C4 */
        0, 27, 0, 0, CALC_PLL_CONST(_pll_n, _pll_m,  _pll_c,  _pll_c*2,  0,  0,  0)
    };
    HIL::pl_set_registers(PLL_CTRL_BASE_ADDR, reinterpret_cast<uint8_t*>(&regs.dw[0]), 17);
}

void CPLL::update_pll()
{
    HIL::pl_set_registers(PLL_CTRL_BASE_ADDR + PLL_UPDATE_OFFSET, nullptr, 1);
}

#define PLL_MAX_N 512
#define PLL_MAX_M 512
#define PLL_MAX_C 512
#define PLL_VCO_MIN (600 * 1000)
#define PLL_VCO_MAX (1200 * 1000)
#define PLL_OUT_MAX 402500
#define PLL_INPUT (25 * 1000)

void CPLL::find_best(uint32_t freq)
{
    int32_t best_dist = 100 * 1000 * 1000;
    int32_t prev_dist;
    uint32_t best_n = 1;
    uint32_t best_m = 1;
    uint32_t best_c = 1;
    bool best_finded = false;
    for (uint32_t n=1 ; n<=PLL_MAX_N && !best_finded ; ++n)
    {
        uint32_t pll_post_n = PLL_INPUT / n;
        uint32_t min_m = PLL_VCO_MIN / pll_post_n;
        uint32_t max_m = (PLL_VCO_MAX / pll_post_n) + 1;
        if (max_m > PLL_MAX_M)
        {
            max_m = PLL_MAX_M;
        }
        for (uint32_t m=min_m ; m<=max_m && !best_finded ; ++m)
        {
            uint32_t vco_out = pll_post_n * m;
            prev_dist = 100 * 1000 * 1000;
            uint32_t c_start = (freq / vco_out);
            if (c_start > 3)
            {
                c_start = 1;
            }
            if (c_start < 2)
            {
                c_start = 2;
            }
            for (uint32_t c=c_start ; c<=PLL_MAX_C && !best_finded ; c+=2)
            {
                uint32_t freq_out = vco_out / c;
                int32_t dist = freq_out - freq;
                if (dist < 0)
                {
                    dist *= -1;
                }
                if (dist > prev_dist)
                {
                    // miss the target, try to next M/N
                    break;
                }
                if (dist < best_dist)
                {
                    best_dist = dist;
                    best_n = n;
                    best_m = m;
                    best_c = c;
                    _pll_freq = freq_out;
                }
                if (dist == 0)
                {
                    best_finded = true;
                }
                prev_dist = dist;
            }
        }
    }
    _pll_n = best_n;
    _pll_m = best_m;
    _pll_c = best_c;
    _pll_dist = best_dist;
#ifdef DEBUG
    xprintf("Finded frequence: %d(KHz) (difference=%d)\nPLL paramaters: N=%d M=%d C=%d\n",
        _pll_freq, _pll_dist, _pll_n, _pll_m, _pll_c);
#endif
}

#ifdef DEBUG
status_e pll_find(uint32_t argc, char * const argv[])
{
    if (argc != 2)
    {
        return STATUS_INV_PAR;
    }
    uint32_t freq = Shell::get_num(argv[1]);
    uint32_t tick_start = Utils::get_tick();
    CPLL::find_best(freq);
    uint32_t tick_end = Utils::get_tick();
    xprintf("Finded frequence: %d(KHz) (difference=%d)\nPLL paramaters: N=%d M=%d C=%d\nTime: %d\n",
        _pll_freq, _pll_dist, _pll_n, _pll_m, _pll_c, tick_end - tick_start);
    return STATUS_OK;
}

SHELL_COMMAND(pll_find, "<freq>", pll_find);
#endif
