#pragma once

#include <cstdint>

class CUSBDInterface
{
public:
    virtual void init() = 0;
    virtual void de_init() = 0;
    virtual void control(uint32_t cmd, uint8_t* p_buf, uint32_t length) = 0;
    virtual void receive(uint8_t p_buf, uint32_t* length) = 0;
};
