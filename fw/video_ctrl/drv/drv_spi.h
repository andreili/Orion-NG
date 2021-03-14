#pragma once

#include "core.h"

class CSPI
{
public:
    void init(SPI_TypeDef* base);
    bool transmit_receive(uint8_t* p_tx_data, uint8_t* p_rx_data, uint32_t size, uint32_t timeout);
private:
    SPI_TypeDef*    m_base;

	enum class EFlag: std::uint32_t
	{
        RXNE                   = SPI_SR_RXNE,   /* SPI status flag: Rx buffer not empty flag       */
        TXE                    = SPI_SR_TXE,    /* SPI status flag: Tx buffer empty flag           */
        BSY                    = SPI_SR_BSY,    /* SPI status flag: Busy flag                      */
        CRCERR                 = SPI_SR_CRCERR, /* SPI Error flag: CRC error flag                  */
        MODF                   = SPI_SR_MODF,   /* SPI Error flag: Mode fault flag                 */
        OVR                    = SPI_SR_OVR,    /* SPI Error flag: Overrun flag                    */
        MASK                   = (SPI_SR_RXNE | SPI_SR_TXE | SPI_SR_BSY
                                  | SPI_SR_CRCERR | SPI_SR_MODF | SPI_SR_OVR),
    };

    void disable() { CLEAR_REG32(&m_base->CR1, SPI_CR1_SPE); }
    void enable() { SET_REG32(&m_base->CR1, SPI_CR1_SPE); }
    bool is_enabled() { return (READ_REG32(&m_base->CR1) & SPI_CR1_SPE) == SPI_CR1_SPE; }

    bool get_flag(uint32_t flag)
    {
        return (READ_REG32(&m_base->SR) & flag) == flag;
    }
    bool get_flag(EFlag flag) { return get_flag(static_cast<uint32_t>(flag)); }
    void clear_ovr_flag()
    {
        READ_REG32(&m_base->DR);
        READ_REG32(&m_base->SR);
    }
};
