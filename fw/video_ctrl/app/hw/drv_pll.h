#pragma once

#include <cstdint>

class CPLL
{
public:
    static void init();
    static void set_freq(uint32_t freq);
    static void find_best(uint32_t freq);
private:
    static void set_pll_regs();
    static void update_pll();
};
