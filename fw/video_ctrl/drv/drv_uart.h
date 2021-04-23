#pragma once

#include "core.h"

class CUART
{
public:
    void init(USART_TypeDef* base);
    void send(uint8_t* data, uint32_t size, uint32_t timeout);
    void send_start_IT(uint8_t data)
    {
        WRITE_REG32(&m_uart->DR, data);
        MODIFY_REG32(&m_uart->CR1, USART_CR1_TXEIE | USART_CR1_TCIE, USART_CR1_TXEIE | USART_CR1_TCIE);
        m_tx_busy = true;
    }
    void send_char(char ch);
    void recv(uint8_t* data, uint32_t size, uint32_t timeout);
    void recv_start_IT() { SET_REG32(&m_uart->CR1, USART_CR1_RXNEIE); }

    bool is_tx_busy() { return m_tx_busy; }

    void isr_handler();
private:
    USART_TypeDef*  m_uart;
    bool            m_tx_busy;

	enum class EFlag: std::uint32_t
	{
		CTS = USART_SR_CTS,
		LBD = USART_SR_LBD,
		TXE = USART_SR_TXE,
		TC = USART_SR_TC,
		RXNE = USART_SR_RXNE,
		IDLE = USART_SR_IDLE,
		ORE = USART_SR_ORE,
		NE = USART_SR_NE,
		FE = USART_SR_FE,
		PE = USART_SR_PE,
	};

    inline void enable() { SET_REG32(&m_uart->CR1, USART_CR1_UE); }
    inline void disable() { CLEAR_REG32(&m_uart->CR1, USART_CR1_UE); }

    inline void set_mode(uint32_t mode) { MODIFY_REG32(&m_uart->CR1,
        (USART_CR1_M | USART_CR1_PCE | USART_CR1_PS | USART_CR1_TE | USART_CR1_RE), mode); }
    inline void set_stop_bits(uint32_t bits) { MODIFY_REG32(&m_uart->CR2, USART_CR2_STOP, bits); }
    inline void set_brr(uint32_t fraction, uint32_t mantissa)
    {
        uint32_t val = (fraction << USART_BRR_DIV_Fraction_Pos) | (mantissa << USART_BRR_DIV_Mantissa_Pos);
        WRITE_REG32(&m_uart->BRR, val);
    }

    bool wait_flag_until_timeout(EFlag flag, bool state, uint32_t timeout_to);
    uint32_t get_status() { return READ_REG32(&m_uart->SR); }
};
