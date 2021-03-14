#pragma once

#include "core.h"

enum EGPIOPins
{
    PIN_0  = (1 << 0),
    PIN_1  = (1 << 1),
    PIN_2  = (1 << 2),
    PIN_3  = (1 << 3),
    PIN_4  = (1 << 4),
    PIN_5  = (1 << 5),
    PIN_6  = (1 << 6),
    PIN_7  = (1 << 7),
    PIN_8  = (1 << 8),
    PIN_9  = (1 << 9),
    PIN_10 = (1 << 10),
    PIN_11 = (1 << 11),
    PIN_12 = (1 << 12),
    PIN_13 = (1 << 13),
    PIN_14 = (1 << 14),
    PIN_15 = (1 << 15),
};
inline EGPIOPins operator|(EGPIOPins a, EGPIOPins b)
{
    return static_cast<EGPIOPins>(static_cast<uint32_t>(a) | static_cast<uint32_t>(b));
}

enum EGPIOMode
{
    INPUT               = 0x00000000u,
    OUTPUT_PP           = 0x00000001u,
    OUTPUT_OD           = 0x00000011u,
    AF_PP               = 0x00000002u,
    AF_OD               = 0x00000012u,
    AF_INPUT            = INPUT,
    ANALOG              = 0x00000003u,
    IT_RISING           = 0x10110000u,
    IT_FALLING          = 0x10210000u,
    IT_RISING_FALLING   = 0x10310000u,
    EVT_RISING          = 0x10120000u,
    EVT_FALLING         = 0x10220000u,
    EVT_RISING_FALLING  = 0x10320000u,
};

enum EGPIOPull
{
    NOPULL = 0,
    PULLUP = 1,
    PULLDOWN = 2,
};

enum EGPIOSpeed
{
    LOW = GPIO_CRL_MODE0_1,
    MEDIUM = GPIO_CRL_MODE0_0,
    HIGH = GPIO_CRL_MODE0,
};

class CGPIO
{
public:
    void init(GPIO_TypeDef* base);
    void init_pins(EGPIOPins pins, EGPIOMode mode, EGPIOPull pull, EGPIOSpeed speed);
    void pin_UP(EGPIOPins pins) { WRITE_REG32(&m_gpio->BSRR, static_cast<uint32_t>(pins)); }
    void pin_DOWN(EGPIOPins pins) { WRITE_REG32(&m_gpio->BRR, static_cast<uint32_t>(pins)); }
private:
    GPIO_TypeDef* m_gpio;
};
