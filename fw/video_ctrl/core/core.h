#if defined(STM32F100xB) || defined(STM32F100xE) || defined(STM32F101x6) || \
    defined(STM32F101xB) || defined(STM32F101xE) || defined(STM32F101xG) || \
	defined(STM32F102x6) || defined(STM32F102xB) || defined(STM32F103x6) || \
    defined(STM32F103xB) || defined(STM32F103xE) || defined(STM32F103xG) || \
	defined(STM32F105xC) || defined(STM32F107xC)
	//#define STM32F1
#elif defined(STM32H743xx)
	//#define STM32H7
#endif

#if defined(STM32F103xB)
#include "stm32f103xb.h"
#include "isr_stm32f103xb.h"
#endif

#define READ_REG32(addr) (*((volatile uint32_t*)addr))
#define WRITE_REG32(addr, data) (*((volatile uint32_t*)addr) = data)

#define SET_REG32(addr, mask) (*((volatile uint32_t*)addr) = ((*((volatile uint32_t*)addr)) | (mask)))
#define CLEAR_REG32(addr, mask) (*((volatile uint32_t*)addr) = ((*((volatile uint32_t*)addr)) & ~(mask)))
#define MODIFY_REG32(addr, mask, data) (*((volatile uint32_t*)addr) = ((*((volatile uint32_t*)addr)) & ~(mask)) | (uint32_t)data)

#include "core_drv.h"
#include "hw_depend.h"

#include "xprintf.h"
#define ASSERT(cond) \
    if (!cond) \
    { \
        xprintf("[ASSERT] %s:%d\n", __FILE__, __LINE__); \
        while(1); \
    }
