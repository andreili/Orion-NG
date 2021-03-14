#include "core.h"

static inline void initialize_data(uint32_t* from, uint32_t* region_begin, uint32_t* region_end)
{
    // Iterate and copy word by word.
    // It is assumed that the pointers are word aligned.
    uint32_t *p = region_begin;
    while (p < region_end)
        *p++ = *from++;
}

static inline void initialize_bss(uint32_t* region_begin, uint32_t* region_end)
{
    // Iterate and clear word by word.
    // It is assumed that the pointers are word aligned.
    uint32_t *p = region_begin;
    while (p < region_end)
        *p++ = 0;
}

static inline void initalize_classes(uint32_t* ctors_begin, uint32_t* ctors_end)
{
    for (uint32_t* ctor=ctors_begin ; ctor<ctors_end ; ++ctor)
        reinterpret_cast<void(*)(void)>(*ctor)();
}

extern uint32_t _sidata;
extern uint32_t _sdata;
extern uint32_t _edata;
extern uint32_t _sbss;
extern uint32_t _ebss;
extern uint32_t __ctors_start__;
extern uint32_t __ctors_end__;

class App
{
public:
    static void entry_point();
};

void __attribute((naked)) ISR::Reset()
{
    asm volatile("ldr sp, =_estack\n\r" : : );
    initialize_bss(&_sbss, &_ebss);
    initialize_data(&_sidata, &_sdata, &_edata);
    initalize_classes(&__ctors_start__, &__ctors_end__);
    App::entry_point();
}
