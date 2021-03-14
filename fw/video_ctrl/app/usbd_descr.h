#pragma once

#include <cstdint>
#include "usbd_conf.h"

class CUSBDDescr
{
public:
    static uint8_t* device_descriptor(EUSBSpeed speed, uint16_t* length);
    static uint8_t* lang_ID_descriptor(EUSBSpeed speed, uint16_t* length);
    static uint8_t* manufacturer_str_descriptor(EUSBSpeed speed, uint16_t* length);
    static uint8_t* product_str_descriptor(EUSBSpeed speed, uint16_t* length);
    static uint8_t* serial_str_descriptor(EUSBSpeed speed, uint16_t* length);
    static uint8_t* config_str_descriptor(EUSBSpeed speed, uint16_t* length);
    static uint8_t* interface_str_descriptor(EUSBSpeed speed, uint16_t* length);
};
