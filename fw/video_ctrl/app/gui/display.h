#pragma once

#include <inttypes.h>

#define SSD1306_I2C_ADDR         0x78
//#define SSD1306_I2C_ADDR       0x7A

#define SSD1306_WIDTH            128
#define SSD1306_HEIGHT           64

class Display
{
public:
    static void init(uint8_t* p_data);
    static void clear();
    static void update();
    static void set_inverted(bool val) { m_inverted = val; }
    static void draw_char(uint32_t x, uint32_t y, char ch);
    static void draw_string(uint32_t x, uint32_t y, const char *p_str);
    static void draw_h_line(uint32_t x0, uint32_t x1, uint32_t y, uint32_t pitch);
    static void draw_v_line(uint32_t x, uint32_t y0, uint32_t y1, uint32_t pitch);
private:
    static bool m_inverted;
    static uint8_t* m_data;
    static uint8_t* m_data_all;
};
