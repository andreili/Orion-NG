create_clock -period 25MHz -name {clk} [get_ports {clk}]
derive_pll_clocks

set_false_path -to {sld_signaltap:*}
set_false_path -from {video:u_video|vctrl_regs:u_vregs|r_h_*}
set_false_path -from {video:u_video|vctrl_regs:u_vregs|r_v_*}
set_false_path -from {video:u_video|vctrl_regs:u_vregs|r_video_active}
set_false_path -from {video:u_video|vctrl_regs:u_vregs|r_hdmi_active}
set_false_path -from {video:u_video|vctrl_regs:u_vregs|r_vga_active}
