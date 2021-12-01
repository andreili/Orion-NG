#pragma once
#include <inttypes.h>

#define SPI_BUF_SIZE (64 + 2)

class HIL
{
public:
    static void init();
    static void idle_proc();
    
    static void pl_get_registers(uint32_t from_addr, uint8_t *p_data, uint32_t count);
    static void pl_set_registers(uint32_t from_addr, uint8_t *p_data, uint32_t count);
    static bool get_edid(uint32_t dev_addr, uint8_t offset, uint8_t* p_data, uint32_t count);
    static bool get_tfp(uint32_t dev_addr, uint8_t offset, uint8_t* p_data, uint32_t count);
    static bool set_tfp(uint32_t dev_addr, uint8_t offset, uint8_t* p_data, uint32_t count);
private:
    static void init_core();
    static void preinit_periph();
    static void init_periph();

    static uint8_t m_spi_tx_buf[SPI_BUF_SIZE];
    static uint8_t m_spi_rx_buf[SPI_BUF_SIZE];
};
