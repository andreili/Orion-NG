#pragma once

#include "core.h"

enum EI2CDuty
{
    CYCLE_2 = 0,
    CYCLE_16_9 = I2C_CCR_DUTY,
};

#define I2C_FLAG_MASK                    0x0000FFFFU

class CI2C
{
public:
    void init(I2C_TypeDef* base, uint32_t clock_speed, EI2CDuty duty);
    bool master_transmit(uint32_t dev_addr, uint8_t* p_data, uint32_t size, uint32_t timeout, bool is_restart);
    bool master_transmit_DMA(uint32_t dev_addr, uint8_t* p_data, uint32_t size, bool is_restart);
    bool master_receive(uint32_t dev_addr, uint8_t* p_data, uint32_t size, uint32_t timeout);
    void reset() { SET_REG32(&m_base->CR1, I2C_CR1_SWRST); CLEAR_REG32(&m_base->CR1, I2C_CR1_SWRST); }
    void enable() { SET_REG32(&m_base->CR1, I2C_CR1_PE); }
    void disable() { CLEAR_REG32(&m_base->CR1, I2C_CR1_PE); }
    bool is_busy() { return get_flag(EFlag::BUSY); }
private:
    I2C_TypeDef*    m_base;

	enum class EFlag: std::uint32_t
	{
        OVR                    = 0x00010800U,
        AF                     = 0x00010400U,
        ARLO                   = 0x00010200U,
        BERR                   = 0x00010100U,
        TXE                    = 0x00010080U,
        RXNE                   = 0x00010040U,
        STOPF                  = 0x00010010U,
        ADD10                  = 0x00010008U,
        BTF                    = 0x00010004U,
        ADDR                   = 0x00010002U,
        SB                     = 0x00010001U,
        DUALF                  = 0x00100080U,
        GENCALL                = 0x00100010U,
        TRA                    = 0x00100004U,
        BUSY                   = 0x00100002U,
        MSL                    = 0x00100001U,
    };

    bool is_enabled() { return (READ_REG32(&m_base->CR1) & I2C_CR1_PE) == I2C_CR1_PE; }
    void disable_pos() { CLEAR_REG32(&m_base->CR1, I2C_CR1_POS); }
    void enable_ack() { SET_REG32(&m_base->CR1, I2C_CR1_ACK); }
    void disable_ack() { CLEAR_REG32(&m_base->CR1, I2C_CR1_ACK); }
    void gen_start() { SET_REG32(&m_base->CR1, I2C_CR1_START); }
    void gen_stop() { SET_REG32(&m_base->CR1, I2C_CR1_STOP); }
    void enable_pos() { SET_REG32(&m_base->CR1, I2C_CR1_POS); }

    bool is_ack_failed()
    {
        if (get_flag(EFlag::AF))
        {
            clear_flag(EFlag::AF);
            return true;
        }
        return false;
    }

    bool get_flag(uint32_t flag)
    {
        uint32_t reg_val;
        if (flag >> 16)
        {
            reg_val = READ_REG32(&m_base->SR1);
        }
        else
        {
            reg_val = READ_REG32(&m_base->SR2);
        }
        return ((reg_val & flag) & I2C_FLAG_MASK) == (flag & I2C_FLAG_MASK);
    }
    bool get_flag(EFlag flag) { return get_flag(static_cast<uint32_t>(flag)); }
    void clear_flag(uint32_t flag) { MODIFY_REG32(&m_base->SR1, (flag & I2C_FLAG_MASK), 0); }
    void clear_flag(EFlag flag) { clear_flag(static_cast<uint32_t>(flag)); }
    void clear_addr_flag()
    {
        READ_REG32(&m_base->SR1);
        READ_REG32(&m_base->SR2);
    }

    void set_freq_range(uint32_t range) { MODIFY_REG32(&m_base->CR2, I2C_CR2_FREQ, range); }
    void set_rise_time(uint32_t time) { MODIFY_REG32(&m_base->TRISE, I2C_TRISE_TRISE, time); }
    void set_speed(uint32_t speed) { MODIFY_REG32(&m_base->CCR, (I2C_CCR_FS | I2C_CCR_DUTY | I2C_CCR_CCR), speed); }

    uint32_t ccr_calc(uint32_t pclk1, uint32_t clock, uint32_t coeff);
    bool wait_flag_until_timeout(EFlag flag, bool state, uint32_t timeout_to);
    bool wait_on_master_addr_flag_until_timeout(EFlag flag, uint32_t timeout_to);
    bool wait_on_RXNE_flag_until_timeout(uint32_t timeout_to);
    bool wait_on_TXE_flag_until_timeout(uint32_t timeout_to);
    bool wait_on_BTF_flag_until_limit(uint32_t timeout_to);

    bool master_request_write(uint32_t dev_addr, uint32_t timeout);
    bool master_request_read(uint32_t dev_addr, uint32_t timeout);
};
