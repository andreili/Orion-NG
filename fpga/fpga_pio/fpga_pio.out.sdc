## Generated SDC file "fpga_ports.out.sdc"

## Copyright (C) 1991-2013 Altera Corporation
## Your use of Altera Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Altera Program License 
## Subscription Agreement, Altera MegaCore Function License 
## Agreement, or other applicable license agreement, including, 
## without limitation, that your use is for the sole purpose of 
## programming logic devices manufactured by Altera and sold by 
## Altera or its authorized distributors.  Please refer to the 
## applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus II"
## VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

## DATE    "Fri Aug 10 20:39:55 2018"

##
## DEVICE  "EPM7128STC100-10"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {addr[0]} -period 100.000 -waveform { 0.000 50.000 } [get_ports { addr[0] }]
create_clock -name {wrn} -period 84.000 -waveform { 0.000 42.000 } [get_ports { wrn }]
create_clock -name {addr[3]} -period 100.000 -waveform { 0.000 50.000 } [get_ports { addr[3] }]
create_clock -name {addr[2]} -period 100.000 -waveform { 0.000 50.000 } [get_ports { addr[2] }]
create_clock -name {blion} -period 1000.000 -waveform { 0.000 500.000 } [get_ports { blion }]
create_clock -name {iorqn} -period 84.000 -waveform { 0.000 42.000 } [get_ports { iorqn }]
create_clock -name {addr[7]} -period 100.000 -waveform { 0.000 50.000 } [get_ports { addr[7] }]
create_clock -name {addr[6]} -period 100.000 -waveform { 0.000 50.000 } [get_ports { addr[6] }]
create_clock -name {addr[5]} -period 100.000 -waveform { 0.000 50.000 } [get_ports { addr[5] }]
create_clock -name {addr[4]} -period 100.000 -waveform { 0.000 50.000 } [get_ports { addr[4] }]
create_clock -name {addr[1]} -period 100.000 -waveform { 0.000 50.000 } [get_ports { addr[1] }]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************



#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************



#**************************************************************
# Set False Path
#**************************************************************



#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************



#**************************************************************
# Set Minimum Delay
#**************************************************************



#**************************************************************
# Set Input Transition
#**************************************************************

