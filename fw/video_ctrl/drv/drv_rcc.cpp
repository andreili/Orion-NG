#include "drv_rcc.h"
#include "utils.h"
#include "drv_flash.h"

uint32_t CRCC::m_core_clock;

static constexpr std::uint32_t DBP_TIMEOUT_VALUE            = 100U;
static constexpr std::uint32_t HSE_TIMEOUT_VALUE 			= 100;
static constexpr std::uint32_t LSE_TIMEOUT_VALUE			= 5000;
static constexpr std::uint32_t CLOCKSWITCH_TIMEOUT_VALUE    = 5000;
static constexpr std::uint32_t HSI_TIMEOUT_VALUE            = 2U;
static constexpr std::uint32_t LSI_TIMEOUT_VALUE            = 2U;
static constexpr std::uint32_t PLL_TIMEOUT_VALUE            = 2U;

#define PLL_SRC_HSE RCC_CFGR_PLLSRC
#define RCC_CFGR_USBPRE_1P5 0   // :1.5
#define RCC_CFGR_USBPRE_1 RCC_CFGR_USBPRE

static const uint8_t AHBPrescTable[16U] = {0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 3, 4, 6, 7, 8, 9};
static const uint8_t APBPrescTable[8U] =  {0, 0, 0, 0, 1, 2, 3, 4};

void CRCC::init()
{
    uint32_t time_end;

    // enable HSE
    HSE_ON();
    time_end = Utils::get_tick() + HSE_TIMEOUT_VALUE;
    while (!HSE_ready())
    {
        if (Utils::get_tick() >= time_end)
        {
            ASSERT(false);
        }
    }

    // set XTAL divider, PLL source, PLL multipler
    MODIFY_REG32(&RCC->CFGR, (RCC_CFGR_PLLXTPRE | RCC_CFGR_PLLSRC | RCC_CFGR_PLLMULL),
        RCC_CFGR_PLLXTPRE_HSE | PLL_SRC_HSE | RCC_CFGR_PLLMULL9);
    // enable PLL
    PLL_ON();
    time_end = Utils::get_tick() + PLL_TIMEOUT_VALUE;
    while (!PLL_ready())
    {
        if (Utils::get_tick() >= time_end)
        {
            ASSERT(false);
        }
    }

    CFLASH::set_latency(CFLASH::ELatency::WS_2);
    // set all predividers - AHB, APB1, APB2, USB
    MODIFY_REG32(&RCC->CFGR, (RCC_CFGR_HPRE | RCC_CFGR_PPRE1 | RCC_CFGR_PPRE2 | RCC_CFGR_USBPRE),
        RCC_CFGR_HPRE_DIV1 | RCC_CFGR_PPRE1_DIV2 | RCC_CFGR_PPRE2_DIV1 | RCC_CFGR_USBPRE_1P5);
    // set system clock sources
    set_system_clock_source(RCC_CFGR_SW_PLL);
    time_end = Utils::get_tick() + CLOCKSWITCH_TIMEOUT_VALUE;
    while (get_system_clock_source() != RCC_CFGR_SWS_PLL)
    {
        if (Utils::get_tick() >= time_end)
        {
            ASSERT(false);
        }
    }

    // update core clock value
    update_sys_clk();

    // re-init system timer
    Utils::timer_init();
}

uint32_t CRCC::get_PCLK1_clock()
{
    return (m_core_clock >> APBPrescTable[get_APB1_prescaller()]);
}

uint32_t CRCC::get_PCLK2_clock()
{
    return (m_core_clock >> APBPrescTable[get_APB2_prescaller()]);
}

void CRCC::update_sys_clk()
{
    EClockSource clk_src = get_sys_clk_source();

    switch (clk_src)
    {
    case EClockSource::HSE:
        m_core_clock = HSE_VALUE;
        break;
    case EClockSource::HSI:
    default:
        m_core_clock = HSI_VALUE;
        break;
    case EClockSource::PLL:
        m_core_clock = get_PLL_clk();
        break;
    }
}

void CRCC::set_clk_AHB_enabled(EPeriph per, bool val)
{
    uint32_t mask = static_cast<uint32_t>(per);
    uint32_t new_val = val ? mask : 0;
    MODIFY_REG32(&RCC->AHBENR, mask, new_val);
}

void CRCC::set_clk_APB1_enabled(EPeriph per, bool val)
{
    uint32_t mask = static_cast<uint32_t>(per);
    uint32_t new_val = val ? mask : 0;
    MODIFY_REG32(&RCC->APB1ENR, mask, new_val);
}

void CRCC::set_clk_APB2_enabled(EPeriph per, bool val)
{
    uint32_t mask = static_cast<uint32_t>(per);
    uint32_t new_val = val ? mask : 0;
    MODIFY_REG32(&RCC->APB2ENR, mask, new_val);
}


uint32_t CRCC::get_PLL_clk()
{
    uint32_t prediv = 0U, pllmul = 0U, clk;
#if defined(RCC_CFGR2_PREDIV1SRC)
    uint32_t prediv2 = 0U, pll2mul = 0U;
#endif /*RCC_CFGR2_PREDIV1SRC*/

    pllmul = get_PLL_mul();
    if (get_PLL_clk_source() != EPLLSource::HSI_DIV2)
    {
        prediv = get_PLL_prediv();
    #if defined(RCC_CFGR2_PREDIV1SRC)
        if (HAL_IS_BIT_SET(RCC->CFGR2, RCC_CFGR2_PREDIV1SRC))
        {
            /* PLL2 selected as Prediv1 source */
            /* PLLCLK = PLL2CLK / PREDIV1 * PLLMUL with PLL2CLK = HSE/PREDIV2 * PLL2MUL */
            prediv2 = ((RCC->CFGR2 & RCC_CFGR2_PREDIV2) >> RCC_CFGR2_PREDIV2_Pos) + 1;
            pll2mul = ((RCC->CFGR2 & RCC_CFGR2_PLL2MUL) >> RCC_CFGR2_PLL2MUL_Pos) + 2;
            pllclk = (uint32_t)(((uint64_t)HSE_VALUE * (uint64_t)pll2mul * (uint64_t)pllmul) / ((uint64_t)prediv2 * (uint64_t)prediv));
        }
        else
        {
            /* HSE used as PLL clock source : PLLCLK = HSE/PREDIV1 * PLLMUL */
            pllclk = (uint32_t)((HSE_VALUE * pllmul) / prediv);
        }

        /* If PLLMUL was set to 13 means that it was to cover the case PLLMUL 6.5 (avoid using float) */
        /* In this case need to divide pllclk by 2 */
        if (pllmul == aPLLMULFactorTable[(uint32_t)(RCC_CFGR_PLLMULL6_5) >> RCC_CFGR_PLLMULL_Pos])
        {
            pllclk = pllclk / 2;
        }
    #else
        clk = (HSE_VALUE / prediv) * pllmul;
    #endif
    }
    else
    {
        clk = (HSI_VALUE >> 1) * pllmul;
    }
    return clk >> AHBPrescTable[get_AHB_prescaller()];
}

uint32_t CRCC::get_PLL_mul()
{
#if defined(RCC_CFGR2_PREDIV1SRC)
    static const uint32_t aPLLMULFactorTable[14] = {0, 0, 4, 5, 6, 7, 8, 9, 0, 0, 0, 0, 0, 13};
#else
    static const uint32_t aPLLMULFactorTable[16] = {2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 16};
#endif
    uint32_t reg_val = (READ_REG32(&RCC->CFGR) & RCC_CFGR_PLLMULL) >> RCC_CFGR_PLLMULL_Pos;
    return aPLLMULFactorTable[reg_val];
}

uint32_t CRCC::get_PLL_prediv()
{
#if defined(RCC_CFGR2_PREDIV1SRC)
    static const uint8_t aPredivFactorTable[16] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
#else
    #if defined(RCC_CFGR2_PREDIV1)
        static const uint8_t aPredivFactorTable[16] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16};
    #else
        static const uint8_t aPredivFactorTable[2] = {1, 2};
    #endif /*RCC_CFGR2_PREDIV1*/
#endif
#if defined(RCC_CFGR2_PREDIV1)
    uint32_t reg_val = (READ_REG32(&RCC->CFGR2) & RCC_CFGR2_PREDIV1) >> RCC_CFGR2_PREDIV1_Pos;
#else
    uint32_t reg_val = (READ_REG32(&RCC->CFGR) & RCC_CFGR_PLLXTPRE) >> RCC_CFGR_PLLXTPRE_Pos;
#endif /*RCC_CFGR2_PREDIV1*/
    return aPredivFactorTable[reg_val];
}
