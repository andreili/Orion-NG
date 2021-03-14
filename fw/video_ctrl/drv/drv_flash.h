#pragma once

#include "core.h"

class CFLASH
{
public:
    enum ELatency
    {
        WS_0 = (0x0UL << FLASH_ACR_LATENCY_Pos),
        WS_1 = (0x1UL << FLASH_ACR_LATENCY_Pos),
        WS_2 = (0x2UL << FLASH_ACR_LATENCY_Pos),
    };
    static inline void prefetch_enable() { SET_REG32(&FLASH->ACR, FLASH_ACR_PRFTBE); }
    static inline void set_latency(ELatency latency) { MODIFY_REG32(&FLASH->ACR, FLASH_ACR_LATENCY, latency); }
private:
};
