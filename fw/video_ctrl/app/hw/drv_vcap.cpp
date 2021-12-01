#include "drv_vcap.h"
#include <cstring>
#ifdef DEBUG
#include "shell.h"
#endif

/*
    Orion-128/PRO - 138 512 25 256 1 1 1
*/

vcap_regs_t CVcap::m_regs;

void CVcap::init()
{
    //
}

#ifdef DEBUG

status_e cmd_set_vcap_param(uint32_t argc, char * const argv[])
{
    if (argc != 8)
    {
        return STATUS_INV_PAR;
    }
    CVcap::set_x_start(Shell::get_num(argv[1]));
    CVcap::set_x_size(Shell::get_num(argv[2]));
    CVcap::set_y_start(Shell::get_num(argv[3]));
    CVcap::set_y_size(Shell::get_num(argv[4]));
    CVcap::set_HS_inv(Shell::get_num(argv[5]));
    CVcap::set_VS_inv(Shell::get_num(argv[6]));
    CVcap::set_mux_mode(Shell::get_num(argv[7]));
    CVcap::set_regs();
    return STATUS_OK;
}

SHELL_COMMAND(set_vcap_param, "[x_start] [x_size] [y_start] [y_size] [HS_inv] [VS_inv] [mux_mode]", cmd_set_vcap_param);
#endif
