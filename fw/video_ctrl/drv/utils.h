#pragma once

#include <stdint.h>

class Utils
{
public:
    static void timer_init();
    static uint32_t get_tick() { return m_ticks; }
    static void on_tick() { ++m_ticks; }
    static void delay_ms(uint32_t ms);
private:
    static volatile uint32_t m_ticks;
};
