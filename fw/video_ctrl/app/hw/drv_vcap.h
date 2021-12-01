#pragma once
#include <cstdint>
#include "hil.h"

#define VREG_RSEN 9
#define VREG_ACTIVE 12
#define VREG_PRESENT 16
#define TFP_ADDR 0x7e

#define VCAP_CTRL_BASE_ADDR 0x40

#pragma pack(push, 1)
typedef union
{
    struct
    {
        uint32_t x_start        : 12;
        uint32_t x_size         : 12;
        uint32_t y_start        : 12;
        uint32_t y_size         : 12;
        uint32_t HS_inv         : 1;
        uint32_t VS_inv         : 1;
        uint32_t mux_mode       : 3;
    };
    uint32_t dw[2];
    uint8_t bt[8];
} vcap_regs_t;
#pragma pack(pop)

class CVcap
{
public:
    static void init();
    static inline void set_regs()
    {
        HIL::pl_set_registers(VCAP_CTRL_BASE_ADDR, &m_regs.bt[0], sizeof(vcap_regs_t));
    }

    static void set_x_start(uint32_t val) { m_regs.x_start = val; }
    static void set_x_size(uint32_t val) { m_regs.x_size = val; }
    static void set_y_start(uint32_t val) { m_regs.y_start = val; }
    static void set_y_size(uint32_t val) { m_regs.y_size = val; }
    static void set_HS_inv(bool val) { m_regs.HS_inv = val; }
    static void set_VS_inv(bool val) { m_regs.VS_inv = val; }
    static void set_mux_mode(uint32_t val) { m_regs.mux_mode = val; }
private:
    static vcap_regs_t      m_regs;
};
