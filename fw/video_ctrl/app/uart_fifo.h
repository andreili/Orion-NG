#pragma once

#include <cstdint>

#define TX_BUF_SIZE 1024
#define RX_BUF_SIZE 32

#define IS_FIFO_FULL(tail, head, size) ((tail==0) ? (head==(size-1)) : (head==(tail-1)))
#define IS_FIFO_EMPTY(tail, head) (tail == head)
#define FIFO_INC(ht, size) { if (ht==(size-1)) { ht=0; } else { ht++; } }

class CUARTFIFO
{
public:
    CUARTFIFO();
    void tx_push(char ch);
    char tx_pop();
    bool tx_empty() { return IS_FIFO_EMPTY(m_tx_tail, m_tx_head); }
    void rx_push(char ch);
    char rx_pop();
    bool rx_empty() { return IS_FIFO_EMPTY(m_rx_tail, m_rx_head); }
private:
    volatile uint32_t    m_tx_head;
    volatile uint32_t    m_tx_tail;
    volatile uint32_t    m_rx_head;
    volatile uint32_t    m_rx_tail;
    char        m_tx_buf[TX_BUF_SIZE];
    char        m_rx_buf[RX_BUF_SIZE];
};

extern CUARTFIFO uart_fifo;
