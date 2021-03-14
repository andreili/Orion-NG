#pragma once

#include "usbd_interface.h"

class CUSBDCDC : public CUSBDInterface
{
public:
    void init();
    void de_init();
    void control(uint32_t cmd, uint8_t* p_buf, uint32_t length);
    void receive(uint8_t p_buf, uint32_t* length);
private:
};
