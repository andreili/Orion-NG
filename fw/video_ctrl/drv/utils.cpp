#include "utils.h"
#include "core.h"
#include "drv_rcc.h"

volatile uint32_t Utils::m_ticks;

void Utils::timer_init()
{
    CORTEX::SysTick_config(CRCC::get_HCLK_clock() / 1000);
    CORTEX::NVIC::set_priority(SysTick_IRQn, CORTEX::NVIC::encode_priority((uint32_t)CORTEX::NVIC::EPriorityGroup::GROUP_4, 0, 0)); 
}

void ISR::SysTickTimer()
{
    Utils::on_tick();
}
