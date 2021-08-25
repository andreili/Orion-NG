create_clock -period 25MHz -name {clk} [get_ports {clk_25}]
derive_pll_clocks
create_clock -period 40MHz -name {hclk_spi_master} [get_registers {mgmt_core:soc|mgmt_soc:soc|simple_spi_master_wb:simple_spi_master_inst|simple_spi_master:spi_master|hsck}]

set_false_path -to {sld_signaltap:*}
