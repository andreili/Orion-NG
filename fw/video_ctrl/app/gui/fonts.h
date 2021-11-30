#pragma once

#include <inttypes.h>

typedef struct
{
    uint8_t is_fixed;
    uint8_t width;
    uint8_t height;
    uint8_t unk;
    const uint8_t *data;
} font_t;

extern font_t const led_font6x8;
