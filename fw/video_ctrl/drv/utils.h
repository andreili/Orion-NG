#pragma once

#include <stdint.h>

class Utils
{
public:
    static void timer_init();
    static uint32_t get_tick() { return m_ticks; }
    static void on_tick() { ++m_ticks; }
private:
    static volatile uint32_t m_ticks;
};
