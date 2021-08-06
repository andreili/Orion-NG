#include "drv_spi.h"
#include "utils.h"

void CSPI::init(SPI_TypeDef* base)
{
    m_base = base;
    disable();
    WRITE_REG32(&m_base->CR1, 
        (SPI_CR1_MSTR | SPI_CR1_SSI) | // mode - master
        SPI_CR1_BR_1); // baud prescaler - 8
        //SPI_CR1_BR_2); // baud prescaler - 32
        //SPI_CR1_BR_2); // baud prescaler - 32
    WRITE_REG32(&m_base->CR2, SPI_CR2_SSOE);
}

#include "xprintf.h"
bool CSPI::transmit_receive(uint8_t* p_tx_data, uint8_t* p_rx_data, uint32_t size, uint32_t timeout)
{
    if (!is_enabled())
    {
        enable();
    }
    uint32_t tx_size = size;
    uint32_t rx_size = size;
    uint32_t time_end = Utils::get_tick() + timeout;
    //xprintf("tx/rx to 0x%02x, size=%d\n", p_tx_data[0], p_tx_data[1]);
    bool tx_allowed = true;
    if (tx_size == 1)
    {
        WRITE_REG32(&m_base->DR, *p_tx_data);
        ++p_tx_data;
        --tx_size;
    }

    while ((tx_size > 0) || (rx_size > 0))
    {
        if (tx_allowed && (tx_size > 0) && get_flag(EFlag::TXE))
        {
            WRITE_REG32(&m_base->DR, *p_tx_data);
            ++p_tx_data;
            --tx_size;
            tx_allowed = false;
        }
        if ((rx_size > 0) && get_flag(EFlag::RXNE))
        {
            *p_rx_data = READ_REG32(&m_base->DR);
            ++p_rx_data;
            --rx_size;
            tx_allowed = true;
        }
        if (Utils::get_tick() >= time_end)
        {
            return false;
        }
    }

	while (get_flag(EFlag::BSY) == true)
	{
		if (Utils::get_tick() >= time_end)
		{
			return false;
		}
	}
    clear_ovr_flag();
    return true;
}
