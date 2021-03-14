#include "core.h"
#include "xprintf.h"

void ISR::HardFault()
{
#ifdef DEBUG
    xprintf("HardFault\n");
#endif
    while (1);
}

void ISR::MemManage()
{
#ifdef DEBUG
    xprintf("MemManage\n");
#endif
    while (1);
}

void ISR::BusFault()
{
#ifdef DEBUG
    xprintf("BusFault\n");
#endif
    while (1);
}

void ISR::UsageFault()
{
#ifdef DEBUG
    xprintf("UsageFault\n");
#endif
    while (1);
}

void ISR::DebugMon()
{
#ifdef DEBUG
    xprintf("DebugMon\n");
#endif
    while (1);
}
