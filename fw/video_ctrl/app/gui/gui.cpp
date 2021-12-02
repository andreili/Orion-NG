#include "gui.h"
#include "scr_info.h"
#include "display.h"

GUI::EActiveScreen GUI::m_screen;
static uint8_t disp_data[(SSD1306_WIDTH * SSD1306_HEIGHT / 8) + 1];

void GUI::init()
{
    Display::init(disp_data);
    Display::clear();

    Display::draw_h_line(0, SSD1306_WIDTH - 1, 0, 1);
    Display::draw_string(10, 2, "Main menu");
    Display::draw_h_line(0, SSD1306_WIDTH - 1, 8+2, 1);
    Display::draw_h_line(0, SSD1306_WIDTH - 1, SSD1306_HEIGHT - 1, 1);
    
    Display::draw_v_line(0, 0, SSD1306_HEIGHT - 1, 1);
    Display::draw_v_line(SSD1306_WIDTH - 1, 0, SSD1306_HEIGHT - 1, 1);
}

void GUI::draw()
{
    Display::update();
}
