#include "drv_gpio.h"

void CGPIO::init(GPIO_TypeDef* base)
{
    m_gpio = base;
}

#define GPIO_MODE             0x00000003u
#define EXTI_MODE             0x10000000u
#define GPIO_MODE_IT          0x00010000u
#define GPIO_MODE_EVT         0x00020000u
#define RISING_EDGE           0x00100000u
#define FALLING_EDGE          0x00200000u
#define GPIO_OUTPUT_TYPE      0x00000010u

#define GPIO_NUMBER           16u

/* Definitions for bit manipulation of CRL and CRH register */
#define  GPIO_CR_MODE_INPUT         0x00000000u /*!< 00: Input mode (reset state)  */
#define  GPIO_CR_CNF_ANALOG         0x00000000u /*!< 00: Analog mode  */
#define  GPIO_CR_CNF_INPUT_FLOATING 0x00000004u /*!< 01: Floating input (reset state)  */
#define  GPIO_CR_CNF_INPUT_PU_PD    0x00000008u /*!< 10: Input with pull-up / pull-down  */
#define  GPIO_CR_CNF_GP_OUTPUT_PP   0x00000000u /*!< 00: General purpose output push-pull  */
#define  GPIO_CR_CNF_GP_OUTPUT_OD   0x00000004u /*!< 01: General purpose output Open-drain  */
#define  GPIO_CR_CNF_AF_OUTPUT_PP   0x00000008u /*!< 10: Alternate function output Push-pull  */
#define  GPIO_CR_CNF_AF_OUTPUT_OD   0x0000000Cu /*!< 11: Alternate function output Open-drain  */

void CGPIO::init_pins(EGPIOPins pins, EGPIOMode mode, EGPIOPull pull, EGPIOSpeed speed)
{
    uint32_t pin_mask = static_cast<uint32_t>(pins);
    uint32_t config;
    for (uint32_t pin=0 ; pin<16 ; ++pin)
    {
        uint32_t msk = (1 << pin);
        if ((pin_mask & msk) != 0)
        {
            switch (mode)
            {
            case EGPIOMode::OUTPUT_PP:
                config = static_cast<uint32_t>(speed) | GPIO_CR_CNF_GP_OUTPUT_PP;
                break;
            case EGPIOMode::OUTPUT_OD:
                config = static_cast<uint32_t>(speed) | GPIO_CR_CNF_GP_OUTPUT_OD;
                break;
            case EGPIOMode::AF_PP:
                config = static_cast<uint32_t>(speed) | GPIO_CR_CNF_AF_OUTPUT_PP;
                break;
            case EGPIOMode::AF_OD:
                config = static_cast<uint32_t>(speed) | GPIO_CR_CNF_AF_OUTPUT_OD;
                break;
            case EGPIOMode::INPUT:
            case EGPIOMode::IT_RISING:
            case EGPIOMode::IT_FALLING:
            case EGPIOMode::IT_RISING_FALLING:
            case EGPIOMode::EVT_RISING:
            case EGPIOMode::EVT_FALLING:
            case EGPIOMode::EVT_RISING_FALLING:
                if (pull == EGPIOPull::NOPULL)
                {
                    config = GPIO_CR_MODE_INPUT | GPIO_CR_CNF_INPUT_FLOATING;
                }
                else if (pull == EGPIOPull::PULLUP)
                {
                    config = GPIO_CR_MODE_INPUT | GPIO_CR_CNF_INPUT_PU_PD;
                    WRITE_REG32(&m_gpio->BSRR, msk);
                }
                else
                {
                    config = GPIO_CR_MODE_INPUT | GPIO_CR_CNF_INPUT_PU_PD;
                    WRITE_REG32(&m_gpio->BRR, msk);
                }
                break;
            case EGPIOMode::ANALOG:
                config = GPIO_CR_MODE_INPUT | GPIO_CR_CNF_ANALOG;
                break;
            default:
                config = 0;
                break;
            }

            volatile uint32_t* config_reg = (pin < 8) ? &m_gpio->CRL : &m_gpio->CRH;
            uint32_t offset = (pin < 8) ? (pin << 2) : ((pin - 8) << 2);

            MODIFY_REG32(config_reg, ((GPIO_CRL_MODE0 | GPIO_CRL_CNF0) << offset), (config << offset));
        }
    }
}
