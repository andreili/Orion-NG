#pragma once

#include "core.h"

class CAFIO
{
public:
    static void remap_swj_enable() { MODIFY_REG32(&AFIO->MAPR, AFIO_MAPR_SWJ_CFG, AFIO_MAPR_SWJ_CFG_RESET); }
    static void remap_swj_nojtrst() { MODIFY_REG32(&AFIO->MAPR, AFIO_MAPR_SWJ_CFG, AFIO_MAPR_SWJ_CFG_NOJNTRST); }
    static void remap_swj_nojtag() { MODIFY_REG32(&AFIO->MAPR, AFIO_MAPR_SWJ_CFG, AFIO_MAPR_SWJ_CFG_JTAGDISABLE); }
    static void remap_swj_disable() { MODIFY_REG32(&AFIO->MAPR, AFIO_MAPR_SWJ_CFG, AFIO_MAPR_SWJ_CFG_DISABLE); }

    static void remap_i2c1() { SET_REG32(&AFIO->MAPR, AFIO_MAPR_I2C1_REMAP); }
    static void remap_spi1() { SET_REG32(&AFIO->MAPR, AFIO_MAPR_SPI1_REMAP); }
private:
};
