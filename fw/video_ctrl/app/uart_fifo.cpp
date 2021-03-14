#include "uart_fifo.h"

CUARTFIFO uart_fifo;

CUARTFIFO::CUARTFIFO()
{
    m_tx_head = 0;
    m_tx_tail = 0;
    m_rx_head = 0;
    m_rx_tail = 0;
}

void CUARTFIFO::tx_push(char ch)
{
    while (IS_FIFO_FULL(m_tx_tail, m_tx_head, TX_BUF_SIZE));
    m_tx_buf[m_tx_head] = ch;
    FIFO_INC(m_tx_head, TX_BUF_SIZE);
}

char CUARTFIFO::tx_pop()
{
    if (IS_FIFO_EMPTY(m_tx_tail, m_tx_head))
    {
        return '\0';
    }
    else
    {
        char ret = m_tx_buf[m_tx_tail];
        FIFO_INC(m_tx_tail, TX_BUF_SIZE);
        return ret;
    }
}

void CUARTFIFO::rx_push(char ch)
{
    while (IS_FIFO_FULL(m_rx_tail, m_rx_head, RX_BUF_SIZE));
    m_rx_buf[m_rx_head] = ch;
    FIFO_INC(m_rx_head, RX_BUF_SIZE);
}

char CUARTFIFO::rx_pop()
{
    if (IS_FIFO_EMPTY(m_rx_tail, m_rx_head))
    {
        return '\0';
    }
    else
    {
        char ret = m_rx_buf[m_rx_tail];
        FIFO_INC(m_rx_tail, RX_BUF_SIZE);
        return ret;
    }
}
