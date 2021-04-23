#include "drv_nvic.h"
#include "core.h"

static inline void set_priority(uint32_t irqn, uint32_t prior, uint32_t subprior)
{
    CORTEX::NVIC::set_priority(irqn, CORTEX::NVIC::encode_priority((uint32_t)CORTEX::NVIC::EPriorityGroup::GROUP_4, prior, subprior));
}

void CNVIC::init()
{
    CORTEX::SCB::VTOR::set(0x8000000);
    CORTEX::NVIC::set_priority_grouping(CORTEX::NVIC::EPriorityGroup::GROUP_4);
    set_priority(MemoryManagement_IRQn, 0, 0);
    set_priority(BusFault_IRQn, 0, 0);
    set_priority(UsageFault_IRQn, 0, 0);
    set_priority(SVCall_IRQn, 0, 0);
    set_priority(DebugMonitor_IRQn, 0, 0);
    set_priority(PendSV_IRQn, 0, 0);
    set_priority(SysTick_IRQn, 0, 0);
    set_priority(FLASH_IRQn, 0, 0);
    CORTEX::NVIC::enable_IRQ(FLASH_IRQn);
}
