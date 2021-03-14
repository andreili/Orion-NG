#pragma once

#include <cstdint>
#include "core.h"

enum EPeriph
{
    // AHB
    AHB_DMA1 		= RCC_AHBENR_DMA1EN,
    AHB_SRAM 		= RCC_AHBENR_SRAMEN,
    AHB_FLITF 		= RCC_AHBENR_FLITFEN,
    AHB_CRC 		= RCC_AHBENR_CRCEN,
    // APB1
    APB1_TIM2 		= RCC_APB1ENR_TIM2EN,
    APB1_TIM3 		= RCC_APB1ENR_TIM3EN,
    APB1_TIM4 		= RCC_APB1ENR_TIM4EN,
    APB1_WWDG 		= RCC_APB1ENR_WWDGEN,
    APB1_SPI2 		= RCC_APB1ENR_SPI2EN,
    APB1_USART2 	= RCC_APB1ENR_USART2EN,
    APB1_USART3 	= RCC_APB1ENR_USART3EN,
    APB1_I2C1 		= RCC_APB1ENR_I2C1EN,
    APB1_I2C2 		= RCC_APB1ENR_I2C2EN,
    APB1_USB 		= RCC_APB1ENR_USBEN,
    APB1_CAN 		= RCC_APB1ENR_CAN1EN,
    APB1_BKP 		= RCC_APB1ENR_BKPEN,
    APB1_PWR 		= RCC_APB1ENR_PWREN,
    // APB2
    APB2_AFIO 		= RCC_APB2ENR_AFIOEN,
    APB2_GPIOA 		= RCC_APB2ENR_IOPAEN,
    APB2_GPIOB 		= RCC_APB2ENR_IOPBEN,
    APB2_GPIOC 		= RCC_APB2ENR_IOPCEN,
    APB2_GPIOD 		= RCC_APB2ENR_IOPDEN,
    APB2_GPIOE 		= RCC_APB2ENR_IOPEEN,
    APB2_ADC1 		= RCC_APB2ENR_ADC1EN,
    APB2_ADC2 		= RCC_APB2ENR_ADC2EN,
    APB2_TIM1 		= RCC_APB2ENR_TIM1EN,
    APB2_SPI1 		= RCC_APB2ENR_SPI1EN,
    APB2_USART1 	= RCC_APB2ENR_USART1EN,
};
inline EPeriph operator|(EPeriph a, EPeriph b)
{
    return static_cast<EPeriph>(static_cast<uint32_t>(a) | static_cast<uint32_t>(b));
}

class CRCC
{
public:
    static void init();
    static uint32_t get_HCLK_clock() { return m_core_clock; }
    static uint32_t get_PCLK1_clock();
    static uint32_t get_PCLK2_clock();
    static void update_sys_clk();

    static void set_clk_AHB_enabled(EPeriph per, bool val);
    static void set_clk_APB1_enabled(EPeriph per, bool val);
    static void set_clk_APB2_enabled(EPeriph per, bool val);
private:
    static uint32_t m_core_clock;

    enum class EClockSource
    {
        HSI = RCC_CFGR_SWS_HSI,
        HSE = RCC_CFGR_SWS_HSE,
        PLL = RCC_CFGR_SWS_PLL,
    };
    enum class EPLLSource
    {
        HSI_DIV2 = 0,
        HSE = RCC_CFGR_PLLSRC,
    };

    static EClockSource get_sys_clk_source()
    {
        return static_cast<EClockSource>(READ_REG32(&RCC->CFGR) & RCC_CFGR_SWS);
    }

    static EPLLSource get_PLL_clk_source()
    {
        return static_cast<EPLLSource>(READ_REG32(&RCC->CFGR) & RCC_CFGR_PLLSRC);
    }

    static uint32_t get_PLL_clk();
    static uint32_t get_PLL_mul();
    static uint32_t get_PLL_prediv();

    static inline void HSE_ON() { SET_REG32(&RCC->CR, RCC_CR_HSEON); }
    static inline bool HSE_ready() { return ((READ_REG32(&RCC->CR) & RCC_CR_HSERDY) == RCC_CR_HSERDY); }
    static inline void PLL_ON() { SET_REG32(&RCC->CR, RCC_CR_PLLON); }
    static inline bool PLL_ready() { return ((READ_REG32(&RCC->CR) & RCC_CR_PLLRDY) == RCC_CR_PLLRDY); }

    static inline void set_system_clock_source(uint32_t source) { MODIFY_REG32(&RCC->CFGR, RCC_CFGR_SW, source); }
    static inline uint32_t get_system_clock_source() { return (READ_REG32(&RCC->CFGR) & RCC_CFGR_SWS); }
    static uint32_t get_AHB_prescaller() { return (READ_REG32(&RCC->CFGR) & RCC_CFGR_HPRE) >> RCC_CFGR_HPRE_Pos; }
    static uint32_t get_APB1_prescaller() { return (READ_REG32(&RCC->CFGR) & RCC_CFGR_PPRE1) >> RCC_CFGR_PPRE1_Pos; }
    static uint32_t get_APB2_prescaller() { return (READ_REG32(&RCC->CFGR) & RCC_CFGR_PPRE2) >> RCC_CFGR_PPRE2_Pos; }
};
