#include "drv_i2c.h"
#include "drv_rcc.h"
#include "utils.h"

#define I2C_TIMEOUT_FLAG          35U         /*!< Timeout 35 ms             */
#define I2C_TIMEOUT_BUSY_FLAG     25U         /*!< Timeout 25 ms             */
#define I2C_TIMEOUT_STOP_FLAG     5U          /*!< Timeout 5 ms              */

#define I2C_7BIT_ADD_WRITE(__ADDRESS__)                    ((uint8_t)((__ADDRESS__) & (uint8_t)(~I2C_OAR1_ADD0)))
#define I2C_7BIT_ADD_READ(__ADDRESS__)                     ((uint8_t)((__ADDRESS__) | I2C_OAR1_ADD0))

void CI2C::init(I2C_TypeDef* base, uint32_t clock_speed, EI2CDuty duty)
{
    m_base = base;
    disable();
    reset();

    uint32_t pclk1 = CRCC::get_PCLK1_clock();
    uint32_t freq_range = pclk1 / (1000 * 1000);
    set_freq_range(freq_range);

    uint32_t rise_time;
    if (clock_speed <= (100 * 1000))
    {
        rise_time = freq_range + 1;
    }
    else
    {
        rise_time = ((freq_range * 300) / 1000) + 1;
    }
    set_rise_time(rise_time);

    uint32_t speed;
    if (clock_speed <= 100 * 1000)
    {
        // standart
        speed = ccr_calc(pclk1, clock_speed, 2);
        if (speed < 4)
        {
            speed = 4;
        }
    }
    else
    {
        // fast
        if (duty == EI2CDuty::CYCLE_2)
        {
            speed = ccr_calc(pclk1, clock_speed, 3);
        }
        else
        {
            speed = ccr_calc(pclk1, clock_speed, 25);
            speed |= EI2CDuty::CYCLE_16_9;
        }
        if (speed == 0)
        {
            speed = 1;
        }
        speed |= I2C_CCR_FS;
    }
    set_speed(speed);

    // Configure I2Cx: Generalcall and NoStretch mode
    MODIFY_REG32(&m_base->CR1, (I2C_CR1_ENGC | I2C_CR1_NOSTRETCH), 0);

    // Own Address1 and addressing mode
    MODIFY_REG32(&m_base->OAR1, (I2C_OAR1_ADDMODE | I2C_OAR1_ADD8_9 | I2C_OAR1_ADD1_7 | I2C_OAR1_ADD0),
        0x00004000U | 0);
    
    // Dual mode and Own Address2
    MODIFY_REG32(&m_base->OAR2, (I2C_OAR2_ENDUAL | I2C_OAR2_ADD2), 0);

    enable();
}

bool CI2C::master_transmit(uint32_t dev_addr, uint8_t* p_data, uint32_t size, uint32_t timeout, bool is_restart)
{
    uint32_t time_end = Utils::get_tick() + timeout;

    if (!wait_flag_until_timeout(EFlag::BUSY, true, I2C_TIMEOUT_BUSY_FLAG))
    {
        return false;
    }

    if (!is_enabled())
    {
        enable();
    }
    disable_pos();
    if (!master_request_write(dev_addr, time_end))
    {
        return false;
    }

    clear_addr_flag();
    
    uint32_t rem_bytes = size;
    while (rem_bytes > 0)
    {
        if (!wait_on_TXE_flag_until_timeout(time_end))
        {
            gen_stop();
            return false;
        }
        WRITE_REG32(&m_base->DR, *p_data);
        ++p_data;
        --rem_bytes;

        if (get_flag(EFlag::BTF) && (rem_bytes != 0))
        {
            WRITE_REG32(&m_base->DR, *p_data);
            ++p_data;
            --rem_bytes;
        }
        if (!wait_on_BTF_flag_until_limit(time_end))
        {
            gen_stop();
            return false;
        }
    }

    if (!is_restart)
    {
        gen_stop();
    }
    return true;
}

bool CI2C::master_transmit_DMA(uint32_t dev_addr, uint8_t* p_data, uint32_t size, bool is_restart)
{
    if (!wait_flag_until_timeout(EFlag::BUSY, true, I2C_TIMEOUT_BUSY_FLAG))
    {
        return false;
    }

    if (!is_enabled())
    {
        enable();
    }
    disable_pos();
}

bool CI2C::master_receive(uint32_t dev_addr, uint8_t* p_data, uint32_t size, uint32_t timeout)
{
    uint32_t time_end = Utils::get_tick() + timeout;

    if (!wait_flag_until_timeout(EFlag::BUSY, true, I2C_TIMEOUT_BUSY_FLAG))
    {
        return false;
    }

    if (!is_enabled())
    {
        enable();
    }
    disable_pos();

    if (!master_request_read(dev_addr, time_end))
    {
        return false;
    }

    if (size == 0)
    {
        clear_addr_flag();
        gen_stop();
    }
    else if (size == 1)
    {
        disable_ack();
        CORTEX::disable_irq();
        clear_addr_flag();
        gen_stop();
        CORTEX::enable_irq();
    }
    else if (size == 2)
    {
        enable_pos();
        CORTEX::disable_irq();
        clear_addr_flag();
        disable_ack();
        CORTEX::enable_irq();
    }
    else
    {
        enable_ack();
        clear_addr_flag();
    }

    uint32_t rem_bytes = size;
    while (rem_bytes > 0)
    {
        if (rem_bytes == 1)
        {
            if (!wait_on_RXNE_flag_until_timeout(time_end))
            {
                return false;
            }
            *p_data = READ_REG32(&m_base->DR);
            p_data++;
            rem_bytes--;
        }
        else if (rem_bytes == 2)
        {
            if (!wait_flag_until_timeout(EFlag::BTF, false, time_end))
            {
                return false;
            }
            CORTEX::disable_irq();
            gen_stop();
            *p_data = READ_REG32(&m_base->DR);
            p_data++;
            rem_bytes--;
            CORTEX::enable_irq();
            *p_data = READ_REG32(&m_base->DR);
            p_data++;
            rem_bytes--;
        }
        else if (rem_bytes == 3)
        {
            if (!wait_flag_until_timeout(EFlag::BTF, false, time_end))
            {
                return false;
            }
            disable_ack();
            CORTEX::disable_irq();
            *p_data = READ_REG32(&m_base->DR);
            p_data++;
            rem_bytes--;
            if (!wait_flag_until_timeout(EFlag::BTF, false, time_end))
            {
                CORTEX::enable_irq();
                return false;
            }
            gen_stop();
            *p_data = READ_REG32(&m_base->DR);
            p_data++;
            rem_bytes--;
            CORTEX::enable_irq();
            *p_data = READ_REG32(&m_base->DR);
            p_data++;
            rem_bytes--;
        }
        else
        {
            if (!wait_on_RXNE_flag_until_timeout(time_end))
            {
                return false;
            }
            *p_data = READ_REG32(&m_base->DR);
            p_data++;
            rem_bytes--;
            if (get_flag(EFlag::BTF) == true)
            {
                *p_data = READ_REG32(&m_base->DR);
                p_data++;
                rem_bytes--;
            }
        }
    }

    return true;
}

uint32_t CI2C::ccr_calc(uint32_t pclk1, uint32_t clock, uint32_t coeff)
{
    return (((pclk1 - 1) / (clock * coeff)) + 1) & I2C_CCR_CCR;
}

bool CI2C::wait_flag_until_timeout(EFlag flag, bool state, uint32_t timeout_to)
{
	while (get_flag(flag) == state)
	{
		if (Utils::get_tick() >= timeout_to)
		{
			return false;
		}
	}
	return true;
}

bool CI2C::wait_on_master_addr_flag_until_timeout(EFlag flag, uint32_t timeout_to)
{
	while (get_flag(flag) == false)
    {
        if (get_flag(EFlag::AF) == true)
        {
            gen_stop();
            clear_flag(EFlag::AF);
            return false;
        }
		if (Utils::get_tick() >= timeout_to)
		{
			return false;
		}
    }
    return true;
}

bool CI2C::wait_on_RXNE_flag_until_timeout(uint32_t timeout_to)
{
	while (get_flag(EFlag::RXNE) == false)
    {
        if (get_flag(EFlag::STOPF) == true)
        {
            gen_stop();
            clear_flag(EFlag::STOPF);
            return false;
        }
		if (Utils::get_tick() >= timeout_to)
		{
			return false;
		}
    }
    return true;
}

bool CI2C::wait_on_TXE_flag_until_timeout(uint32_t timeout_to)
{
	while (get_flag(EFlag::TXE) == false)
    {
        if (is_ack_failed())
        {
            return false;
        }
		if (Utils::get_tick() >= timeout_to)
		{
			return false;
		}
    }
    return true;
}

bool CI2C::wait_on_BTF_flag_until_limit(uint32_t timeout_to)
{
	while (get_flag(EFlag::BTF) == false)
    {
        if (is_ack_failed())
        {
            return false;
        }
		if (Utils::get_tick() >= timeout_to)
		{
			return false;
		}
    }
    return true;
}

bool CI2C::master_request_write(uint32_t dev_addr, uint32_t timeout)
{
    gen_start();
    if (!wait_flag_until_timeout(EFlag::SB, false, timeout))
    {
        return false;
    }
    WRITE_REG32(&m_base->DR, I2C_7BIT_ADD_WRITE(dev_addr));
    if (!wait_on_master_addr_flag_until_timeout(EFlag::ADDR, timeout))
    {
        return false;
    }
    return true;
}

bool CI2C::master_request_read(uint32_t dev_addr, uint32_t timeout)
{
    enable_ack();
    gen_start();
    if (!wait_flag_until_timeout(EFlag::SB, false, timeout))
    {
        return false;
    }
    WRITE_REG32(&m_base->DR, I2C_7BIT_ADD_READ(dev_addr));
    if (!wait_on_master_addr_flag_until_timeout(EFlag::ADDR, timeout))
    {
        return false;
    }
    return true;
}
