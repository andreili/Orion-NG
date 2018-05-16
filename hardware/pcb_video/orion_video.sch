EESchema Schematic File Version 2
LIBS:orion_video-rescue
LIBS:orion
LIBS:device
LIBS:power
LIBS:conn
LIBS:Lattice
LIBS:74xgxx
LIBS:memory
LIBS:orion_video-cache
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "ORION-NG"
Date "2018-03-06"
Rev "1"
Comp ""
Comment1 "Video module"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 2000 1150 0    60   ~ 0
CLK
Entry Wire Line
	2150 1150 2250 1250
Entry Wire Line
	550  2250 650  2150
Text Label 650  2150 0    60   ~ 0
CLK
Text Label 650  2450 0    60   ~ 0
XRn
Entry Wire Line
	550  2550 650  2450
$Comp
L R_Small R1
U 1 1 5AA79D29
P 1100 1600
F 0 "R1" V 1025 1575 50  0000 L CNN
F 1 "1k" V 1100 1550 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 1100 1600 50  0001 C CNN
F 3 "" H 1100 1600 50  0001 C CNN
	1    1100 1600
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR01
U 1 1 5AA7BD67
P 1250 1600
F 0 "#PWR01" H 1250 1450 50  0001 C CNN
F 1 "VCC" H 1250 1750 50  0000 C CNN
F 2 "" H 1250 1600 50  0001 C CNN
F 3 "" H 1250 1600 50  0001 C CNN
	1    1250 1600
	1    0    0    -1  
$EndComp
Entry Wire Line
	2150 1750 2250 1850
Entry Wire Line
	2150 1850 2250 1950
Entry Wire Line
	2150 1950 2250 2050
Entry Wire Line
	2150 2050 2250 2150
Text Label 2050 1750 0    60   ~ 0
X0
Text Label 2050 1850 0    60   ~ 0
X1
Text Label 2050 1950 0    60   ~ 0
X2
Text Label 2050 2050 0    60   ~ 0
X3
Entry Wire Line
	550  3250 650  3150
Text Label 650  3150 0    60   ~ 0
CLK
Text Label 650  3450 0    60   ~ 0
XRn
Entry Wire Line
	550  3550 650  3450
Entry Wire Line
	2150 2750 2250 2850
Entry Wire Line
	2150 2850 2250 2950
Entry Wire Line
	2150 2950 2250 3050
Entry Wire Line
	2150 3050 2250 3150
Text Label 2050 2750 0    60   ~ 0
X4
Text Label 2050 2850 0    60   ~ 0
X5
Text Label 2050 2950 0    60   ~ 0
X6
Text Label 2050 3050 0    60   ~ 0
X7
Text Label 650  3550 0    60   ~ 0
X3h
Entry Wire Line
	550  3650 650  3550
Entry Wire Line
	2150 2250 2250 2350
Text Label 2000 2250 0    60   ~ 0
X3h
Entry Wire Line
	2150 3250 2250 3350
Text Label 2000 3250 0    60   ~ 0
X7h
Entry Wire Line
	550  4250 650  4150
Text Label 650  4150 0    60   ~ 0
CLK
Text Label 650  4450 0    60   ~ 0
XRn
Entry Wire Line
	550  4550 650  4450
Entry Wire Line
	2150 3750 2250 3850
Entry Wire Line
	2150 3850 2250 3950
Text Label 2050 3750 0    60   ~ 0
X8
Text Label 2050 3850 0    60   ~ 0
X9
Text Label 650  4550 0    60   ~ 0
X7h
Entry Wire Line
	550  4650 650  4550
$Comp
L IE18 DD1
U 1 1 5AB0B75C
P 1450 2150
F 0 "DD1" H 1450 2650 60  0000 C CNN
F 1 "IE18" H 1450 1750 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 1350 2500 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1350 2500 60  0001 C CNN
	1    1450 2150
	1    0    0    -1  
$EndComp
$Comp
L IE18 DD2
U 1 1 5AB0B823
P 1450 3150
F 0 "DD2" H 1450 3650 60  0000 C CNN
F 1 "IE18" H 1450 2750 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 1350 3500 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1350 3500 60  0001 C CNN
	1    1450 3150
	1    0    0    -1  
$EndComp
$Comp
L IE18 DD3
U 1 1 5AB0BB62
P 1450 4150
F 0 "DD3" H 1450 4650 60  0000 C CNN
F 1 "IE18" H 1450 3750 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 1350 4500 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1350 4500 60  0001 C CNN
	1    1450 4150
	1    0    0    -1  
$EndComp
$Comp
L GEN Y1
U 1 1 5AA6965A
P 1450 1150
F 0 "Y1" H 1600 950 60  0000 C CNN
F 1 "25MHz" H 1450 1250 60  0000 C CNN
F 2 "Crystals:Crystal_SMD_7050-4pin_7.0x5.0mm" H 1450 1150 60  0001 C CNN
F 3 "" H 1450 1150 60  0001 C CNN
	1    1450 1150
	1    0    0    1   
$EndComp
$Comp
L C_Small C30
U 1 1 5AA814EE
P 7300 4350
F 0 "C30" H 7310 4420 50  0000 L CNN
F 1 "0.1u" H 7310 4270 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7300 4350 50  0001 C CNN
F 3 "" H 7300 4350 50  0001 C CNN
	1    7300 4350
	1    0    0    -1  
$EndComp
$Comp
L C_Small C29
U 1 1 5AA81A69
P 8700 3550
F 0 "C29" H 8710 3620 50  0000 L CNN
F 1 "0.1u" H 8710 3470 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8700 3550 50  0001 C CNN
F 3 "" H 8700 3550 50  0001 C CNN
	1    8700 3550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C28
U 1 1 5AA81BBB
P 8500 3550
F 0 "C28" H 8510 3620 50  0000 L CNN
F 1 "0.1u" H 8510 3470 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8500 3550 50  0001 C CNN
F 3 "" H 8500 3550 50  0001 C CNN
	1    8500 3550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C27
U 1 1 5AA81D4C
P 8300 3550
F 0 "C27" H 8310 3620 50  0000 L CNN
F 1 "0.1u" H 8310 3470 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8300 3550 50  0001 C CNN
F 3 "" H 8300 3550 50  0001 C CNN
	1    8300 3550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C26
U 1 1 5AA81D52
P 8100 3550
F 0 "C26" H 8110 3620 50  0000 L CNN
F 1 "0.1u" H 8110 3470 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8100 3550 50  0001 C CNN
F 3 "" H 8100 3550 50  0001 C CNN
	1    8100 3550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C25
U 1 1 5AA81D58
P 7900 3550
F 0 "C25" H 7910 3620 50  0000 L CNN
F 1 "0.1u" H 7910 3470 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7900 3550 50  0001 C CNN
F 3 "" H 7900 3550 50  0001 C CNN
	1    7900 3550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C24
U 1 1 5AA8200E
P 7700 3550
F 0 "C24" H 7710 3620 50  0000 L CNN
F 1 "0.1u" H 7710 3470 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7700 3550 50  0001 C CNN
F 3 "" H 7700 3550 50  0001 C CNN
	1    7700 3550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C23
U 1 1 5AA82014
P 7500 3550
F 0 "C23" H 7510 3620 50  0000 L CNN
F 1 "0.1u" H 7510 3470 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7500 3550 50  0001 C CNN
F 3 "" H 7500 3550 50  0001 C CNN
	1    7500 3550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C22
U 1 1 5AA8201A
P 7300 3550
F 0 "C22" H 7310 3620 50  0000 L CNN
F 1 "0.1u" H 7310 3470 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7300 3550 50  0001 C CNN
F 3 "" H 7300 3550 50  0001 C CNN
	1    7300 3550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C21
U 1 1 5AA82020
P 8700 2750
F 0 "C21" H 8710 2820 50  0000 L CNN
F 1 "0.1u" H 8710 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8700 2750 50  0001 C CNN
F 3 "" H 8700 2750 50  0001 C CNN
	1    8700 2750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C20
U 1 1 5AA82026
P 8500 2750
F 0 "C20" H 8510 2820 50  0000 L CNN
F 1 "0.1u" H 8510 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8500 2750 50  0001 C CNN
F 3 "" H 8500 2750 50  0001 C CNN
	1    8500 2750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C19
U 1 1 5AA8202C
P 8300 2750
F 0 "C19" H 8310 2820 50  0000 L CNN
F 1 "0.1u" H 8310 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8300 2750 50  0001 C CNN
F 3 "" H 8300 2750 50  0001 C CNN
	1    8300 2750
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C5
U 1 1 5AA837D1
P 8250 1150
F 0 "C5" H 8260 1220 50  0000 L CNN
F 1 "10u" H 8260 1070 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 8250 1150 50  0001 C CNN
F 3 "" H 8250 1150 50  0001 C CNN
	1    8250 1150
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C4
U 1 1 5AA83A53
P 8050 1150
F 0 "C4" H 8060 1220 50  0000 L CNN
F 1 "10u" H 8060 1070 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 8050 1150 50  0001 C CNN
F 3 "" H 8050 1150 50  0001 C CNN
	1    8050 1150
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C3
U 1 1 5AA83BE7
P 7850 1150
F 0 "C3" H 7860 1220 50  0000 L CNN
F 1 "10u" H 7860 1070 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 7850 1150 50  0001 C CNN
F 3 "" H 7850 1150 50  0001 C CNN
	1    7850 1150
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C2
U 1 1 5AA83BED
P 7650 1150
F 0 "C2" H 7660 1220 50  0000 L CNN
F 1 "10u" H 7660 1070 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 7650 1150 50  0001 C CNN
F 3 "" H 7650 1150 50  0001 C CNN
	1    7650 1150
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR02
U 1 1 5AA84C0F
P 7300 3350
F 0 "#PWR02" H 7300 3200 50  0001 C CNN
F 1 "VCC" H 7300 3500 50  0000 C CNN
F 2 "" H 7300 3350 50  0001 C CNN
F 3 "" H 7300 3350 50  0001 C CNN
	1    7300 3350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5AA84C9F
P 7300 3750
F 0 "#PWR03" H 7300 3500 50  0001 C CNN
F 1 "GND" H 7300 3600 50  0000 C CNN
F 2 "" H 7300 3750 50  0001 C CNN
F 3 "" H 7300 3750 50  0001 C CNN
	1    7300 3750
	1    0    0    -1  
$EndComp
Entry Wire Line
	550  5450 650  5350
Text Label 650  5350 0    60   ~ 0
XE
Text Label 650  5650 0    60   ~ 0
YRn
Entry Wire Line
	550  5750 650  5650
$Comp
L R_Small R2
U 1 1 5AA955C6
P 1100 4800
F 0 "R2" V 1025 4775 50  0000 L CNN
F 1 "1k" V 1100 4750 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 1100 4800 50  0001 C CNN
F 3 "" H 1100 4800 50  0001 C CNN
	1    1100 4800
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR04
U 1 1 5AA955CC
P 1250 4800
F 0 "#PWR04" H 1250 4650 50  0001 C CNN
F 1 "VCC" H 1250 4950 50  0000 C CNN
F 2 "" H 1250 4800 50  0001 C CNN
F 3 "" H 1250 4800 50  0001 C CNN
	1    1250 4800
	1    0    0    -1  
$EndComp
Entry Wire Line
	2150 4950 2250 5050
Entry Wire Line
	2150 5050 2250 5150
Entry Wire Line
	2150 5150 2250 5250
Entry Wire Line
	2150 5250 2250 5350
Text Label 2050 4950 0    60   ~ 0
Y0
Text Label 2050 5050 0    60   ~ 0
Y1
Text Label 2050 5150 0    60   ~ 0
Y2
Text Label 2050 5250 0    60   ~ 0
Y3
Entry Wire Line
	550  6450 650  6350
Text Label 650  6350 0    60   ~ 0
XE
Text Label 650  6650 0    60   ~ 0
YRn
Entry Wire Line
	550  6750 650  6650
Entry Wire Line
	2150 5950 2250 6050
Entry Wire Line
	2150 6050 2250 6150
Entry Wire Line
	2150 6150 2250 6250
Entry Wire Line
	2150 6250 2250 6350
Text Label 2050 5950 0    60   ~ 0
Y4
Text Label 2050 6050 0    60   ~ 0
Y5
Text Label 2050 6150 0    60   ~ 0
Y6
Text Label 2050 6250 0    60   ~ 0
Y7
Text Label 650  6750 0    60   ~ 0
Y3h
Entry Wire Line
	550  6850 650  6750
Entry Wire Line
	2150 5450 2250 5550
Text Label 2000 5450 0    60   ~ 0
Y3h
Entry Wire Line
	2150 6450 2250 6550
Text Label 2000 6450 0    60   ~ 0
Y7h
Entry Wire Line
	550  7450 650  7350
Text Label 650  7350 0    60   ~ 0
XE
Text Label 650  7650 0    60   ~ 0
YRn
Entry Wire Line
	550  7750 650  7650
Entry Wire Line
	2150 6950 2250 7050
Entry Wire Line
	2150 7050 2250 7150
Text Label 2050 6950 0    60   ~ 0
Y8
Text Label 2050 7050 0    60   ~ 0
Y9
Text Label 650  7750 0    60   ~ 0
Y7h
Entry Wire Line
	550  7850 650  7750
$Comp
L IE18 DD4
U 1 1 5AA95610
P 1450 5350
F 0 "DD4" H 1450 5850 60  0000 C CNN
F 1 "IE18" H 1450 4950 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 1350 5700 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1350 5700 60  0001 C CNN
	1    1450 5350
	1    0    0    -1  
$EndComp
$Comp
L IE18 DD5
U 1 1 5AA95616
P 1450 6350
F 0 "DD5" H 1450 6850 60  0000 C CNN
F 1 "IE18" H 1450 5950 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 1350 6700 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1350 6700 60  0001 C CNN
	1    1450 6350
	1    0    0    -1  
$EndComp
$Comp
L IE18 DD6
U 1 1 5AA9561C
P 1450 7350
F 0 "DD6" H 1450 7850 60  0000 C CNN
F 1 "IE18" H 1450 6950 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 1350 7700 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1350 7700 60  0001 C CNN
	1    1450 7350
	1    0    0    -1  
$EndComp
$Comp
L C_Small C31
U 1 1 5AA8E2DA
P 7500 4350
F 0 "C31" H 7510 4420 50  0000 L CNN
F 1 "0.1u" H 7510 4270 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7500 4350 50  0001 C CNN
F 3 "" H 7500 4350 50  0001 C CNN
	1    7500 4350
	1    0    0    -1  
$EndComp
$Comp
L DB15_Female_HighDensity_MountingHoles J1
U 1 1 5AAC91B4
P 6400 3000
F 0 "J1" H 6400 3725 50  0000 C CNN
F 1 "VGA" H 6625 3600 50  0000 C CNN
F 2 "w_conn_pc:DB_15F-VGA" H 5450 3400 50  0001 C CNN
F 3 "" H 5450 3400 50  0001 C CNN
	1    6400 3000
	1    0    0    -1  
$EndComp
Entry Wire Line
	5650 2700 5750 2600
Text Label 5750 2600 0    60   ~ 0
VR
Entry Wire Line
	7050 3000 7150 3100
Text Label 6950 3000 0    60   ~ 0
HS
Entry Wire Line
	5650 2900 5750 2800
Text Label 5750 2800 0    60   ~ 0
VG
Entry Wire Line
	5650 3100 5750 3000
Text Label 5750 3000 0    60   ~ 0
VB
$Comp
L R_Small R20
U 1 1 5AACD33B
P 6800 3200
F 0 "R20" V 6725 3125 50  0000 L CNN
F 1 "47" V 6800 3150 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6800 3200 50  0001 C CNN
F 3 "" H 6800 3200 50  0001 C CNN
	1    6800 3200
	0    1    1    0   
$EndComp
$Comp
L R_Small R19
U 1 1 5AACDA94
P 6800 3000
F 0 "R19" V 6725 2925 50  0000 L CNN
F 1 "47" V 6800 2950 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6800 3000 50  0001 C CNN
F 3 "" H 6800 3000 50  0001 C CNN
	1    6800 3000
	0    1    1    0   
$EndComp
Entry Wire Line
	7050 3200 7150 3300
Text Label 6950 3200 0    60   ~ 0
VS
$Comp
L GND #PWR05
U 1 1 5AAD2CCC
P 6000 3800
F 0 "#PWR05" H 6000 3550 50  0001 C CNN
F 1 "GND" H 5850 3750 50  0000 C CNN
F 2 "" H 6000 3800 50  0001 C CNN
F 3 "" H 6000 3800 50  0001 C CNN
	1    6000 3800
	1    0    0    -1  
$EndComp
$Comp
L C_Small C1
U 1 1 5AAD3372
P 6150 3750
F 0 "C1" V 6250 3675 50  0000 L CNN
F 1 "0.1u" V 6025 3625 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 6150 3750 50  0001 C CNN
F 3 "" H 6150 3750 50  0001 C CNN
	1    6150 3750
	0    -1   -1   0   
$EndComp
Entry Wire Line
	7050 7650 7150 7750
Entry Wire Line
	7050 7750 7150 7850
Entry Wire Line
	7050 7850 7150 7950
Text Label 6850 7650 0    60   ~ 0
MA12
Text Label 6850 7750 0    60   ~ 0
MA13
Text Label 6850 7850 0    60   ~ 0
MA14
Text Label 5750 8450 0    60   ~ 0
MCP
Entry Wire Line
	5650 8550 5750 8450
Text Label 5750 7650 0    60   ~ 0
A12
Entry Wire Line
	5650 7750 5750 7650
Text Label 5750 7750 0    60   ~ 0
A13
Entry Wire Line
	5650 7850 5750 7750
Text Label 5750 7850 0    60   ~ 0
VA14
Entry Wire Line
	5650 7950 5750 7850
Entry Wire Line
	5650 8150 5750 8050
Text Label 5750 8150 0    60   ~ 0
X8
Entry Wire Line
	5650 8250 5750 8150
Text Label 5750 8250 0    60   ~ 0
B0
Entry Wire Line
	5650 8350 5750 8250
$Comp
L GND #PWR06
U 1 1 5AB00E43
P 5950 8550
F 0 "#PWR06" H 5950 8300 50  0001 C CNN
F 1 "GND" H 5800 8500 50  0000 C CNN
F 2 "" H 5950 8550 50  0001 C CNN
F 3 "" H 5950 8550 50  0001 C CNN
	1    5950 8550
	1    0    0    -1  
$EndComp
Text Label 5750 8050 0    60   ~ 0
X7
$Comp
L KP11 DD27
U 1 1 5AB00E4A
P 6400 8050
F 0 "DD27" H 6400 8550 60  0000 C CNN
F 1 "KP11" H 6400 7550 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 6300 8400 60  0001 C CNN
F 3 "" H 6300 8400 60  0001 C CNN
	1    6400 8050
	1    0    0    -1  
$EndComp
Entry Wire Line
	7050 7950 7150 8050
Text Label 6850 7950 0    60   ~ 0
MA15
Text Label 5750 7950 0    60   ~ 0
VA15
Entry Wire Line
	5650 8050 5750 7950
Text Label 5750 8350 0    60   ~ 0
B1
Entry Wire Line
	5650 8450 5750 8350
Entry Wire Line
	7050 6450 7150 6550
Entry Wire Line
	7050 6550 7150 6650
Entry Wire Line
	7050 6650 7150 6750
Text Label 6900 6450 0    60   ~ 0
MA8
Text Label 6900 6550 0    60   ~ 0
MA9
Text Label 6850 6650 0    60   ~ 0
MA10
Text Label 5750 7250 0    60   ~ 0
MCP
Entry Wire Line
	5650 7350 5750 7250
Text Label 5750 6450 0    60   ~ 0
A8
Entry Wire Line
	5650 6550 5750 6450
Text Label 5750 6550 0    60   ~ 0
A9
Entry Wire Line
	5650 6650 5750 6550
Text Label 5750 6650 0    60   ~ 0
A10
Entry Wire Line
	5650 6750 5750 6650
Entry Wire Line
	5650 6950 5750 6850
Text Label 5750 6950 0    60   ~ 0
X4
Entry Wire Line
	5650 7050 5750 6950
Text Label 5750 7050 0    60   ~ 0
X5
Entry Wire Line
	5650 7150 5750 7050
$Comp
L GND #PWR07
U 1 1 5AB04719
P 5950 7350
F 0 "#PWR07" H 5950 7100 50  0001 C CNN
F 1 "GND" H 5800 7300 50  0000 C CNN
F 2 "" H 5950 7350 50  0001 C CNN
F 3 "" H 5950 7350 50  0001 C CNN
	1    5950 7350
	1    0    0    -1  
$EndComp
Text Label 5750 6850 0    60   ~ 0
X3
$Comp
L KP11 DD26
U 1 1 5AB04720
P 6400 6850
F 0 "DD26" H 6400 7350 60  0000 C CNN
F 1 "KP11" H 6400 6350 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 6300 7200 60  0001 C CNN
F 3 "" H 6300 7200 60  0001 C CNN
	1    6400 6850
	1    0    0    -1  
$EndComp
Entry Wire Line
	7050 6750 7150 6850
Text Label 6850 6750 0    60   ~ 0
MA11
Text Label 5750 6750 0    60   ~ 0
A11
Entry Wire Line
	5650 6850 5750 6750
Text Label 5750 7150 0    60   ~ 0
X6
Entry Wire Line
	5650 7250 5750 7150
Entry Wire Line
	7050 5250 7150 5350
Entry Wire Line
	7050 5350 7150 5450
Entry Wire Line
	7050 5450 7150 5550
Text Label 6900 5250 0    60   ~ 0
MA4
Text Label 6900 5350 0    60   ~ 0
MA5
Text Label 6900 5450 0    60   ~ 0
MA6
Text Label 5750 6050 0    60   ~ 0
MCP
Entry Wire Line
	5650 6150 5750 6050
Text Label 5750 5250 0    60   ~ 0
A4
Entry Wire Line
	5650 5350 5750 5250
Text Label 5750 5350 0    60   ~ 0
A5
Entry Wire Line
	5650 5450 5750 5350
Text Label 5750 5450 0    60   ~ 0
A6
Entry Wire Line
	5650 5550 5750 5450
Entry Wire Line
	5650 5750 5750 5650
Text Label 5750 5750 0    60   ~ 0
Y5
Entry Wire Line
	5650 5850 5750 5750
Text Label 5750 5850 0    60   ~ 0
Y6
Entry Wire Line
	5650 5950 5750 5850
$Comp
L GND #PWR08
U 1 1 5AB04EE6
P 5950 6150
F 0 "#PWR08" H 5950 5900 50  0001 C CNN
F 1 "GND" H 5800 6100 50  0000 C CNN
F 2 "" H 5950 6150 50  0001 C CNN
F 3 "" H 5950 6150 50  0001 C CNN
	1    5950 6150
	1    0    0    -1  
$EndComp
Text Label 5750 5650 0    60   ~ 0
Y4
$Comp
L KP11 DD25
U 1 1 5AB04EED
P 6400 5650
F 0 "DD25" H 6400 6150 60  0000 C CNN
F 1 "KP11" H 6400 5150 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 6300 6000 60  0001 C CNN
F 3 "" H 6300 6000 60  0001 C CNN
	1    6400 5650
	1    0    0    -1  
$EndComp
Entry Wire Line
	7050 5550 7150 5650
Text Label 6900 5550 0    60   ~ 0
MA7
Text Label 5750 5550 0    60   ~ 0
A7
Entry Wire Line
	5650 5650 5750 5550
Text Label 5750 5950 0    60   ~ 0
Y7
Entry Wire Line
	5650 6050 5750 5950
Entry Wire Line
	7050 4100 7150 4200
Entry Wire Line
	7050 4200 7150 4300
Entry Wire Line
	7050 4300 7150 4400
Text Label 6900 4100 0    60   ~ 0
MA0
Text Label 6900 4200 0    60   ~ 0
MA1
Text Label 6900 4300 0    60   ~ 0
MA2
Text Label 5750 4900 0    60   ~ 0
MCP
Entry Wire Line
	5650 5000 5750 4900
Text Label 5750 4100 0    60   ~ 0
A0
Entry Wire Line
	5650 4200 5750 4100
Text Label 5750 4200 0    60   ~ 0
A1
Entry Wire Line
	5650 4300 5750 4200
Text Label 5750 4300 0    60   ~ 0
A2
Entry Wire Line
	5650 4400 5750 4300
Entry Wire Line
	5650 4600 5750 4500
Text Label 5750 4600 0    60   ~ 0
Y1
Entry Wire Line
	5650 4700 5750 4600
Text Label 5750 4700 0    60   ~ 0
Y2
Entry Wire Line
	5650 4800 5750 4700
$Comp
L GND #PWR09
U 1 1 5AB04F19
P 5950 5000
F 0 "#PWR09" H 5950 4750 50  0001 C CNN
F 1 "GND" H 5800 4950 50  0000 C CNN
F 2 "" H 5950 5000 50  0001 C CNN
F 3 "" H 5950 5000 50  0001 C CNN
	1    5950 5000
	1    0    0    -1  
$EndComp
Text Label 5750 4500 0    60   ~ 0
Y0
$Comp
L KP11 DD24
U 1 1 5AB04F20
P 6400 4500
F 0 "DD24" H 6400 5000 60  0000 C CNN
F 1 "KP11" H 6400 4000 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 6300 4850 60  0001 C CNN
F 3 "" H 6300 4850 60  0001 C CNN
	1    6400 4500
	1    0    0    -1  
$EndComp
Entry Wire Line
	7050 4400 7150 4500
Text Label 6900 4400 0    60   ~ 0
MA3
Text Label 5750 4400 0    60   ~ 0
A3
Entry Wire Line
	5650 4500 5750 4400
Text Label 5750 4800 0    60   ~ 0
Y3
Entry Wire Line
	5650 4900 5750 4800
Text Label 8850 10050 2    60   ~ 0
MD8
Text Label 8850 10150 2    60   ~ 0
MD9
Text Label 8850 10250 2    60   ~ 0
MD10
Text Label 8850 10350 2    60   ~ 0
MD11
Text Label 8850 10450 2    60   ~ 0
MD12
Text Label 8850 10550 2    60   ~ 0
MD13
Text Label 8850 10650 2    60   ~ 0
MD14
Text Label 8850 10750 2    60   ~ 0
MD15
Entry Wire Line
	8950 10850 8850 10750
Entry Wire Line
	8950 10750 8850 10650
Entry Wire Line
	8950 10650 8850 10550
Entry Wire Line
	8950 10550 8850 10450
Entry Wire Line
	8950 10450 8850 10350
Entry Wire Line
	8950 10350 8850 10250
Entry Wire Line
	8950 10250 8850 10150
Entry Wire Line
	8950 10150 8850 10050
Entry Wire Line
	7150 10950 7250 10850
Text Label 7250 10850 0    60   ~ 0
OE
Entry Wire Line
	7150 11050 7250 10950
Text Label 7250 10950 0    60   ~ 0
MCP
$Comp
L AP6 DD30
U 1 1 5AAD664E
P 8050 10500
F 0 "DD30" H 8050 11050 60  0000 C CNN
F 1 "AP6" H 8050 10050 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-20W_7.5x12.8mm_Pitch1.27mm" H 8000 10650 60  0001 C CNN
F 3 "" H 8000 10650 60  0001 C CNN
	1    8050 10500
	1    0    0    -1  
$EndComp
Entry Wire Line
	7250 8950 7150 9050
Text Label 7350 8950 2    60   ~ 0
D0
Entry Wire Line
	7250 9050 7150 9150
Text Label 7350 9050 2    60   ~ 0
D1
Entry Wire Line
	7250 9150 7150 9250
Text Label 7350 9150 2    60   ~ 0
D2
Entry Wire Line
	7250 9250 7150 9350
Text Label 7350 9250 2    60   ~ 0
D3
Entry Wire Line
	7250 9350 7150 9450
Text Label 7350 9350 2    60   ~ 0
D4
Entry Wire Line
	7250 9450 7150 9550
Text Label 7350 9450 2    60   ~ 0
D5
Entry Wire Line
	7250 9550 7150 9650
Text Label 7350 9550 2    60   ~ 0
D6
Entry Wire Line
	7250 9650 7150 9750
Text Label 7350 9650 2    60   ~ 0
D7
Text Label 8850 8950 2    60   ~ 0
MD0
Text Label 8850 9050 2    60   ~ 0
MD1
Text Label 8850 9150 2    60   ~ 0
MD2
Text Label 8850 9250 2    60   ~ 0
MD3
Text Label 8850 9350 2    60   ~ 0
MD4
Text Label 8850 9450 2    60   ~ 0
MD5
Text Label 8850 9550 2    60   ~ 0
MD6
Text Label 8850 9650 2    60   ~ 0
MD7
Entry Wire Line
	8950 9750 8850 9650
Entry Wire Line
	8950 9650 8850 9550
Entry Wire Line
	8950 9550 8850 9450
Entry Wire Line
	8950 9450 8850 9350
Entry Wire Line
	8950 9350 8850 9250
Entry Wire Line
	8950 9250 8850 9150
Entry Wire Line
	8950 9150 8850 9050
Entry Wire Line
	8950 9050 8850 8950
Entry Wire Line
	7150 9850 7250 9750
Text Label 7250 9750 0    60   ~ 0
OE
Entry Wire Line
	7150 9950 7250 9850
Text Label 7250 9850 0    60   ~ 0
MCP
$Comp
L AP6 DD29
U 1 1 5AAD9696
P 8050 9400
F 0 "DD29" H 8050 9950 60  0000 C CNN
F 1 "AP6" H 8050 8950 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-20W_7.5x12.8mm_Pitch1.27mm" H 8000 9550 60  0001 C CNN
F 3 "" H 8000 9550 60  0001 C CNN
	1    8050 9400
	1    0    0    -1  
$EndComp
Entry Wire Line
	7250 10050 7150 10150
Text Label 7350 10050 2    60   ~ 0
D0
Entry Wire Line
	7250 10150 7150 10250
Text Label 7350 10150 2    60   ~ 0
D1
Entry Wire Line
	7250 10250 7150 10350
Text Label 7350 10250 2    60   ~ 0
D2
Entry Wire Line
	7250 10350 7150 10450
Text Label 7350 10350 2    60   ~ 0
D3
Entry Wire Line
	7250 10450 7150 10550
Text Label 7350 10450 2    60   ~ 0
D4
Entry Wire Line
	7250 10550 7150 10650
Text Label 7350 10550 2    60   ~ 0
D5
Entry Wire Line
	7250 10650 7150 10750
Text Label 7350 10650 2    60   ~ 0
D6
Entry Wire Line
	7250 10750 7150 10850
Text Label 7350 10750 2    60   ~ 0
D7
Entry Wire Line
	8950 6450 9050 6350
Entry Wire Line
	8950 5850 9050 5750
Text Label 9050 5750 0    60   ~ 0
X1
Entry Wire Line
	8950 5550 9050 5450
Text Label 9050 5450 0    60   ~ 0
66?
Entry Wire Line
	8950 5250 9050 5150
Text Label 9050 5150 0    60   ~ 0
HOLD
Entry Wire Line
	8950 4950 9050 4850
Text Label 9050 4850 0    60   ~ 0
RDn
Entry Wire Line
	8950 4650 9050 4550
Text Label 9050 4550 0    60   ~ 0
WRn
Entry Wire Line
	8950 4350 9050 4250
Text Label 9050 4250 0    60   ~ 0
MREQn
Entry Wire Line
	8950 4050 9050 3950
Text Label 9050 3950 0    60   ~ 0
IORQn
Entry Wire Line
	8950 3750 9050 3650
Text Label 9050 3650 0    60   ~ 0
BLIO
Entry Wire Line
	8950 3150 9050 3050
Text Label 9050 3050 0    60   ~ 0
BLRAM
Entry Wire Line
	8950 2550 9050 2450
Text Label 9050 2450 0    60   ~ 0
M1n
Entry Wire Line
	8950 1950 9050 1850
Text Label 9050 1850 0    60   ~ 0
INTAn
Entry Wire Line
	8950 1350 9050 1250
Text Label 9050 1250 0    60   ~ 0
RESn
Entry Wire Line
	8950 10350 9050 10250
Text Label 9050 10250 0    60   ~ 0
BLn
Entry Wire Line
	8950 9750 9050 9650
Text Label 9050 9650 0    60   ~ 0
X0
Entry Wire Line
	8950 9150 9050 9050
Text Label 9050 9050 0    60   ~ 0
IRQS
Entry Wire Line
	8950 8850 9050 8750
Text Label 9050 8750 0    60   ~ 0
IRQ7
Entry Wire Line
	8950 8550 9050 8450
Text Label 9050 8450 0    60   ~ 0
IRQ6
Entry Wire Line
	8950 8250 9050 8150
Text Label 9050 8150 0    60   ~ 0
IRQ5
Entry Wire Line
	8950 7950 9050 7850
Text Label 9050 7850 0    60   ~ 0
IRQ4
Entry Wire Line
	8950 7650 9050 7550
Text Label 9050 7550 0    60   ~ 0
IRQ3
Entry Wire Line
	8950 7350 9050 7250
Text Label 9050 7250 0    60   ~ 0
IRQ2
Entry Wire Line
	8950 7050 9050 6950
Text Label 9050 6950 0    60   ~ 0
IRQ1
Entry Wire Line
	8950 6750 9050 6650
Text Label 9050 6650 0    60   ~ 0
CLC0?
Entry Wire Line
	8950 6050 9050 5950
Text Label 9050 5950 0    60   ~ 0
A13
Entry Wire Line
	8950 5750 9050 5650
Text Label 9050 5650 0    60   ~ 0
A14
Entry Wire Line
	8950 5450 9050 5350
Text Label 9050 5350 0    60   ~ 0
A15
Text Label 9050 4150 0    60   ~ 0
SND
Entry Wire Line
	8950 3650 9050 3550
Text Label 9050 3550 0    60   ~ 0
WAITn
Entry Wire Line
	8950 1250 9050 1150
Text Label 9050 1150 0    60   ~ 0
D7
Entry Wire Line
	8950 1550 9050 1450
Text Label 9050 1450 0    60   ~ 0
D6
Entry Wire Line
	8950 1850 9050 1750
Text Label 9050 1750 0    60   ~ 0
D5
Entry Wire Line
	8950 2150 9050 2050
Text Label 9050 2050 0    60   ~ 0
D4
Entry Wire Line
	8950 2450 9050 2350
Text Label 9050 2350 0    60   ~ 0
D3
Entry Wire Line
	8950 2750 9050 2650
Text Label 9050 2650 0    60   ~ 0
D2
Entry Wire Line
	8950 3050 9050 2950
Text Label 9050 2950 0    60   ~ 0
D1
Entry Wire Line
	8950 3350 9050 3250
Text Label 9050 3250 0    60   ~ 0
D0
Entry Wire Line
	8950 10250 9050 10150
Text Label 9050 10150 0    60   ~ 0
HLDA
Entry Wire Line
	8950 9950 9050 9850
Text Label 9050 9850 0    60   ~ 0
A0
Entry Wire Line
	8950 9650 9050 9550
Text Label 9050 9550 0    60   ~ 0
A1
Entry Wire Line
	8950 9350 9050 9250
Text Label 9050 9250 0    60   ~ 0
A2
Entry Wire Line
	8950 9050 9050 8950
Text Label 9050 8950 0    60   ~ 0
A3
Entry Wire Line
	8950 8750 9050 8650
Text Label 9050 8650 0    60   ~ 0
A4
Entry Wire Line
	8950 8450 9050 8350
Text Label 9050 8350 0    60   ~ 0
A5
Entry Wire Line
	8950 8150 9050 8050
Text Label 9050 8050 0    60   ~ 0
A6
Entry Wire Line
	8950 7850 9050 7750
Text Label 9050 7750 0    60   ~ 0
A7
Entry Wire Line
	8950 7550 9050 7450
Text Label 9050 7450 0    60   ~ 0
A8
Entry Wire Line
	8950 7250 9050 7150
Text Label 9050 7150 0    60   ~ 0
A9
Entry Wire Line
	8950 6950 9050 6850
Text Label 9050 6850 0    60   ~ 0
A10
Entry Wire Line
	8950 6650 9050 6550
Text Label 9050 6550 0    60   ~ 0
A11
Entry Wire Line
	8950 6350 9050 6250
Text Label 9050 6250 0    60   ~ 0
A12
$Comp
L GND #PWR010
U 1 1 5AAFFE64
P 9350 950
F 0 "#PWR010" H 9350 700 50  0001 C CNN
F 1 "GND" V 9350 775 50  0000 C CNN
F 2 "" H 9350 950 50  0001 C CNN
F 3 "" H 9350 950 50  0001 C CNN
	1    9350 950 
	0    1    1    0   
$EndComp
$Comp
L VDD #PWR011
U 1 1 5AB00E1B
P 9350 1550
F 0 "#PWR011" H 9350 1400 50  0001 C CNN
F 1 "VDD" V 9350 1725 50  0000 C CNN
F 2 "" H 9350 1550 50  0001 C CNN
F 3 "" H 9350 1550 50  0001 C CNN
	1    9350 1550
	0    -1   -1   0   
$EndComp
$Comp
L -12V #PWR45
U 1 1 5AB01A9F
P 9350 2750
F 0 "#PWR45" H 9350 2850 50  0001 C CNN
F 1 "-12V" V 9350 2975 50  0000 C CNN
F 2 "" H 9350 2750 50  0001 C CNN
F 3 "" H 9350 2750 50  0001 C CNN
	1    9350 2750
	0    -1   -1   0   
$EndComp
Text Label 9050 6350 0    60   ~ 0
RFSHn
$Comp
L +12V #PWR012
U 1 1 5AB08886
P 9350 3350
F 0 "#PWR012" H 9350 3200 50  0001 C CNN
F 1 "+12V" V 9350 3550 50  0000 C CNN
F 2 "" H 9350 3350 50  0001 C CNN
F 3 "" H 9350 3350 50  0001 C CNN
	1    9350 3350
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR013
U 1 1 5AB09CBA
P 9350 9950
F 0 "#PWR013" H 9350 9700 50  0001 C CNN
F 1 "GND" V 9350 9775 50  0000 C CNN
F 2 "" H 9350 9950 50  0001 C CNN
F 3 "" H 9350 9950 50  0001 C CNN
	1    9350 9950
	0    1    1    0   
$EndComp
Entry Wire Line
	8950 7150 9050 7050
Text Label 9050 7050 0    60   ~ 0
1B8
Entry Wire Line
	8950 6550 9050 6450
Text Label 9050 6450 0    60   ~ 0
1B6
Entry Wire Line
	8950 5950 9050 5850
Text Label 9050 5850 0    60   ~ 0
1B4
Entry Wire Line
	8950 5350 9050 5250
Text Label 9050 5250 0    60   ~ 0
1B2
Entry Wire Line
	8950 2950 9050 2850
Text Label 9050 2850 0    60   ~ 0
ROM
Entry Wire Line
	8950 3850 9050 3750
Text Label 9050 3750 0    60   ~ 0
VA18
Entry Wire Line
	8950 4450 9050 4350
Text Label 9050 4350 0    60   ~ 0
VA16
Entry Wire Line
	8950 1150 9050 1050
Text Label 9050 1050 0    60   ~ 0
MW
Entry Wire Line
	8950 950  9050 850 
Text Label 9050 850  0    60   ~ 0
M2V
Entry Wire Line
	8950 6850 9050 6750
Text Label 9050 6750 0    60   ~ 0
1B7
Entry Wire Line
	8950 6250 9050 6150
Text Label 9050 6150 0    60   ~ 0
1B5
Entry Wire Line
	8950 5650 9050 5550
Text Label 9050 5550 0    60   ~ 0
1B3
Entry Wire Line
	8950 2650 9050 2550
Text Label 9050 2550 0    60   ~ 0
XROM
Entry Wire Line
	8950 3550 9050 3450
Text Label 9050 3450 0    60   ~ 0
VA19
Entry Wire Line
	8950 4150 9050 4050
Text Label 9050 4050 0    60   ~ 0
VA17
Entry Wire Line
	8950 1450 9050 1350
Text Label 9050 1350 0    60   ~ 0
MR
Entry Wire Line
	8950 5050 9050 4950
Text Label 9050 4950 0    60   ~ 0
VA14
Entry Wire Line
	8950 4750 9050 4650
Text Label 9050 4650 0    60   ~ 0
VA15
Entry Wire Line
	8950 1750 9050 1650
Entry Wire Line
	8950 2350 9050 2250
Text Label 9050 2250 0    60   ~ 0
PFCn
Text Label 9050 1650 0    60   ~ 0
PF8
Entry Wire Line
	8950 2050 9050 1950
Entry Wire Line
	8950 2250 9050 2150
Text Label 9050 2150 0    60   ~ 0
FEN
Text Label 9050 1950 0    60   ~ 0
PFA
Entry Wire Line
	2350 650  2250 750 
Text Label 2450 650  2    60   ~ 0
D0
Entry Wire Line
	2350 750  2250 850 
Text Label 2450 750  2    60   ~ 0
D1
Entry Wire Line
	2350 850  2250 950 
Text Label 2450 850  2    60   ~ 0
D2
Entry Wire Line
	2350 950  2250 1050
Text Label 2450 950  2    60   ~ 0
D3
Entry Wire Line
	2350 1050 2250 1150
Text Label 2450 1050 2    60   ~ 0
D4
Entry Wire Line
	2350 1150 2250 1250
Text Label 2450 1150 2    60   ~ 0
D5
Entry Wire Line
	2350 1250 2250 1350
Text Label 2450 1250 2    60   ~ 0
D6
Entry Wire Line
	2350 1350 2250 1450
Text Label 2450 1350 2    60   ~ 0
D7
Entry Wire Line
	2250 1550 2350 1450
Text Label 2350 1450 0    60   ~ 0
PF8
Text Label 2350 1550 0    60   ~ 0
RESn
Text Label 3900 650  2    60   ~ 0
VM0
Text Label 3900 750  2    60   ~ 0
VM1
Text Label 3900 850  2    60   ~ 0
VM2
Text Label 3900 950  2    60   ~ 0
VM3
Text Label 3900 1050 2    60   ~ 0
VM4
Text Label 3900 1150 2    60   ~ 0
FL0
Text Label 3900 1250 2    60   ~ 0
FL1
Text Label 3900 1350 2    60   ~ 0
FL2
Entry Wire Line
	4000 1450 3900 1350
Entry Wire Line
	4000 1350 3900 1250
Entry Wire Line
	4000 1250 3900 1150
Entry Wire Line
	4000 1150 3900 1050
Entry Wire Line
	4000 1050 3900 950 
Entry Wire Line
	4000 950  3900 850 
Entry Wire Line
	4000 850  3900 750 
Entry Wire Line
	4000 750  3900 650 
Entry Wire Line
	3900 5050 4000 5150
Text Label 3800 5050 0    60   ~ 0
V0
Entry Wire Line
	3900 5150 4000 5250
Text Label 3800 5150 0    60   ~ 0
V1
Entry Wire Line
	3900 5250 4000 5350
Text Label 3800 5250 0    60   ~ 0
V2
Entry Wire Line
	3900 5350 4000 5450
Text Label 3800 5350 0    60   ~ 0
V3
Entry Wire Line
	3900 5450 4000 5550
Text Label 3800 5450 0    60   ~ 0
V4
Entry Wire Line
	3900 5550 4000 5650
Text Label 3800 5550 0    60   ~ 0
V5
Entry Wire Line
	3900 5650 4000 5750
Text Label 3800 5650 0    60   ~ 0
V6
Entry Wire Line
	3900 5750 4000 5850
Text Label 3800 5750 0    60   ~ 0
V7
Entry Wire Line
	2250 5950 2350 5850
Text Label 2350 5850 0    60   ~ 0
CL0
Entry Wire Line
	2250 5850 2350 5750
Text Label 2350 5750 0    60   ~ 0
MD7
Entry Wire Line
	2250 5750 2350 5650
Text Label 2350 5650 0    60   ~ 0
MD6
Entry Wire Line
	2250 5650 2350 5550
Text Label 2350 5550 0    60   ~ 0
MD5
Entry Wire Line
	2250 5550 2350 5450
Text Label 2350 5450 0    60   ~ 0
MD4
Entry Wire Line
	2250 5450 2350 5350
Text Label 2350 5350 0    60   ~ 0
MD3
Entry Wire Line
	2250 5350 2350 5250
Text Label 2350 5250 0    60   ~ 0
MD2
Entry Wire Line
	2250 5250 2350 5150
Text Label 2350 5150 0    60   ~ 0
MD1
Entry Wire Line
	2250 5150 2350 5050
Text Label 2350 5050 0    60   ~ 0
MD0
$Comp
L GND #PWR014
U 1 1 5ACE8E40
P 2600 5950
F 0 "#PWR014" H 2600 5700 50  0001 C CNN
F 1 "GND" H 2450 5900 50  0000 C CNN
F 2 "" H 2600 5950 50  0001 C CNN
F 3 "" H 2600 5950 50  0001 C CNN
	1    2600 5950
	1    0    0    -1  
$EndComp
Entry Wire Line
	3900 6150 4000 6250
Text Label 3750 6150 0    60   ~ 0
VD8
Entry Wire Line
	3900 6250 4000 6350
Text Label 3750 6250 0    60   ~ 0
VD9
Entry Wire Line
	3900 6350 4000 6450
Text Label 3700 6350 0    60   ~ 0
VD10
Entry Wire Line
	3900 6450 4000 6550
Text Label 3700 6450 0    60   ~ 0
VD11
Entry Wire Line
	3900 6550 4000 6650
Text Label 3700 6550 0    60   ~ 0
VD12
Entry Wire Line
	3900 6650 4000 6750
Text Label 3700 6650 0    60   ~ 0
VD13
Entry Wire Line
	3900 6750 4000 6850
Text Label 3700 6750 0    60   ~ 0
VD14
Entry Wire Line
	3900 6850 4000 6950
Text Label 3700 6850 0    60   ~ 0
VD15
Entry Wire Line
	2250 7050 2350 6950
Text Label 2350 6950 0    60   ~ 0
CL0
Entry Wire Line
	2250 6950 2350 6850
Text Label 2350 6850 0    60   ~ 0
MD15
Entry Wire Line
	2250 6850 2350 6750
Text Label 2350 6750 0    60   ~ 0
MD14
Entry Wire Line
	2250 6750 2350 6650
Text Label 2350 6650 0    60   ~ 0
MD13
Entry Wire Line
	2250 6650 2350 6550
Text Label 2350 6550 0    60   ~ 0
MD12
Entry Wire Line
	2250 6550 2350 6450
Text Label 2350 6450 0    60   ~ 0
MD11
Entry Wire Line
	2250 6450 2350 6350
Text Label 2350 6350 0    60   ~ 0
MD10
Entry Wire Line
	2250 6350 2350 6250
Text Label 2350 6250 0    60   ~ 0
MD9
Entry Wire Line
	2250 6250 2350 6150
Text Label 2350 6150 0    60   ~ 0
MD8
$Comp
L GND #PWR015
U 1 1 5ACEC1BA
P 2600 7050
F 0 "#PWR015" H 2600 6800 50  0001 C CNN
F 1 "GND" H 2450 7000 50  0000 C CNN
F 2 "" H 2600 7050 50  0001 C CNN
F 3 "" H 2600 7050 50  0001 C CNN
	1    2600 7050
	1    0    0    -1  
$EndComp
Entry Wire Line
	3900 7250 4000 7350
Text Label 3700 7250 0    60   ~ 0
VD16
Entry Wire Line
	3900 7350 4000 7450
Text Label 3700 7350 0    60   ~ 0
VD17
Entry Wire Line
	3900 7450 4000 7550
Text Label 3700 7450 0    60   ~ 0
VD18
Entry Wire Line
	3900 7550 4000 7650
Text Label 3700 7550 0    60   ~ 0
VD19
Entry Wire Line
	3900 7750 4000 7850
Text Label 3700 7650 0    60   ~ 0
VD20
Entry Wire Line
	3900 7850 4000 7950
Text Label 3700 7750 0    60   ~ 0
VD21
Entry Wire Line
	3900 7950 4000 8050
Text Label 3700 7850 0    60   ~ 0
VD22
Entry Wire Line
	3900 7650 4000 7750
Text Label 3700 7950 0    60   ~ 0
VD23
Entry Wire Line
	2250 8150 2350 8050
Text Label 2350 8050 0    60   ~ 0
CL1
Entry Wire Line
	2250 8050 2350 7950
Text Label 2350 7950 0    60   ~ 0
MD7
Entry Wire Line
	2250 7950 2350 7850
Text Label 2350 7850 0    60   ~ 0
MD6
Entry Wire Line
	2250 7850 2350 7750
Text Label 2350 7750 0    60   ~ 0
MD5
Entry Wire Line
	2250 7750 2350 7650
Text Label 2350 7650 0    60   ~ 0
MD4
Entry Wire Line
	2250 7650 2350 7550
Text Label 2350 7550 0    60   ~ 0
MD3
Entry Wire Line
	2250 7550 2350 7450
Text Label 2350 7450 0    60   ~ 0
MD2
Entry Wire Line
	2250 7450 2350 7350
Text Label 2350 7350 0    60   ~ 0
MD1
Entry Wire Line
	2250 7350 2350 7250
Text Label 2350 7250 0    60   ~ 0
MD0
$Comp
L GND #PWR016
U 1 1 5ACEE9E0
P 2600 8150
F 0 "#PWR016" H 2600 7900 50  0001 C CNN
F 1 "GND" H 2450 8100 50  0000 C CNN
F 2 "" H 2600 8150 50  0001 C CNN
F 3 "" H 2600 8150 50  0001 C CNN
	1    2600 8150
	1    0    0    -1  
$EndComp
Entry Wire Line
	3900 8450 4000 8550
Text Label 3700 8350 0    60   ~ 0
VD24
Entry Wire Line
	3900 8550 4000 8650
Text Label 3700 8450 0    60   ~ 0
VD25
Entry Wire Line
	3900 8650 4000 8750
Text Label 3700 8550 0    60   ~ 0
VD26
Entry Wire Line
	3900 8750 4000 8850
Text Label 3700 8650 0    60   ~ 0
VD27
Entry Wire Line
	3900 8850 4000 8950
Text Label 3700 8750 0    60   ~ 0
VD28
Entry Wire Line
	3900 8950 4000 9050
Text Label 3700 8850 0    60   ~ 0
VD29
Entry Wire Line
	3900 8950 4000 9050
Text Label 3700 8950 0    60   ~ 0
VD30
Entry Wire Line
	3900 9050 4000 9150
Text Label 3700 9050 0    60   ~ 0
VD31
Entry Wire Line
	2250 9250 2350 9150
Text Label 2350 9150 0    60   ~ 0
CL1
Entry Wire Line
	2250 9150 2350 9050
Text Label 2350 9050 0    60   ~ 0
MD15
Entry Wire Line
	2250 9050 2350 8950
Text Label 2350 8950 0    60   ~ 0
MD14
Entry Wire Line
	2250 8950 2350 8850
Text Label 2350 8850 0    60   ~ 0
MD13
Entry Wire Line
	2250 8850 2350 8750
Text Label 2350 8750 0    60   ~ 0
MD12
Entry Wire Line
	2250 8750 2350 8650
Text Label 2350 8650 0    60   ~ 0
MD11
Entry Wire Line
	2250 8650 2350 8550
Text Label 2350 8550 0    60   ~ 0
MD10
Entry Wire Line
	2250 8550 2350 8450
Text Label 2350 8450 0    60   ~ 0
MD9
Entry Wire Line
	2250 8450 2350 8350
Text Label 2350 8350 0    60   ~ 0
MD8
$Comp
L GND #PWR017
U 1 1 5ACEEA1F
P 2600 9250
F 0 "#PWR017" H 2600 9000 50  0001 C CNN
F 1 "GND" H 2450 9200 50  0000 C CNN
F 2 "" H 2600 9250 50  0001 C CNN
F 3 "" H 2600 9250 50  0001 C CNN
	1    2600 9250
	1    0    0    -1  
$EndComp
Entry Wire Line
	3900 3950 4000 4050
Text Label 3750 3950 0    60   ~ 0
PS0
Entry Wire Line
	3900 4050 4000 4150
Text Label 3750 4050 0    60   ~ 0
PS1
Entry Wire Line
	3900 4150 4000 4250
Text Label 3750 4150 0    60   ~ 0
PS2
Entry Wire Line
	3900 4250 4000 4350
Text Label 3750 4250 0    60   ~ 0
PS3
Entry Wire Line
	3900 4350 4000 4450
Text Label 3750 4350 0    60   ~ 0
PS4
Entry Wire Line
	3900 4450 4000 4550
Text Label 3750 4450 0    60   ~ 0
PS5
Entry Wire Line
	3900 4550 4000 4650
Text Label 3750 4550 0    60   ~ 0
PS6
Entry Wire Line
	3900 4650 4000 4750
Text Label 3750 4650 0    60   ~ 0
PS7
Entry Wire Line
	2250 4850 2350 4750
Text Label 2350 4750 0    60   ~ 0
BE
Entry Wire Line
	2250 4750 2350 4650
Text Label 2350 4650 0    60   ~ 0
VD15
Entry Wire Line
	2250 4650 2350 4550
Text Label 2350 4550 0    60   ~ 0
VD14
Entry Wire Line
	2250 4550 2350 4450
Text Label 2350 4450 0    60   ~ 0
VD13
Entry Wire Line
	2250 4450 2350 4350
Text Label 2350 4350 0    60   ~ 0
VD12
Entry Wire Line
	2250 4350 2350 4250
Text Label 2350 4250 0    60   ~ 0
VD11
Entry Wire Line
	2250 4250 2350 4150
Text Label 2350 4150 0    60   ~ 0
VD10
Entry Wire Line
	2250 4150 2350 4050
Text Label 2350 4050 0    60   ~ 0
VD9
Entry Wire Line
	2250 4050 2350 3950
Text Label 2350 3950 0    60   ~ 0
VD8
Entry Wire Line
	2250 4950 2350 4850
Text Label 2350 4850 0    60   ~ 0
VM3
Entry Wire Line
	4000 1650 4100 1550
Text Label 4100 1550 0    60   ~ 0
CLK
Entry Wire Line
	4000 1450 4100 1350
Text Label 4100 1350 0    60   ~ 0
VD7
Entry Wire Line
	4000 1350 4100 1250
Text Label 4100 1250 0    60   ~ 0
VD6
Entry Wire Line
	4000 1250 4100 1150
Text Label 4100 1150 0    60   ~ 0
VD5
Entry Wire Line
	4000 1150 4100 1050
Text Label 4100 1050 0    60   ~ 0
VD4
Entry Wire Line
	4000 1050 4100 950 
Text Label 4100 950  0    60   ~ 0
VD3
Entry Wire Line
	4000 950  4100 850 
Text Label 4100 850  0    60   ~ 0
VD2
Entry Wire Line
	4000 850  4100 750 
Text Label 4100 750  0    60   ~ 0
VD1
Entry Wire Line
	4000 750  4100 650 
Text Label 4100 650  0    60   ~ 0
VD0
Entry Wire Line
	4000 1950 4100 1850
Text Label 4100 1850 0    60   ~ 0
BEn
$Comp
L GND #PWR018
U 1 1 5AD0114F
P 4250 1900
F 0 "#PWR018" H 4250 1650 50  0001 C CNN
F 1 "GND" H 4100 1850 50  0000 C CNN
F 2 "" H 4250 1900 50  0001 C CNN
F 3 "" H 4250 1900 50  0001 C CNN
	1    4250 1900
	1    0    0    -1  
$EndComp
$Comp
L R_Small R4
U 1 1 5AD05481
P 4400 2000
F 0 "R4" V 4325 1975 50  0000 L CNN
F 1 "1k" V 4400 1950 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 4400 2000 50  0001 C CNN
F 3 "" H 4400 2000 50  0001 C CNN
	1    4400 2000
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR019
U 1 1 5AD05487
P 4500 2000
F 0 "#PWR019" H 4500 1850 50  0001 C CNN
F 1 "VCC" V 4500 2175 50  0000 C CNN
F 2 "" H 4500 2000 50  0001 C CNN
F 3 "" H 4500 2000 50  0001 C CNN
	1    4500 2000
	0    1    1    0   
$EndComp
$Comp
L IR10 DD19
U 1 1 5AD0847F
P 4850 1100
F 0 "DD19" H 4850 1650 60  0000 C CNN
F 1 "IR10" H 4850 350 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 4800 1250 60  0001 C CNN
F 3 "" H 4800 1250 60  0001 C CNN
	1    4850 1100
	1    0    0    -1  
$EndComp
Entry Wire Line
	5550 1350 5650 1450
Text Label 5450 1350 0    60   ~ 0
P1
Entry Wire Line
	4000 3100 4100 3000
Text Label 4100 3000 0    60   ~ 0
CLK
Entry Wire Line
	4000 2900 4100 2800
Text Label 4100 2800 0    60   ~ 0
VD15
Entry Wire Line
	4000 2800 4100 2700
Text Label 4100 2700 0    60   ~ 0
VD14
Entry Wire Line
	4000 2700 4100 2600
Text Label 4100 2600 0    60   ~ 0
VD13
Entry Wire Line
	4000 2600 4100 2500
Text Label 4100 2500 0    60   ~ 0
VD12
Entry Wire Line
	4000 2500 4100 2400
Text Label 4100 2400 0    60   ~ 0
VD11
Entry Wire Line
	4000 2400 4100 2300
Text Label 4100 2300 0    60   ~ 0
VD10
Entry Wire Line
	4000 2300 4100 2200
Text Label 4100 2200 0    60   ~ 0
VD9
Entry Wire Line
	4000 2200 4100 2100
Text Label 4100 2100 0    60   ~ 0
VD8
Entry Wire Line
	4000 3400 4100 3300
Text Label 4100 3300 0    60   ~ 0
BEn
$Comp
L GND #PWR020
U 1 1 5AD0AC5C
P 4300 3325
F 0 "#PWR020" H 4300 3075 50  0001 C CNN
F 1 "GND" H 4150 3275 50  0000 C CNN
F 2 "" H 4300 3325 50  0001 C CNN
F 3 "" H 4300 3325 50  0001 C CNN
	1    4300 3325
	1    0    0    -1  
$EndComp
$Comp
L IR10 DD20
U 1 1 5AD0AC71
P 4850 2550
F 0 "DD20" H 4850 3100 60  0000 C CNN
F 1 "IR10" H 4850 1800 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 4800 2700 60  0001 C CNN
F 3 "" H 4800 2700 60  0001 C CNN
	1    4850 2550
	1    0    0    -1  
$EndComp
Entry Wire Line
	5550 2800 5650 2900
Text Label 5450 2800 0    60   ~ 0
P2
Entry Wire Line
	4000 3300 4100 3200
Text Label 4100 3200 0    60   ~ 0
VM2
Entry Wire Line
	4000 4500 4100 4400
Text Label 4100 4400 0    60   ~ 0
CLK
Entry Wire Line
	4000 4300 4100 4200
Text Label 4100 4200 0    60   ~ 0
VD23
Entry Wire Line
	4000 4200 4100 4100
Text Label 4100 4100 0    60   ~ 0
VD22
Entry Wire Line
	4000 4100 4100 4000
Text Label 4100 4000 0    60   ~ 0
VD21
Entry Wire Line
	4000 4000 4100 3900
Text Label 4100 3900 0    60   ~ 0
VD20
Entry Wire Line
	4000 3900 4100 3800
Text Label 4100 3800 0    60   ~ 0
VD19
Entry Wire Line
	4000 3800 4100 3700
Text Label 4100 3700 0    60   ~ 0
VD18
Entry Wire Line
	4000 3700 4100 3600
Text Label 4100 3600 0    60   ~ 0
VD17
Entry Wire Line
	4000 3600 4100 3500
Text Label 4100 3500 0    60   ~ 0
VD16
Entry Wire Line
	4000 4800 4100 4700
Text Label 4100 4700 0    60   ~ 0
BEn
$Comp
L GND #PWR021
U 1 1 5AD0E034
P 4250 4750
F 0 "#PWR021" H 4250 4500 50  0001 C CNN
F 1 "GND" H 4100 4700 50  0000 C CNN
F 2 "" H 4250 4750 50  0001 C CNN
F 3 "" H 4250 4750 50  0001 C CNN
	1    4250 4750
	1    0    0    -1  
$EndComp
$Comp
L R_Small R5
U 1 1 5AD0E03B
P 4400 4850
F 0 "R5" V 4325 4825 50  0000 L CNN
F 1 "1k" V 4400 4800 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 4400 4850 50  0001 C CNN
F 3 "" H 4400 4850 50  0001 C CNN
	1    4400 4850
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR022
U 1 1 5AD0E041
P 4500 4850
F 0 "#PWR022" H 4500 4700 50  0001 C CNN
F 1 "VCC" V 4500 5025 50  0000 C CNN
F 2 "" H 4500 4850 50  0001 C CNN
F 3 "" H 4500 4850 50  0001 C CNN
	1    4500 4850
	0    1    1    0   
$EndComp
$Comp
L IR10 DD21
U 1 1 5AD0E048
P 4850 3950
F 0 "DD21" H 4850 4500 60  0000 C CNN
F 1 "IR10" H 4850 3200 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 4800 4100 60  0001 C CNN
F 3 "" H 4800 4100 60  0001 C CNN
	1    4850 3950
	1    0    0    -1  
$EndComp
Entry Wire Line
	5550 4200 5650 4300
Text Label 5450 4200 0    60   ~ 0
P3
Entry Wire Line
	4000 5950 4100 5850
Text Label 4100 5850 0    60   ~ 0
CLK
Entry Wire Line
	4000 5750 4100 5650
Text Label 4100 5650 0    60   ~ 0
VD31
Entry Wire Line
	4000 5650 4100 5550
Text Label 4100 5550 0    60   ~ 0
VD30
Entry Wire Line
	4000 5550 4100 5450
Text Label 4100 5450 0    60   ~ 0
VD29
Entry Wire Line
	4000 5450 4100 5350
Text Label 4100 5350 0    60   ~ 0
VD28
Entry Wire Line
	4000 5350 4100 5250
Text Label 4100 5250 0    60   ~ 0
VD27
Entry Wire Line
	4000 5250 4100 5150
Text Label 4100 5150 0    60   ~ 0
VD26
Entry Wire Line
	4000 5150 4100 5050
Text Label 4100 5050 0    60   ~ 0
VD25
Entry Wire Line
	4000 5050 4100 4950
Text Label 4100 4950 0    60   ~ 0
VD24
Entry Wire Line
	4000 6250 4100 6150
Text Label 4100 6150 0    60   ~ 0
BEn
$Comp
L GND #PWR023
U 1 1 5AD106DF
P 4250 6200
F 0 "#PWR023" H 4250 5950 50  0001 C CNN
F 1 "GND" H 4100 6150 50  0000 C CNN
F 2 "" H 4250 6200 50  0001 C CNN
F 3 "" H 4250 6200 50  0001 C CNN
	1    4250 6200
	1    0    0    -1  
$EndComp
$Comp
L R_Small R6
U 1 1 5AD106E6
P 4400 6300
F 0 "R6" V 4325 6275 50  0000 L CNN
F 1 "1k" V 4400 6250 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 4400 6300 50  0001 C CNN
F 3 "" H 4400 6300 50  0001 C CNN
	1    4400 6300
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR024
U 1 1 5AD106EC
P 4500 6300
F 0 "#PWR024" H 4500 6150 50  0001 C CNN
F 1 "VCC" V 4500 6475 50  0000 C CNN
F 2 "" H 4500 6300 50  0001 C CNN
F 3 "" H 4500 6300 50  0001 C CNN
	1    4500 6300
	0    1    1    0   
$EndComp
$Comp
L IR10 DD22
U 1 1 5AD106F3
P 4850 5400
F 0 "DD22" H 4850 5950 60  0000 C CNN
F 1 "IR10" H 4850 4650 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 4800 5550 60  0001 C CNN
F 3 "" H 4800 5550 60  0001 C CNN
	1    4850 5400
	1    0    0    -1  
$EndComp
Entry Wire Line
	5550 5650 5650 5750
Text Label 5450 5650 0    60   ~ 0
P4
Entry Wire Line
	3900 2850 4000 2950
Text Label 3750 2850 0    60   ~ 0
PS0
Entry Wire Line
	3900 2950 4000 3050
Text Label 3750 2950 0    60   ~ 0
PS1
Entry Wire Line
	3900 3050 4000 3150
Text Label 3750 3050 0    60   ~ 0
PS2
Entry Wire Line
	3900 3150 4000 3250
Text Label 3750 3150 0    60   ~ 0
PS3
Entry Wire Line
	3900 3250 4000 3350
Text Label 3750 3250 0    60   ~ 0
PS4
Entry Wire Line
	3900 3350 4000 3450
Text Label 3750 3350 0    60   ~ 0
PS5
Entry Wire Line
	3900 3450 4000 3550
Text Label 3750 3450 0    60   ~ 0
PS6
Entry Wire Line
	3900 3550 4000 3650
Text Label 3750 3550 0    60   ~ 0
PS7
Entry Wire Line
	2250 3750 2350 3650
Text Label 2350 3650 0    60   ~ 0
PFCn
Entry Wire Line
	2250 3650 2350 3550
Text Label 2350 3550 0    60   ~ 0
D7
Entry Wire Line
	2250 3550 2350 3450
Text Label 2350 3450 0    60   ~ 0
D6
Entry Wire Line
	2250 3450 2350 3350
Text Label 2350 3350 0    60   ~ 0
D5
Entry Wire Line
	2250 3350 2350 3250
Text Label 2350 3250 0    60   ~ 0
D4
Entry Wire Line
	2250 3250 2350 3150
Text Label 2350 3150 0    60   ~ 0
D3
Entry Wire Line
	2250 3150 2350 3050
Text Label 2350 3050 0    60   ~ 0
D2
Entry Wire Line
	2250 3050 2350 2950
Text Label 2350 2950 0    60   ~ 0
D1
Entry Wire Line
	2250 2950 2350 2850
Text Label 2350 2850 0    60   ~ 0
D0
Entry Wire Line
	2250 3850 2350 3750
Text Label 2350 3750 0    60   ~ 0
VM3n
$Comp
L R_Small R7
U 1 1 5AD9F67A
P 6450 650
F 0 "R7" V 6375 625 50  0000 C CNN
F 1 "470" V 6450 650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" H 6450 650 50  0001 C CNN
F 3 "" H 6450 650 50  0001 C CNN
	1    6450 650 
	0    1    1    0   
$EndComp
$Comp
L GND #PWR025
U 1 1 5AD9F686
P 6350 700
F 0 "#PWR025" H 6350 450 50  0001 C CNN
F 1 "GND" H 6375 550 50  0000 C CNN
F 2 "" H 6350 700 50  0001 C CNN
F 3 "" H 6350 700 50  0001 C CNN
	1    6350 700 
	1    0    0    -1  
$EndComp
$Comp
L R_Small R13
U 1 1 5AD9F698
P 6600 800
F 0 "R13" H 6400 775 50  0000 L CNN
F 1 "1k" V 6600 800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" H 6600 800 50  0001 C CNN
F 3 "" H 6600 800 50  0001 C CNN
	1    6600 800 
	-1   0    0    1   
$EndComp
Entry Wire Line
	5650 1150 5750 1050
Text Label 5750 1050 0    60   ~ 0
IR
Entry Wire Line
	5650 1050 5750 950 
Text Label 5750 950  0    60   ~ 0
R
Entry Wire Line
	7050 650  7150 750 
Text Label 6950 650  0    60   ~ 0
VR
Entry Wire Line
	4000 9150 4100 9050
Entry Wire Line
	4000 10050 4100 9950
Text Label 4100 9950 0    60   ~ 0
V6
Entry Wire Line
	4000 9950 4100 9850
Text Label 4100 9850 0    60   ~ 0
V5
Entry Wire Line
	4000 9850 4100 9750
Text Label 4100 9750 0    60   ~ 0
V4
Entry Wire Line
	4000 9750 4100 9650
Text Label 4100 9650 0    60   ~ 0
V3
Entry Wire Line
	4000 9650 4100 9550
Text Label 4100 9550 0    60   ~ 0
V2
Entry Wire Line
	4000 9550 4100 9450
Text Label 4100 9450 0    60   ~ 0
V1
Entry Wire Line
	4000 9450 4100 9350
Text Label 4100 9350 0    60   ~ 0
V0
Entry Wire Line
	4000 9350 4100 9250
Text Label 4100 9250 0    60   ~ 0
U2
Entry Wire Line
	4000 9250 4100 9150
Text Label 4100 9150 0    60   ~ 0
U1
Text Label 4100 9050 0    60   ~ 0
U0
Entry Wire Line
	4000 10550 4100 10450
Text Label 4100 10450 0    60   ~ 0
F3
Entry Wire Line
	4000 10450 4100 10350
Text Label 4100 10350 0    60   ~ 0
F2
Entry Wire Line
	4000 10350 4100 10250
Text Label 4100 10250 0    60   ~ 0
F1
Entry Wire Line
	4000 10250 4100 10150
Text Label 4100 10150 0    60   ~ 0
F0
Entry Wire Line
	4000 10150 4100 10050
Text Label 4100 10050 0    60   ~ 0
V7
Entry Wire Line
	5550 9050 5650 9150
Text Label 5400 9050 0    60   ~ 0
VD0
Entry Wire Line
	5550 9150 5650 9250
Text Label 5400 9150 0    60   ~ 0
VD1
Entry Wire Line
	5550 9250 5650 9350
Text Label 5400 9250 0    60   ~ 0
VD2
Entry Wire Line
	5550 9350 5650 9450
Text Label 5400 9350 0    60   ~ 0
VD3
Entry Wire Line
	5550 9450 5650 9550
Text Label 5400 9450 0    60   ~ 0
VD4
Entry Wire Line
	5550 9550 5650 9650
Text Label 5400 9550 0    60   ~ 0
VD5
Entry Wire Line
	5550 9650 5650 9750
Text Label 5400 9650 0    60   ~ 0
VD6
Entry Wire Line
	5550 9750 5650 9850
Text Label 5400 9750 0    60   ~ 0
VD7
$Comp
L KP11 DD17
U 1 1 5AE6D2F1
P 4850 8250
F 0 "DD17" H 4850 8750 60  0000 C CNN
F 1 "KP11" H 4850 7750 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 4750 8600 60  0001 C CNN
F 3 "" H 4750 8600 60  0001 C CNN
	1    4850 8250
	1    0    0    -1  
$EndComp
Entry Wire Line
	5550 7850 5650 7950
Entry Wire Line
	5550 7950 5650 8050
Text Label 5450 7950 0    60   ~ 0
U1
Entry Wire Line
	5550 8050 5650 8150
Text Label 5450 8050 0    60   ~ 0
U2
Entry Wire Line
	4000 8150 4100 8050
Text Label 4100 8050 0    60   ~ 0
Y2
Entry Wire Line
	4000 8050 4100 7950
Text Label 4100 7950 0    60   ~ 0
Y1
Entry Wire Line
	4000 7950 4100 7850
Entry Wire Line
	4000 8750 4100 8650
Text Label 4100 8650 0    60   ~ 0
PGD
Text Label 5450 7850 0    60   ~ 0
U0
Text Label 4100 7850 0    60   ~ 0
Y0
$Comp
L GND #PWR026
U 1 1 5AE81283
P 4350 8800
F 0 "#PWR026" H 4350 8550 50  0001 C CNN
F 1 "GND" H 4200 8750 50  0000 C CNN
F 2 "" H 4350 8800 50  0001 C CNN
F 3 "" H 4350 8800 50  0001 C CNN
	1    4350 8800
	1    0    0    -1  
$EndComp
$Comp
L ATF22V10 DD7
U 1 1 5AF1342D
P 1450 8550
F 0 "DD7" H 1450 9200 60  0000 C CNN
F 1 "ATF22V10" H 1550 8000 60  0000 C CNN
F 2 "Housings_DIP:DIP-24_W7.62mm_Socket_LongPads" H 1450 8500 60  0001 C CNN
F 3 "" H 1450 8500 60  0001 C CNN
	1    1450 8550
	1    0    0    -1  
$EndComp
Entry Wire Line
	550  8200 650  8100
Entry Wire Line
	550  8300 650  8200
Entry Wire Line
	550  8400 650  8300
Entry Wire Line
	550  8500 650  8400
Entry Wire Line
	550  8600 650  8500
Entry Wire Line
	550  8700 650  8600
Entry Wire Line
	550  8800 650  8700
Entry Wire Line
	550  8900 650  8800
Entry Wire Line
	550  9000 650  8900
Entry Wire Line
	550  9100 650  9000
Entry Wire Line
	550  9200 650  9100
Entry Wire Line
	550  8100 650  8000
Entry Wire Line
	2150 8000 2250 8100
Entry Wire Line
	2150 8100 2250 8200
Entry Wire Line
	2150 8200 2250 8300
Entry Wire Line
	2150 8300 2250 8400
Entry Wire Line
	2150 8400 2250 8500
Entry Wire Line
	2150 8500 2250 8600
Entry Wire Line
	2150 8600 2250 8700
Entry Wire Line
	2150 8700 2250 8800
Text Label 650  8100 0    60   ~ 0
X0
Text Label 650  8200 0    60   ~ 0
X1
Text Label 650  8300 0    60   ~ 0
X2
Text Label 650  8400 0    60   ~ 0
X3
Text Label 650  8500 0    60   ~ 0
X4
Text Label 650  8600 0    60   ~ 0
X5
Text Label 650  8700 0    60   ~ 0
X6
Text Label 650  8800 0    60   ~ 0
X7
Text Label 650  8900 0    60   ~ 0
X8
Text Label 650  9000 0    60   ~ 0
X9
Text Label 650  9100 0    60   ~ 0
SR16
Text Label 650  8000 0    60   ~ 0
CLK
Text Label 2000 8000 0    60   ~ 0
XRn
Text Label 2000 8100 0    60   ~ 0
BEn
Text Label 2050 8200 0    60   ~ 0
BH
Text Label 2050 8300 0    60   ~ 0
XE
Text Label 2000 8400 0    60   ~ 0
HSP
Text Label 2000 8500 0    60   ~ 0
CL0
Text Label 2000 8600 0    60   ~ 0
CL1
Text Label 2000 8700 0    60   ~ 0
MCP
$Comp
L ATF22V10 DD8
U 1 1 5AF332B1
P 1450 9900
F 0 "DD8" H 1450 10550 60  0000 C CNN
F 1 "ATF22V10" H 1550 9350 60  0000 C CNN
F 2 "Housings_DIP:DIP-24_W7.62mm_Socket_LongPads" H 1450 9850 60  0001 C CNN
F 3 "" H 1450 9850 60  0001 C CNN
	1    1450 9900
	1    0    0    -1  
$EndComp
Entry Wire Line
	550  9450 650  9350
Entry Wire Line
	550  9550 650  9450
Entry Wire Line
	550  9650 650  9550
Entry Wire Line
	550  9750 650  9650
Entry Wire Line
	550  9850 650  9750
Entry Wire Line
	550  9950 650  9850
Entry Wire Line
	550  10050 650  9950
Entry Wire Line
	550  10150 650  10050
Entry Wire Line
	550  10250 650  10150
Entry Wire Line
	550  10350 650  10250
Entry Wire Line
	550  10450 650  10350
Entry Wire Line
	550  10550 650  10450
Entry Wire Line
	2150 9350 2250 9450
Entry Wire Line
	2150 9450 2250 9550
Entry Wire Line
	2150 9550 2250 9650
Text Label 650  9350 0    60   ~ 0
Y0
Text Label 650  9450 0    60   ~ 0
Y1
Text Label 650  9550 0    60   ~ 0
Y2
Text Label 650  9650 0    60   ~ 0
Y3
Text Label 650  9750 0    60   ~ 0
Y4
Text Label 650  9850 0    60   ~ 0
Y5
Text Label 650  9950 0    60   ~ 0
Y6
Text Label 650  10050 0    60   ~ 0
Y7
Text Label 650  10150 0    60   ~ 0
Y8
Text Label 650  10250 0    60   ~ 0
Y9
Text Label 650  10350 0    60   ~ 0
WEN
Text Label 650  10450 0    60   ~ 0
BH
Text Label 2000 9350 0    60   ~ 0
YRn
Text Label 2050 9450 0    60   ~ 0
BL
Text Label 2050 9550 0    60   ~ 0
VS
$Comp
L IR35 DD9
U 1 1 5AB6FA54
P 3100 1100
F 0 "DD9" H 3100 1650 60  0000 C CNN
F 1 "IR35" H 3100 650 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-20W_7.5x12.8mm_Pitch1.27mm" H 3050 1250 60  0001 C CNN
F 3 "" H 3050 1250 60  0001 C CNN
	1    3100 1100
	1    0    0    -1  
$EndComp
Entry Wire Line
	2350 1550 2250 1650
Entry Wire Line
	2350 1750 2250 1850
Text Label 2450 1750 2    60   ~ 0
D0
Entry Wire Line
	2350 1850 2250 1950
Text Label 2450 1850 2    60   ~ 0
D1
Entry Wire Line
	2350 1950 2250 2050
Text Label 2450 1950 2    60   ~ 0
D2
Entry Wire Line
	2350 2050 2250 2150
Text Label 2450 2050 2    60   ~ 0
D3
Entry Wire Line
	2350 2150 2250 2250
Text Label 2450 2150 2    60   ~ 0
D4
Entry Wire Line
	2350 2250 2250 2350
Text Label 2450 2250 2    60   ~ 0
D5
Entry Wire Line
	2350 2350 2250 2450
Text Label 2450 2350 2    60   ~ 0
D6
Entry Wire Line
	2350 2450 2250 2550
Text Label 2450 2450 2    60   ~ 0
D7
Entry Wire Line
	2250 2650 2350 2550
Text Label 2350 2550 0    60   ~ 0
PFA
Text Label 2350 2650 0    60   ~ 0
RESn
Text Label 3900 1750 2    60   ~ 0
VB0
Text Label 3900 1850 2    60   ~ 0
VB1
Text Label 3900 1950 2    60   ~ 0
F0
Text Label 3900 2050 2    60   ~ 0
F1
Text Label 3900 2150 2    60   ~ 0
F2
Text Label 3900 2250 2    60   ~ 0
F3
Text Label 3900 2350 2    60   ~ 0
PGD
Text Label 3900 2450 2    60   ~ 0
SR16
Entry Wire Line
	4000 2550 3900 2450
Entry Wire Line
	4000 2450 3900 2350
Entry Wire Line
	4000 2350 3900 2250
Entry Wire Line
	4000 2250 3900 2150
Entry Wire Line
	4000 2150 3900 2050
Entry Wire Line
	4000 2050 3900 1950
Entry Wire Line
	4000 1950 3900 1850
Entry Wire Line
	4000 1850 3900 1750
$Comp
L IR35 DD10
U 1 1 5AF44584
P 3100 2200
F 0 "DD10" H 3100 2750 60  0000 C CNN
F 1 "IR35" H 3100 1750 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-20W_7.5x12.8mm_Pitch1.27mm" H 3050 2350 60  0001 C CNN
F 3 "" H 3050 2350 60  0001 C CNN
	1    3100 2200
	1    0    0    -1  
$EndComp
Entry Wire Line
	2350 2650 2250 2750
$Comp
L ATF22V10 DD23
U 1 1 5AFCEC37
P 4850 7000
F 0 "DD23" H 4850 7650 60  0000 C CNN
F 1 "ATF22V10" H 4950 6450 60  0000 C CNN
F 2 "Housings_DIP:DIP-24_W7.62mm_Socket_LongPads" H 4850 6950 60  0001 C CNN
F 3 "" H 4850 6950 60  0001 C CNN
	1    4850 7000
	1    0    0    -1  
$EndComp
Entry Wire Line
	4000 6550 4100 6450
Entry Wire Line
	4000 6650 4100 6550
Entry Wire Line
	4000 6750 4100 6650
Entry Wire Line
	4000 6850 4100 6750
Entry Wire Line
	4000 6950 4100 6850
Entry Wire Line
	4000 7050 4100 6950
Entry Wire Line
	4000 7150 4100 7050
Entry Wire Line
	4000 7250 4100 7150
Entry Wire Line
	4000 7350 4100 7250
Entry Wire Line
	4000 7450 4100 7350
Entry Wire Line
	4000 7550 4100 7450
Entry Wire Line
	4000 7650 4100 7550
Entry Wire Line
	5550 6450 5650 6550
Entry Wire Line
	5550 6550 5650 6650
Entry Wire Line
	5550 6650 5650 6750
Entry Wire Line
	5550 6750 5650 6850
Entry Wire Line
	5550 6850 5650 6950
Entry Wire Line
	5550 6950 5650 7050
Entry Wire Line
	5550 7050 5650 7150
Entry Wire Line
	5550 7150 5650 7250
Entry Wire Line
	5550 7250 5650 7350
Text Label 4100 6450 0    60   ~ 0
VM0
Text Label 4100 6550 0    60   ~ 0
VM1
Text Label 4100 6650 0    60   ~ 0
VM4
Text Label 4100 6750 0    60   ~ 0
BLn
Text Label 4100 6850 0    60   ~ 0
P1
Text Label 4100 6950 0    60   ~ 0
P2
Text Label 4100 7050 0    60   ~ 0
P3
Text Label 4100 7150 0    60   ~ 0
P4
Text Label 4100 7250 0    60   ~ 0
PS0
Text Label 4100 7350 0    60   ~ 0
PS1
Text Label 4100 7450 0    60   ~ 0
PS2
Text Label 4100 7550 0    60   ~ 0
PS3
Text Label 5450 6450 0    60   ~ 0
IB
Text Label 5450 6550 0    60   ~ 0
B
Text Label 5450 6650 0    60   ~ 0
IG
Text Label 5450 6750 0    60   ~ 0
G
Text Label 5450 6850 0    60   ~ 0
IR
Text Label 5450 6950 0    60   ~ 0
R
Text Label 5400 7050 0    60   ~ 0
PS7
Text Label 5400 7150 0    60   ~ 0
PS6
Text Label 5400 7250 0    60   ~ 0
PS5
Entry Wire Line
	5550 7350 5650 7450
Text Label 5400 7350 0    60   ~ 0
PS4
Entry Wire Line
	4000 8550 4100 8450
Text Label 4100 8450 0    60   ~ 0
FL2
Entry Wire Line
	4000 8450 4100 8350
Text Label 4100 8350 0    60   ~ 0
FL1
Entry Wire Line
	4000 8350 4100 8250
Text Label 4100 8250 0    60   ~ 0
FL0
$Comp
L GND #PWR027
U 1 1 5B0059A2
P 4150 10900
F 0 "#PWR027" H 4150 10650 50  0001 C CNN
F 1 "GND" H 4275 10850 50  0000 C CNN
F 2 "" H 4150 10900 50  0001 C CNN
F 3 "" H 4150 10900 50  0001 C CNN
	1    4150 10900
	1    0    0    -1  
$EndComp
$Comp
L IR23 DD11
U 1 1 5B02416D
P 3100 3300
F 0 "DD11" H 3100 3850 60  0000 C CNN
F 1 "IR23" H 3100 2850 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-20W_7.5x12.8mm_Pitch1.27mm" H 3050 3450 60  0001 C CNN
F 3 "" H 3050 3450 60  0001 C CNN
	1    3100 3300
	1    0    0    -1  
$EndComp
$Comp
L IR22 DD12
U 1 1 5B0267E7
P 3100 4400
F 0 "DD12" H 3100 4950 60  0000 C CNN
F 1 "IR22" H 3100 3950 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-20W_7.5x12.8mm_Pitch1.27mm" H 3050 4550 60  0001 C CNN
F 3 "" H 3050 4550 60  0001 C CNN
	1    3100 4400
	1    0    0    -1  
$EndComp
$Comp
L IR22 DD13
U 1 1 5B02C736
P 3100 5500
F 0 "DD13" H 3100 6050 60  0000 C CNN
F 1 "IR22" H 3100 5050 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-20W_7.5x12.8mm_Pitch1.27mm" H 3050 5650 60  0001 C CNN
F 3 "" H 3050 5650 60  0001 C CNN
	1    3100 5500
	1    0    0    -1  
$EndComp
$Comp
L IR22 DD14
U 1 1 5B02C88B
P 3100 6600
F 0 "DD14" H 3100 7150 60  0000 C CNN
F 1 "IR22" H 3100 6150 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-20W_7.5x12.8mm_Pitch1.27mm" H 3050 6750 60  0001 C CNN
F 3 "" H 3050 6750 60  0001 C CNN
	1    3100 6600
	1    0    0    -1  
$EndComp
$Comp
L IR22 DD15
U 1 1 5B02D3E9
P 3100 7700
F 0 "DD15" H 3100 8250 60  0000 C CNN
F 1 "IR22" H 3100 7250 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-20W_7.5x12.8mm_Pitch1.27mm" H 3050 7850 60  0001 C CNN
F 3 "" H 3050 7850 60  0001 C CNN
	1    3100 7700
	1    0    0    -1  
$EndComp
$Comp
L IR22 DD16
U 1 1 5B02DDCC
P 3100 8800
F 0 "DD16" H 3100 9350 60  0000 C CNN
F 1 "IR22" H 3100 8350 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-20W_7.5x12.8mm_Pitch1.27mm" H 3050 8950 60  0001 C CNN
F 3 "" H 3050 8950 60  0001 C CNN
	1    3100 8800
	1    0    0    -1  
$EndComp
Entry Wire Line
	7050 8850 7150 8950
Text Label 6900 8850 0    60   ~ 0
VD0
Entry Wire Line
	7050 8950 7150 9050
Text Label 6900 8950 0    60   ~ 0
VD1
Entry Wire Line
	7050 9050 7150 9150
Text Label 6900 9050 0    60   ~ 0
VD2
Entry Wire Line
	7050 9150 7150 9250
Text Label 6900 9150 0    60   ~ 0
VD3
Entry Wire Line
	7050 9250 7150 9350
Text Label 6900 9250 0    60   ~ 0
VD4
Entry Wire Line
	7050 9350 7150 9450
Text Label 6900 9350 0    60   ~ 0
VD5
Entry Wire Line
	7050 9450 7150 9550
Text Label 6900 9450 0    60   ~ 0
VD6
Entry Wire Line
	7050 9550 7150 9650
Text Label 6900 9550 0    60   ~ 0
VD7
Entry Wire Line
	5650 9550 5750 9450
Text Label 5750 9450 0    60   ~ 0
V6
Entry Wire Line
	5650 9450 5750 9350
Text Label 5750 9350 0    60   ~ 0
V5
Entry Wire Line
	5650 9350 5750 9250
Text Label 5750 9250 0    60   ~ 0
V4
Entry Wire Line
	5650 9250 5750 9150
Text Label 5750 9150 0    60   ~ 0
V3
Entry Wire Line
	5650 9150 5750 9050
Text Label 5750 9050 0    60   ~ 0
V2
Entry Wire Line
	5650 9050 5750 8950
Text Label 5750 8950 0    60   ~ 0
V1
Entry Wire Line
	5650 8950 5750 8850
Text Label 5750 8850 0    60   ~ 0
V0
Entry Wire Line
	5650 9650 5750 9550
Text Label 5750 9550 0    60   ~ 0
V7
Entry Wire Line
	2150 8800 2250 8900
Text Label 2050 8800 0    60   ~ 0
VC
Entry Wire Line
	2150 9650 2250 9750
Text Label 2000 9650 0    60   ~ 0
FEN
Entry Wire Line
	2150 9750 2250 9850
Entry Wire Line
	2150 9850 2250 9950
Text Label 2000 9750 0    60   ~ 0
HSP
Text Label 2050 9850 0    60   ~ 0
HS
Entry Wire Line
	2150 9950 2250 10050
Entry Wire Line
	2150 10050 2250 10150
Entry Wire Line
	2150 10150 2250 10250
Text Label 2000 9950 0    60   ~ 0
VM3
Text Label 1950 10050 0    60   ~ 0
VM3n
Text Label 2000 10150 0    60   ~ 0
YR1
Entry Wire Line
	2150 10250 2250 10350
Text Label 2000 10250 0    60   ~ 0
YR2
Entry Wire Line
	2150 8900 2250 9000
Text Label 2050 8900 0    60   ~ 0
BE
Entry Wire Line
	2250 10950 2350 10850
Text Label 2350 10850 0    60   ~ 0
WEN
$Comp
L ATF22V10 DD28
U 1 1 5AF91BA7
P 6400 10400
F 0 "DD28" H 6400 11050 60  0000 C CNN
F 1 "ATF22V10" H 6500 9850 60  0000 C CNN
F 2 "Housings_DIP:DIP-24_W7.62mm_Socket_LongPads" H 6400 10350 60  0001 C CNN
F 3 "" H 6400 10350 60  0001 C CNN
	1    6400 10400
	1    0    0    -1  
$EndComp
Entry Wire Line
	5650 9950 5750 9850
Entry Wire Line
	5650 10050 5750 9950
Entry Wire Line
	5650 10150 5750 10050
Entry Wire Line
	5650 10250 5750 10150
Entry Wire Line
	5650 10350 5750 10250
Entry Wire Line
	5650 10450 5750 10350
Entry Wire Line
	5650 10550 5750 10450
Entry Wire Line
	5650 10650 5750 10550
Entry Wire Line
	5650 10750 5750 10650
Entry Wire Line
	5650 10850 5750 10750
Entry Wire Line
	5650 10950 5750 10850
Entry Wire Line
	5650 11050 5750 10950
Entry Wire Line
	7050 9850 7150 9950
Entry Wire Line
	7050 9950 7150 10050
Entry Wire Line
	7050 10050 7150 10150
Entry Wire Line
	7050 10150 7150 10250
Entry Wire Line
	7050 10250 7150 10350
Entry Wire Line
	7050 10350 7150 10450
Entry Wire Line
	7050 10450 7150 10550
Entry Wire Line
	7050 10550 7150 10650
Entry Wire Line
	7050 10650 7150 10750
Text Label 5750 9850 0    60   ~ 0
VC
Text Label 5750 9950 0    60   ~ 0
VM4
Text Label 5750 10050 0    60   ~ 0
VB0
Text Label 5750 10150 0    60   ~ 0
VB1
Text Label 5750 10250 0    60   ~ 0
VA16
Text Label 5750 10350 0    60   ~ 0
VA17
Text Label 5750 10450 0    60   ~ 0
VA18
Text Label 5750 10550 0    60   ~ 0
VA19
Text Label 5750 10650 0    60   ~ 0
MW
Text Label 5750 10750 0    60   ~ 0
MR
Text Label 5750 10850 0    60   ~ 0
MCP
Text Label 5750 10950 0    60   ~ 0
WS
Text Label 6900 9850 0    60   ~ 0
S16
Text Label 6900 9950 0    60   ~ 0
S17
Text Label 6900 10050 0    60   ~ 0
CE0
Text Label 6900 10150 0    60   ~ 0
CE1
Text Label 6950 10250 0    60   ~ 0
SL
Text Label 6950 10350 0    60   ~ 0
SU
Text Label 6950 10450 0    60   ~ 0
WE
Text Label 6950 10550 0    60   ~ 0
OE
Text Label 6950 10650 0    60   ~ 0
B0
Entry Wire Line
	7050 10750 7150 10850
Text Label 6950 10750 0    60   ~ 0
B1
$Comp
L Conn_02x12_Odd_Even J4
U 1 1 5AFEFDEE
P 8000 6650
F 0 "J4" H 8050 7250 50  0000 C CNN
F 1 "MEM1" H 8050 5950 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x12_Pitch2.54mm" H 8000 6650 50  0001 C CNN
F 3 "" H 8000 6650 50  0001 C CNN
	1    8000 6650
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x12_Odd_Even J5
U 1 1 5AFEFF45
P 8000 8050
F 0 "J5" H 8050 8650 50  0000 C CNN
F 1 "MEM2" H 8050 7350 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x12_Pitch2.54mm" H 8000 8050 50  0001 C CNN
F 3 "" H 8000 8050 50  0001 C CNN
	1    8000 8050
	1    0    0    -1  
$EndComp
Entry Wire Line
	7150 8750 7250 8650
Text Label 7250 8650 0    60   ~ 0
MD7
Entry Wire Line
	7150 8650 7250 8550
Text Label 7250 8550 0    60   ~ 0
MD6
Entry Wire Line
	7150 8550 7250 8450
Text Label 7250 8450 0    60   ~ 0
MD5
Entry Wire Line
	7150 8450 7250 8350
Text Label 7250 8350 0    60   ~ 0
MD4
Entry Wire Line
	7150 8350 7250 8250
Text Label 7250 8250 0    60   ~ 0
MD3
Entry Wire Line
	7150 8250 7250 8150
Text Label 7250 8150 0    60   ~ 0
MD2
Entry Wire Line
	7150 8150 7250 8050
Text Label 7250 8050 0    60   ~ 0
MD1
Entry Wire Line
	7150 8050 7250 7950
Text Label 7250 7950 0    60   ~ 0
MD0
Entry Wire Line
	7150 7250 7250 7150
Text Label 7250 7150 0    60   ~ 0
MA19
Entry Wire Line
	7150 7150 7250 7050
Text Label 7250 7050 0    60   ~ 0
S16
Entry Wire Line
	7150 7050 7250 6950
Text Label 7250 6950 0    60   ~ 0
MA14
Entry Wire Line
	7150 6950 7250 6850
Text Label 7250 6850 0    60   ~ 0
MA12
Entry Wire Line
	7150 6850 7250 6750
Text Label 7250 6750 0    60   ~ 0
MA10
Entry Wire Line
	7150 6750 7250 6650
Text Label 7250 6650 0    60   ~ 0
MA8
Entry Wire Line
	7150 6650 7250 6550
Text Label 7250 6550 0    60   ~ 0
MA6
Entry Wire Line
	7150 6550 7250 6450
Text Label 7250 6450 0    60   ~ 0
MA4
Entry Wire Line
	7150 6450 7250 6350
Text Label 7250 6350 0    60   ~ 0
MA2
Entry Wire Line
	7150 6350 7250 6250
Text Label 7250 6250 0    60   ~ 0
MA0
Entry Wire Line
	8850 6250 8950 6350
Text Label 8700 6250 0    60   ~ 0
MA1
Entry Wire Line
	8850 6350 8950 6450
Text Label 8700 6350 0    60   ~ 0
MA3
Entry Wire Line
	8850 6450 8950 6550
Text Label 8700 6450 0    60   ~ 0
MA5
Entry Wire Line
	8850 6550 8950 6650
Text Label 8700 6550 0    60   ~ 0
MA7
Entry Wire Line
	8850 6650 8950 6750
Text Label 8700 6650 0    60   ~ 0
MA9
Entry Wire Line
	8850 6750 8950 6850
Text Label 8650 6750 0    60   ~ 0
MA11
Entry Wire Line
	8850 6850 8950 6950
Text Label 8650 6850 0    60   ~ 0
MA13
Entry Wire Line
	8850 6950 8950 7050
Text Label 8650 6950 0    60   ~ 0
MA15
Entry Wire Line
	8850 7050 8950 7150
Text Label 8700 7050 0    60   ~ 0
S17
Entry Wire Line
	8850 7950 8950 8050
Text Label 8675 7950 0    60   ~ 0
MD8
Entry Wire Line
	8850 8050 8950 8150
Text Label 8675 8050 0    60   ~ 0
MD9
Entry Wire Line
	8850 8150 8950 8250
Text Label 8625 8150 0    60   ~ 0
MD10
Entry Wire Line
	8850 8250 8950 8350
Text Label 8625 8250 0    60   ~ 0
MD11
Entry Wire Line
	8850 8350 8950 8450
Text Label 8625 8350 0    60   ~ 0
MD12
Entry Wire Line
	8850 8450 8950 8550
Text Label 8625 8450 0    60   ~ 0
MD13
$Comp
L VCC #PWR028
U 1 1 5AFF94F3
P 8300 6150
F 0 "#PWR028" H 8300 6000 50  0001 C CNN
F 1 "VCC" V 8300 6325 50  0000 C CNN
F 2 "" H 8300 6150 50  0001 C CNN
F 3 "" H 8300 6150 50  0001 C CNN
	1    8300 6150
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR029
U 1 1 5AFF9BE6
P 7800 7250
F 0 "#PWR029" H 7800 7100 50  0001 C CNN
F 1 "VCC" V 7800 7425 50  0000 C CNN
F 2 "" H 7800 7250 50  0001 C CNN
F 3 "" H 7800 7250 50  0001 C CNN
	1    7800 7250
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR030
U 1 1 5AFFA504
P 7800 6150
F 0 "#PWR030" H 7800 5900 50  0001 C CNN
F 1 "GND" V 7800 5975 50  0000 C CNN
F 2 "" H 7800 6150 50  0001 C CNN
F 3 "" H 7800 6150 50  0001 C CNN
	1    7800 6150
	0    1    1    0   
$EndComp
$Comp
L GND #PWR031
U 1 1 5AFFAFB9
P 8300 7250
F 0 "#PWR031" H 8300 7000 50  0001 C CNN
F 1 "GND" V 8300 7075 50  0000 C CNN
F 2 "" H 8300 7250 50  0001 C CNN
F 3 "" H 8300 7250 50  0001 C CNN
	1    8300 7250
	0    -1   -1   0   
$EndComp
$Comp
L VCC #PWR032
U 1 1 5B00A3CC
P 8300 7550
F 0 "#PWR032" H 8300 7400 50  0001 C CNN
F 1 "VCC" V 8300 7725 50  0000 C CNN
F 2 "" H 8300 7550 50  0001 C CNN
F 3 "" H 8300 7550 50  0001 C CNN
	1    8300 7550
	0    1    1    0   
$EndComp
$Comp
L GND #PWR033
U 1 1 5B00A56F
P 7800 7550
F 0 "#PWR033" H 7800 7300 50  0001 C CNN
F 1 "GND" V 7800 7375 50  0000 C CNN
F 2 "" H 7800 7550 50  0001 C CNN
F 3 "" H 7800 7550 50  0001 C CNN
	1    7800 7550
	0    1    1    0   
$EndComp
Entry Wire Line
	8850 8550 8950 8650
Text Label 8625 8550 0    60   ~ 0
MD14
Entry Wire Line
	8850 8650 8950 8750
Text Label 8625 8650 0    60   ~ 0
MD15
Entry Wire Line
	8850 7650 8950 7750
Text Label 8750 7650 0    60   ~ 0
WE
Entry Wire Line
	8850 7750 8950 7850
Text Label 8750 7750 0    60   ~ 0
SL
Entry Wire Line
	8850 7850 8950 7950
Text Label 8700 7850 0    60   ~ 0
CE1
Entry Wire Line
	7150 7950 7250 7850
Text Label 7250 7850 0    60   ~ 0
CE0
Entry Wire Line
	7150 7850 7250 7750
Text Label 7250 7750 0    60   ~ 0
SU
Entry Wire Line
	7150 7750 7250 7650
Text Label 7250 7650 0    60   ~ 0
OE
$Comp
L C_Small C17
U 1 1 5B037798
P 7900 2750
F 0 "C17" H 7910 2820 50  0000 L CNN
F 1 "0.1u" H 7910 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7900 2750 50  0001 C CNN
F 3 "" H 7900 2750 50  0001 C CNN
	1    7900 2750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C16
U 1 1 5B03779E
P 7700 2750
F 0 "C16" H 7710 2820 50  0000 L CNN
F 1 "0.1u" H 7710 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7700 2750 50  0001 C CNN
F 3 "" H 7700 2750 50  0001 C CNN
	1    7700 2750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C15
U 1 1 5B0377A4
P 7500 2750
F 0 "C15" H 7510 2820 50  0000 L CNN
F 1 "0.1u" H 7510 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7500 2750 50  0001 C CNN
F 3 "" H 7500 2750 50  0001 C CNN
	1    7500 2750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C14
U 1 1 5B0377AA
P 7300 2750
F 0 "C14" H 7310 2820 50  0000 L CNN
F 1 "0.1u" H 7310 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7300 2750 50  0001 C CNN
F 3 "" H 7300 2750 50  0001 C CNN
	1    7300 2750
	1    0    0    -1  
$EndComp
$Comp
L C_Small C13
U 1 1 5B0377B0
P 8700 1950
F 0 "C13" H 8710 2020 50  0000 L CNN
F 1 "0.1u" H 8710 1870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8700 1950 50  0001 C CNN
F 3 "" H 8700 1950 50  0001 C CNN
	1    8700 1950
	1    0    0    -1  
$EndComp
$Comp
L C_Small C12
U 1 1 5B0377B6
P 8500 1950
F 0 "C12" H 8510 2020 50  0000 L CNN
F 1 "0.1u" H 8510 1870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8500 1950 50  0001 C CNN
F 3 "" H 8500 1950 50  0001 C CNN
	1    8500 1950
	1    0    0    -1  
$EndComp
$Comp
L C_Small C11
U 1 1 5B0377BC
P 8300 1950
F 0 "C11" H 8310 2020 50  0000 L CNN
F 1 "0.1u" H 8310 1870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8300 1950 50  0001 C CNN
F 3 "" H 8300 1950 50  0001 C CNN
	1    8300 1950
	1    0    0    -1  
$EndComp
$Comp
L C_Small C10
U 1 1 5B0377C2
P 8100 1950
F 0 "C10" H 8110 2020 50  0000 L CNN
F 1 "0.1u" H 8110 1870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8100 1950 50  0001 C CNN
F 3 "" H 8100 1950 50  0001 C CNN
	1    8100 1950
	1    0    0    -1  
$EndComp
$Comp
L C_Small C9
U 1 1 5B0377C8
P 7900 1950
F 0 "C9" H 7910 2020 50  0000 L CNN
F 1 "0.1u" H 7910 1870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7900 1950 50  0001 C CNN
F 3 "" H 7900 1950 50  0001 C CNN
	1    7900 1950
	1    0    0    -1  
$EndComp
$Comp
L C_Small C8
U 1 1 5B0377CE
P 7700 1950
F 0 "C8" H 7710 2020 50  0000 L CNN
F 1 "0.1u" H 7710 1870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7700 1950 50  0001 C CNN
F 3 "" H 7700 1950 50  0001 C CNN
	1    7700 1950
	1    0    0    -1  
$EndComp
$Comp
L C_Small C7
U 1 1 5B0377D4
P 7500 1950
F 0 "C7" H 7510 2020 50  0000 L CNN
F 1 "0.1u" H 7510 1870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7500 1950 50  0001 C CNN
F 3 "" H 7500 1950 50  0001 C CNN
	1    7500 1950
	1    0    0    -1  
$EndComp
$Comp
L C_Small C6
U 1 1 5B0377DA
P 7300 1950
F 0 "C6" H 7310 2020 50  0000 L CNN
F 1 "0.1u" H 7310 1870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7300 1950 50  0001 C CNN
F 3 "" H 7300 1950 50  0001 C CNN
	1    7300 1950
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR034
U 1 1 5B0377E0
P 7300 1750
F 0 "#PWR034" H 7300 1600 50  0001 C CNN
F 1 "VCC" H 7300 1900 50  0000 C CNN
F 2 "" H 7300 1750 50  0001 C CNN
F 3 "" H 7300 1750 50  0001 C CNN
	1    7300 1750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR035
U 1 1 5B0377E6
P 7300 2150
F 0 "#PWR035" H 7300 1900 50  0001 C CNN
F 1 "GND" H 7300 2000 50  0000 C CNN
F 2 "" H 7300 2150 50  0001 C CNN
F 3 "" H 7300 2150 50  0001 C CNN
	1    7300 2150
	1    0    0    -1  
$EndComp
$Comp
L C_Small C18
U 1 1 5B0377FE
P 8100 2750
F 0 "C18" H 8110 2820 50  0000 L CNN
F 1 "0.1u" H 8110 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8100 2750 50  0001 C CNN
F 3 "" H 8100 2750 50  0001 C CNN
	1    8100 2750
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR036
U 1 1 5B037CF5
P 7650 950
F 0 "#PWR036" H 7650 800 50  0001 C CNN
F 1 "VCC" H 7650 1100 50  0000 C CNN
F 2 "" H 7650 950 50  0001 C CNN
F 3 "" H 7650 950 50  0001 C CNN
	1    7650 950 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR037
U 1 1 5B037CFB
P 7650 1350
F 0 "#PWR037" H 7650 1100 50  0001 C CNN
F 1 "GND" H 7650 1200 50  0000 C CNN
F 2 "" H 7650 1350 50  0001 C CNN
F 3 "" H 7650 1350 50  0001 C CNN
	1    7650 1350
	1    0    0    -1  
$EndComp
NoConn ~ 1900 3950
NoConn ~ 1900 4050
NoConn ~ 1900 4250
NoConn ~ 1050 1150
NoConn ~ 1900 7250
NoConn ~ 1900 7150
NoConn ~ 1900 7450
NoConn ~ 4400 8150
NoConn ~ 4400 8550
NoConn ~ 5300 8150
$Comp
L VCC #PWR038
U 1 1 5B080DD3
P 5725 3200
F 0 "#PWR038" H 5725 3050 50  0001 C CNN
F 1 "VCC" V 5675 3250 50  0000 C CNN
F 2 "" H 5725 3200 50  0001 C CNN
F 3 "" H 5725 3200 50  0001 C CNN
	1    5725 3200
	0    1    1    0   
$EndComp
NoConn ~ 6100 3200
NoConn ~ 6700 3400
NoConn ~ 6700 2800
NoConn ~ 6700 2600
$Comp
L GND #PWR039
U 1 1 5AF6B4E3
P 6350 1250
F 0 "#PWR039" H 6350 1000 50  0001 C CNN
F 1 "GND" H 6375 1100 50  0000 C CNN
F 2 "" H 6350 1250 50  0001 C CNN
F 3 "" H 6350 1250 50  0001 C CNN
	1    6350 1250
	1    0    0    -1  
$EndComp
Entry Wire Line
	5650 1700 5750 1600
Text Label 5750 1600 0    60   ~ 0
IG
Entry Wire Line
	5650 1600 5750 1500
Text Label 5750 1500 0    60   ~ 0
G
Entry Wire Line
	7050 1200 7150 1300
Text Label 6950 1200 0    60   ~ 0
VG
$Comp
L GND #PWR040
U 1 1 5AF6BADD
P 6350 1800
F 0 "#PWR040" H 6350 1550 50  0001 C CNN
F 1 "GND" H 6375 1650 50  0000 C CNN
F 2 "" H 6350 1800 50  0001 C CNN
F 3 "" H 6350 1800 50  0001 C CNN
	1    6350 1800
	1    0    0    -1  
$EndComp
Entry Wire Line
	5650 2250 5750 2150
Text Label 5750 2150 0    60   ~ 0
IB
Entry Wire Line
	5650 2150 5750 2050
Text Label 5750 2050 0    60   ~ 0
B
Entry Wire Line
	7050 1750 7150 1850
Text Label 6950 1750 0    60   ~ 0
VB
Entry Wire Line
	8850 7150 8950 7250
Text Label 8725 7150 0    60   ~ 0
WS
$Comp
L R_Small R8
U 1 1 5AFAAF2D
P 6750 650
F 0 "R8" V 6675 625 50  0000 C CNN
F 1 "470" V 6750 650 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" H 6750 650 50  0001 C CNN
F 3 "" H 6750 650 50  0001 C CNN
	1    6750 650 
	0    1    1    0   
$EndComp
$Comp
L R_Small R9
U 1 1 5AFAB0F5
P 6450 1200
F 0 "R9" V 6375 1175 50  0000 C CNN
F 1 "470" V 6450 1200 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" H 6450 1200 50  0001 C CNN
F 3 "" H 6450 1200 50  0001 C CNN
	1    6450 1200
	0    1    1    0   
$EndComp
$Comp
L R_Small R10
U 1 1 5AFAB0FB
P 6750 1200
F 0 "R10" V 6675 1175 50  0000 C CNN
F 1 "470" V 6750 1200 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" H 6750 1200 50  0001 C CNN
F 3 "" H 6750 1200 50  0001 C CNN
	1    6750 1200
	0    1    1    0   
$EndComp
$Comp
L R_Small R11
U 1 1 5AFAB21B
P 6450 1750
F 0 "R11" V 6375 1725 50  0000 C CNN
F 1 "470" V 6450 1750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" H 6450 1750 50  0001 C CNN
F 3 "" H 6450 1750 50  0001 C CNN
	1    6450 1750
	0    1    1    0   
$EndComp
$Comp
L R_Small R12
U 1 1 5AFAB221
P 6750 1750
F 0 "R12" V 6675 1725 50  0000 C CNN
F 1 "470" V 6750 1750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" H 6750 1750 50  0001 C CNN
F 3 "" H 6750 1750 50  0001 C CNN
	1    6750 1750
	0    1    1    0   
$EndComp
$Comp
L R_Small R16
U 1 1 5AFAB4FA
P 6900 800
F 0 "R16" H 6775 775 50  0000 C CNN
F 1 "510" V 6900 800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" H 6900 800 50  0001 C CNN
F 3 "" H 6900 800 50  0001 C CNN
	1    6900 800 
	-1   0    0    1   
$EndComp
$Comp
L R_Small R17
U 1 1 5AFAB701
P 6900 1350
F 0 "R17" H 6775 1325 50  0000 C CNN
F 1 "510" V 6900 1350 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" H 6900 1350 50  0001 C CNN
F 3 "" H 6900 1350 50  0001 C CNN
	1    6900 1350
	-1   0    0    1   
$EndComp
$Comp
L R_Small R18
U 1 1 5AFAB893
P 6900 1900
F 0 "R18" H 6775 1875 50  0000 C CNN
F 1 "510" V 6900 1900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" H 6900 1900 50  0001 C CNN
F 3 "" H 6900 1900 50  0001 C CNN
	1    6900 1900
	-1   0    0    1   
$EndComp
$Comp
L R_Small R14
U 1 1 5AFABA32
P 6600 1350
F 0 "R14" H 6475 1325 50  0000 C CNN
F 1 "1k" V 6600 1350 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" H 6600 1350 50  0001 C CNN
F 3 "" H 6600 1350 50  0001 C CNN
	1    6600 1350
	-1   0    0    1   
$EndComp
$Comp
L R_Small R15
U 1 1 5AFABBD2
P 6600 1900
F 0 "R15" H 6475 1875 50  0000 C CNN
F 1 "1k" V 6600 1900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" H 6600 1900 50  0001 C CNN
F 3 "" H 6600 1900 50  0001 C CNN
	1    6600 1900
	-1   0    0    1   
$EndComp
Entry Wire Line
	3900 8350 4000 8450
Entry Wire Line
	8950 4250 9050 4150
$Comp
L Jumper_NC_Small JP1
U 1 1 5B0106CB
P 3025 10850
F 0 "JP1" H 3025 10930 50  0000 C CNN
F 1 "4:3" H 3035 10790 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x02_Pitch2.54mm" H 3025 10850 50  0001 C CNN
F 3 "" H 3025 10850 50  0001 C CNN
	1    3025 10850
	1    0    0    -1  
$EndComp
$Comp
L R_Small R3
U 1 1 5B011BC6
P 2850 11050
F 0 "R3" V 2775 11025 50  0000 L CNN
F 1 "1k" V 2850 11000 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 2850 11050 50  0001 C CNN
F 3 "" H 2850 11050 50  0001 C CNN
	1    2850 11050
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR041
U 1 1 5B011BCC
P 2950 11050
F 0 "#PWR041" H 2950 10900 50  0001 C CNN
F 1 "VCC" V 2950 11225 50  0000 C CNN
F 2 "" H 2950 11050 50  0001 C CNN
F 3 "" H 2950 11050 50  0001 C CNN
	1    2950 11050
	0    1    1    0   
$EndComp
$Comp
L GND #PWR042
U 1 1 5B011CC0
P 3200 10850
F 0 "#PWR042" H 3200 10600 50  0001 C CNN
F 1 "GND" H 3325 10800 50  0000 C CNN
F 2 "" H 3200 10850 50  0001 C CNN
F 3 "" H 3200 10850 50  0001 C CNN
	1    3200 10850
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x08_Odd_Even JP2
U 1 1 5AF905CB
P 6350 9150
F 0 "JP2" H 6400 9550 50  0000 C CNN
F 1 "GDS" H 6400 8650 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x08_Pitch2.54mm" H 6350 9150 50  0001 C CNN
F 3 "" H 6350 9150 50  0001 C CNN
	1    6350 9150
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x03 J6
U 1 1 5AF6EB0D
P 5375 3300
F 0 "J6" H 5375 3500 50  0000 C CNN
F 1 "VGAP" H 5375 3100 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_1x03_Pitch2.54mm" H 5375 3300 50  0001 C CNN
F 3 "" H 5375 3300 50  0001 C CNN
	1    5375 3300
	-1   0    0    -1  
$EndComp
$Comp
L 28C512 DD18
U 1 1 5AF7563F
P 4800 9950
F 0 "DD18" H 5000 10950 50  0000 C CNN
F 1 "28C512" H 4950 8950 50  0000 C CNN
F 2 "Housings_DIP:DIP-28_W15.24mm_Socket_LongPads" H 4800 9950 50  0001 C CNN
F 3 "" H 4800 9950 50  0001 C CNN
	1    4800 9950
	1    0    0    -1  
$EndComp
Entry Wire Line
	4000 10650 4100 10550
Text Label 4100 10550 0    60   ~ 0
PGD
Wire Wire Line
	950  2550 1000 2550
Wire Wire Line
	950  1600 950  4350
Wire Wire Line
	950  2350 1000 2350
Wire Wire Line
	950  2250 1000 2250
Connection ~ 950  2350
Wire Wire Line
	1000 2050 950  2050
Connection ~ 950  2250
Wire Wire Line
	950  1950 1000 1950
Connection ~ 950  2050
Wire Wire Line
	1000 1850 950  1850
Connection ~ 950  1950
Wire Wire Line
	1000 1750 950  1750
Connection ~ 950  1850
Wire Wire Line
	1200 1600 1250 1600
Wire Wire Line
	1000 1600 950  1600
Connection ~ 950  1750
Wire Wire Line
	1900 1750 2150 1750
Wire Wire Line
	1900 1850 2150 1850
Wire Wire Line
	1900 1950 2150 1950
Wire Wire Line
	1900 2050 2150 2050
Wire Wire Line
	950  3250 1000 3250
Wire Wire Line
	1000 3050 950  3050
Connection ~ 950  3250
Wire Wire Line
	950  2950 1000 2950
Connection ~ 950  3050
Wire Wire Line
	1000 2850 950  2850
Connection ~ 950  2950
Wire Wire Line
	1000 2750 950  2750
Connection ~ 950  2850
Connection ~ 950  2750
Wire Wire Line
	1900 2750 2150 2750
Wire Wire Line
	1900 2850 2150 2850
Wire Wire Line
	1900 2950 2150 2950
Wire Wire Line
	1900 3050 2150 3050
Connection ~ 950  2550
Wire Wire Line
	1000 3450 650  3450
Wire Wire Line
	650  3150 1000 3150
Wire Wire Line
	650  2450 1000 2450
Wire Wire Line
	650  2150 1000 2150
Wire Wire Line
	950  3350 1000 3350
Wire Wire Line
	1000 3550 650  3550
Wire Wire Line
	1900 2250 2150 2250
Wire Wire Line
	1900 3250 2150 3250
Wire Wire Line
	950  4250 1000 4250
Wire Wire Line
	1000 4050 950  4050
Connection ~ 950  4250
Wire Wire Line
	950  3950 1000 3950
Connection ~ 950  4050
Wire Wire Line
	1000 3850 950  3850
Connection ~ 950  3950
Wire Wire Line
	1000 3750 950  3750
Connection ~ 950  3850
Connection ~ 950  3750
Wire Wire Line
	1900 3750 2150 3750
Wire Wire Line
	1900 3850 2150 3850
Wire Wire Line
	1000 4450 650  4450
Wire Wire Line
	650  4150 1000 4150
Wire Wire Line
	950  4350 1000 4350
Wire Wire Line
	1000 4550 650  4550
Connection ~ 950  3350
Wire Bus Line
	2250 750  2250 11150
Wire Wire Line
	7300 3650 7300 3750
Wire Wire Line
	7300 3350 7300 3450
Wire Wire Line
	7300 3400 8700 3400
Wire Wire Line
	7300 2600 8700 2600
Connection ~ 7300 3400
Wire Wire Line
	7300 3700 8700 3700
Wire Wire Line
	7300 2900 8700 2900
Connection ~ 7300 3700
Wire Wire Line
	7500 3450 7500 3400
Connection ~ 7500 3400
Wire Wire Line
	7700 3400 7700 3450
Connection ~ 7700 3400
Wire Wire Line
	7900 3400 7900 3450
Connection ~ 7900 3400
Wire Wire Line
	8100 3450 8100 3400
Connection ~ 8100 3400
Wire Wire Line
	8300 3450 8300 3400
Connection ~ 8300 3400
Wire Wire Line
	8500 3450 8500 3400
Connection ~ 8500 3400
Wire Wire Line
	8700 3400 8700 3450
Wire Wire Line
	7300 4150 7300 4250
Connection ~ 7300 4200
Wire Wire Line
	8300 2650 8300 2600
Connection ~ 8300 2600
Wire Wire Line
	8500 2650 8500 2600
Connection ~ 8500 2600
Wire Wire Line
	8700 2600 8700 2650
Wire Wire Line
	8700 2900 8700 2850
Wire Wire Line
	8500 2850 8500 2900
Connection ~ 8500 2900
Wire Wire Line
	8300 2850 8300 2900
Connection ~ 8300 2900
Wire Wire Line
	7300 4450 7300 4550
Connection ~ 7300 4500
Wire Wire Line
	8700 3700 8700 3650
Wire Wire Line
	8500 3650 8500 3700
Connection ~ 8500 3700
Wire Wire Line
	8300 3650 8300 3700
Connection ~ 8300 3700
Wire Wire Line
	8100 3650 8100 3700
Connection ~ 8100 3700
Wire Wire Line
	7900 3650 7900 3700
Connection ~ 7900 3700
Wire Wire Line
	7700 3650 7700 3700
Connection ~ 7700 3700
Wire Wire Line
	7500 3650 7500 3700
Connection ~ 7500 3700
Wire Bus Line
	550  2250 550  11150
Wire Wire Line
	950  5750 1000 5750
Wire Wire Line
	950  4800 950  7550
Wire Wire Line
	950  5550 1000 5550
Wire Wire Line
	950  5450 1000 5450
Connection ~ 950  5550
Wire Wire Line
	1000 5250 950  5250
Connection ~ 950  5450
Wire Wire Line
	950  5150 1000 5150
Connection ~ 950  5250
Wire Wire Line
	1000 5050 950  5050
Connection ~ 950  5150
Wire Wire Line
	1000 4950 950  4950
Connection ~ 950  5050
Wire Wire Line
	1200 4800 1250 4800
Wire Wire Line
	1000 4800 950  4800
Connection ~ 950  4950
Wire Wire Line
	1900 4950 2150 4950
Wire Wire Line
	1900 5050 2150 5050
Wire Wire Line
	1900 5150 2150 5150
Wire Wire Line
	1900 5250 2150 5250
Wire Wire Line
	950  6450 1000 6450
Wire Wire Line
	1000 6250 950  6250
Connection ~ 950  6450
Wire Wire Line
	950  6150 1000 6150
Connection ~ 950  6250
Wire Wire Line
	1000 6050 950  6050
Connection ~ 950  6150
Wire Wire Line
	1000 5950 950  5950
Connection ~ 950  6050
Connection ~ 950  5950
Wire Wire Line
	1900 5950 2150 5950
Wire Wire Line
	1900 6050 2150 6050
Wire Wire Line
	1900 6150 2150 6150
Wire Wire Line
	1900 6250 2150 6250
Connection ~ 950  5750
Wire Wire Line
	1000 6650 650  6650
Wire Wire Line
	650  6350 1000 6350
Wire Wire Line
	650  5650 1000 5650
Wire Wire Line
	650  5350 1000 5350
Wire Wire Line
	950  6550 1000 6550
Wire Wire Line
	1000 6750 650  6750
Wire Wire Line
	1900 5450 2150 5450
Wire Wire Line
	1900 6450 2150 6450
Wire Wire Line
	950  7450 1000 7450
Wire Wire Line
	1000 7250 950  7250
Connection ~ 950  7450
Wire Wire Line
	950  7150 1000 7150
Connection ~ 950  7250
Wire Wire Line
	1000 7050 950  7050
Connection ~ 950  7150
Wire Wire Line
	1000 6950 950  6950
Connection ~ 950  7050
Connection ~ 950  6950
Wire Wire Line
	1900 6950 2150 6950
Wire Wire Line
	1900 7050 2150 7050
Wire Wire Line
	1000 7650 650  7650
Wire Wire Line
	650  7350 1000 7350
Wire Wire Line
	950  7550 1000 7550
Wire Wire Line
	1000 7750 650  7750
Connection ~ 950  6550
Wire Wire Line
	6000 2500 6000 3800
Wire Wire Line
	6000 3750 6050 3750
Connection ~ 6000 3750
Wire Wire Line
	6250 3750 6400 3750
Wire Wire Line
	6400 3750 6400 3700
Connection ~ 6000 2700
Connection ~ 6000 2900
Connection ~ 6000 3300
Connection ~ 6000 3400
Wire Wire Line
	4100 1550 4350 1550
Wire Wire Line
	4100 1350 4350 1350
Wire Wire Line
	4100 1250 4350 1250
Wire Wire Line
	4100 1150 4350 1150
Wire Wire Line
	4100 1050 4350 1050
Wire Wire Line
	4100 950  4350 950 
Wire Wire Line
	4100 850  4350 850 
Wire Wire Line
	4100 750  4350 750 
Wire Wire Line
	4100 650  4350 650 
Wire Wire Line
	4100 1850 4350 1850
Wire Wire Line
	4250 1650 4350 1650
Wire Wire Line
	4300 1750 4350 1750
Wire Wire Line
	4250 1450 4250 1900
Wire Wire Line
	4300 2000 4300 1750
Wire Wire Line
	5350 1350 5550 1350
Wire Wire Line
	4100 3000 4350 3000
Wire Wire Line
	4100 2800 4350 2800
Wire Wire Line
	4100 2700 4350 2700
Wire Wire Line
	4100 2600 4350 2600
Wire Wire Line
	4100 2500 4350 2500
Wire Wire Line
	4100 2400 4350 2400
Wire Wire Line
	4100 2300 4350 2300
Wire Wire Line
	4100 2200 4350 2200
Wire Wire Line
	4100 2100 4350 2100
Wire Wire Line
	4100 3300 4350 3300
Wire Wire Line
	5350 2800 5550 2800
Wire Wire Line
	4100 3200 4350 3200
Wire Wire Line
	4300 3100 4350 3100
Wire Wire Line
	4100 4400 4350 4400
Wire Wire Line
	4100 4200 4350 4200
Wire Wire Line
	4100 4100 4350 4100
Wire Wire Line
	4100 4000 4350 4000
Wire Wire Line
	4100 3900 4350 3900
Wire Wire Line
	4100 3800 4350 3800
Wire Wire Line
	4100 3700 4350 3700
Wire Wire Line
	4100 3600 4350 3600
Wire Wire Line
	4100 3500 4350 3500
Wire Wire Line
	4100 4700 4350 4700
Wire Wire Line
	4250 4500 4350 4500
Wire Wire Line
	4300 4600 4350 4600
Wire Wire Line
	4250 4300 4250 4750
Wire Wire Line
	4300 4850 4300 4600
Wire Wire Line
	5350 4200 5550 4200
Wire Wire Line
	4100 5850 4350 5850
Wire Wire Line
	4100 5650 4350 5650
Wire Wire Line
	4100 5550 4350 5550
Wire Wire Line
	4100 5450 4350 5450
Wire Wire Line
	4100 5350 4350 5350
Wire Wire Line
	4100 5250 4350 5250
Wire Wire Line
	4100 5150 4350 5150
Wire Wire Line
	4100 5050 4350 5050
Wire Wire Line
	4100 4950 4350 4950
Wire Wire Line
	4100 6150 4350 6150
Wire Wire Line
	4250 5950 4350 5950
Wire Wire Line
	4300 6050 4350 6050
Wire Wire Line
	4250 5750 4250 6200
Wire Wire Line
	4300 6300 4300 6050
Wire Wire Line
	5350 5650 5550 5650
Wire Wire Line
	2350 2850 2600 2850
Wire Wire Line
	2600 2950 2350 2950
Wire Wire Line
	2350 3050 2600 3050
Wire Wire Line
	2600 3150 2350 3150
Wire Wire Line
	2350 3250 2600 3250
Wire Wire Line
	2600 3350 2350 3350
Wire Wire Line
	2350 3450 2600 3450
Wire Wire Line
	2350 3550 2600 3550
Wire Wire Line
	2350 3650 2600 3650
Wire Wire Line
	2600 3750 2350 3750
Wire Wire Line
	3600 3550 3900 3550
Wire Wire Line
	3600 3450 3900 3450
Wire Wire Line
	3600 3350 3900 3350
Wire Wire Line
	3600 3250 3900 3250
Wire Wire Line
	3600 3150 3900 3150
Wire Wire Line
	3600 3050 3900 3050
Wire Wire Line
	3600 2950 3900 2950
Wire Wire Line
	3600 2850 3900 2850
Wire Wire Line
	5750 1050 6900 1050
Wire Wire Line
	5750 950  6600 950 
Wire Wire Line
	6350 650  6350 700 
Wire Wire Line
	6550 650  6650 650 
Wire Wire Line
	6600 700  6600 650 
Connection ~ 6600 650 
Wire Wire Line
	6900 700  6900 650 
Connection ~ 6900 650 
Wire Wire Line
	6850 650  7050 650 
Wire Wire Line
	4300 2900 4300 3325
Wire Wire Line
	5400 9750 5550 9750
Wire Wire Line
	5550 9650 5400 9650
Wire Wire Line
	5400 9550 5550 9550
Wire Wire Line
	5400 9450 5550 9450
Wire Wire Line
	5550 9350 5400 9350
Wire Wire Line
	5400 9250 5550 9250
Wire Wire Line
	5400 9150 5550 9150
Wire Wire Line
	5400 9050 5550 9050
Wire Wire Line
	4100 9050 4200 9050
Wire Wire Line
	4100 9150 4200 9150
Wire Wire Line
	4100 9250 4200 9250
Wire Wire Line
	4100 9350 4200 9350
Wire Wire Line
	4100 9450 4200 9450
Wire Wire Line
	4100 9550 4200 9550
Wire Wire Line
	4100 9650 4200 9650
Wire Wire Line
	4100 9750 4200 9750
Wire Wire Line
	4100 9850 4200 9850
Wire Wire Line
	4100 9950 4200 9950
Wire Wire Line
	4100 10050 4200 10050
Wire Wire Line
	4100 10150 4200 10150
Wire Wire Line
	4100 10250 4200 10250
Wire Wire Line
	4100 10350 4200 10350
Wire Wire Line
	4100 10450 4200 10450
Wire Wire Line
	4400 8750 4350 8750
Wire Wire Line
	650  8100 950  8100
Wire Wire Line
	950  8200 650  8200
Wire Wire Line
	650  8300 950  8300
Wire Wire Line
	950  8400 650  8400
Wire Wire Line
	650  8500 950  8500
Wire Wire Line
	950  8600 650  8600
Wire Wire Line
	650  8700 950  8700
Wire Wire Line
	950  8800 650  8800
Wire Wire Line
	650  8900 950  8900
Wire Wire Line
	650  9000 950  9000
Wire Wire Line
	950  9100 650  9100
Wire Wire Line
	650  8000 950  8000
Wire Wire Line
	1950 8000 2150 8000
Wire Wire Line
	2150 8100 1950 8100
Wire Wire Line
	1950 8200 2150 8200
Wire Wire Line
	2150 8300 1950 8300
Wire Wire Line
	1950 8400 2150 8400
Wire Wire Line
	1950 8500 2150 8500
Wire Wire Line
	2150 8600 1950 8600
Wire Wire Line
	1950 8700 2150 8700
Wire Wire Line
	650  9350 950  9350
Wire Wire Line
	950  9450 650  9450
Wire Wire Line
	650  9550 950  9550
Wire Wire Line
	950  9650 650  9650
Wire Wire Line
	650  9750 950  9750
Wire Wire Line
	950  9850 650  9850
Wire Wire Line
	650  9950 950  9950
Wire Wire Line
	950  10050 650  10050
Wire Wire Line
	650  10150 950  10150
Wire Wire Line
	650  10250 950  10250
Wire Wire Line
	950  10350 650  10350
Wire Wire Line
	650  10450 950  10450
Wire Wire Line
	1950 9350 2150 9350
Wire Wire Line
	2150 9450 1950 9450
Wire Wire Line
	1950 9550 2150 9550
Wire Wire Line
	2350 650  2600 650 
Wire Wire Line
	2350 750  2600 750 
Wire Wire Line
	2600 850  2350 850 
Wire Wire Line
	2350 950  2600 950 
Wire Wire Line
	2350 1050 2600 1050
Wire Wire Line
	2350 1150 2600 1150
Wire Wire Line
	2600 1250 2350 1250
Wire Wire Line
	2350 1350 2600 1350
Wire Wire Line
	2600 1450 2350 1450
Wire Wire Line
	2350 1550 2600 1550
Wire Wire Line
	3600 650  3900 650 
Wire Wire Line
	3900 750  3600 750 
Wire Wire Line
	3600 850  3900 850 
Wire Wire Line
	3900 950  3600 950 
Wire Wire Line
	3600 1050 3900 1050
Wire Wire Line
	3900 1150 3600 1150
Wire Wire Line
	3600 1250 3900 1250
Wire Wire Line
	3900 1350 3600 1350
Wire Wire Line
	2350 1750 2600 1750
Wire Wire Line
	2350 1850 2600 1850
Wire Wire Line
	2600 1950 2350 1950
Wire Wire Line
	2350 2050 2600 2050
Wire Wire Line
	2350 2150 2600 2150
Wire Wire Line
	2350 2250 2600 2250
Wire Wire Line
	2600 2350 2350 2350
Wire Wire Line
	2350 2450 2600 2450
Wire Wire Line
	2600 2550 2350 2550
Wire Wire Line
	2350 2650 2600 2650
Wire Wire Line
	3600 1750 3900 1750
Wire Wire Line
	3900 1850 3600 1850
Wire Wire Line
	3600 1950 3900 1950
Wire Wire Line
	3900 2050 3600 2050
Wire Wire Line
	3600 2150 3900 2150
Wire Wire Line
	3900 2250 3600 2250
Wire Wire Line
	3600 2350 3900 2350
Wire Wire Line
	3900 2450 3600 2450
Wire Wire Line
	3900 3950 3600 3950
Wire Wire Line
	3600 4050 3900 4050
Wire Wire Line
	3900 4150 3600 4150
Wire Wire Line
	3600 4250 3900 4250
Wire Wire Line
	3600 4350 3900 4350
Wire Wire Line
	3900 4450 3600 4450
Wire Wire Line
	3600 4550 3900 4550
Wire Wire Line
	3900 4650 3600 4650
Wire Wire Line
	2600 4850 2350 4850
Wire Wire Line
	2350 4750 2600 4750
Wire Wire Line
	2350 4650 2600 4650
Wire Wire Line
	2600 4550 2350 4550
Wire Wire Line
	2350 4450 2600 4450
Wire Wire Line
	2600 4350 2350 4350
Wire Wire Line
	2350 4250 2600 4250
Wire Wire Line
	2600 4150 2350 4150
Wire Wire Line
	2350 4050 2600 4050
Wire Wire Line
	2600 3950 2350 3950
Wire Bus Line
	4000 750  4000 11150
Wire Wire Line
	2350 9150 2600 9150
Wire Wire Line
	2600 9050 2350 9050
Wire Wire Line
	2350 8950 2600 8950
Wire Wire Line
	2600 8850 2350 8850
Wire Wire Line
	2350 8750 2600 8750
Wire Wire Line
	2600 8650 2350 8650
Wire Wire Line
	2350 8550 2600 8550
Wire Wire Line
	2600 8450 2350 8450
Wire Wire Line
	2350 8350 2600 8350
Wire Wire Line
	3600 8350 3900 8350
Wire Wire Line
	3900 8450 3600 8450
Wire Wire Line
	3600 8550 3900 8550
Wire Wire Line
	3900 8650 3600 8650
Wire Wire Line
	3600 8750 3900 8750
Wire Wire Line
	3900 8850 3600 8850
Wire Wire Line
	3600 8950 3900 8950
Wire Wire Line
	3900 9050 3600 9050
Wire Wire Line
	2350 8050 2600 8050
Wire Wire Line
	2600 7950 2350 7950
Wire Wire Line
	2350 7850 2600 7850
Wire Wire Line
	2600 7750 2350 7750
Wire Wire Line
	2350 7650 2600 7650
Wire Wire Line
	2600 7550 2350 7550
Wire Wire Line
	2350 7450 2600 7450
Wire Wire Line
	2600 7350 2350 7350
Wire Wire Line
	2350 7250 2600 7250
Wire Wire Line
	3600 7250 3900 7250
Wire Wire Line
	3900 7350 3600 7350
Wire Wire Line
	3600 7450 3900 7450
Wire Wire Line
	3900 7550 3600 7550
Wire Wire Line
	3600 7650 3900 7650
Wire Wire Line
	3900 7750 3600 7750
Wire Wire Line
	3600 7850 3900 7850
Wire Wire Line
	3900 7950 3600 7950
Wire Wire Line
	2350 6950 2600 6950
Wire Wire Line
	2600 6850 2350 6850
Wire Wire Line
	2350 6750 2600 6750
Wire Wire Line
	2600 6650 2350 6650
Wire Wire Line
	2350 6550 2600 6550
Wire Wire Line
	2600 6450 2350 6450
Wire Wire Line
	2350 6350 2600 6350
Wire Wire Line
	2600 6250 2350 6250
Wire Wire Line
	2350 6150 2600 6150
Wire Wire Line
	3600 6150 3900 6150
Wire Wire Line
	3900 6250 3600 6250
Wire Wire Line
	3600 6350 3900 6350
Wire Wire Line
	3900 6450 3600 6450
Wire Wire Line
	3600 6550 3900 6550
Wire Wire Line
	3900 6650 3600 6650
Wire Wire Line
	3600 6750 3900 6750
Wire Wire Line
	3900 6850 3600 6850
Wire Wire Line
	2350 5050 2600 5050
Wire Wire Line
	2600 5150 2350 5150
Wire Wire Line
	2350 5250 2600 5250
Wire Wire Line
	2600 5350 2350 5350
Wire Wire Line
	2350 5450 2600 5450
Wire Wire Line
	2600 5550 2350 5550
Wire Wire Line
	2350 5650 2600 5650
Wire Wire Line
	2600 5750 2350 5750
Wire Wire Line
	2350 5850 2600 5850
Wire Wire Line
	3600 5050 3900 5050
Wire Wire Line
	3900 5150 3600 5150
Wire Wire Line
	3600 5250 3900 5250
Wire Wire Line
	3900 5350 3600 5350
Wire Wire Line
	3600 5450 3900 5450
Wire Wire Line
	3900 5550 3600 5550
Wire Wire Line
	3600 5650 3900 5650
Wire Wire Line
	3900 5750 3600 5750
Wire Wire Line
	5350 6450 5550 6450
Wire Wire Line
	5550 6550 5350 6550
Wire Wire Line
	5350 6650 5550 6650
Wire Wire Line
	5550 6750 5350 6750
Wire Wire Line
	5350 6850 5550 6850
Wire Wire Line
	5550 6950 5350 6950
Wire Wire Line
	5350 7050 5550 7050
Wire Wire Line
	5550 7150 5350 7150
Wire Wire Line
	5350 7250 5550 7250
Wire Wire Line
	4100 7550 4350 7550
Wire Wire Line
	4350 7450 4100 7450
Wire Wire Line
	4100 7350 4350 7350
Wire Wire Line
	4350 7250 4100 7250
Wire Wire Line
	4100 7150 4350 7150
Wire Wire Line
	4100 7050 4350 7050
Wire Wire Line
	4350 6950 4100 6950
Wire Wire Line
	4100 6850 4350 6850
Wire Wire Line
	4350 6750 4100 6750
Wire Wire Line
	4100 6650 4350 6650
Wire Wire Line
	4100 6550 4350 6550
Wire Wire Line
	4350 6450 4100 6450
Wire Wire Line
	5350 7350 5550 7350
Wire Wire Line
	4100 7850 4400 7850
Wire Wire Line
	4400 7950 4100 7950
Wire Wire Line
	4100 8050 4400 8050
Wire Wire Line
	4100 8650 4400 8650
Wire Wire Line
	5300 7850 5550 7850
Wire Wire Line
	5550 7950 5300 7950
Wire Wire Line
	5300 8050 5550 8050
Wire Wire Line
	4350 8750 4350 8800
Wire Wire Line
	4100 8250 4400 8250
Wire Wire Line
	4400 8350 4100 8350
Wire Wire Line
	4100 8450 4400 8450
Wire Wire Line
	4150 10750 4200 10750
Wire Wire Line
	4150 10850 4200 10850
Connection ~ 4150 10850
Wire Bus Line
	5650 1050 5650 11150
Wire Wire Line
	7050 3000 6900 3000
Wire Wire Line
	6900 3200 7050 3200
Wire Wire Line
	5575 3400 6100 3400
Wire Wire Line
	6000 3300 6100 3300
Wire Wire Line
	6100 3000 5750 3000
Wire Wire Line
	6000 2900 6100 2900
Wire Wire Line
	6100 2800 5750 2800
Wire Wire Line
	6000 2700 6100 2700
Wire Wire Line
	6100 2600 5750 2600
Wire Wire Line
	6000 2500 6100 2500
Wire Bus Line
	7150 750  7150 11150
Wire Wire Line
	6650 9550 7050 9550
Wire Wire Line
	6650 9450 7050 9450
Wire Wire Line
	6650 9350 7050 9350
Wire Wire Line
	6650 9250 7050 9250
Wire Wire Line
	6650 9150 7050 9150
Wire Wire Line
	6650 9050 7050 9050
Wire Wire Line
	6650 8950 7050 8950
Wire Wire Line
	6650 8850 7050 8850
Wire Wire Line
	5750 8850 6150 8850
Wire Wire Line
	5750 8950 6150 8950
Wire Wire Line
	5750 9050 6150 9050
Wire Wire Line
	5750 9150 6150 9150
Wire Wire Line
	5750 9250 6150 9250
Wire Wire Line
	5750 9350 6150 9350
Wire Wire Line
	5750 9450 6150 9450
Wire Wire Line
	5750 9550 6150 9550
Wire Wire Line
	1850 1150 2150 1150
Wire Wire Line
	1950 8800 2150 8800
Wire Wire Line
	1950 9650 2150 9650
Wire Wire Line
	1950 9750 2150 9750
Wire Wire Line
	2150 9850 1950 9850
Wire Wire Line
	1950 9950 2150 9950
Wire Wire Line
	2150 10050 1950 10050
Wire Wire Line
	1950 10150 2150 10150
Wire Wire Line
	1950 10250 2150 10250
Wire Wire Line
	1950 8900 2150 8900
Wire Wire Line
	2350 10850 2925 10850
Wire Wire Line
	4350 1450 4250 1450
Connection ~ 4250 1650
Wire Wire Line
	4350 2900 4300 2900
Connection ~ 4300 3100
Wire Wire Line
	4350 4300 4250 4300
Connection ~ 4250 4500
Wire Wire Line
	4350 5750 4250 5750
Connection ~ 4250 5950
Wire Wire Line
	5750 9850 5900 9850
Wire Wire Line
	5900 9950 5750 9950
Wire Wire Line
	5750 10050 5900 10050
Wire Wire Line
	5900 10150 5750 10150
Wire Wire Line
	5750 10250 5900 10250
Wire Wire Line
	5900 10350 5750 10350
Wire Wire Line
	5750 10450 5900 10450
Wire Wire Line
	5900 10550 5750 10550
Wire Wire Line
	5750 10650 5900 10650
Wire Wire Line
	5750 10750 5900 10750
Wire Wire Line
	5900 10850 5750 10850
Wire Wire Line
	5750 10950 5900 10950
Wire Wire Line
	6900 10750 7050 10750
Wire Wire Line
	7050 10650 6900 10650
Wire Wire Line
	6900 10550 7050 10550
Wire Wire Line
	7050 10450 6900 10450
Wire Wire Line
	6900 10350 7050 10350
Wire Wire Line
	7050 10250 6900 10250
Wire Wire Line
	6900 10150 7050 10150
Wire Wire Line
	6900 10050 7050 10050
Wire Wire Line
	7050 9950 6900 9950
Wire Wire Line
	6900 9850 7050 9850
Wire Bus Line
	8950 950  8950 11150
Wire Wire Line
	7300 2050 7300 2150
Wire Wire Line
	7300 1750 7300 1850
Wire Wire Line
	7300 1800 8700 1800
Connection ~ 7300 1800
Wire Wire Line
	7300 2100 8700 2100
Connection ~ 7300 2100
Wire Wire Line
	7500 1850 7500 1800
Connection ~ 7500 1800
Wire Wire Line
	7700 1800 7700 1850
Connection ~ 7700 1800
Wire Wire Line
	7900 1800 7900 1850
Connection ~ 7900 1800
Wire Wire Line
	8100 1850 8100 1800
Connection ~ 8100 1800
Wire Wire Line
	8300 1850 8300 1800
Connection ~ 8300 1800
Wire Wire Line
	8500 1850 8500 1800
Connection ~ 8500 1800
Wire Wire Line
	8700 1800 8700 1850
Wire Wire Line
	7300 2550 7300 2650
Connection ~ 7300 2600
Wire Wire Line
	7500 2650 7500 2600
Connection ~ 7500 2600
Wire Wire Line
	7700 2650 7700 2600
Connection ~ 7700 2600
Wire Wire Line
	7900 2650 7900 2600
Connection ~ 7900 2600
Wire Wire Line
	8100 2600 8100 2650
Wire Wire Line
	8100 2900 8100 2850
Wire Wire Line
	7900 2850 7900 2900
Connection ~ 7900 2900
Wire Wire Line
	7700 2850 7700 2900
Connection ~ 7700 2900
Wire Wire Line
	7500 2850 7500 2900
Connection ~ 7500 2900
Wire Wire Line
	7300 2850 7300 2950
Connection ~ 7300 2900
Wire Wire Line
	8700 2100 8700 2050
Wire Wire Line
	8500 2050 8500 2100
Connection ~ 8500 2100
Wire Wire Line
	8300 2050 8300 2100
Connection ~ 8300 2100
Wire Wire Line
	8100 2050 8100 2100
Connection ~ 8100 2100
Wire Wire Line
	7900 2050 7900 2100
Connection ~ 7900 2100
Wire Wire Line
	7700 2050 7700 2100
Connection ~ 7700 2100
Wire Wire Line
	7500 2050 7500 2100
Connection ~ 7500 2100
Wire Wire Line
	7650 1250 7650 1350
Wire Wire Line
	7650 950  7650 1050
Wire Wire Line
	7650 1000 8250 1000
Connection ~ 7650 1000
Connection ~ 7650 1300
Wire Wire Line
	7850 1050 7850 1000
Connection ~ 7850 1000
Wire Wire Line
	8050 1000 8050 1050
Connection ~ 8050 1000
Wire Wire Line
	7850 1250 7850 1300
Connection ~ 7850 1300
Wire Wire Line
	8050 1300 8050 1250
Connection ~ 8050 1300
Wire Wire Line
	7650 1300 8250 1300
Wire Wire Line
	8250 1000 8250 1050
Wire Wire Line
	8250 1300 8250 1250
Wire Wire Line
	6100 3100 5950 3100
Wire Wire Line
	6600 950  6600 900 
Wire Wire Line
	6900 1050 6900 900 
Wire Wire Line
	5750 1600 6900 1600
Wire Wire Line
	5750 1500 6600 1500
Wire Wire Line
	6350 1200 6350 1250
Wire Wire Line
	6550 1200 6650 1200
Wire Wire Line
	6600 1250 6600 1200
Connection ~ 6600 1200
Wire Wire Line
	6900 1250 6900 1200
Connection ~ 6900 1200
Wire Wire Line
	6850 1200 7050 1200
Wire Wire Line
	6600 1500 6600 1450
Wire Wire Line
	6900 1600 6900 1450
Wire Wire Line
	5750 2150 6900 2150
Wire Wire Line
	5750 2050 6600 2050
Wire Wire Line
	6350 1750 6350 1800
Wire Wire Line
	6550 1750 6650 1750
Wire Wire Line
	6600 1800 6600 1750
Connection ~ 6600 1750
Wire Wire Line
	6900 1800 6900 1750
Connection ~ 6900 1750
Wire Wire Line
	6850 1750 7050 1750
Wire Wire Line
	6600 2050 6600 2000
Wire Wire Line
	6900 2150 6900 2000
Wire Wire Line
	5750 4100 5950 4100
Wire Wire Line
	5950 4200 5750 4200
Wire Wire Line
	5750 4300 5950 4300
Wire Wire Line
	5950 4400 5750 4400
Wire Wire Line
	5750 4500 5950 4500
Wire Wire Line
	5950 4600 5750 4600
Wire Wire Line
	5750 4700 5950 4700
Wire Wire Line
	5950 4800 5750 4800
Wire Wire Line
	5750 4900 5950 4900
Wire Wire Line
	5750 5250 5950 5250
Wire Wire Line
	5950 5350 5750 5350
Wire Wire Line
	5750 5450 5950 5450
Wire Wire Line
	5950 5550 5750 5550
Wire Wire Line
	5750 5650 5950 5650
Wire Wire Line
	5750 5750 5950 5750
Wire Wire Line
	5950 5850 5750 5850
Wire Wire Line
	5750 5950 5950 5950
Wire Wire Line
	5750 6050 5950 6050
Wire Wire Line
	6850 5250 7050 5250
Wire Wire Line
	7050 5350 6850 5350
Wire Wire Line
	6850 5450 7050 5450
Wire Wire Line
	7050 5550 6850 5550
Wire Wire Line
	5750 6450 5950 6450
Wire Wire Line
	5950 6550 5750 6550
Wire Wire Line
	5750 6650 5950 6650
Wire Wire Line
	5950 6750 5750 6750
Wire Wire Line
	5750 6850 5950 6850
Wire Wire Line
	5950 6950 5750 6950
Wire Wire Line
	5750 7050 5950 7050
Wire Wire Line
	5950 7150 5750 7150
Wire Wire Line
	5750 7250 5950 7250
Wire Wire Line
	6850 6750 7050 6750
Wire Wire Line
	7050 6650 6850 6650
Wire Wire Line
	6850 6550 7050 6550
Wire Wire Line
	7050 6450 6850 6450
Wire Wire Line
	5750 7650 5950 7650
Wire Wire Line
	5950 7750 5750 7750
Wire Wire Line
	5750 7850 5950 7850
Wire Wire Line
	5950 7950 5750 7950
Wire Wire Line
	5750 8050 5950 8050
Wire Wire Line
	5950 8150 5750 8150
Wire Wire Line
	5750 8250 5950 8250
Wire Wire Line
	5950 8350 5750 8350
Wire Wire Line
	5750 8450 5950 8450
Wire Wire Line
	6850 7950 7050 7950
Wire Wire Line
	7050 7850 6850 7850
Wire Wire Line
	6850 7750 7050 7750
Wire Wire Line
	7050 7650 6850 7650
Wire Wire Line
	6850 4100 7050 4100
Wire Wire Line
	7050 4200 6850 4200
Wire Wire Line
	6850 4300 7050 4300
Wire Wire Line
	7050 4400 6850 4400
Wire Wire Line
	7250 6250 7800 6250
Wire Wire Line
	7250 6350 7800 6350
Wire Wire Line
	7250 6450 7800 6450
Wire Wire Line
	7250 6550 7800 6550
Wire Wire Line
	7250 6650 7800 6650
Wire Wire Line
	7800 6750 7250 6750
Wire Wire Line
	7250 6850 7800 6850
Wire Wire Line
	7800 6950 7250 6950
Wire Wire Line
	7250 7050 7800 7050
Wire Wire Line
	7800 7150 7250 7150
Wire Wire Line
	8300 7150 8850 7150
Wire Wire Line
	8850 7050 8300 7050
Wire Wire Line
	8300 6950 8850 6950
Wire Wire Line
	8850 6850 8300 6850
Wire Wire Line
	8300 6750 8850 6750
Wire Wire Line
	8850 6650 8300 6650
Wire Wire Line
	8300 6550 8850 6550
Wire Wire Line
	8825 6450 8300 6450
Wire Wire Line
	8300 6350 8850 6350
Wire Wire Line
	8850 6250 8300 6250
Wire Wire Line
	7250 7950 7800 7950
Wire Wire Line
	7800 8050 7250 8050
Wire Wire Line
	7250 8150 7800 8150
Wire Wire Line
	7800 8250 7250 8250
Wire Wire Line
	7250 8350 7800 8350
Wire Wire Line
	7800 8450 7250 8450
Wire Wire Line
	7250 8550 7800 8550
Wire Wire Line
	7800 8650 7250 8650
Wire Wire Line
	7250 7650 7800 7650
Wire Wire Line
	7800 7750 7250 7750
Wire Wire Line
	7250 7850 7800 7850
Wire Wire Line
	8300 7850 8850 7850
Wire Wire Line
	8850 7750 8300 7750
Wire Wire Line
	8300 7650 8850 7650
Wire Wire Line
	8850 8650 8300 8650
Wire Wire Line
	8300 8550 8850 8550
Wire Wire Line
	8300 8450 8850 8450
Wire Wire Line
	8300 8350 8850 8350
Wire Wire Line
	8850 8250 8300 8250
Wire Wire Line
	8300 8150 8850 8150
Wire Wire Line
	8850 8050 8300 8050
Wire Wire Line
	8300 7950 8850 7950
Wire Wire Line
	7250 8950 7550 8950
Wire Wire Line
	7550 9050 7250 9050
Wire Wire Line
	7250 9150 7550 9150
Wire Wire Line
	7550 9250 7250 9250
Wire Wire Line
	7250 9350 7550 9350
Wire Wire Line
	7550 9450 7250 9450
Wire Wire Line
	7250 9550 7550 9550
Wire Wire Line
	7550 9650 7250 9650
Wire Wire Line
	7250 9750 7550 9750
Wire Wire Line
	7550 9850 7250 9850
Wire Wire Line
	8850 9650 8550 9650
Wire Wire Line
	8550 9550 8850 9550
Wire Wire Line
	8850 9450 8550 9450
Wire Wire Line
	8550 9350 8850 9350
Wire Wire Line
	8850 9250 8550 9250
Wire Wire Line
	8550 9150 8850 9150
Wire Wire Line
	8850 9050 8550 9050
Wire Wire Line
	8550 8950 8850 8950
Wire Wire Line
	7250 10050 7550 10050
Wire Wire Line
	7550 10150 7250 10150
Wire Wire Line
	7250 10250 7550 10250
Wire Wire Line
	7550 10350 7250 10350
Wire Wire Line
	7250 10450 7550 10450
Wire Wire Line
	7550 10550 7250 10550
Wire Wire Line
	7250 10650 7550 10650
Wire Wire Line
	7550 10750 7250 10750
Wire Wire Line
	7250 10850 7550 10850
Wire Wire Line
	7550 10950 7250 10950
Wire Wire Line
	8550 10750 8850 10750
Wire Wire Line
	8850 10650 8550 10650
Wire Wire Line
	8550 10550 8850 10550
Wire Wire Line
	8850 10450 8550 10450
Wire Wire Line
	8550 10350 8850 10350
Wire Wire Line
	8850 10250 8550 10250
Wire Wire Line
	8550 10150 8850 10150
Wire Wire Line
	8850 10050 8550 10050
Wire Bus Line
	8950 11150 550  11150
Wire Wire Line
	3125 10850 3200 10850
Wire Wire Line
	2750 11050 2650 11050
Wire Wire Line
	2650 11050 2650 10850
Connection ~ 2650 10850
Wire Wire Line
	4150 10750 4150 10900
Wire Wire Line
	5950 3100 5950 3300
Wire Wire Line
	5950 3300 5575 3300
Wire Wire Line
	5575 3200 5725 3200
Wire Wire Line
	4100 10550 4200 10550
Wire Wire Line
	9050 1250 9350 1250
Wire Wire Line
	9350 3250 9050 3250
Wire Wire Line
	9050 2950 9350 2950
Wire Wire Line
	9050 1850 9350 1850
Wire Wire Line
	9350 2650 9050 2650
Wire Wire Line
	9050 2350 9350 2350
Wire Wire Line
	9050 2450 9350 2450
Wire Wire Line
	9350 2050 9050 2050
Wire Wire Line
	9050 1750 9350 1750
Wire Wire Line
	9350 3050 9050 3050
Wire Wire Line
	9050 1450 9350 1450
Wire Wire Line
	9050 1150 9350 1150
Wire Wire Line
	9050 3650 9350 3650
Wire Wire Line
	9350 3550 9050 3550
Wire Wire Line
	9050 3950 9350 3950
Wire Wire Line
	9350 4150 9050 4150
Wire Wire Line
	9050 4250 9350 4250
Wire Wire Line
	9350 4550 9050 4550
Wire Wire Line
	9050 4850 9350 4850
Wire Wire Line
	9350 5150 9050 5150
Wire Wire Line
	9050 5350 9350 5350
Wire Wire Line
	9050 5650 9350 5650
Wire Wire Line
	9350 5750 9050 5750
Wire Wire Line
	9050 5950 9350 5950
Wire Wire Line
	9050 6250 9350 6250
Wire Wire Line
	9350 6350 9050 6350
Wire Wire Line
	9050 6550 9350 6550
Wire Wire Line
	9050 6850 9350 6850
Wire Wire Line
	9350 6950 9050 6950
Wire Wire Line
	9050 7150 9350 7150
Wire Wire Line
	9350 7250 9050 7250
Wire Wire Line
	9050 7450 9350 7450
Wire Wire Line
	9350 7550 9050 7550
Wire Wire Line
	9050 7750 9350 7750
Wire Wire Line
	9350 7850 9050 7850
Wire Wire Line
	9050 8050 9350 8050
Wire Wire Line
	9350 8150 9050 8150
Wire Wire Line
	9050 8350 9350 8350
Wire Wire Line
	9350 8450 9050 8450
Wire Wire Line
	9050 8650 9350 8650
Wire Wire Line
	9050 8750 9350 8750
Wire Wire Line
	9350 8950 9050 8950
Wire Wire Line
	9050 9050 9350 9050
Wire Wire Line
	9350 9250 9050 9250
Wire Wire Line
	9050 9550 9350 9550
Wire Wire Line
	9350 9650 9050 9650
Wire Wire Line
	9050 9850 9350 9850
Wire Wire Line
	9350 10150 9050 10150
Wire Wire Line
	9050 10250 9350 10250
Wire Wire Line
	9050 850  9350 850 
Wire Wire Line
	9050 1050 9350 1050
Wire Wire Line
	9350 1350 9050 1350
Wire Wire Line
	9350 1650 9050 1650
Wire Wire Line
	9050 1950 9350 1950
Wire Wire Line
	9050 2150 9350 2150
Wire Wire Line
	9350 2250 9050 2250
Wire Wire Line
	9050 2550 9350 2550
Wire Wire Line
	9050 2850 9350 2850
Wire Wire Line
	9050 3450 9350 3450
Wire Wire Line
	9050 3750 9350 3750
Wire Wire Line
	9050 4050 9350 4050
Wire Wire Line
	9050 4350 9350 4350
$Comp
L VCC #PWR043
U 1 1 5B04101E
P 7300 2550
F 0 "#PWR043" H 7300 2400 50  0001 C CNN
F 1 "VCC" H 7300 2700 50  0000 C CNN
F 2 "" H 7300 2550 50  0001 C CNN
F 3 "" H 7300 2550 50  0001 C CNN
	1    7300 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR044
U 1 1 5B041140
P 7300 2950
F 0 "#PWR044" H 7300 2700 50  0001 C CNN
F 1 "GND" H 7300 2800 50  0000 C CNN
F 2 "" H 7300 2950 50  0001 C CNN
F 3 "" H 7300 2950 50  0001 C CNN
	1    7300 2950
	1    0    0    -1  
$EndComp
Connection ~ 8100 2600
Connection ~ 8100 2900
$Comp
L VCC #PWR045
U 1 1 5B04F302
P 7300 4150
F 0 "#PWR045" H 7300 4000 50  0001 C CNN
F 1 "VCC" H 7300 4300 50  0000 C CNN
F 2 "" H 7300 4150 50  0001 C CNN
F 3 "" H 7300 4150 50  0001 C CNN
	1    7300 4150
	1    0    0    -1  
$EndComp
$Comp
L C_Small C33
U 1 1 5B04F69F
P 7900 4350
F 0 "C33" H 7910 4420 50  0000 L CNN
F 1 "0.1u" H 7910 4270 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7900 4350 50  0001 C CNN
F 3 "" H 7900 4350 50  0001 C CNN
	1    7900 4350
	1    0    0    -1  
$EndComp
$Comp
L C_Small C32
U 1 1 5B04F6A5
P 7700 4350
F 0 "C32" H 7710 4420 50  0000 L CNN
F 1 "0.1u" H 7710 4270 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7700 4350 50  0001 C CNN
F 3 "" H 7700 4350 50  0001 C CNN
	1    7700 4350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR046
U 1 1 5B04F831
P 7300 4550
F 0 "#PWR046" H 7300 4300 50  0001 C CNN
F 1 "GND" H 7300 4400 50  0000 C CNN
F 2 "" H 7300 4550 50  0001 C CNN
F 3 "" H 7300 4550 50  0001 C CNN
	1    7300 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 4200 7900 4200
Wire Wire Line
	7900 4200 7900 4250
Wire Wire Line
	7300 4500 7900 4500
Wire Wire Line
	7500 4500 7500 4450
Wire Wire Line
	7700 4500 7700 4450
Connection ~ 7500 4500
Wire Wire Line
	7900 4500 7900 4450
Connection ~ 7700 4500
Wire Wire Line
	7700 4200 7700 4250
Connection ~ 7700 4200
Wire Wire Line
	7500 4200 7500 4250
Connection ~ 7500 4200
Wire Wire Line
	9050 4650 9350 4650
Wire Wire Line
	9350 4950 9050 4950
Wire Wire Line
	9050 5250 9350 5250
Wire Wire Line
	9350 5550 9050 5550
Wire Wire Line
	9350 5850 9050 5850
Wire Wire Line
	9050 6150 9350 6150
Wire Wire Line
	9350 6450 9050 6450
Wire Wire Line
	9050 6650 9350 6650
Wire Wire Line
	9350 6750 9050 6750
Wire Wire Line
	9350 7050 9050 7050
$Comp
L C96ABC J2
U 1 1 5AFBA271
P 9850 5600
F 0 "J2" H 9850 10500 50  0000 C CNN
F 1 "SYSTEM" V 10100 5600 50  0000 C CNN
F 2 "Connectors_IEC_DIN:Socket_DIN41612-CaseC1-full-Male-96Pin-3rows" H 9850 5600 50  0001 C CNN
F 3 "" H 9850 5600 50  0001 C CNN
	1    9850 5600
	1    0    0    -1  
$EndComp
$EndSCHEMATC
