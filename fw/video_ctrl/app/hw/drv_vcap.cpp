#include "drv_vcap.h"
#include "drv_spi.h"
#include "drv_gpio.h"
#include <cstring>
#ifdef DEBUG
#include "shell.h"
#endif

/*
    Orion-128/PRO - 138 512 25 256 1 1 1
*/

#define BUF_SIZE (sizeof(vcap_regs_t) + 2)

#define VCAP_CTRL_BASE_ADDR 0x40

static uint8_t tx_buf[BUF_SIZE];
static uint8_t rx_buf[BUF_SIZE];

extern CGPIO gpioa;
extern CSPI spi1;

vcap_regs_t CVcap::m_regs;

void CVcap::init()
{
    //
}

void CVcap::set_regs()
{
    tx_buf[0] = (1 << 7) | (VCAP_CTRL_BASE_ADDR);
    tx_buf[1] = sizeof(vcap_regs_t);

    gpioa.pin_DOWN(EGPIOPins::PIN_3);
    // disable I2C1 clock - see ERRATA for STM32F103 medium density devices (ES096)
    memcpy(&tx_buf[2], &m_regs.bt[0], sizeof(vcap_regs_t));
    spi1.transmit_receive(tx_buf, rx_buf, sizeof(vcap_regs_t) + 2, 1000);
    gpioa.pin_UP(EGPIOPins::PIN_3);
}

#ifdef DEBUG

status_e cmd_set_vcap_param(uint32_t argc, char * const argv[])
{
    if (argc != 8)
    {
        return STATUS_INV_PAR;
    }
    CVcap::set_x_start(Shell::get_num(argv[1]));
    CVcap::set_x_size(Shell::get_num(argv[2]));
    CVcap::set_y_start(Shell::get_num(argv[3]));
    CVcap::set_y_size(Shell::get_num(argv[4]));
    CVcap::set_HS_inv(Shell::get_num(argv[5]));
    CVcap::set_VS_inv(Shell::get_num(argv[6]));
    CVcap::set_mux_mode(Shell::get_num(argv[7]));
    CVcap::set_regs();
    return STATUS_OK;
}

SHELL_COMMAND(set_vcap_param, "[x_start] [x_size] [y_start] [y_size] [HS_inv] [VS_inv] [mux_mode]", cmd_set_vcap_param);
#endif
