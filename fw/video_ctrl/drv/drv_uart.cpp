#include "drv_uart.h"
#include "drv_rcc.h"
#include "utils.h"
#include "uart_fifo.h"

#define STOP (0 << USART_CR2_STOP_Pos)      // 1 stop bit
#define WORD_LENGTH (0 << USART_CR1_M_Pos)  // 8
#define PARITY (0 << USART_CR1_PS_Pos)      // no parity
#define MODE (USART_CR1_RE | USART_CR1_TE)  // TX + RX
#define BAUD_RATE 115200

void CUART::init(USART_TypeDef* base)
{
    m_uart = base;
	disable();

    set_stop_bits(STOP);
	set_mode(WORD_LENGTH  | PARITY | MODE);
	uint32_t pclk;
	if (m_uart == USART1)
	{
		pclk = CRCC::get_PCLK2_clock();
	}
	else
	{
		pclk = CRCC::get_PCLK1_clock();
	}
	uint32_t div_100 = (pclk * 25) / (4 * BAUD_RATE);
	uint32_t mantissa = div_100 / 100;
	uint32_t fraction = ((div_100 % 100) * 16) / 100;
    set_brr(fraction, mantissa);

    // set UART mode
    MODIFY_REG32(&m_uart->CR2, (USART_CR2_LINEN | USART_CR2_CLKEN), 0);
    MODIFY_REG32(&m_uart->CR3, (USART_CR3_SCEN | USART_CR3_HDSEL | USART_CR3_IREN), 0);
    
	enable();
}

void CUART::send(uint8_t* data, uint32_t size, uint32_t timeout)
{
	if ((data == nullptr) || (size == 0))
	{
		return;
	}

	uint32_t timeout_to = Utils::get_tick() + timeout;

    for (uint32_t tx_count=0 ; tx_count<size ; ++tx_count, ++data)
	{
		if (wait_flag_until_timeout(EFlag::TXE, false, timeout_to) != true)
		{
			return;
		}
        WRITE_REG32(&m_uart->DR, *data);
	}

	if (wait_flag_until_timeout(EFlag::TC, false, timeout_to) != true)
	{
		return;
	}
}

void CUART::send_char(char ch)
{
    if (wait_flag_until_timeout(EFlag::TXE, false, 100) != true)
    {
        return;
    }
    WRITE_REG32(&m_uart->DR, ch);
}

void CUART::recv(uint8_t* data, uint32_t size, uint32_t timeout)
{
	if ((data == nullptr) || (size == 0))
	{
		return;
	}

	uint32_t timeout_to = Utils::get_tick() + timeout;

    for (uint32_t rx_count=0 ; rx_count<size ; ++rx_count, ++data)
	{
		if (wait_flag_until_timeout(EFlag::RXNE, false, timeout_to) != true)
		{
			return;
		}
        *data = READ_REG32(&m_uart->DR) & 0xff;
	}
}

void CUART::isr_handler()
{
    uint32_t isr_flags = READ_REG32(&m_uart->SR);

    if (isr_flags & USART_SR_RXNE)
    {
        uart_fifo.rx_push(READ_REG32(&m_uart->DR) & 0xff);
    }
    if (isr_flags & USART_SR_TXE)
    {
        char ch = uart_fifo.tx_pop();
        if (ch == '\0')
        {
            // end of transmit
            MODIFY_REG32(&m_uart->CR1, USART_CR1_TXEIE | USART_CR1_TCIE, 0);
            m_tx_busy = false;
        }
        else
        {
            WRITE_REG32(&m_uart->DR, ch);
        }
    }
}

bool CUART::wait_flag_until_timeout(EFlag flag, bool state, uint32_t timeout_to)
{
	std::uint32_t mask = static_cast<std::uint32_t>(flag);
	while (((get_status() & mask) == mask ? true : false) == state)
	{
		if (Utils::get_tick() >= timeout_to)
		{
			/* Disable TXE, RXNE, PE and ERR (Frame error, noise error, overrun error)
			 * interrupts for the interrupt process */
            MODIFY_REG32(&m_uart->CR1, (USART_CR1_RXNEIE | USART_CR1_PEIE | USART_CR1_TXEIE), 0);
            MODIFY_REG32(&m_uart->CR3, USART_CR3_EIE, 0);

			return false;
		}
	}
	return true;
}

extern CUART uart1;

void ISR::USART1_IRQ()
{
    uart1.isr_handler();
}
