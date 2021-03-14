#include "core.h"
#include "edid_ctrl.h"
#include "task_mgr.h"
#include "drv_i2c.h"
#include <string.h>
#include "xprintf.h"
#include "drv_video.h"
#ifdef DEBUG
#include "shell.h"
#endif
#include "drv_pll.h"

#define EDID_ADDR_VGA (0x50 << 1)

char     CEDIDCtrl::m_serial[EDID_DESC_SIZE];
uint8_t  CEDIDCtrl::m_buf[EDID_DATA_SIZE+1];
uint32_t CEDIDCtrl::m_pxl_clk;

typedef union
{
	struct
	{
		uint16_t resolution		:  8;
		uint16_t v_freq			:  6;
		uint16_t aspect_ratio	:  2;
	} bt;
	uint16_t data;
} timing_st_t;

typedef union
{
	struct
	{
		// byte 0
		uint32_t pxl_clock		: 16;
		// byte 2
		uint32_t h_active_l		:  8;
		// byte 3
		uint32_t h_blank_l		:  8;
		// byte 4
		uint32_t h_blank_m		:  4;
		uint32_t h_active_m		:  4;
		// byte 5
		uint32_t v_active_l		:  8;
		// byte 6
		uint32_t v_blank_l		:  8;
		// byte 7
		uint32_t v_blank_m		:  4;
		uint32_t v_active_m		:  4;
		// byte 8
		uint32_t h_fp_l			:  8;
		// byte 9
		uint32_t h_sync_l		:  8;
		// byte 10
		uint32_t v_sync_l		:  4;
		uint32_t v_fp_l			:  4;
		// byte 11
		uint32_t v_sync_m		:  2;
		uint32_t v_fp_m			:  2;
		uint32_t h_sync_m		:  2;
		uint32_t h_fp_m			:  2;
		// byte 12
		uint32_t h_img_size_mm_l:  8;
		// byte 13
		uint32_t v_img_size_mm_l:  8;
		// byte 14
		uint32_t v_img_size_mm_m:  4;
		uint32_t h_img_size_mm_m:  4;
		// byte 15
		uint32_t h_border_sz_pxl:  8;
		// byte 16
		uint32_t v_border_sz_pxl:  8;
		// byte 17
		uint32_t stereo_mode_m	:  1;
		union
		{
			struct
			{
				uint32_t h_sync_pol		:  1;
				uint32_t v_sync_serr	:  1;
				uint32_t type			:  2;
			} dig_sync_separate;
			struct
			{
				uint32_t 				:  1;
				uint32_t v_sync_pol		:  1;
				uint32_t type			:  2;
			} dig_sync_composite;
			struct
			{
				uint32_t sync_on_red	:  1;
				uint32_t v_sync_serr	:  1;
				uint32_t sync_type		:  1;
				uint32_t type			:  1;
			} an_sync;
		} sync;
		uint32_t stereo_l		:  2;
		uint32_t interlaced		:  1;
	} timing;
	struct
	{
		// byte 0
		uint32_t zeroes			: 16;
		// byte 2
		uint32_t zero			:  8;
		// byte 3
		uint32_t desc_type		:  8;
		// byte 4
		uint32_t range_limits	:  8;
	} display;
    uint8_t data_b[18];
    uint32_t data_dw[5];
} desc_t;

typedef union
{
	struct
	{
		uint32_t header1		: 32;
		uint32_t header2		: 32;
		uint32_t mf_id_3		:  5;
		uint32_t mf_id_2		:  5;
		uint32_t mf_id_1		:  5;
		uint32_t				:  1;
		uint32_t mf_product		: 16;
		uint32_t serial			: 32;
		uint32_t week_of_mf		:  8;
		uint32_t year_of_mf		:  8;
		uint32_t EDID_ver_0		:  8;
		uint32_t EDID_ver_1		:  8;
		// byte 20
		union
		{
			struct
			{
				uint32_t type			:  4;
				uint32_t bit_depth		:  3;
				uint32_t digital_input	:  1;
			} digital;
			struct
			{
				uint32_t vs_serr		:  1;
				uint32_t sync_on_green	:  1;
				uint32_t comp_sync		:  1;
				uint32_t sep_sync		:  1;
				uint32_t blank_to_blank	:  1;
				uint32_t volt_level		:  2;
				uint32_t analog_input	:  1;
			} analog;
		} interface;
		uint32_t h_size_sm		:  8;
		uint32_t v_size_sm		:  8;
		uint32_t gamma			:  8;
		//byte 24
		uint32_t cont_timing	:  1;
		uint32_t pref_timing	:  1;
		uint32_t sRGB_space		:  1;
		uint32_t disp_type		:  2;
		uint32_t DPSM_act_off	:  1;
		uint32_t DPSM_suspend	:  1;
		uint32_t DPSM_standby	:  1;
		// byte 25
		uint32_t chr_gr_y_l		:  2;
		uint32_t chr_gr_x_l		:  2;
		uint32_t chr_rd_y_l		:  2;
		uint32_t chr_rd_x_l		:  2;
		// byte 26
		uint32_t chr_wh_y_l		:  2;
		uint32_t chr_wh_x_l		:  2;
		uint32_t chr_bl_y_l		:  2;
		uint32_t chr_bl_x_l		:  2;
		// byte 27
		uint32_t chr_rd_x_m		:  8;
		uint32_t chr_rd_y_m		:  8;
		uint32_t chr_gr_x_m		:  8;
		uint32_t chr_gr_y_m		:  8;
		uint32_t chr_bl_x_m		:  8;
		uint32_t chr_bl_y_m		:  8;
		uint32_t chr_wh_x_m		:  8;
		uint32_t chr_wh_y_m		:  8;
		// byte 35
		uint32_t timing_0		:  1;
		uint32_t timing_1		:  1;
		uint32_t timing_2		:  1;
		uint32_t timing_3		:  1;
		uint32_t timing_4		:  1;
		uint32_t timing_5		:  1;
		uint32_t timing_6		:  1;
		uint32_t timing_7		:  1;
		// byte 36
		uint32_t timing_8		:  1;
		uint32_t timing_9		:  1;
		uint32_t timing_10		:  1;
		uint32_t timing_11		:  1;
		uint32_t timing_12		:  1;
		uint32_t timing_13		:  1;
		uint32_t timing_14		:  1;
		uint32_t timing_15		:  1;
		// byte 37
		uint32_t timing_16		:  1;
		uint32_t timing_17		:  1;
		uint32_t timing_18		:  1;
		uint32_t timing_19		:  1;
		uint32_t timing_20		:  1;
		uint32_t timing_21		:  1;
		uint32_t timing_22		:  1;
		uint32_t timing_23		:  1;
		// byte 38
		uint32_t timing_st_0	: 16;
		uint32_t timing_st_1	: 16;
		uint32_t timing_st_2	: 16;
		uint32_t timing_st_3	: 16;
		uint32_t timing_st_4	: 16;
		uint32_t timing_st_5	: 16;
		uint32_t timing_st_6	: 16;
		uint32_t timing_st_7	: 16;
		// byte 54
		uint32_t desc_1_p0		:  8;
		uint32_t desc_1_p1		:  8;
		uint32_t desc_1_p2		:  8;
		uint32_t desc_1_p3		:  8;
		uint32_t desc_1_p4		:  8;
		uint32_t desc_1_p5		:  8;
		uint32_t desc_1_p6		:  8;
		uint32_t desc_1_p7		:  8;
		uint32_t desc_1_p8		:  8;
		uint32_t desc_1_p9		:  8;
		uint32_t desc_1_p10		:  8;
		uint32_t desc_1_p11		:  8;
		uint32_t desc_1_p12		:  8;
		uint32_t desc_1_p13		:  8;
		uint32_t desc_1_p14		:  8;
		uint32_t desc_1_p15		:  8;
		uint32_t desc_1_p16		:  8;
		uint32_t desc_1_p17		:  8;
		// byte 72
		uint32_t desc_2_p0		:  8;
		uint32_t desc_2_p1		:  8;
		uint32_t desc_2_p2		:  8;
		uint32_t desc_2_p3		:  8;
		uint32_t desc_2_p4		:  8;
		uint32_t desc_2_p5		:  8;
		uint32_t desc_2_p6		:  8;
		uint32_t desc_2_p7		:  8;
		uint32_t desc_2_p8		:  8;
		uint32_t desc_2_p9		:  8;
		uint32_t desc_2_p10		:  8;
		uint32_t desc_2_p11		:  8;
		uint32_t desc_2_p12		:  8;
		uint32_t desc_2_p13		:  8;
		uint32_t desc_2_p14		:  8;
		uint32_t desc_2_p15		:  8;
		uint32_t desc_2_p16		:  8;
		uint32_t desc_2_p17		:  8;
		// byte 90
		uint32_t desc_3_p0		:  8;
		uint32_t desc_3_p1		:  8;
		uint32_t desc_3_p2		:  8;
		uint32_t desc_3_p3		:  8;
		uint32_t desc_3_p4		:  8;
		uint32_t desc_3_p5		:  8;
		uint32_t desc_3_p6		:  8;
		uint32_t desc_3_p7		:  8;
		uint32_t desc_3_p8		:  8;
		uint32_t desc_3_p9		:  8;
		uint32_t desc_3_p10		:  8;
		uint32_t desc_3_p11		:  8;
		uint32_t desc_3_p12		:  8;
		uint32_t desc_3_p13		:  8;
		uint32_t desc_3_p14		:  8;
		uint32_t desc_3_p15		:  8;
		uint32_t desc_3_p16		:  8;
		uint32_t desc_3_p17		:  8;
		// byte 108
		uint32_t desc_4_p0		:  8;
		uint32_t desc_4_p1		:  8;
		uint32_t desc_4_p2		:  8;
		uint32_t desc_4_p3		:  8;
		uint32_t desc_4_p4		:  8;
		uint32_t desc_4_p5		:  8;
		uint32_t desc_4_p6		:  8;
		uint32_t desc_4_p7		:  8;
		uint32_t desc_4_p8		:  8;
		uint32_t desc_4_p9		:  8;
		uint32_t desc_4_p10		:  8;
		uint32_t desc_4_p11		:  8;
		uint32_t desc_4_p12		:  8;
		uint32_t desc_4_p13		:  8;
		uint32_t desc_4_p14		:  8;
		uint32_t desc_4_p15		:  8;
		uint32_t desc_4_p16		:  8;
		uint32_t desc_4_p17		:  8;
		// byte 126
		uint32_t ext_to_follow	:  8;
	} bt;
	uint32_t data_dw[EDID_DATA_SIZE/sizeof(uint32_t)];
	uint8_t  data_b[EDID_DATA_SIZE];
} edid_t;

static edid_t* p_edid;
static uint32_t connect_pause;

void CEDIDCtrl::init()
{
    //CORE::reg_write(&p_vctrl_reg->CTRL, 0);
    m_serial[0] = 0;
    connect_pause = 0;
    p_edid = reinterpret_cast<edid_t*>(m_buf);
    CTaskMgr::add_task(periodic_rescan, CTaskMgr::EInterval::MS_1000);
}

void CEDIDCtrl::parse_info()
{
    parse_desc(&m_buf[108]);
    parse_desc(&m_buf[90]);
    parse_desc(&m_buf[72]);
    parse_desc(&m_buf[54]);
    #ifdef DEBUG
        /*xprintf("Detected Modeline: ");
        video_ctrl_t::SYNC0_t hsync0 = { .dw = CORE::reg_read(&p_vctrl_reg->HSYNC0) };
        video_ctrl_t::SYNC1_t hsync1 = { .dw = CORE::reg_read(&p_vctrl_reg->HSYNC1) };
        video_ctrl_t::SYNC0_t vsync0 = { .dw = CORE::reg_read(&p_vctrl_reg->VSYNC0) };
        video_ctrl_t::SYNC1_t vsync1 = { .dw = CORE::reg_read(&p_vctrl_reg->VSYNC1) };
        xprintf("\"0x%dx0x%d\" 0x%d(kHz) ", hsync0.bt.ACTIVE, vsync0.bt.ACTIVE, m_pxl_clk);
        xprintf("0x%d 0x%d 0x%d 0x%d ", hsync0.bt.ACTIVE, hsync0.bt.SYNC_START, hsync1.bt.SYNC_END, hsync1.bt.BLANKING);
        xprintf("0x%d 0x%d 0x%d 0x%d ", vsync0.bt.ACTIVE, vsync0.bt.SYNC_START, vsync1.bt.SYNC_END, vsync1.bt.BLANKING);
        xprintf("%sHSync %sVSync\n", hsync0.bt.SYNC_POL ? "+" : "-", vsync0.bt.SYNC_POL ? "+" : "-");*/
    #endif
}

extern CI2C i2c1;

void CEDIDCtrl::periodic_rescan()
{
    // TODO: scan HDMI addresses

    uint32_t offset = 0;
    if (i2c1.master_transmit(EDID_ADDR_VGA, (uint8_t*)&offset, 1, 1000, true))
    {
        if (i2c1.master_receive(EDID_ADDR_VGA, m_buf, EDID_DATA_SIZE, 1000))
        {
            if (m_serial[0] == 0)
            {
                // VGA is now connected, scan all infos
                parse_info();
            #ifdef DEBUG
            #endif
                if (CVideo::get_dvi_present())
                {
                #ifdef DEBUG
                    xprintf("Connected DVI/HDMI display '%s'\n", m_serial);
                #endif
                    CVideo::enable_hdmi();
                }
                else
                {
                #ifdef DEBUG
                    xprintf("Connected VGA display '%s'\n", m_serial);
                #endif
                    CVideo::enable_vga();
                }
                CVideo::enable_video();
            }
            return;
        }
    }


    CVideo::disable_video();
    m_serial[0] = 0;
    //CORE::reg_write(&p_vctrl_reg->CTRL, 0);
#ifdef DEBUG
    xprintf("No dispay connected\n");
#endif
}


void CEDIDCtrl::parse_desc(uint8_t* ptr)
{
    desc_t* p_src = (desc_t*)ptr;
    if (p_src->timing.pxl_clock == 0)
    {
        // display info, check SN
        if (p_src->display.desc_type == 0xff)
        {
            for (uint32_t i=0 ; i<(EDID_DESC_SIZE-1) ; ++i)
            {
                if (ptr[5 + i] == '\n')
                {
                    m_serial[i] = 0;
                    break;
                }
                else
                {
                    m_serial[i] = ptr[5 + i];
                }
            }
        }
    }
    else
    {
        CVideo::disable_video();

        m_pxl_clk = p_src->timing.pxl_clock * 10;

    #ifdef DEBUG
        xprintf("Modeline: %d(kHz) ", m_pxl_clk);
    #endif
        uint32_t active, sync_start, sync_end, blank;
        // horisontal timings
        active = (p_src->timing.h_active_m << 8) | p_src->timing.h_active_l;
        sync_start = ((p_src->timing.h_fp_m << 8) | p_src->timing.h_fp_l) + active;
        sync_end = ((p_src->timing.h_sync_m << 8) | p_src->timing.h_sync_l) + sync_start;
        blank = ((p_src->timing.h_blank_m << 8) | p_src->timing.h_blank_l) + active;
    #ifdef DEBUG
        xprintf("%d %d %d %d ", active, sync_start, sync_end, blank);
    #endif
        CVideo::set_h_active(active - 1);
        CVideo::set_h_sync_start(sync_start - 1);
        CVideo::set_h_sync_end(sync_end - 1);
        CVideo::set_h_blank(blank - 1);
        // vertical timings
        active = (p_src->timing.v_active_m << 8) | p_src->timing.v_active_l;
        sync_start = ((p_src->timing.v_fp_m << 4) | p_src->timing.v_fp_l) + active;
        sync_end = ((p_src->timing.v_sync_m << 4) | p_src->timing.v_sync_l) + sync_start;
        blank = ((p_src->timing.v_blank_m << 8) | p_src->timing.v_blank_l) + active;
    #ifdef DEBUG
        xprintf("%d %d %d %d ", active, sync_start, sync_end, blank);
    #endif
        CVideo::set_v_active(active - 1);
        CVideo::set_v_sync_start(sync_start - 1);
        CVideo::set_v_sync_end(sync_end - 1);
        CVideo::set_v_blank(blank - 1);

    #ifdef DEBUG
        xprintf("%sHSync %sVSync\n", p_src->timing.sync.dig_sync_separate.h_sync_pol ? "+" : "-",
            p_src->timing.sync.dig_sync_composite.v_sync_pol ? "+" : "-");
    #endif
        CVideo::set_h_sync_pos(p_src->timing.sync.dig_sync_separate.h_sync_pol);
        CVideo::set_v_sync_pos(p_src->timing.sync.dig_sync_composite.v_sync_pol);

        CVideo::apply_res();
        // print some infos
    #ifdef DEBUG
        xprintf("EDID4[17]=0x%d\n", p_src->data_b[17]);
    #endif

        CPLL::set_freq(m_pxl_clk);
    }
}

void CEDIDCtrl::reset()
{
    m_serial[0] = 0;
    CVideo::disable_video();
}

#ifdef DEBUG
status_e cmd_video_reset(uint32_t argc, char * const argv[])
{
    (void)(argc);
    (void)(argv);
    CEDIDCtrl::reset();
    return STATUS_OK;
}

SHELL_COMMAND(video_reset, "", cmd_video_reset);
#endif
