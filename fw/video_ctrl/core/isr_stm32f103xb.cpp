#include "isr_stm32f103xb.h"

void ISR::default_handler()
{
   for(;;);
}

#ifdef USE_MEMORY_ISR
__attribute__((section(".isr_vector"))) extern const ISR::ShortVectors interruptsVectorTable =
#else
__attribute__((section(".isr_vector"))) extern const ISR::Vectors interruptsVectorTable =
#endif
{
#ifdef USE_MEMORY_ISR
   _estack,
   ISR::Reset
};

__attribute__((section(".isr_vector2"))) extern const ISR::Vectors MeminterruptsVectorTable =
{
#endif
	(uint32_t)&_estack,
	ISR::Reset,
	ISR::NMI,
	ISR::HardFault,
	ISR::MemManage,
	ISR::BusFault,
	ISR::UsageFault,
	{0, 0, 0, 0},
	ISR::SVC,
	ISR::DebugMon,
	{0},
	ISR::PendSV,
	ISR::SysTickTimer,
	ISR::WWDG_IRQ,
	ISR::PVD_IRQ,
	ISR::TAMPER_IRQ,
	ISR::RTC_IRQ,
	ISR::FLASH_IRQ,
	ISR::RCC_IRQ,
	ISR::EXTI0_IRQ,
	ISR::EXTI1_IRQ,
	ISR::EXTI2_IRQ,
	ISR::EXTI3_IRQ,
	ISR::EXTI4_IRQ,
	ISR::DMA1_Channel1_IRQ,
	ISR::DMA1_Channel2_IRQ,
	ISR::DMA1_Channel3_IRQ,
	ISR::DMA1_Channel4_IRQ,
	ISR::DMA1_Channel5_IRQ,
	ISR::DMA1_Channel6_IRQ,
	ISR::DMA1_Channel7_IRQ,
	ISR::ADC1_2_IRQ,
	ISR::USB_HP_CAN1_TX_IRQ,
	ISR::USB_LP_CAN1_RX0_IRQ,
	ISR::CAN1_RX1_IRQ,
	ISR::CAN1_SCE_IRQ,
	ISR::EXTI9_5_IRQ,
	ISR::TIM1_BRK_IRQ,
	ISR::TIM1_UP_IRQ,
	ISR::TIM1_TRG_COM_IRQ,
	ISR::TIM1_CC_IRQ,
	ISR::TIM2_IRQ,
	ISR::TIM3_IRQ,
	ISR::TIM4_IRQ,
	ISR::I2C1_EV_IRQ,
	ISR::I2C1_ER_IRQ,
	ISR::I2C2_EV_IRQ,
	ISR::I2C2_ER_IRQ,
	ISR::SPI1_IRQ,
	ISR::SPI2_IRQ,
	ISR::USART1_IRQ,
	ISR::USART2_IRQ,
	ISR::USART3_IRQ,
	ISR::EXTI15_10_IRQ,
	ISR::RTC_Alarm_IRQ,
	ISR::USBWakeUp_IRQ,

};
#pragma weak Reset                = default_handler 
#pragma weak NMI                  = default_handler 
#pragma weak HardFault            = default_handler 
#pragma weak MemManage            = default_handler 
#pragma weak BusFault             = default_handler 
#pragma weak UsageFault           = default_handler 
#pragma weak SVC                  = default_handler 
#pragma weak DebugMon             = default_handler 
#pragma weak PendSV               = default_handler 
#pragma weak SysTickTimer         = default_handler 
#pragma weak WWDG_IRQ             = default_handler 
#pragma weak PVD_IRQ              = default_handler 
#pragma weak TAMPER_IRQ           = default_handler 
#pragma weak RTC_IRQ              = default_handler 
#pragma weak FLASH_IRQ            = default_handler 
#pragma weak RCC_IRQ              = default_handler 
#pragma weak EXTI0_IRQ            = default_handler 
#pragma weak EXTI1_IRQ            = default_handler 
#pragma weak EXTI2_IRQ            = default_handler 
#pragma weak EXTI3_IRQ            = default_handler 
#pragma weak EXTI4_IRQ            = default_handler 
#pragma weak DMA1_Channel1_IRQ    = default_handler 
#pragma weak DMA1_Channel2_IRQ    = default_handler 
#pragma weak DMA1_Channel3_IRQ    = default_handler 
#pragma weak DMA1_Channel4_IRQ    = default_handler 
#pragma weak DMA1_Channel5_IRQ    = default_handler 
#pragma weak DMA1_Channel6_IRQ    = default_handler 
#pragma weak DMA1_Channel7_IRQ    = default_handler 
#pragma weak ADC1_2_IRQ           = default_handler 
#pragma weak USB_HP_CAN1_TX_IRQ   = default_handler 
#pragma weak USB_LP_CAN1_RX0_IRQ  = default_handler 
#pragma weak CAN1_RX1_IRQ         = default_handler 
#pragma weak CAN1_SCE_IRQ         = default_handler 
#pragma weak EXTI9_5_IRQ          = default_handler 
#pragma weak TIM1_BRK_IRQ         = default_handler
#pragma weak TIM1_UP_IRQ          = default_handler
#pragma weak TIM1_TRG_COM_IRQ     = default_handler
#pragma weak TIM1_CC_IRQ          = default_handler 
#pragma weak TIM2_IRQ             = default_handler 
#pragma weak TIM3_IRQ             = default_handler 
#pragma weak TIM4_IRQ             = default_handler 
#pragma weak I2C1_EV_IRQ          = default_handler 
#pragma weak I2C1_ER_IRQ          = default_handler 
#pragma weak I2C2_EV_IRQ          = default_handler 
#pragma weak I2C2_ER_IRQ          = default_handler 
#pragma weak SPI1_IRQ             = default_handler 
#pragma weak SPI2_IRQ             = default_handler 
#pragma weak USART1_IRQ           = default_handler 
#pragma weak USART2_IRQ           = default_handler 
#pragma weak USART3_IRQ           = default_handler 
#pragma weak EXTI15_10_IRQ        = default_handler 
#pragma weak RTC_Alarm_IRQ        = default_handler 
#pragma weak USBWakeUp_IRQ        = default_handler

