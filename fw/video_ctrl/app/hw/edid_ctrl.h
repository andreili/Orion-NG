#pragma once

#include <cstdint>

#define EDID_DATA_SIZE 128
#define EDID_DESC_SIZE 13

class CEDIDCtrl
{
public:
    static void init();
    static uint32_t get_pxl_clk() { return m_pxl_clk; }
    static void periodic_rescan();
    static void reset();
private:
    static char     m_serial[EDID_DESC_SIZE];
    static uint8_t  m_buf[EDID_DATA_SIZE+1];
    static uint32_t m_pxl_clk;
    static void parse_info();
    static void parse_desc(uint8_t* ptr);
};
