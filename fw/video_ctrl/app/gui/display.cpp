#include "display.h"
#include "utils.h"
#include "drv_i2c.h"
#include "fonts.h"
#include <string.h>

bool Display::m_inverted;
uint8_t* Display::m_data;
uint8_t* Display::m_data_all;

extern CI2C i2c2;

static uint8_t _cmd_buf[4];

#define SSD1306_WRITE_COMMAND(cmd) \
    { \
        _cmd_buf[0] = 0; \
        _cmd_buf[1] = cmd; \
        if (!i2c2.master_transmit(SSD1306_I2C_ADDR, _cmd_buf, 2, 100, false)) \
        { \
            ASSERT(false); \
        } \
    }

void Display::init(uint8_t* p_data)
{
    m_inverted = false;
    m_data = &p_data[1];
    m_data_all = p_data;

    Utils::delay_ms(1);
    /* Init LCD */
	SSD1306_WRITE_COMMAND(0xAE); //display off
	SSD1306_WRITE_COMMAND(0x20); //Set Memory Addressing Mode   
	SSD1306_WRITE_COMMAND(0x10); //00,Horizontal Addressing Mode;01,Vertical Addressing Mode;10,Page Addressing Mode (RESET);11,Invalid
	SSD1306_WRITE_COMMAND(0xB0); //Set Page Start Address for Page Addressing Mode,0-7
	SSD1306_WRITE_COMMAND(0xC8); //Set COM Output Scan Direction
	SSD1306_WRITE_COMMAND(0x00); //---set low column address
	SSD1306_WRITE_COMMAND(0x10); //---set high column address
	SSD1306_WRITE_COMMAND(0x40); //--set start line address
	SSD1306_WRITE_COMMAND(0x81); //--set contrast control register
	SSD1306_WRITE_COMMAND(0xFF);
	SSD1306_WRITE_COMMAND(0xA1); //--set segment re-map 0 to 127
	SSD1306_WRITE_COMMAND(0xA6); //--set normal display
	SSD1306_WRITE_COMMAND(0xA8); //--set multiplex ratio(1 to 64)
	SSD1306_WRITE_COMMAND(0x3F); //
	SSD1306_WRITE_COMMAND(0xA4); //0xa4,Output follows RAM content;0xa5,Output ignores RAM content
	SSD1306_WRITE_COMMAND(0xD3); //-set display offset
	SSD1306_WRITE_COMMAND(0x00); //-not offset
	SSD1306_WRITE_COMMAND(0xD5); //--set display clock divide ratio/oscillator frequency
	SSD1306_WRITE_COMMAND(0xF0); //--set divide ratio
	SSD1306_WRITE_COMMAND(0xD9); //--set pre-charge period
	SSD1306_WRITE_COMMAND(0x22); //
	SSD1306_WRITE_COMMAND(0xDA); //--set com pins hardware configuration
	SSD1306_WRITE_COMMAND(0x12);
	SSD1306_WRITE_COMMAND(0xDB); //--set vcomh
	SSD1306_WRITE_COMMAND(0x20); //0x20,0.77xVcc

	SSD1306_WRITE_COMMAND(0x8D); //--set DC-DC enable
	SSD1306_WRITE_COMMAND(0x14); //
	SSD1306_WRITE_COMMAND(0xAF); //--turn on SSD1306 panel
}

void Display::clear()
{
    memset(m_data_all, 0, SSD1306_WIDTH * SSD1306_HEIGHT / 8);
}

void Display::update()
{
    m_data_all[0] = 0x40;
    i2c2.master_transmit(SSD1306_I2C_ADDR, (uint8_t*)m_data_all, (SSD1306_WIDTH * SSD1306_HEIGHT / 8) + 1, 1000, false);
}

void Display::draw_char(uint32_t x, uint32_t y, char ch)
{
    uint32_t idx = (ch - ' ') * led_font6x8.width;
    uint32_t draw_y_offset = (y / 8);
    uint32_t draw_to_down = y % 8;
    uint32_t draw_to_up = 8 - draw_to_down;
    draw_y_offset *= 8;
    uint32_t addr = ((draw_y_offset * SSD1306_WIDTH) / 8) + x;
    for (uint32_t i=0 ; i<led_font6x8.width ; ++i)
    {
        uint8_t glyph = led_font6x8.data[idx + i];
        if (m_inverted)
        {
            glyph = ~glyph;
        }
        uint8_t glyph_dr = glyph << draw_to_down;
        uint8_t mask_dr = 0xff << draw_to_down;
        uint8_t data = m_data[addr];
        data &= (~mask_dr);
        data |= glyph_dr;
        m_data[addr] = data;
        if (draw_to_down != 0)
        {
            glyph_dr = glyph >> draw_to_up;
            mask_dr = 0xff >> draw_to_up;
            data = m_data[addr + SSD1306_WIDTH];
            data &= (~mask_dr);
            data |= glyph_dr;
            m_data[addr + SSD1306_WIDTH] = data;
        }
        ++addr;
    }
}

void Display::draw_string(uint32_t x, uint32_t y, const char *p_str)
{
    size_t len = strlen(p_str);
    for (size_t i=0 ; i<len ; ++i)
    {
        draw_char(x, y, *p_str++);
        x += led_font6x8.width;
    }
}

void Display::draw_h_line(uint32_t x0, uint32_t x1, uint32_t y, uint32_t pitch)
{
    uint8_t mask = (1 << pitch) - 1;
    uint32_t y_offset = y & 7;
    uint8_t masks[2];
    masks[0] = mask << y_offset;
    masks[1] = mask >> (8 - y_offset);
    for (int i=0 ; i<2 ; ++i)
    {
        if (masks[i] != 0)
        {
            uint32_t addr = ((y & ~7) * SSD1306_WIDTH) / 8;
            for (uint32_t x=x0 ; x<=x1 ; ++x)
            {
                m_data[addr + x] |= masks[i];
            }
        }
        y += 8;
    }
}

void Display::draw_v_line(uint32_t x, uint32_t y0, uint32_t y1, uint32_t pitch)
{
    
    for (uint32_t y=y0 ; y<=y1 ; )
    {
        uint32_t len = (y1 - y) + 1;
        if (len > 8)
        {
            len = 8 - (y & 7);
        }
        uint32_t addr = ((y & ~7) * SSD1306_WIDTH) / 8;
        uint8_t mask = ((1 << len) - 1 ) << (y & 7);
        for(uint32_t i=0 ; i<pitch ; ++i)
        {
            m_data[addr + x + i] |= mask;
        }
        y += len;
    }
}
