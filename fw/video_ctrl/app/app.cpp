#include "app.h"
#include "core.h"
#include "task_mgr.h"
#include "edid_ctrl.h"
#include "drv_video.h"
#include "drv_pll.h"
#include "drv_vcap.h"

#include "hil.h"
#include "gui.h"
//#include "usbd.h"
//#include "usbd_cdc.h"
#ifdef DEBUG
#include "xprintf.h"
#include "shell.h"
#endif

void App::entry_point()
{
    HIL::init();

    CTaskMgr::init();

#ifdef DEBUG
    shell.init("VideoCTRL");
#endif
    CORTEX::enable_irq();

    CVideo::init();
    CPLL::init();
    CEDIDCtrl::init();
    CVcap::init();
    GUI::init();

    while (1)
    {
        HIL::idle_proc();
        GUI::draw();
        CTaskMgr::run();
    }
}

#ifdef DEBUG

status_e cmd_scan(uint32_t argc, char * const argv[])
{
    (void)(argc);
    (void)(argv);
    CEDIDCtrl::periodic_rescan();
    return STATUS_OK;
}

SHELL_COMMAND(scan, "", cmd_scan);

status_e cmd_m_wr(uint32_t argc, char * const argv[])
{
    if (argc != 3)
    {
        return STATUS_INV_PAR;
    }
    uint32_t addr = Shell::get_num(argv[1]);
    uint32_t data = Shell::get_num(argv[2]);
    WRITE_REG32(addr, data);
    return STATUS_OK;
}

SHELL_COMMAND(m_wr, "[addr (based on 4 bytes)] [data]", cmd_m_wr);

status_e cmd_m_rd(uint32_t argc, char * const argv[])
{
    if (argc != 2)
    {
        return STATUS_INV_PAR;
    }
    uint32_t addr = Shell::get_num(argv[1]);
    uint32_t data = READ_REG32(addr);
    xprintf("Readed data: 0x%x\n", data);
    return STATUS_OK;
}

SHELL_COMMAND(m_rd, "[addr (based on 4 bytes)]", cmd_m_rd);

extern "C"
{
    static uint8_t *__sbrk_heap_end = NULL;
    extern uint8_t _end; /* Symbol defined in the linker script */
    extern uint32_t _Min_Stack_Size; /* Symbol defined in the linker script */

    void* _sbrk(int incr)
    {
        const uint32_t stack_limit = (uint32_t)&_estack - (uint32_t)&_Min_Stack_Size;
        const uint8_t *max_heap = (uint8_t *)stack_limit;
        uint8_t *prev_heap_end;

        /* Initalize heap end at first call */
        if (NULL == __sbrk_heap_end)
        {
         __sbrk_heap_end = &_end;
        }

        /* Protect heap from growing into the reserved MSP stack */
        if (__sbrk_heap_end + incr > max_heap)
        {
            return (void*)-1;
        }

        prev_heap_end = __sbrk_heap_end;
        __sbrk_heap_end += incr;

        return (void*)prev_heap_end;
    }
}
#endif
