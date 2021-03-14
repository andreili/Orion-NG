#pragma once

#include <cstdint>

#define VREG_RSEN 9
#define VREG_ACTIVE 12
#define TFP_ADDR 0x7e

#pragma pack(push, 1)
typedef union
{
    struct
    {
        uint32_t h_active       : 12;
        uint32_t h_sync_start   : 12;
        uint32_t h_sync_end     : 12;
        uint32_t h_blank        : 12;
        uint32_t v_active       : 12;
        uint32_t v_sync_start   : 12;
        uint32_t v_sync_end     : 12;
        uint32_t v_blank        : 12;
        uint32_t video_active   : 1;
        uint32_t hdmi_active    : 1;
        uint32_t vga_active     : 1;
        uint32_t v_sync_pos     : 1;
        uint32_t h_sync_pos     : 1;
    };
    uint32_t dw[4];
    uint8_t bt[16];
} video_ctrl_t;

typedef union
{
    struct
    {
        uint16_t VEN_ID         : 16;   // byte #0/1 0x014c
        uint16_t DEV_ID         : 16;   // byte #2/3 0x0410
        uint16_t REV_ID         :  8;   // byte #4
        uint16_t                :  8;   // byte #5
        uint16_t                : 16;   // byte #6/7
        uint16_t PD             :  1;   // byte #8.0
        uint16_t EDGE           :  1;   // byte #8.1
        uint16_t BSEL           :  1;   // byte #8.2
        uint16_t DSEL           :  1;   // byte #8.3
        uint16_t HEN            :  1;   // byte #8.4
        uint16_t VEN            :  1;   // byte #8.5
        uint16_t TDIS           :  1;   // byte #8.6
        uint16_t                :  1;   // byte #8.7
        uint16_t MDI            :  1;   // byte #9.0
        uint16_t HTPLG          :  1;   // byte #9.1
        uint16_t RSEN           :  1;   // byte #9.2
        uint16_t TSEL           :  1;   // byte #9.3
        uint16_t MSEL           :  3;   // byte #9.4-6
        uint16_t VLOW           :  1;   // byte #9.7
        uint16_t                :  1;   // byte #10.0
        uint16_t CTL            :  3;   // byte #10.1-3
        uint16_t DKEN           :  1;   // byte #10.4
        uint16_t DK             :  3;   // byte #10.5-7
        uint16_t CFG            :  8;   // byte #11
        uint16_t                :  8;   // byte #12
        uint16_t                :  8;   // byte #13
        uint16_t                :  8;   // byte #14
        uint16_t                :  8;   // byte #15
        uint16_t                :  8;   // byte #16
        uint16_t                :  8;   // byte #17
        uint16_t                :  8;   // byte #18
        uint16_t                :  8;   // byte #19
        uint16_t                :  8;   // byte #20
        uint16_t                :  8;   // byte #21
        uint16_t                :  8;   // byte #22
        uint16_t                :  8;   // byte #23
        uint16_t                :  8;   // byte #24
        uint16_t                :  8;   // byte #25
        uint16_t                :  8;   // byte #26
        uint16_t                :  8;   // byte #27
        uint16_t                :  8;   // byte #28
        uint16_t                :  8;   // byte #29
        uint16_t                :  8;   // byte #30
        uint16_t                :  8;   // byte #31
        uint16_t                :  8;   // byte #32
        uint16_t                :  8;   // byte #33
        uint16_t                :  8;   // byte #34
        uint16_t                :  8;   // byte #35
        uint16_t                :  8;   // byte #36
        uint16_t                :  8;   // byte #37
        uint16_t                :  8;   // byte #38
        uint16_t                :  8;   // byte #39
        uint16_t                :  8;   // byte #40
        uint16_t                :  8;   // byte #41
        uint16_t                :  8;   // byte #42
        uint16_t                :  8;   // byte #43
        uint16_t                :  8;   // byte #44
        uint16_t                :  8;   // byte #45
        uint16_t                :  8;   // byte #46
        uint16_t                :  8;   // byte #47
        uint16_t                :  8;   // byte #48
        uint16_t                :  8;   // byte #49
        uint16_t DE_DLY         :  9;   // byte #50+51.0
        uint16_t                :  3;   // byte #51.1-3
        uint16_t HS_POL         :  1;   // byte #51.4
        uint16_t VS_POL         :  1;   // byte #51.5
        uint16_t DE_GEN         :  1;   // byte #51.6
        uint16_t                :  1;   // byte #51.7
        uint16_t DE_TOP         :  8;   // byte #52
        uint16_t                :  8;   // byte #53
        uint16_t DE_CNT         : 11;   // byte #54+55.0-2
        uint16_t                :  5;   // byte #55.3-7
        uint16_t DE_LIN         : 11;   // byte #56+57.0-2
        uint16_t                :  5;   // byte #57.3-7
        uint16_t H_RES          : 11;   // byte #58+59.0-2
        uint16_t                :  5;   // byte #59.3-7
        uint16_t V_RES          : 11;   // byte #60+61.0-2
        uint16_t                :  5;   // byte #61.3-7
    };
    uint8_t bt[64];
} hdmi_regs_r;
#pragma pack(pop)

class CVideo
{
public:
    static void init();
    static void dump_hdmi();
    static void set_h_active(uint32_t val) { m_vregs.h_active = val; }
    static void set_h_sync_start(uint32_t val) { m_vregs.h_sync_start = val; }
    static void set_h_sync_end(uint32_t val) { m_vregs.h_sync_end = val; }
    static void set_h_blank(uint32_t val) { m_vregs.h_blank = val; }
    static void set_h_sync_pos(uint32_t val) { m_vregs.h_sync_pos = val; }
    static void set_v_active(uint32_t val) { m_vregs.v_active = val; }
    static void set_v_sync_start(uint32_t val) { m_vregs.v_sync_start = val; }
    static void set_v_sync_end(uint32_t val) { m_vregs.v_sync_end = val; }
    static void set_v_blank(uint32_t val) { m_vregs.v_blank = val; }
    static void set_v_sync_pos(uint32_t val) { m_vregs.v_sync_pos = val; }
    static bool get_dvi_present()
    {
        get_hreg(VREG_RSEN, 1);
        return m_hdmi.RSEN;
    }
    static void enable_vga()
    {
        m_vregs.vga_active = 1;
        set_vreg(VREG_ACTIVE, 1);
    }
    static void disable_vga()
    {
        m_vregs.vga_active = 0;
        set_vreg(VREG_ACTIVE, 1);
    }
    static void enable_hdmi();
    static void disable_hdmi()
    {
        m_vregs.hdmi_active = 0;
        set_vreg(VREG_ACTIVE, 1);
        m_hdmi.PD = 0;
        set_hreg(8, 1);
    }
    static void enable_video()
    {
        m_vregs.video_active = 1;
        set_vreg(VREG_ACTIVE, 1);
    }
    static void disable_video()
    {
        m_vregs.video_active = 0;
        set_vreg(VREG_ACTIVE, 1);
    }
    static void apply_res() { set_vreg(0, VREG_ACTIVE + 1); }
private:
    static video_ctrl_t     m_vregs;
    static hdmi_regs_r      m_hdmi;
    static void set_vreg(uint32_t from_addr, uint32_t count);
    static bool get_hreg(uint32_t from, uint32_t count);
    static bool set_hreg(uint32_t from, uint32_t count);
};
