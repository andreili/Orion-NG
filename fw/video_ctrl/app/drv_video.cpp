#include "drv_video.h"
#include "drv_spi.h"
#include "drv_gpio.h"
#include "drv_rcc.h"
#include <cstring>
#include "xprintf.h"
#ifdef DEBUG
#include "shell.h"
#endif
#include "drv_i2c.h"

#define VIDEO_CTRL_BASE_ADDR 0

extern CGPIO gpioa;
extern CSPI spi1;
extern CI2C i2c2;

#define BUF_SIZE 64

video_ctrl_t    CVideo::m_vregs;
hdmi_regs_r     CVideo::m_hdmi;

static uint8_t tx_buf[BUF_SIZE];
static uint8_t rx_buf[BUF_SIZE];

void CVideo::init()
{
    disable_video();
    get_hreg(0, sizeof(hdmi_regs_r));
}

void CVideo::enable_hdmi()
{
    m_vregs.hdmi_active = 1;
    set_vreg(VREG_ACTIVE, 1);
    m_hdmi.PD = 0;
    m_hdmi.EDGE = 0;
    m_hdmi.BSEL = 1;
    m_hdmi.HEN = 1;
    m_hdmi.VEN = 1;
    m_hdmi.TDIS = 0;
    m_hdmi.MSEL = 3;
    m_hdmi.TSEL = 0;
    m_hdmi.DKEN = 1;
    m_hdmi.DK = 4;
    set_hreg(8, 3);
    m_hdmi.PD = 1;
    set_hreg(8, 1);
}

void CVideo::dump_hdmi()
{
    if (get_hreg(0, sizeof(hdmi_regs_r)))
    {
        xprintf("Transmited data\n0x%04x: ", 0);
        for (uint32_t i=0 ; i<sizeof(hdmi_regs_r); ++i)
        {
            if ((i % 16) == 0)
            {
                xprintf("\n0x%04x: ", i);
            }
            xprintf("0x%02x ", m_hdmi.bt[i]);
        }
        xprintf("\n");

        xprintf("VEN_ID=0x%04x DEV_ID=0x%04x REV_ID=0x%02x\n", m_hdmi.VEN_ID, m_hdmi.DEV_ID, m_hdmi.REV_ID);
        xprintf("PD=%d EDGE=%d BSEL=%d DSEL=%d HEN=%d VEN=%d TDIS=%d MDI=%d HTPLG=%d RSEN=%d TSEL=%d MSEL=%d VLOW=%d\n",
            m_hdmi.PD, m_hdmi.EDGE, m_hdmi.BSEL, m_hdmi.DSEL, m_hdmi.HEN, m_hdmi.VEN, m_hdmi.TDIS, m_hdmi.MDI,
            m_hdmi.HTPLG, m_hdmi.RSEN, m_hdmi.TSEL, m_hdmi.MSEL, m_hdmi.VLOW);
        xprintf("CTL=%d DKEN=%d DK=%d CFG=%d DE_DLY=%d HS_POL=%d VS_POL=%d\n",
            m_hdmi.CTL, m_hdmi.DKEN, m_hdmi.DK, m_hdmi.CFG, m_hdmi.DE_DLY, m_hdmi.HS_POL, m_hdmi.VS_POL);
        xprintf("DE_GEN=%d DE_TOP=%d DE_CNT=%d DE_LIN=%d H_RES=%d V_RES=%d\n",
            m_hdmi.DE_GEN, m_hdmi.DE_TOP, m_hdmi.DE_CNT, m_hdmi.DE_LIN, m_hdmi.H_RES, m_hdmi.V_RES);
    }
    else
    {
        xprintf("Failed to get data!\n");
    }
}

void CVideo::get_vreg(uint32_t from_addr, uint32_t count)
{
    tx_buf[0] = (from_addr + VIDEO_CTRL_BASE_ADDR);
    tx_buf[1] = count;

    gpioa.pin_DOWN(EGPIOPins::PIN_3);
    // disable I2C1 clock - see ERRATA for STM32F103 medium density devices (ES096)
    spi1.transmit_receive(tx_buf, rx_buf, count + 3, 1000);
    memcpy(&m_vregs.bt[from_addr], &rx_buf[2], count);
    gpioa.pin_UP(EGPIOPins::PIN_3);
}

void CVideo::set_vreg(uint32_t from_addr, uint32_t count)
{
    tx_buf[0] = (1 << 7) | (from_addr + VIDEO_CTRL_BASE_ADDR);
    tx_buf[1] = count;

    gpioa.pin_DOWN(EGPIOPins::PIN_3);
    // disable I2C1 clock - see ERRATA for STM32F103 medium density devices (ES096)
    memcpy(&tx_buf[2], &m_vregs.bt[from_addr], count);
    spi1.transmit_receive(tx_buf, rx_buf, count + 2, 1000);
    gpioa.pin_UP(EGPIOPins::PIN_3);
}

bool CVideo::get_hreg(uint32_t from, uint32_t count)
{
    if (i2c2.master_transmit(TFP_ADDR, (uint8_t*)&from, 1, 1000, true))
    {
        if (i2c2.master_receive(TFP_ADDR, &m_hdmi.bt[from], count, 1000))
        {
            return true;
        }
    }
    return false;
}

bool CVideo::set_hreg(uint32_t from, uint32_t count)
{
    tx_buf[0] = from;
    memcpy(&tx_buf[1], &m_hdmi.bt[from], count);
    if (i2c2.master_transmit(TFP_ADDR, tx_buf, count + 1, 1000, false))
    {
        return true;
    }
    return false;
}

#ifdef DEBUG

status_e cmd_video_disable(uint32_t argc, char * const argv[])
{
    (void)(argc);
    (void)(argv);
    CVideo::disable_video();
    return STATUS_OK;
}

SHELL_COMMAND(video_disable, "", cmd_video_disable);

status_e cmd_video_enable(uint32_t argc, char * const argv[])
{
    (void)(argc);
    (void)(argv);
    CVideo::enable_video();
    return STATUS_OK;
}

SHELL_COMMAND(video_enable, "", cmd_video_enable);

status_e cmd_dump_hdmi(uint32_t argc, char * const argv[])
{
    (void)(argc);
    (void)(argv);
    CVideo::dump_hdmi();
    return STATUS_OK;
}

SHELL_COMMAND(dump_hdmi, "", cmd_dump_hdmi);

status_e cmd_hdmi_disable(uint32_t argc, char * const argv[])
{
    (void)(argc);
    (void)(argv);
    CVideo::disable_hdmi();
    return STATUS_OK;
}

SHELL_COMMAND(hdmi_disable, "", cmd_hdmi_disable);

status_e cmd_hdmi_enable(uint32_t argc, char * const argv[])
{
    (void)(argc);
    (void)(argv);
    CVideo::enable_hdmi();
    return STATUS_OK;
}

SHELL_COMMAND(hdmi_enable, "", cmd_hdmi_enable);

status_e cmd_hdmi_set(uint32_t argc, char * const argv[])
{
    (void)(argc);
    uint32_t addr = Shell::get_num(argv[1]);
    tx_buf[0] = addr;
    tx_buf[1] = Shell::get_num(argv[2]);
    if (i2c2.master_transmit(TFP_ADDR, tx_buf, 2, 1000, false))
    {
        return STATUS_OK;
    }
    return STATUS_FAIL;
}

SHELL_COMMAND(hdmi_set, "", cmd_hdmi_set);
#endif
