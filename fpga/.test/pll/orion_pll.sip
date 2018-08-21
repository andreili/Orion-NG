set_global_assignment -entity "orion_pll" -library "lib_orion_pll" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "orion_pll" -library "lib_orion_pll" -name IP_TOOL_VERSION "17.0"
set_global_assignment -entity "orion_pll" -library "lib_orion_pll" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_orion_pll" -name SPD_FILE [file join $::quartus(sip_path) "orion_pll.spd"]

set_global_assignment -library "lib_orion_pll" -name MISC_FILE [file join $::quartus(sip_path) "orion_pll_sim/orion_pll.vo"]
