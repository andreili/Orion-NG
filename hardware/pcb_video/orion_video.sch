EESchema Schematic File Version 2
LIBS:orion_video-rescue
LIBS:device
LIBS:power
LIBS:conn
LIBS:Lattice
LIBS:orion
LIBS:74xgxx
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
L R_Small R?
U 1 1 5AA79D29
P 1100 1600
F 0 "R?" V 1025 1575 50  0000 L CNN
F 1 "1k" V 1100 1550 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 1100 1600 50  0001 C CNN
F 3 "" H 1100 1600 50  0001 C CNN
	1    1100 1600
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR?
U 1 1 5AA7BD67
P 1250 1600
F 0 "#PWR?" H 1250 1450 50  0001 C CNN
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
L IE18 DD?
U 1 1 5AB0B75C
P 1450 2150
F 0 "DD?" H 1450 2650 60  0000 C CNN
F 1 "IE18" H 1450 1750 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 1350 2500 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1350 2500 60  0001 C CNN
	1    1450 2150
	1    0    0    -1  
$EndComp
$Comp
L IE18 DD?
U 1 1 5AB0B823
P 1450 3150
F 0 "DD?" H 1450 3650 60  0000 C CNN
F 1 "IE18" H 1450 2750 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 1350 3500 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1350 3500 60  0001 C CNN
	1    1450 3150
	1    0    0    -1  
$EndComp
$Comp
L IE18 DD?
U 1 1 5AB0BB62
P 1450 4150
F 0 "DD?" H 1450 4650 60  0000 C CNN
F 1 "IE18" H 1450 3750 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 1350 4500 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1350 4500 60  0001 C CNN
	1    1450 4150
	1    0    0    -1  
$EndComp
$Comp
L GEN Y?
U 1 1 5AA6965A
P 1450 1150
F 0 "Y?" H 1600 950 60  0000 C CNN
F 1 "25MHz" H 1450 1250 60  0000 C CNN
F 2 "Crystals:Crystal_SMD_7050-4pin_7.0x5.0mm" H 1450 1150 60  0001 C CNN
F 3 "" H 1450 1150 60  0001 C CNN
	1    1450 1150
	1    0    0    1   
$EndComp
$Comp
L C_Small C?
U 1 1 5AA814EE
P 14400 9500
F 0 "C?" H 14410 9570 50  0000 L CNN
F 1 "0.1u" H 14410 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 14400 9500 50  0001 C CNN
F 3 "" H 14400 9500 50  0001 C CNN
	1    14400 9500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AA81A69
P 14200 9500
F 0 "C?" H 14210 9570 50  0000 L CNN
F 1 "0.1u" H 14210 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 14200 9500 50  0001 C CNN
F 3 "" H 14200 9500 50  0001 C CNN
	1    14200 9500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AA81BBB
P 14000 9500
F 0 "C?" H 14010 9570 50  0000 L CNN
F 1 "0.1u" H 14010 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 14000 9500 50  0001 C CNN
F 3 "" H 14000 9500 50  0001 C CNN
	1    14000 9500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AA81D4C
P 13800 9500
F 0 "C?" H 13810 9570 50  0000 L CNN
F 1 "0.1u" H 13810 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 13800 9500 50  0001 C CNN
F 3 "" H 13800 9500 50  0001 C CNN
	1    13800 9500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AA81D52
P 13600 9500
F 0 "C?" H 13610 9570 50  0000 L CNN
F 1 "0.1u" H 13610 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 13600 9500 50  0001 C CNN
F 3 "" H 13600 9500 50  0001 C CNN
	1    13600 9500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AA81D58
P 13400 9500
F 0 "C?" H 13410 9570 50  0000 L CNN
F 1 "0.1u" H 13410 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 13400 9500 50  0001 C CNN
F 3 "" H 13400 9500 50  0001 C CNN
	1    13400 9500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AA8200E
P 13200 9500
F 0 "C?" H 13210 9570 50  0000 L CNN
F 1 "0.1u" H 13210 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 13200 9500 50  0001 C CNN
F 3 "" H 13200 9500 50  0001 C CNN
	1    13200 9500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AA82014
P 13000 9500
F 0 "C?" H 13010 9570 50  0000 L CNN
F 1 "0.1u" H 13010 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 13000 9500 50  0001 C CNN
F 3 "" H 13000 9500 50  0001 C CNN
	1    13000 9500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AA8201A
P 12800 9500
F 0 "C?" H 12810 9570 50  0000 L CNN
F 1 "0.1u" H 12810 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 12800 9500 50  0001 C CNN
F 3 "" H 12800 9500 50  0001 C CNN
	1    12800 9500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AA82020
P 12600 9500
F 0 "C?" H 12610 9570 50  0000 L CNN
F 1 "0.1u" H 12610 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 12600 9500 50  0001 C CNN
F 3 "" H 12600 9500 50  0001 C CNN
	1    12600 9500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AA82026
P 12400 9500
F 0 "C?" H 12410 9570 50  0000 L CNN
F 1 "0.1u" H 12410 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 12400 9500 50  0001 C CNN
F 3 "" H 12400 9500 50  0001 C CNN
	1    12400 9500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AA8202C
P 12200 9500
F 0 "C?" H 12210 9570 50  0000 L CNN
F 1 "0.1u" H 12210 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 12200 9500 50  0001 C CNN
F 3 "" H 12200 9500 50  0001 C CNN
	1    12200 9500
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C?
U 1 1 5AA837D1
P 12800 7825
F 0 "C?" H 12810 7895 50  0000 L CNN
F 1 "10u" H 12810 7745 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 12800 7825 50  0001 C CNN
F 3 "" H 12800 7825 50  0001 C CNN
	1    12800 7825
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C?
U 1 1 5AA83A53
P 12600 7825
F 0 "C?" H 12610 7895 50  0000 L CNN
F 1 "10u" H 12610 7745 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 12600 7825 50  0001 C CNN
F 3 "" H 12600 7825 50  0001 C CNN
	1    12600 7825
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C?
U 1 1 5AA83BE7
P 12400 7825
F 0 "C?" H 12410 7895 50  0000 L CNN
F 1 "10u" H 12410 7745 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 12400 7825 50  0001 C CNN
F 3 "" H 12400 7825 50  0001 C CNN
	1    12400 7825
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C?
U 1 1 5AA83BED
P 12200 7825
F 0 "C?" H 12210 7895 50  0000 L CNN
F 1 "10u" H 12210 7745 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 12200 7825 50  0001 C CNN
F 3 "" H 12200 7825 50  0001 C CNN
	1    12200 7825
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 5AA84C0F
P 12200 9300
F 0 "#PWR?" H 12200 9150 50  0001 C CNN
F 1 "VCC" H 12200 9450 50  0000 C CNN
F 2 "" H 12200 9300 50  0001 C CNN
F 3 "" H 12200 9300 50  0001 C CNN
	1    12200 9300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5AA84C9F
P 12200 9700
F 0 "#PWR?" H 12200 9450 50  0001 C CNN
F 1 "GND" H 12200 9550 50  0000 C CNN
F 2 "" H 12200 9700 50  0001 C CNN
F 3 "" H 12200 9700 50  0001 C CNN
	1    12200 9700
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
L R_Small R?
U 1 1 5AA955C6
P 1100 4800
F 0 "R?" V 1025 4775 50  0000 L CNN
F 1 "1k" V 1100 4750 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 1100 4800 50  0001 C CNN
F 3 "" H 1100 4800 50  0001 C CNN
	1    1100 4800
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR?
U 1 1 5AA955CC
P 1250 4800
F 0 "#PWR?" H 1250 4650 50  0001 C CNN
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
L IE18 DD?
U 1 1 5AA95610
P 1450 5350
F 0 "DD?" H 1450 5850 60  0000 C CNN
F 1 "IE18" H 1450 4950 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 1350 5700 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1350 5700 60  0001 C CNN
	1    1450 5350
	1    0    0    -1  
$EndComp
$Comp
L IE18 DD?
U 1 1 5AA95616
P 1450 6350
F 0 "DD?" H 1450 6850 60  0000 C CNN
F 1 "IE18" H 1450 5950 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 1350 6700 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1350 6700 60  0001 C CNN
	1    1450 6350
	1    0    0    -1  
$EndComp
$Comp
L IE18 DD?
U 1 1 5AA9561C
P 1450 7350
F 0 "DD?" H 1450 7850 60  0000 C CNN
F 1 "IE18" H 1450 6950 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 1350 7700 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1350 7700 60  0001 C CNN
	1    1450 7350
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AA8E2C8
P 15200 9500
F 0 "C?" H 15210 9570 50  0000 L CNN
F 1 "0.1u" H 15210 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 15200 9500 50  0001 C CNN
F 3 "" H 15200 9500 50  0001 C CNN
	1    15200 9500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AA8E2CE
P 15000 9500
F 0 "C?" H 15010 9570 50  0000 L CNN
F 1 "0.1u" H 15010 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 15000 9500 50  0001 C CNN
F 3 "" H 15000 9500 50  0001 C CNN
	1    15000 9500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AA8E2D4
P 14800 9500
F 0 "C?" H 14810 9570 50  0000 L CNN
F 1 "0.1u" H 14810 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 14800 9500 50  0001 C CNN
F 3 "" H 14800 9500 50  0001 C CNN
	1    14800 9500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AA8E2DA
P 14600 9500
F 0 "C?" H 14610 9570 50  0000 L CNN
F 1 "0.1u" H 14610 9420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 14600 9500 50  0001 C CNN
F 3 "" H 14600 9500 50  0001 C CNN
	1    14600 9500
	1    0    0    -1  
$EndComp
$Comp
L DB15_Female_HighDensity_MountingHoles J?
U 1 1 5AAC91B4
P 6400 6850
F 0 "J?" H 6400 7575 50  0000 C CNN
F 1 "VGA" H 6625 7450 50  0000 C CNN
F 2 "w_conn_pc:DB_15F-VGA" H 5450 7250 50  0001 C CNN
F 3 "" H 5450 7250 50  0001 C CNN
	1    6400 6850
	1    0    0    -1  
$EndComp
Entry Wire Line
	5650 6550 5750 6450
Text Label 5750 6450 0    60   ~ 0
VR
Entry Wire Line
	7050 6850 7150 6950
Text Label 6950 6850 0    60   ~ 0
HS
Entry Wire Line
	5650 6750 5750 6650
Text Label 5750 6650 0    60   ~ 0
VG
Entry Wire Line
	5650 6950 5750 6850
Text Label 5750 6850 0    60   ~ 0
VB
$Comp
L R_Small R?
U 1 1 5AACD33B
P 6800 7050
F 0 "R?" V 6725 6975 50  0000 L CNN
F 1 "47" V 6800 7000 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6800 7050 50  0001 C CNN
F 3 "" H 6800 7050 50  0001 C CNN
	1    6800 7050
	0    1    1    0   
$EndComp
$Comp
L R_Small R?
U 1 1 5AACDA94
P 6800 6850
F 0 "R?" V 6725 6775 50  0000 L CNN
F 1 "47" V 6800 6800 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6800 6850 50  0001 C CNN
F 3 "" H 6800 6850 50  0001 C CNN
	1    6800 6850
	0    1    1    0   
$EndComp
Entry Wire Line
	7050 7050 7150 7150
Text Label 6950 7050 0    60   ~ 0
VS
$Comp
L GND #PWR?
U 1 1 5AAD2CCC
P 6000 7650
F 0 "#PWR?" H 6000 7400 50  0001 C CNN
F 1 "GND" H 5850 7600 50  0000 C CNN
F 2 "" H 6000 7650 50  0001 C CNN
F 3 "" H 6000 7650 50  0001 C CNN
	1    6000 7650
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5AAD3372
P 6150 7600
F 0 "C?" V 6250 7525 50  0000 L CNN
F 1 "0.1u" V 6025 7475 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 6150 7600 50  0001 C CNN
F 3 "" H 6150 7600 50  0001 C CNN
	1    6150 7600
	0    -1   -1   0   
$EndComp
$Comp
L AS7C4098A U?
U 1 1 5AAEAA65
P 12750 2000
F 0 "U?" H 12800 2000 50  0000 C CNN
F 1 "AS7C4098A" H 12900 750 50  0000 C CNN
F 2 "Projects:SOJ-44" H 12750 2000 50  0001 C CNN
F 3 "" H 12750 2000 50  0001 C CNN
	1    12750 2000
	1    0    0    -1  
$EndComp
Entry Wire Line
	11700 3350 11800 3250
Text Label 11800 3250 0    60   ~ 0
CE0
Entry Wire Line
	11700 3250 11800 3150
Text Label 11800 3150 0    60   ~ 0
SL
Entry Wire Line
	11700 3150 11800 3050
Text Label 11800 3050 0    60   ~ 0
SU
Entry Wire Line
	11700 3050 11800 2950
Text Label 11800 2950 0    60   ~ 0
WE
Entry Wire Line
	11700 2950 11800 2850
Text Label 11800 2850 0    60   ~ 0
OE
Entry Wire Line
	11700 2750 11800 2650
Text Label 11800 2650 0    60   ~ 0
S17
Entry Wire Line
	11700 2650 11800 2550
Text Label 11800 2550 0    60   ~ 0
S16
Entry Wire Line
	11700 2550 11800 2450
Text Label 11800 2450 0    60   ~ 0
MA15
Entry Wire Line
	11700 2450 11800 2350
Text Label 11800 2350 0    60   ~ 0
MA14
Entry Wire Line
	11700 2350 11800 2250
Text Label 11800 2250 0    60   ~ 0
MA13
Entry Wire Line
	11700 2250 11800 2150
Text Label 11800 2150 0    60   ~ 0
MA12
Entry Wire Line
	11700 2150 11800 2050
Text Label 11800 2050 0    60   ~ 0
MA11
Entry Wire Line
	11700 2050 11800 1950
Text Label 11800 1950 0    60   ~ 0
MA10
Entry Wire Line
	11700 1950 11800 1850
Text Label 11800 1850 0    60   ~ 0
MA9
Entry Wire Line
	11700 1850 11800 1750
Text Label 11800 1750 0    60   ~ 0
MA8
Entry Wire Line
	11700 1750 11800 1650
Text Label 11800 1650 0    60   ~ 0
MA7
Entry Wire Line
	11700 1650 11800 1550
Text Label 11800 1550 0    60   ~ 0
MA6
Entry Wire Line
	11700 1550 11800 1450
Text Label 11800 1450 0    60   ~ 0
MA5
Entry Wire Line
	11700 1450 11800 1350
Text Label 11800 1350 0    60   ~ 0
MA4
Entry Wire Line
	11700 1350 11800 1250
Text Label 11800 1250 0    60   ~ 0
MA3
Entry Wire Line
	11700 1250 11800 1150
Text Label 11800 1150 0    60   ~ 0
MA2
Entry Wire Line
	11700 1150 11800 1050
Text Label 11800 1050 0    60   ~ 0
MA1
Entry Wire Line
	11700 1050 11800 950 
Text Label 11800 950  0    60   ~ 0
MA0
Entry Wire Line
	13650 950  13750 1050
Text Label 13500 950  0    60   ~ 0
MD0
Entry Wire Line
	13650 1050 13750 1150
Text Label 13500 1050 0    60   ~ 0
MD1
Entry Wire Line
	13650 1150 13750 1250
Text Label 13500 1150 0    60   ~ 0
MD2
Entry Wire Line
	13650 1250 13750 1350
Text Label 13500 1250 0    60   ~ 0
MD3
Entry Wire Line
	13650 1350 13750 1450
Text Label 13500 1350 0    60   ~ 0
MD4
Entry Wire Line
	13650 1450 13750 1550
Text Label 13500 1450 0    60   ~ 0
MD5
Entry Wire Line
	13650 1550 13750 1650
Text Label 13500 1550 0    60   ~ 0
MD6
Entry Wire Line
	13650 1650 13750 1750
Text Label 13500 1650 0    60   ~ 0
MD7
Entry Wire Line
	13650 1750 13750 1850
Text Label 13500 1750 0    60   ~ 0
MD8
Entry Wire Line
	13650 1850 13750 1950
Text Label 13500 1850 0    60   ~ 0
MD9
Entry Wire Line
	13650 1950 13750 2050
Text Label 13450 1950 0    60   ~ 0
MD10
Entry Wire Line
	13650 2050 13750 2150
Text Label 13450 2050 0    60   ~ 0
MD11
Entry Wire Line
	13650 2150 13750 2250
Text Label 13450 2150 0    60   ~ 0
MD12
Entry Wire Line
	13650 2250 13750 2350
Text Label 13450 2250 0    60   ~ 0
MD13
Entry Wire Line
	13650 2350 13750 2450
Text Label 13450 2350 0    60   ~ 0
MD14
Entry Wire Line
	13650 2450 13750 2550
Text Label 13450 2450 0    60   ~ 0
MD15
Entry Wire Line
	9100 4100 9200 4200
Entry Wire Line
	9100 4200 9200 4300
Entry Wire Line
	9100 4300 9200 4400
Text Label 8900 4100 0    60   ~ 0
MA12
Text Label 8900 4200 0    60   ~ 0
MA13
Text Label 8900 4300 0    60   ~ 0
MA14
Text Label 7250 4900 0    60   ~ 0
DSn
Entry Wire Line
	7150 5000 7250 4900
Text Label 7250 4100 0    60   ~ 0
A12
Entry Wire Line
	7150 4200 7250 4100
Text Label 7250 4200 0    60   ~ 0
A13
Entry Wire Line
	7150 4300 7250 4200
Text Label 7250 4300 0    60   ~ 0
VA14
Entry Wire Line
	7150 4400 7250 4300
Entry Wire Line
	7150 4600 7250 4500
Text Label 7250 4600 0    60   ~ 0
X8
Entry Wire Line
	7150 4700 7250 4600
Text Label 7250 4700 0    60   ~ 0
B0
Entry Wire Line
	7150 4800 7250 4700
$Comp
L GND #PWR?
U 1 1 5AB00E43
P 7750 5000
F 0 "#PWR?" H 7750 4750 50  0001 C CNN
F 1 "GND" H 7600 4950 50  0000 C CNN
F 2 "" H 7750 5000 50  0001 C CNN
F 3 "" H 7750 5000 50  0001 C CNN
	1    7750 5000
	1    0    0    -1  
$EndComp
Text Label 7250 4500 0    60   ~ 0
X7
$Comp
L KP11 DD?
U 1 1 5AB00E4A
P 8200 4500
F 0 "DD?" H 8200 5000 60  0000 C CNN
F 1 "KP11" H 8200 4000 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 8100 4850 60  0001 C CNN
F 3 "" H 8100 4850 60  0001 C CNN
	1    8200 4500
	1    0    0    -1  
$EndComp
Entry Wire Line
	9100 4400 9200 4500
Text Label 8900 4400 0    60   ~ 0
MA15
Text Label 7250 4400 0    60   ~ 0
VA15
Entry Wire Line
	7150 4500 7250 4400
Text Label 7250 4800 0    60   ~ 0
B1
Entry Wire Line
	7150 4900 7250 4800
Entry Wire Line
	9100 2950 9200 3050
Entry Wire Line
	9100 3050 9200 3150
Entry Wire Line
	9100 3150 9200 3250
Text Label 8950 2950 0    60   ~ 0
MA8
Text Label 8950 3050 0    60   ~ 0
MA9
Text Label 8900 3150 0    60   ~ 0
MA10
Text Label 7250 3750 0    60   ~ 0
DSn
Entry Wire Line
	7150 3850 7250 3750
Text Label 7250 2950 0    60   ~ 0
A8
Entry Wire Line
	7150 3050 7250 2950
Text Label 7250 3050 0    60   ~ 0
A9
Entry Wire Line
	7150 3150 7250 3050
Text Label 7250 3150 0    60   ~ 0
A10
Entry Wire Line
	7150 3250 7250 3150
Entry Wire Line
	7150 3450 7250 3350
Text Label 7250 3450 0    60   ~ 0
X4
Entry Wire Line
	7150 3550 7250 3450
Text Label 7250 3550 0    60   ~ 0
X5
Entry Wire Line
	7150 3650 7250 3550
$Comp
L GND #PWR?
U 1 1 5AB04719
P 7750 3850
F 0 "#PWR?" H 7750 3600 50  0001 C CNN
F 1 "GND" H 7600 3800 50  0000 C CNN
F 2 "" H 7750 3850 50  0001 C CNN
F 3 "" H 7750 3850 50  0001 C CNN
	1    7750 3850
	1    0    0    -1  
$EndComp
Text Label 7250 3350 0    60   ~ 0
X3
$Comp
L KP11 DD?
U 1 1 5AB04720
P 8200 3350
F 0 "DD?" H 8200 3850 60  0000 C CNN
F 1 "KP11" H 8200 2850 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 8100 3700 60  0001 C CNN
F 3 "" H 8100 3700 60  0001 C CNN
	1    8200 3350
	1    0    0    -1  
$EndComp
Entry Wire Line
	9100 3250 9200 3350
Text Label 8900 3250 0    60   ~ 0
MA11
Text Label 7250 3250 0    60   ~ 0
A11
Entry Wire Line
	7150 3350 7250 3250
Text Label 7250 3650 0    60   ~ 0
X6
Entry Wire Line
	7150 3750 7250 3650
Entry Wire Line
	9100 1800 9200 1900
Entry Wire Line
	9100 1900 9200 2000
Entry Wire Line
	9100 2000 9200 2100
Text Label 8950 1800 0    60   ~ 0
MA4
Text Label 8950 1900 0    60   ~ 0
MA5
Text Label 8950 2000 0    60   ~ 0
MA6
Text Label 7250 2600 0    60   ~ 0
DSn
Entry Wire Line
	7150 2700 7250 2600
Text Label 7250 1800 0    60   ~ 0
A4
Entry Wire Line
	7150 1900 7250 1800
Text Label 7250 1900 0    60   ~ 0
A5
Entry Wire Line
	7150 2000 7250 1900
Text Label 7250 2000 0    60   ~ 0
A6
Entry Wire Line
	7150 2100 7250 2000
Entry Wire Line
	7150 2300 7250 2200
Text Label 7250 2300 0    60   ~ 0
Y5
Entry Wire Line
	7150 2400 7250 2300
Text Label 7250 2400 0    60   ~ 0
Y6
Entry Wire Line
	7150 2500 7250 2400
$Comp
L GND #PWR?
U 1 1 5AB04EE6
P 7750 2700
F 0 "#PWR?" H 7750 2450 50  0001 C CNN
F 1 "GND" H 7600 2650 50  0000 C CNN
F 2 "" H 7750 2700 50  0001 C CNN
F 3 "" H 7750 2700 50  0001 C CNN
	1    7750 2700
	1    0    0    -1  
$EndComp
Text Label 7250 2200 0    60   ~ 0
Y4
$Comp
L KP11 DD?
U 1 1 5AB04EED
P 8200 2200
F 0 "DD?" H 8200 2700 60  0000 C CNN
F 1 "KP11" H 8200 1700 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 8100 2550 60  0001 C CNN
F 3 "" H 8100 2550 60  0001 C CNN
	1    8200 2200
	1    0    0    -1  
$EndComp
Entry Wire Line
	9100 2100 9200 2200
Text Label 8950 2100 0    60   ~ 0
MA7
Text Label 7250 2100 0    60   ~ 0
A7
Entry Wire Line
	7150 2200 7250 2100
Text Label 7250 2500 0    60   ~ 0
Y7
Entry Wire Line
	7150 2600 7250 2500
Entry Wire Line
	9100 650  9200 750 
Entry Wire Line
	9100 750  9200 850 
Entry Wire Line
	9100 850  9200 950 
Text Label 8950 650  0    60   ~ 0
MA0
Text Label 8950 750  0    60   ~ 0
MA1
Text Label 8950 850  0    60   ~ 0
MA2
Text Label 7250 1450 0    60   ~ 0
DSn
Entry Wire Line
	7150 1550 7250 1450
Text Label 7250 650  0    60   ~ 0
A0
Entry Wire Line
	7150 750  7250 650 
Text Label 7250 750  0    60   ~ 0
A1
Entry Wire Line
	7150 850  7250 750 
Text Label 7250 850  0    60   ~ 0
A2
Entry Wire Line
	7150 950  7250 850 
Entry Wire Line
	7150 1150 7250 1050
Text Label 7250 1150 0    60   ~ 0
Y1
Entry Wire Line
	7150 1250 7250 1150
Text Label 7250 1250 0    60   ~ 0
Y2
Entry Wire Line
	7150 1350 7250 1250
$Comp
L GND #PWR?
U 1 1 5AB04F19
P 7750 1550
F 0 "#PWR?" H 7750 1300 50  0001 C CNN
F 1 "GND" H 7600 1500 50  0000 C CNN
F 2 "" H 7750 1550 50  0001 C CNN
F 3 "" H 7750 1550 50  0001 C CNN
	1    7750 1550
	1    0    0    -1  
$EndComp
Text Label 7250 1050 0    60   ~ 0
Y0
$Comp
L KP11 DD?
U 1 1 5AB04F20
P 8200 1050
F 0 "DD?" H 8200 1550 60  0000 C CNN
F 1 "KP11" H 8200 550 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 8100 1400 60  0001 C CNN
F 3 "" H 8100 1400 60  0001 C CNN
	1    8200 1050
	1    0    0    -1  
$EndComp
Entry Wire Line
	9100 950  9200 1050
Text Label 8950 950  0    60   ~ 0
MA3
Text Label 7250 950  0    60   ~ 0
A3
Entry Wire Line
	7150 1050 7250 950 
Text Label 7250 1350 0    60   ~ 0
Y3
Entry Wire Line
	7150 1450 7250 1350
$Comp
L AS7C4098A U?
U 1 1 5AB272C7
P 12750 4600
F 0 "U?" H 12800 4600 50  0000 C CNN
F 1 "AS7C4098A" H 12900 3350 50  0000 C CNN
F 2 "Projects:SOJ-44" H 12750 4600 50  0001 C CNN
F 3 "" H 12750 4600 50  0001 C CNN
	1    12750 4600
	1    0    0    -1  
$EndComp
Entry Wire Line
	11700 5950 11800 5850
Text Label 11800 5850 0    60   ~ 0
CE1
Entry Wire Line
	11700 5850 11800 5750
Text Label 11800 5750 0    60   ~ 0
SL
Entry Wire Line
	11700 5750 11800 5650
Text Label 11800 5650 0    60   ~ 0
SU
Entry Wire Line
	11700 5650 11800 5550
Text Label 11800 5550 0    60   ~ 0
WE
Entry Wire Line
	11700 5550 11800 5450
Text Label 11800 5450 0    60   ~ 0
OE
Entry Wire Line
	11700 5350 11800 5250
Text Label 11800 5250 0    60   ~ 0
S17
Entry Wire Line
	11700 5250 11800 5150
Text Label 11800 5150 0    60   ~ 0
S16
Entry Wire Line
	11700 5150 11800 5050
Text Label 11800 5050 0    60   ~ 0
MA15
Entry Wire Line
	11700 5050 11800 4950
Text Label 11800 4950 0    60   ~ 0
MA14
Entry Wire Line
	11700 4950 11800 4850
Text Label 11800 4850 0    60   ~ 0
MA13
Entry Wire Line
	11700 4850 11800 4750
Text Label 11800 4750 0    60   ~ 0
MA12
Entry Wire Line
	11700 4750 11800 4650
Text Label 11800 4650 0    60   ~ 0
MA11
Entry Wire Line
	11700 4650 11800 4550
Text Label 11800 4550 0    60   ~ 0
MA10
Entry Wire Line
	11700 4550 11800 4450
Text Label 11800 4450 0    60   ~ 0
MA9
Entry Wire Line
	11700 4450 11800 4350
Text Label 11800 4350 0    60   ~ 0
MA8
Entry Wire Line
	11700 4350 11800 4250
Text Label 11800 4250 0    60   ~ 0
MA7
Entry Wire Line
	11700 4250 11800 4150
Text Label 11800 4150 0    60   ~ 0
MA6
Entry Wire Line
	11700 4150 11800 4050
Text Label 11800 4050 0    60   ~ 0
MA5
Entry Wire Line
	11700 4050 11800 3950
Text Label 11800 3950 0    60   ~ 0
MA4
Entry Wire Line
	11700 3950 11800 3850
Text Label 11800 3850 0    60   ~ 0
MA3
Entry Wire Line
	11700 3850 11800 3750
Text Label 11800 3750 0    60   ~ 0
MA2
Entry Wire Line
	11700 3750 11800 3650
Text Label 11800 3650 0    60   ~ 0
MA1
Entry Wire Line
	11700 3650 11800 3550
Text Label 11800 3550 0    60   ~ 0
MA0
Entry Wire Line
	13650 3550 13750 3650
Text Label 13500 3550 0    60   ~ 0
MD0
Entry Wire Line
	13650 3650 13750 3750
Text Label 13500 3650 0    60   ~ 0
MD1
Entry Wire Line
	13650 3750 13750 3850
Text Label 13500 3750 0    60   ~ 0
MD2
Entry Wire Line
	13650 3850 13750 3950
Text Label 13500 3850 0    60   ~ 0
MD3
Entry Wire Line
	13650 3950 13750 4050
Text Label 13500 3950 0    60   ~ 0
MD4
Entry Wire Line
	13650 4050 13750 4150
Text Label 13500 4050 0    60   ~ 0
MD5
Entry Wire Line
	13650 4150 13750 4250
Text Label 13500 4150 0    60   ~ 0
MD6
Entry Wire Line
	13650 4250 13750 4350
Text Label 13500 4250 0    60   ~ 0
MD7
Entry Wire Line
	13650 4350 13750 4450
Text Label 13500 4350 0    60   ~ 0
MD8
Entry Wire Line
	13650 4450 13750 4550
Text Label 13500 4450 0    60   ~ 0
MD9
Entry Wire Line
	13650 4550 13750 4650
Text Label 13450 4550 0    60   ~ 0
MD10
Entry Wire Line
	13650 4650 13750 4750
Text Label 13450 4650 0    60   ~ 0
MD11
Entry Wire Line
	13650 4750 13750 4850
Text Label 13450 4750 0    60   ~ 0
MD12
Entry Wire Line
	13650 4850 13750 4950
Text Label 13450 4850 0    60   ~ 0
MD13
Entry Wire Line
	13650 4950 13750 5050
Text Label 13450 4950 0    60   ~ 0
MD14
Entry Wire Line
	13650 5050 13750 5150
Text Label 13450 5050 0    60   ~ 0
MD15
Text Label 9100 9100 2    60   ~ 0
MD8
Text Label 9100 9200 2    60   ~ 0
MD9
Text Label 9100 9300 2    60   ~ 0
MD10
Text Label 9100 9400 2    60   ~ 0
MD11
Text Label 9100 9500 2    60   ~ 0
MD12
Text Label 9100 9600 2    60   ~ 0
MD13
Text Label 9100 9700 2    60   ~ 0
MD14
Text Label 9100 9800 2    60   ~ 0
MD15
Entry Wire Line
	9200 9900 9100 9800
Entry Wire Line
	9200 9800 9100 9700
Entry Wire Line
	9200 9700 9100 9600
Entry Wire Line
	9200 9600 9100 9500
Entry Wire Line
	9200 9500 9100 9400
Entry Wire Line
	9200 9400 9100 9300
Entry Wire Line
	9200 9300 9100 9200
Entry Wire Line
	9200 9200 9100 9100
Entry Wire Line
	7150 10000 7250 9900
Text Label 7250 9900 0    60   ~ 0
OE
Entry Wire Line
	7150 10100 7250 10000
Text Label 7250 10000 0    60   ~ 0
MCP
$Comp
L AP6 DD?
U 1 1 5AAD664E
P 8200 9550
F 0 "DD?" H 8200 10100 60  0000 C CNN
F 1 "AP6" H 8200 9100 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-20W_7.5x12.8mm_Pitch1.27mm" H 8150 9700 60  0001 C CNN
F 3 "" H 8150 9700 60  0001 C CNN
	1    8200 9550
	1    0    0    -1  
$EndComp
Entry Wire Line
	7250 8000 7150 8100
Text Label 7350 8000 2    60   ~ 0
D0
Entry Wire Line
	7250 8100 7150 8200
Text Label 7350 8100 2    60   ~ 0
D1
Entry Wire Line
	7250 8200 7150 8300
Text Label 7350 8200 2    60   ~ 0
D2
Entry Wire Line
	7250 8300 7150 8400
Text Label 7350 8300 2    60   ~ 0
D3
Entry Wire Line
	7250 8400 7150 8500
Text Label 7350 8400 2    60   ~ 0
D4
Entry Wire Line
	7250 8500 7150 8600
Text Label 7350 8500 2    60   ~ 0
D5
Entry Wire Line
	7250 8600 7150 8700
Text Label 7350 8600 2    60   ~ 0
D6
Entry Wire Line
	7250 8700 7150 8800
Text Label 7350 8700 2    60   ~ 0
D7
Text Label 9100 8000 2    60   ~ 0
MD0
Text Label 9100 8100 2    60   ~ 0
MD1
Text Label 9100 8200 2    60   ~ 0
MD2
Text Label 9100 8300 2    60   ~ 0
MD3
Text Label 9100 8400 2    60   ~ 0
MD4
Text Label 9100 8500 2    60   ~ 0
MD5
Text Label 9100 8600 2    60   ~ 0
MD6
Text Label 9100 8700 2    60   ~ 0
MD7
Entry Wire Line
	9200 8800 9100 8700
Entry Wire Line
	9200 8700 9100 8600
Entry Wire Line
	9200 8600 9100 8500
Entry Wire Line
	9200 8500 9100 8400
Entry Wire Line
	9200 8400 9100 8300
Entry Wire Line
	9200 8300 9100 8200
Entry Wire Line
	9200 8200 9100 8100
Entry Wire Line
	9200 8100 9100 8000
Entry Wire Line
	7150 8900 7250 8800
Text Label 7250 8800 0    60   ~ 0
OE
Entry Wire Line
	7150 9000 7250 8900
Text Label 7250 8900 0    60   ~ 0
MCP
$Comp
L AP6 DD?
U 1 1 5AAD9696
P 8200 8450
F 0 "DD?" H 8200 9000 60  0000 C CNN
F 1 "AP6" H 8200 8000 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-20W_7.5x12.8mm_Pitch1.27mm" H 8150 8600 60  0001 C CNN
F 3 "" H 8150 8600 60  0001 C CNN
	1    8200 8450
	1    0    0    -1  
$EndComp
Entry Wire Line
	7250 9100 7150 9200
Text Label 7350 9100 2    60   ~ 0
D0
Entry Wire Line
	7250 9200 7150 9300
Text Label 7350 9200 2    60   ~ 0
D1
Entry Wire Line
	7250 9300 7150 9400
Text Label 7350 9300 2    60   ~ 0
D2
Entry Wire Line
	7250 9400 7150 9500
Text Label 7350 9400 2    60   ~ 0
D3
Entry Wire Line
	7250 9500 7150 9600
Text Label 7350 9500 2    60   ~ 0
D4
Entry Wire Line
	7250 9600 7150 9700
Text Label 7350 9600 2    60   ~ 0
D5
Entry Wire Line
	7250 9700 7150 9800
Text Label 7350 9700 2    60   ~ 0
D6
Entry Wire Line
	7250 9800 7150 9900
Text Label 7350 9800 2    60   ~ 0
D7
Entry Wire Line
	9200 2650 9300 2550
Entry Wire Line
	9200 2450 9300 2350
Text Label 9300 2350 0    60   ~ 0
5MHz
Entry Wire Line
	9200 2350 9300 2250
Text Label 9300 2250 0    60   ~ 0
66?
Entry Wire Line
	9200 2250 9300 2150
Text Label 9300 2150 0    60   ~ 0
HOLD
Entry Wire Line
	9200 2150 9300 2050
Text Label 9300 2050 0    60   ~ 0
RDn
Entry Wire Line
	9200 2050 9300 1950
Text Label 9300 1950 0    60   ~ 0
WRn
Entry Wire Line
	9200 1950 9300 1850
Text Label 9300 1850 0    60   ~ 0
MREQn
Entry Wire Line
	9200 1850 9300 1750
Text Label 9300 1750 0    60   ~ 0
IORQn
Entry Wire Line
	9200 1750 9300 1650
Text Label 9300 1650 0    60   ~ 0
BLIO
Entry Wire Line
	9200 1550 9300 1450
Text Label 9300 1450 0    60   ~ 0
BLRAM
Entry Wire Line
	9200 1350 9300 1250
Text Label 9300 1250 0    60   ~ 0
M1n
Entry Wire Line
	9200 1150 9300 1050
Text Label 9300 1050 0    60   ~ 0
INTAn
Entry Wire Line
	9200 950  9300 850 
Text Label 9300 850  0    60   ~ 0
RESn
Entry Wire Line
	9200 3950 9300 3850
Text Label 9300 3850 0    60   ~ 0
BLn
Entry Wire Line
	9200 3750 9300 3650
Text Label 9300 3650 0    60   ~ 0
10MHz
Entry Wire Line
	9200 3550 9300 3450
Text Label 9300 3450 0    60   ~ 0
IRQS
Entry Wire Line
	9200 3450 9300 3350
Text Label 9300 3350 0    60   ~ 0
IRQ7
Entry Wire Line
	9200 3350 9300 3250
Text Label 9300 3250 0    60   ~ 0
IRQ6
Entry Wire Line
	9200 3250 9300 3150
Text Label 9300 3150 0    60   ~ 0
IRQ5
Entry Wire Line
	9200 3150 9300 3050
Text Label 9300 3050 0    60   ~ 0
IRQ4
Entry Wire Line
	9200 3050 9300 2950
Text Label 9300 2950 0    60   ~ 0
IRQ3
Entry Wire Line
	9200 2950 9300 2850
Text Label 9300 2850 0    60   ~ 0
IRQ2
Entry Wire Line
	9200 2850 9300 2750
Text Label 9300 2750 0    60   ~ 0
IRQ1
Entry Wire Line
	9200 2750 9300 2650
Text Label 9300 2650 0    60   ~ 0
CLC0?
Entry Wire Line
	11000 2550 10900 2450
Text Label 10900 2450 2    60   ~ 0
A13
Entry Wire Line
	11000 2450 10900 2350
Text Label 10900 2350 2    60   ~ 0
A14
Entry Wire Line
	11000 2350 10900 2250
Text Label 10900 2250 2    60   ~ 0
A15
Entry Wire Line
	11000 2250 10900 2150
Text Label 10900 2150 2    60   ~ 0
I
Entry Wire Line
	11000 2150 10900 2050
Text Label 10900 2050 2    60   ~ 0
B
Entry Wire Line
	11000 2050 10900 1950
Text Label 10900 1950 2    60   ~ 0
G
Entry Wire Line
	11000 1950 10900 1850
Entry Wire Line
	11000 1850 10900 1750
Text Label 10900 1750 2    60   ~ 0
SND
Entry Wire Line
	11000 1750 10900 1650
Text Label 10900 1650 2    60   ~ 0
WAITn
Entry Wire Line
	11000 1650 10900 1550
Text Label 10900 1550 2    60   ~ 0
D7
Entry Wire Line
	11000 1550 10900 1450
Text Label 10900 1450 2    60   ~ 0
D6
Entry Wire Line
	11000 1450 10900 1350
Text Label 10900 1350 2    60   ~ 0
D5
Entry Wire Line
	11000 1350 10900 1250
Text Label 10900 1250 2    60   ~ 0
D4
Entry Wire Line
	11000 1250 10900 1150
Text Label 10900 1150 2    60   ~ 0
D3
Entry Wire Line
	11000 1150 10900 1050
Text Label 10900 1050 2    60   ~ 0
D2
Entry Wire Line
	11000 1050 10900 950 
Text Label 10900 950  2    60   ~ 0
D1
Entry Wire Line
	11000 950  10900 850 
Text Label 10900 850  2    60   ~ 0
D0
Entry Wire Line
	11000 3950 10900 3850
Text Label 10900 3850 2    60   ~ 0
HLDA
Entry Wire Line
	11000 3850 10900 3750
Text Label 10900 3750 2    60   ~ 0
A0
Entry Wire Line
	11000 3750 10900 3650
Text Label 10900 3650 2    60   ~ 0
A1
Entry Wire Line
	11000 3650 10900 3550
Text Label 10900 3550 2    60   ~ 0
A2
Entry Wire Line
	11000 3550 10900 3450
Text Label 10900 3450 2    60   ~ 0
A3
Entry Wire Line
	11000 3450 10900 3350
Text Label 10900 3350 2    60   ~ 0
A4
Entry Wire Line
	11000 3350 10900 3250
Text Label 10900 3250 2    60   ~ 0
A5
Entry Wire Line
	11000 3250 10900 3150
Text Label 10900 3150 2    60   ~ 0
A6
Entry Wire Line
	11000 3150 10900 3050
Text Label 10900 3050 2    60   ~ 0
A7
Entry Wire Line
	11000 3050 10900 2950
Text Label 10900 2950 2    60   ~ 0
A8
Entry Wire Line
	11000 2950 10900 2850
Text Label 10900 2850 2    60   ~ 0
A9
Entry Wire Line
	11000 2850 10900 2750
Text Label 10900 2750 2    60   ~ 0
A10
Entry Wire Line
	11000 2750 10900 2650
Text Label 10900 2650 2    60   ~ 0
A11
Entry Wire Line
	11000 2650 10900 2550
Text Label 10900 2550 2    60   ~ 0
A12
$Comp
L GND #PWR?
U 1 1 5AAFFE64
P 9900 750
F 0 "#PWR?" H 9900 500 50  0001 C CNN
F 1 "GND" V 9900 575 50  0000 C CNN
F 2 "" H 9900 750 50  0001 C CNN
F 3 "" H 9900 750 50  0001 C CNN
	1    9900 750 
	0    1    1    0   
$EndComp
$Comp
L VDD #PWR?
U 1 1 5AB00E1B
P 9900 950
F 0 "#PWR?" H 9900 800 50  0001 C CNN
F 1 "VDD" V 9900 1125 50  0000 C CNN
F 2 "" H 9900 950 50  0001 C CNN
F 3 "" H 9900 950 50  0001 C CNN
	1    9900 950 
	0    -1   -1   0   
$EndComp
$Comp
L -12V #PWR?
U 1 1 5AB01A9F
P 9900 1350
F 0 "#PWR?" H 9900 1450 50  0001 C CNN
F 1 "-12V" V 9900 1575 50  0000 C CNN
F 2 "" H 9900 1350 50  0001 C CNN
F 3 "" H 9900 1350 50  0001 C CNN
	1    9900 1350
	0    -1   -1   0   
$EndComp
Text Label 9300 2550 0    60   ~ 0
RFSHn
$Comp
L +12V #PWR?
U 1 1 5AB08886
P 9900 1550
F 0 "#PWR?" H 9900 1400 50  0001 C CNN
F 1 "+12V" V 9900 1750 50  0000 C CNN
F 2 "" H 9900 1550 50  0001 C CNN
F 3 "" H 9900 1550 50  0001 C CNN
	1    9900 1550
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5AB09CBA
P 9900 3750
F 0 "#PWR?" H 9900 3500 50  0001 C CNN
F 1 "GND" V 9900 3575 50  0000 C CNN
F 2 "" H 9900 3750 50  0001 C CNN
F 3 "" H 9900 3750 50  0001 C CNN
	1    9900 3750
	0    1    1    0   
$EndComp
Text Label 10900 1850 2    60   ~ 0
R
$Comp
L Conn_02x32_Odd_Even J?
U 1 1 5AB0DEC8
P 10200 2250
F 0 "J?" H 10250 3850 50  0000 C CNN
F 1 "SYS_PRO" H 10250 550 50  0000 C CNN
F 2 "Projects:ORION_BE_ST" H 10200 2250 50  0001 C CNN
F 3 "" H 10200 2250 50  0001 C CNN
	1    10200 2250
	-1   0    0    -1  
$EndComp
Entry Wire Line
	9200 4300 9300 4200
Entry Wire Line
	9200 5300 9300 5200
Text Label 9300 5200 0    60   ~ 0
1B8
Entry Wire Line
	9200 5200 9300 5100
Text Label 9300 5100 0    60   ~ 0
1B6
Entry Wire Line
	9200 5100 9300 5000
Text Label 9300 5000 0    60   ~ 0
1B4
Entry Wire Line
	9200 5000 9300 4900
Text Label 9300 4900 0    60   ~ 0
1B2
Entry Wire Line
	9200 4900 9300 4800
Text Label 9300 4800 0    60   ~ 0
ROM
Entry Wire Line
	9200 4800 9300 4700
Text Label 9300 4700 0    60   ~ 0
VA18
Entry Wire Line
	9200 4700 9300 4600
Text Label 9300 4600 0    60   ~ 0
VA16
Entry Wire Line
	9200 4500 9300 4400
Text Label 9300 4400 0    60   ~ 0
MW
Entry Wire Line
	9200 4400 9300 4300
Text Label 9300 4300 0    60   ~ 0
DSn
Text Label 9300 4200 0    60   ~ 0
SR16
Entry Wire Line
	11000 4300 10900 4200
Entry Wire Line
	11000 5300 10900 5200
Text Label 10900 5200 2    60   ~ 0
M2V
Entry Wire Line
	11000 5200 10900 5100
Text Label 10900 5100 2    60   ~ 0
1B7
Entry Wire Line
	11000 5100 10900 5000
Text Label 10900 5000 2    60   ~ 0
1B5
Entry Wire Line
	11000 5000 10900 4900
Text Label 10900 4900 2    60   ~ 0
1B3
Entry Wire Line
	11000 4900 10900 4800
Text Label 10900 4800 2    60   ~ 0
XROM
Entry Wire Line
	11000 4800 10900 4700
Text Label 10900 4700 2    60   ~ 0
VA19
Entry Wire Line
	11000 4700 10900 4600
Text Label 10900 4600 2    60   ~ 0
VA17
Entry Wire Line
	11000 4500 10900 4400
Text Label 10900 4400 2    60   ~ 0
MR
Entry Wire Line
	11000 4400 10900 4300
Text Label 10900 4300 2    60   ~ 0
CLC0?
Text Label 10900 4200 2    60   ~ 0
WS
Entry Wire Line
	9200 4600 9300 4500
Text Label 9300 4500 0    60   ~ 0
VA14
Entry Wire Line
	11000 4600 10900 4500
Text Label 10900 4500 2    60   ~ 0
VA15
Entry Wire Line
	9200 5400 9300 5300
Entry Wire Line
	9200 5900 9300 5800
Text Label 9300 5800 0    60   ~ 0
r6
Entry Wire Line
	9200 5800 9300 5700
Text Label 9300 5700 0    60   ~ 0
r4
Entry Wire Line
	9200 5600 9300 5500
Text Label 9300 5500 0    60   ~ 0
r0
Entry Wire Line
	9200 5500 9300 5400
Text Label 9300 5400 0    60   ~ 0
PFCn
Text Label 9300 5300 0    60   ~ 0
PF8
Entry Wire Line
	11000 5400 10900 5300
Entry Wire Line
	11000 5900 10900 5800
Text Label 10900 5800 2    60   ~ 0
r7
Entry Wire Line
	11000 5800 10900 5700
Text Label 10900 5700 2    60   ~ 0
r5
Entry Wire Line
	11000 5600 10900 5500
Text Label 10900 5500 2    60   ~ 0
r1
Entry Wire Line
	11000 5500 10900 5400
Text Label 10900 5400 2    60   ~ 0
YR
Text Label 10900 5300 2    60   ~ 0
PFA
Entry Wire Line
	9200 5700 9300 5600
Text Label 9300 5600 0    60   ~ 0
r2
Entry Wire Line
	11000 5700 10900 5600
Text Label 10900 5600 2    60   ~ 0
r3
$Comp
L Conn_02x17_Odd_Even J?
U 1 1 5AB5E6A2
P 10100 5000
F 0 "J?" H 10150 5900 50  0000 C CNN
F 1 "SYS_EXT" H 10150 4100 50  0000 C CNN
F 2 "Projects:ORION_BE_EX" H 10100 5000 50  0001 C CNN
F 3 "" H 10100 5000 50  0001 C CNN
	1    10100 5000
	1    0    0    -1  
$EndComp
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
$Comp
L CY7C1049B DD?
U 1 1 5AABA02C
P 14750 4400
F 0 "DD?" H 14750 5550 50  0000 C CNN
F 1 "CY7C1049B" H 14900 3300 50  0000 C CNN
F 2 "Projects:SOJ-36" H 14750 4400 50  0001 C CNN
F 3 "" H 14750 4400 50  0001 C CNN
	1    14750 4400
	1    0    0    -1  
$EndComp
Entry Wire Line
	13750 5600 13850 5500
Text Label 13850 5300 0    60   ~ 0
CE1
Entry Wire Line
	13750 5500 13850 5400
Text Label 13850 5400 0    60   ~ 0
WE
Entry Wire Line
	13750 5400 13850 5300
Text Label 13850 5500 0    60   ~ 0
OE
Entry Wire Line
	15650 3350 15750 3450
Text Label 15500 3350 0    60   ~ 0
MD0
Entry Wire Line
	15650 3450 15750 3550
Text Label 15500 3450 0    60   ~ 0
MD1
Entry Wire Line
	15650 3550 15750 3650
Text Label 15500 3550 0    60   ~ 0
MD2
Entry Wire Line
	15650 3650 15750 3750
Text Label 15500 3650 0    60   ~ 0
MD3
Entry Wire Line
	15650 3750 15750 3850
Text Label 15500 3750 0    60   ~ 0
MD4
Entry Wire Line
	15650 3850 15750 3950
Text Label 15500 3850 0    60   ~ 0
MD5
Entry Wire Line
	15650 3950 15750 4050
Text Label 15500 3950 0    60   ~ 0
MD6
Entry Wire Line
	15650 4050 15750 4150
Text Label 15500 4050 0    60   ~ 0
MD7
$Comp
L CY7C1049B DD?
U 1 1 5AAF621D
P 14750 2000
F 0 "DD?" H 14750 3150 50  0000 C CNN
F 1 "CY7C1049B" H 14900 900 50  0000 C CNN
F 2 "Projects:SOJ-36" H 14750 2000 50  0001 C CNN
F 3 "" H 14750 2000 50  0001 C CNN
	1    14750 2000
	1    0    0    -1  
$EndComp
Entry Wire Line
	13750 2750 13850 2650
Text Label 13850 2650 0    60   ~ 0
S17
Entry Wire Line
	13750 2650 13850 2550
Text Label 13850 2550 0    60   ~ 0
S16
Entry Wire Line
	13750 2550 13850 2450
Text Label 13850 2450 0    60   ~ 0
MA15
Entry Wire Line
	13750 2450 13850 2350
Text Label 13850 2350 0    60   ~ 0
MA14
Entry Wire Line
	13750 2350 13850 2250
Text Label 13850 2250 0    60   ~ 0
MA13
Entry Wire Line
	13750 2250 13850 2150
Text Label 13850 2150 0    60   ~ 0
MA12
Entry Wire Line
	13750 2150 13850 2050
Text Label 13850 2050 0    60   ~ 0
MA11
Entry Wire Line
	13750 2050 13850 1950
Text Label 13850 1950 0    60   ~ 0
MA10
Entry Wire Line
	13750 1950 13850 1850
Text Label 13850 1850 0    60   ~ 0
MA9
Entry Wire Line
	13750 1850 13850 1750
Text Label 13850 1750 0    60   ~ 0
MA8
Entry Wire Line
	13750 1750 13850 1650
Text Label 13850 1650 0    60   ~ 0
MA7
Entry Wire Line
	13750 1650 13850 1550
Text Label 13850 1550 0    60   ~ 0
MA6
Entry Wire Line
	13750 1550 13850 1450
Text Label 13850 1450 0    60   ~ 0
MA5
Entry Wire Line
	13750 1450 13850 1350
Text Label 13850 1350 0    60   ~ 0
MA4
Entry Wire Line
	13750 1350 13850 1250
Text Label 13850 1250 0    60   ~ 0
MA3
Entry Wire Line
	13750 1250 13850 1150
Text Label 13850 1150 0    60   ~ 0
MA2
Entry Wire Line
	13750 1150 13850 1050
Text Label 13850 1050 0    60   ~ 0
MA1
Entry Wire Line
	13750 1050 13850 950 
Text Label 13850 950  0    60   ~ 0
MA0
Entry Wire Line
	13750 2850 13850 2750
Text Label 13850 2750 0    60   ~ 0
MA19
Entry Wire Line
	13750 3200 13850 3100
Text Label 13850 2900 0    60   ~ 0
CE0
Entry Wire Line
	13750 3100 13850 3000
Text Label 13850 3000 0    60   ~ 0
WE
Entry Wire Line
	13750 3000 13850 2900
Text Label 13850 3100 0    60   ~ 0
OE
Entry Wire Line
	15650 950  15750 1050
Text Label 15500 950  0    60   ~ 0
MD8
Entry Wire Line
	15650 1050 15750 1150
Text Label 15500 1050 0    60   ~ 0
MD9
Entry Wire Line
	15650 1150 15750 1250
Text Label 15450 1150 0    60   ~ 0
MD10
Entry Wire Line
	15650 1250 15750 1350
Text Label 15450 1250 0    60   ~ 0
MD11
Entry Wire Line
	15650 1350 15750 1450
Text Label 15450 1350 0    60   ~ 0
MD12
Entry Wire Line
	15650 1450 15750 1550
Text Label 15450 1450 0    60   ~ 0
MD13
Entry Wire Line
	15650 1550 15750 1650
Text Label 15450 1550 0    60   ~ 0
MD14
Entry Wire Line
	15650 1650 15750 1750
Text Label 15450 1650 0    60   ~ 0
MD15
$Comp
L TEST_1P J?
U 1 1 5AAFBB11
P 850 10650
F 0 "J?" V 775 10725 50  0000 C CNN
F 1 "25M" V 850 10900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 1050 10650 50  0001 C CNN
F 3 "" H 1050 10650 50  0001 C CNN
	1    850  10650
	0    1    1    0   
$EndComp
$Comp
L TEST_1P J?
U 1 1 5AAFC2C1
P 850 10800
F 0 "J?" V 775 10875 50  0000 C CNN
F 1 "X0" V 850 11025 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 1050 10800 50  0001 C CNN
F 3 "" H 1050 10800 50  0001 C CNN
	1    850  10800
	0    1    1    0   
$EndComp
$Comp
L TEST_1P J?
U 1 1 5AAFC479
P 850 10950
F 0 "J?" V 775 11025 50  0000 C CNN
F 1 "X4" V 850 11175 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 1050 10950 50  0001 C CNN
F 3 "" H 1050 10950 50  0001 C CNN
	1    850  10950
	0    1    1    0   
$EndComp
Entry Wire Line
	550  10750 650  10650
Text Label 650  10650 0    60   ~ 0
CLK
Entry Wire Line
	550  10900 650  10800
Text Label 650  10800 0    60   ~ 0
X1
Entry Wire Line
	550  11050 650  10950
Text Label 650  10950 0    60   ~ 0
XRn
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
L GND #PWR?
U 1 1 5ACE8E40
P 2600 5950
F 0 "#PWR?" H 2600 5700 50  0001 C CNN
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
L GND #PWR?
U 1 1 5ACEC1BA
P 2600 7050
F 0 "#PWR?" H 2600 6800 50  0001 C CNN
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
	3900 7650 4000 7750
Text Label 3700 7650 0    60   ~ 0
VD20
Entry Wire Line
	3900 7750 4000 7850
Text Label 3700 7750 0    60   ~ 0
VD21
Entry Wire Line
	3900 7850 4000 7950
Text Label 3700 7850 0    60   ~ 0
VD22
Entry Wire Line
	3900 7950 4000 8050
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
L GND #PWR?
U 1 1 5ACEE9E0
P 2600 8150
F 0 "#PWR?" H 2600 7900 50  0001 C CNN
F 1 "GND" H 2450 8100 50  0000 C CNN
F 2 "" H 2600 8150 50  0001 C CNN
F 3 "" H 2600 8150 50  0001 C CNN
	1    2600 8150
	1    0    0    -1  
$EndComp
Entry Wire Line
	3900 8350 4000 8450
Text Label 3700 8350 0    60   ~ 0
VD24
Entry Wire Line
	3900 8450 4000 8550
Text Label 3700 8450 0    60   ~ 0
VD25
Entry Wire Line
	3900 8550 4000 8650
Text Label 3700 8550 0    60   ~ 0
VD26
Entry Wire Line
	3900 8650 4000 8750
Text Label 3700 8650 0    60   ~ 0
VD27
Entry Wire Line
	3900 8750 4000 8850
Text Label 3700 8750 0    60   ~ 0
VD28
Entry Wire Line
	3900 8850 4000 8950
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
L GND #PWR?
U 1 1 5ACEEA1F
P 2600 9250
F 0 "#PWR?" H 2600 9000 50  0001 C CNN
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
L GND #PWR?
U 1 1 5AD0114F
P 4250 1900
F 0 "#PWR?" H 4250 1650 50  0001 C CNN
F 1 "GND" H 4100 1850 50  0000 C CNN
F 2 "" H 4250 1900 50  0001 C CNN
F 3 "" H 4250 1900 50  0001 C CNN
	1    4250 1900
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 5AD05481
P 4400 2000
F 0 "R?" V 4325 1975 50  0000 L CNN
F 1 "1k" V 4400 1950 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 4400 2000 50  0001 C CNN
F 3 "" H 4400 2000 50  0001 C CNN
	1    4400 2000
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR?
U 1 1 5AD05487
P 4500 2000
F 0 "#PWR?" H 4500 1850 50  0001 C CNN
F 1 "VCC" V 4500 2175 50  0000 C CNN
F 2 "" H 4500 2000 50  0001 C CNN
F 3 "" H 4500 2000 50  0001 C CNN
	1    4500 2000
	0    1    1    0   
$EndComp
$Comp
L IR10 DD?
U 1 1 5AD0847F
P 4850 1100
F 0 "DD?" H 4850 1650 60  0000 C CNN
F 1 "IR10" H 4850 350 60  0000 C CNN
F 2 "" H 4800 1250 60  0001 C CNN
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
L GND #PWR?
U 1 1 5AD0AC5C
P 4300 3325
F 0 "#PWR?" H 4300 3075 50  0001 C CNN
F 1 "GND" H 4150 3275 50  0000 C CNN
F 2 "" H 4300 3325 50  0001 C CNN
F 3 "" H 4300 3325 50  0001 C CNN
	1    4300 3325
	1    0    0    -1  
$EndComp
$Comp
L IR10 DD?
U 1 1 5AD0AC71
P 4850 2550
F 0 "DD?" H 4850 3100 60  0000 C CNN
F 1 "IR10" H 4850 1800 60  0000 C CNN
F 2 "" H 4800 2700 60  0001 C CNN
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
L GND #PWR?
U 1 1 5AD0E034
P 4250 4750
F 0 "#PWR?" H 4250 4500 50  0001 C CNN
F 1 "GND" H 4100 4700 50  0000 C CNN
F 2 "" H 4250 4750 50  0001 C CNN
F 3 "" H 4250 4750 50  0001 C CNN
	1    4250 4750
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 5AD0E03B
P 4400 4850
F 0 "R?" V 4325 4825 50  0000 L CNN
F 1 "1k" V 4400 4800 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 4400 4850 50  0001 C CNN
F 3 "" H 4400 4850 50  0001 C CNN
	1    4400 4850
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR?
U 1 1 5AD0E041
P 4500 4850
F 0 "#PWR?" H 4500 4700 50  0001 C CNN
F 1 "VCC" V 4500 5025 50  0000 C CNN
F 2 "" H 4500 4850 50  0001 C CNN
F 3 "" H 4500 4850 50  0001 C CNN
	1    4500 4850
	0    1    1    0   
$EndComp
$Comp
L IR10 DD?
U 1 1 5AD0E048
P 4850 3950
F 0 "DD?" H 4850 4500 60  0000 C CNN
F 1 "IR10" H 4850 3200 60  0000 C CNN
F 2 "" H 4800 4100 60  0001 C CNN
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
L GND #PWR?
U 1 1 5AD106DF
P 4250 6200
F 0 "#PWR?" H 4250 5950 50  0001 C CNN
F 1 "GND" H 4100 6150 50  0000 C CNN
F 2 "" H 4250 6200 50  0001 C CNN
F 3 "" H 4250 6200 50  0001 C CNN
	1    4250 6200
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 5AD106E6
P 4400 6300
F 0 "R?" V 4325 6275 50  0000 L CNN
F 1 "1k" V 4400 6250 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 4400 6300 50  0001 C CNN
F 3 "" H 4400 6300 50  0001 C CNN
	1    4400 6300
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR?
U 1 1 5AD106EC
P 4500 6300
F 0 "#PWR?" H 4500 6150 50  0001 C CNN
F 1 "VCC" V 4500 6475 50  0000 C CNN
F 2 "" H 4500 6300 50  0001 C CNN
F 3 "" H 4500 6300 50  0001 C CNN
	1    4500 6300
	0    1    1    0   
$EndComp
$Comp
L IR10 DD?
U 1 1 5AD106F3
P 4850 5400
F 0 "DD?" H 4850 5950 60  0000 C CNN
F 1 "IR10" H 4850 4650 60  0000 C CNN
F 2 "" H 4800 5550 60  0001 C CNN
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
Entry Wire Line
	7050 1500 7150 1600
Text Label 6950 1500 0    60   ~ 0
R1
Entry Wire Line
	7050 1600 7150 1700
Text Label 6950 1600 0    60   ~ 0
R2
Entry Wire Line
	7050 1700 7150 1800
Text Label 6950 1700 0    60   ~ 0
R3
Entry Wire Line
	7050 1800 7150 1900
Text Label 6950 1800 0    60   ~ 0
R4
Entry Wire Line
	7050 1900 7150 2000
Text Label 6950 1900 0    60   ~ 0
G1
Entry Wire Line
	7050 2000 7150 2100
Text Label 6950 2000 0    60   ~ 0
G2
Entry Wire Line
	7050 2100 7150 2200
Text Label 6950 2100 0    60   ~ 0
G3
Entry Wire Line
	7050 2200 7150 2300
Text Label 6950 2200 0    60   ~ 0
G4
Entry Wire Line
	5650 1900 5750 1800
Text Label 5750 1800 0    60   ~ 0
R
Entry Wire Line
	5650 1800 5750 1700
Text Label 5750 1700 0    60   ~ 0
IR
Entry Wire Line
	5650 1700 5750 1600
Text Label 5750 1600 0    60   ~ 0
R
Entry Wire Line
	5650 1600 5750 1500
Text Label 5750 1500 0    60   ~ 0
R
Entry Wire Line
	5650 2400 5750 2300
Text Label 5750 2300 0    60   ~ 0
G
Entry Wire Line
	5650 2300 5750 2200
Text Label 5750 2200 0    60   ~ 0
IG
Entry Wire Line
	5650 2200 5750 2100
Text Label 5750 2100 0    60   ~ 0
G
Entry Wire Line
	5650 2100 5750 2000
Text Label 5750 2000 0    60   ~ 0
G
Entry Wire Line
	7050 2600 7150 2700
Text Label 6950 2600 0    60   ~ 0
B1
Entry Wire Line
	7050 2700 7150 2800
Text Label 6950 2700 0    60   ~ 0
B2
Entry Wire Line
	7050 2800 7150 2900
Text Label 6950 2800 0    60   ~ 0
B3
Entry Wire Line
	7050 2900 7150 3000
Text Label 6950 2900 0    60   ~ 0
B4
Entry Wire Line
	5650 3000 5750 2900
Text Label 5750 2900 0    60   ~ 0
B
Entry Wire Line
	5650 2900 5750 2800
Text Label 5750 2800 0    60   ~ 0
IB
Entry Wire Line
	5650 2800 5750 2700
Text Label 5750 2700 0    60   ~ 0
B
Entry Wire Line
	5650 2700 5750 2600
Text Label 5750 2600 0    60   ~ 0
B
$Comp
L R_Small R?
U 1 1 5AD9F66E
P 5850 3900
F 0 "R?" V 5775 3875 50  0000 L CNN
F 1 "2R" V 5850 3850 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 5850 3900 50  0001 C CNN
F 3 "" H 5850 3900 50  0001 C CNN
	1    5850 3900
	0    1    1    0   
$EndComp
$Comp
L R_Small R?
U 1 1 5AD9F674
P 6150 3900
F 0 "R?" V 6075 3875 50  0000 L CNN
F 1 "R" V 6150 3875 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6150 3900 50  0001 C CNN
F 3 "" H 6150 3900 50  0001 C CNN
	1    6150 3900
	0    1    1    0   
$EndComp
$Comp
L R_Small R?
U 1 1 5AD9F67A
P 6450 3900
F 0 "R?" V 6375 3875 50  0000 L CNN
F 1 "R" V 6450 3875 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6450 3900 50  0001 C CNN
F 3 "" H 6450 3900 50  0001 C CNN
	1    6450 3900
	0    1    1    0   
$EndComp
$Comp
L R_Small R?
U 1 1 5AD9F680
P 6750 3900
F 0 "R?" V 6675 3875 50  0000 L CNN
F 1 "R" V 6750 3875 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6750 3900 50  0001 C CNN
F 3 "" H 6750 3900 50  0001 C CNN
	1    6750 3900
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5AD9F686
P 5750 3950
F 0 "#PWR?" H 5750 3700 50  0001 C CNN
F 1 "GND" H 5775 3800 50  0000 C CNN
F 2 "" H 5750 3950 50  0001 C CNN
F 3 "" H 5750 3950 50  0001 C CNN
	1    5750 3950
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 5AD9F68C
P 6000 4050
F 0 "R?" H 5875 4025 50  0000 L CNN
F 1 "2R" V 6000 4000 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6000 4050 50  0001 C CNN
F 3 "" H 6000 4050 50  0001 C CNN
	1    6000 4050
	-1   0    0    1   
$EndComp
$Comp
L R_Small R?
U 1 1 5AD9F692
P 6300 4050
F 0 "R?" H 6175 4025 50  0000 L CNN
F 1 "2R" V 6300 4000 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6300 4050 50  0001 C CNN
F 3 "" H 6300 4050 50  0001 C CNN
	1    6300 4050
	-1   0    0    1   
$EndComp
$Comp
L R_Small R?
U 1 1 5AD9F698
P 6600 4050
F 0 "R?" H 6475 4025 50  0000 L CNN
F 1 "2R" V 6600 4000 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6600 4050 50  0001 C CNN
F 3 "" H 6600 4050 50  0001 C CNN
	1    6600 4050
	-1   0    0    1   
$EndComp
$Comp
L R_Small R?
U 1 1 5AD9F69E
P 6900 4050
F 0 "R?" H 6775 4025 50  0000 L CNN
F 1 "2R" V 6900 4000 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6900 4050 50  0001 C CNN
F 3 "" H 6900 4050 50  0001 C CNN
	1    6900 4050
	-1   0    0    1   
$EndComp
Entry Wire Line
	5650 4600 5750 4500
Text Label 5750 4500 0    60   ~ 0
R4
Entry Wire Line
	5650 4500 5750 4400
Text Label 5750 4400 0    60   ~ 0
R3
Entry Wire Line
	5650 4400 5750 4300
Text Label 5750 4300 0    60   ~ 0
R2
Entry Wire Line
	5650 4300 5750 4200
Text Label 5750 4200 0    60   ~ 0
R1
Entry Wire Line
	7050 3900 7150 4000
Text Label 6950 3900 0    60   ~ 0
VR
Entry Wire Line
	4000 9100 4100 9000
Entry Wire Line
	4000 10000 4100 9900
Text Label 4100 9900 0    60   ~ 0
V6
Entry Wire Line
	4000 9900 4100 9800
Text Label 4100 9800 0    60   ~ 0
V5
Entry Wire Line
	4000 9800 4100 9700
Text Label 4100 9700 0    60   ~ 0
V4
Entry Wire Line
	4000 9700 4100 9600
Text Label 4100 9600 0    60   ~ 0
V3
Entry Wire Line
	4000 9600 4100 9500
Text Label 4100 9500 0    60   ~ 0
V2
Entry Wire Line
	4000 9500 4100 9400
Text Label 4100 9400 0    60   ~ 0
V1
Entry Wire Line
	4000 9400 4100 9300
Text Label 4100 9300 0    60   ~ 0
V0
Entry Wire Line
	4000 9300 4100 9200
Text Label 4100 9200 0    60   ~ 0
U2
Entry Wire Line
	4000 9200 4100 9100
Text Label 4100 9100 0    60   ~ 0
U1
Text Label 4100 9000 0    60   ~ 0
U0
Entry Wire Line
	4000 10500 4100 10400
Text Label 4100 10400 0    60   ~ 0
F3
Entry Wire Line
	4000 10400 4100 10300
Text Label 4100 10300 0    60   ~ 0
F2
Entry Wire Line
	4000 10300 4100 10200
Text Label 4100 10200 0    60   ~ 0
F1
Entry Wire Line
	4000 10200 4100 10100
Text Label 4100 10100 0    60   ~ 0
F0
Entry Wire Line
	4000 10100 4100 10000
Text Label 4100 10000 0    60   ~ 0
V7
Entry Wire Line
	5550 9000 5650 9100
Text Label 5400 9000 0    60   ~ 0
VD0
Entry Wire Line
	5550 9100 5650 9200
Text Label 5400 9100 0    60   ~ 0
VD1
Entry Wire Line
	5550 9200 5650 9300
Text Label 5400 9200 0    60   ~ 0
VD2
Entry Wire Line
	5550 9300 5650 9400
Text Label 5400 9300 0    60   ~ 0
VD3
Entry Wire Line
	5550 9400 5650 9500
Text Label 5400 9400 0    60   ~ 0
VD4
Entry Wire Line
	5550 9500 5650 9600
Text Label 5400 9500 0    60   ~ 0
VD5
Entry Wire Line
	5550 9600 5650 9700
Text Label 5400 9600 0    60   ~ 0
VD6
Entry Wire Line
	5550 9700 5650 9800
Text Label 5400 9700 0    60   ~ 0
VD7
Entry Wire Line
	13750 5150 13850 5050
Text Label 13850 5050 0    60   ~ 0
S17
Entry Wire Line
	13750 5050 13850 4950
Text Label 13850 4950 0    60   ~ 0
S16
Entry Wire Line
	13750 4950 13850 4850
Text Label 13850 4850 0    60   ~ 0
MA15
Entry Wire Line
	13750 4850 13850 4750
Text Label 13850 4750 0    60   ~ 0
MA14
Entry Wire Line
	13750 4750 13850 4650
Text Label 13850 4650 0    60   ~ 0
MA13
Entry Wire Line
	13750 4650 13850 4550
Text Label 13850 4550 0    60   ~ 0
MA12
Entry Wire Line
	13750 4550 13850 4450
Text Label 13850 4450 0    60   ~ 0
MA11
Entry Wire Line
	13750 4450 13850 4350
Text Label 13850 4350 0    60   ~ 0
MA10
Entry Wire Line
	13750 4350 13850 4250
Text Label 13850 4250 0    60   ~ 0
MA9
Entry Wire Line
	13750 4250 13850 4150
Text Label 13850 4150 0    60   ~ 0
MA8
Entry Wire Line
	13750 4150 13850 4050
Text Label 13850 4050 0    60   ~ 0
MA7
Entry Wire Line
	13750 4050 13850 3950
Text Label 13850 3950 0    60   ~ 0
MA6
Entry Wire Line
	13750 3950 13850 3850
Text Label 13850 3850 0    60   ~ 0
MA5
Entry Wire Line
	13750 3850 13850 3750
Text Label 13850 3750 0    60   ~ 0
MA4
Entry Wire Line
	13750 3750 13850 3650
Text Label 13850 3650 0    60   ~ 0
MA3
Entry Wire Line
	13750 3650 13850 3550
Text Label 13850 3550 0    60   ~ 0
MA2
Entry Wire Line
	13750 3550 13850 3450
Text Label 13850 3450 0    60   ~ 0
MA1
Entry Wire Line
	13750 3450 13850 3350
Text Label 13850 3350 0    60   ~ 0
MA0
Entry Wire Line
	13750 5250 13850 5150
Text Label 13850 5150 0    60   ~ 0
MA19
$Comp
L KP11 DD?
U 1 1 5AE6D2F1
P 4850 8200
F 0 "DD?" H 4850 8700 60  0000 C CNN
F 1 "KP11" H 4850 7700 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-16_3.9x9.9mm_Pitch1.27mm" H 4750 8550 60  0001 C CNN
F 3 "" H 4750 8550 60  0001 C CNN
	1    4850 8200
	1    0    0    -1  
$EndComp
Entry Wire Line
	5550 7800 5650 7900
Entry Wire Line
	5550 7900 5650 8000
Text Label 5450 7900 0    60   ~ 0
U1
Entry Wire Line
	5550 8000 5650 8100
Text Label 5450 8000 0    60   ~ 0
U2
Entry Wire Line
	4000 8100 4100 8000
Text Label 4100 8000 0    60   ~ 0
Y2
Entry Wire Line
	4000 8000 4100 7900
Text Label 4100 7900 0    60   ~ 0
Y1
Entry Wire Line
	4000 7900 4100 7800
Entry Wire Line
	4000 8700 4100 8600
Text Label 4100 8600 0    60   ~ 0
PGD
Text Label 5450 7800 0    60   ~ 0
U0
Text Label 4100 7800 0    60   ~ 0
Y0
$Comp
L GND #PWR?
U 1 1 5AE81283
P 4350 8750
F 0 "#PWR?" H 4350 8500 50  0001 C CNN
F 1 "GND" H 4200 8700 50  0000 C CNN
F 2 "" H 4350 8750 50  0001 C CNN
F 3 "" H 4350 8750 50  0001 C CNN
	1    4350 8750
	1    0    0    -1  
$EndComp
$Comp
L ATF22V10 DD?
U 1 1 5AF1342D
P 1450 8550
F 0 "DD?" H 1450 9200 60  0000 C CNN
F 1 "ATF22V10" H 1550 8000 60  0000 C CNN
F 2 "" H 1450 8500 60  0001 C CNN
F 3 "" H 1450 8500 60  0001 C CNN
	1    1450 8550
	1    0    0    -1  
$EndComp
Entry Wire Line
	550  8100 650  8000
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
Text Label 650  8000 0    60   ~ 0
X0
Text Label 650  8100 0    60   ~ 0
X1
Text Label 650  8200 0    60   ~ 0
X2
Text Label 650  8300 0    60   ~ 0
X3
Text Label 650  8400 0    60   ~ 0
X4
Text Label 650  8500 0    60   ~ 0
X5
Text Label 650  8600 0    60   ~ 0
X6
Text Label 650  8700 0    60   ~ 0
X7
Text Label 650  8800 0    60   ~ 0
X8
Text Label 650  8900 0    60   ~ 0
X9
Text Label 650  9000 0    60   ~ 0
SR16
Text Label 650  9100 0    60   ~ 0
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
L ATF22V10 DD?
U 1 1 5AF332B1
P 1450 9900
F 0 "DD?" H 1450 10550 60  0000 C CNN
F 1 "ATF22V10" H 1550 9350 60  0000 C CNN
F 2 "" H 1450 9850 60  0001 C CNN
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
WE
Text Label 650  10450 0    60   ~ 0
BH
Text Label 2000 9350 0    60   ~ 0
YRn
Text Label 2050 9450 0    60   ~ 0
BL
Text Label 2050 9550 0    60   ~ 0
VS
$Comp
L IR35 DD?
U 1 1 5AB6FA54
P 3100 1100
F 0 "DD?" H 3100 1650 60  0000 C CNN
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
L IR35 DD?
U 1 1 5AF44584
P 3100 2200
F 0 "DD?" H 3100 2750 60  0000 C CNN
F 1 "IR35" H 3100 1750 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-20W_7.5x12.8mm_Pitch1.27mm" H 3050 2350 60  0001 C CNN
F 3 "" H 3050 2350 60  0001 C CNN
	1    3100 2200
	1    0    0    -1  
$EndComp
Entry Wire Line
	2350 2650 2250 2750
$Comp
L TEST_1P J?
U 1 1 5AFC3FD6
P 1950 10650
F 0 "J?" V 1875 10725 50  0000 C CNN
F 1 "25M" V 1950 10900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 2150 10650 50  0001 C CNN
F 3 "" H 2150 10650 50  0001 C CNN
	1    1950 10650
	0    -1   1    0   
$EndComp
$Comp
L TEST_1P J?
U 1 1 5AFC3FDC
P 1950 10800
F 0 "J?" V 1875 10875 50  0000 C CNN
F 1 "X0" V 1950 11025 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 2150 10800 50  0001 C CNN
F 3 "" H 2150 10800 50  0001 C CNN
	1    1950 10800
	0    -1   1    0   
$EndComp
$Comp
L TEST_1P J?
U 1 1 5AFC3FE2
P 1950 10950
F 0 "J?" V 1875 11025 50  0000 C CNN
F 1 "X4" V 1950 11175 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 2150 10950 50  0001 C CNN
F 3 "" H 2150 10950 50  0001 C CNN
	1    1950 10950
	0    -1   1    0   
$EndComp
Entry Wire Line
	2250 10750 2150 10650
Text Label 2150 10650 2    60   ~ 0
X0
Entry Wire Line
	2250 10900 2150 10800
Text Label 2150 10800 2    60   ~ 0
X2
Entry Wire Line
	2250 11050 2150 10950
Text Label 2150 10950 2    60   ~ 0
BEn
$Comp
L TEST_1P J?
U 1 1 5AFC4AE9
P 2550 9750
F 0 "J?" V 2475 9825 50  0000 C CNN
F 1 "25M" V 2550 10000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 2750 9750 50  0001 C CNN
F 3 "" H 2750 9750 50  0001 C CNN
	1    2550 9750
	0    1    1    0   
$EndComp
$Comp
L TEST_1P J?
U 1 1 5AFC4AEF
P 2550 9900
F 0 "J?" V 2475 9975 50  0000 C CNN
F 1 "X0" V 2550 10125 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 2750 9900 50  0001 C CNN
F 3 "" H 2750 9900 50  0001 C CNN
	1    2550 9900
	0    1    1    0   
$EndComp
$Comp
L TEST_1P J?
U 1 1 5AFC4AF5
P 2550 10050
F 0 "J?" V 2475 10125 50  0000 C CNN
F 1 "X4" V 2550 10275 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 2750 10050 50  0001 C CNN
F 3 "" H 2750 10050 50  0001 C CNN
	1    2550 10050
	0    1    1    0   
$EndComp
Entry Wire Line
	2250 9850 2350 9750
Text Label 2350 9750 0    60   ~ 0
XR1
Entry Wire Line
	2250 10000 2350 9900
Text Label 2350 9900 0    60   ~ 0
CL1
Entry Wire Line
	2250 10150 2350 10050
Text Label 2350 10050 0    60   ~ 0
VC
$Comp
L TEST_1P J?
U 1 1 5AFC4B04
P 3700 9750
F 0 "J?" V 3625 9825 50  0000 C CNN
F 1 "25M" V 3700 10000 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 3900 9750 50  0001 C CNN
F 3 "" H 3900 9750 50  0001 C CNN
	1    3700 9750
	0    -1   1    0   
$EndComp
$Comp
L TEST_1P J?
U 1 1 5AFC4B0A
P 3700 9900
F 0 "J?" V 3625 9975 50  0000 C CNN
F 1 "X0" V 3700 10125 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 3900 9900 50  0001 C CNN
F 3 "" H 3900 9900 50  0001 C CNN
	1    3700 9900
	0    -1   1    0   
$EndComp
$Comp
L TEST_1P J?
U 1 1 5AFC4B10
P 3700 10050
F 0 "J?" V 3625 10125 50  0000 C CNN
F 1 "X4" V 3700 10275 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 3900 10050 50  0001 C CNN
F 3 "" H 3900 10050 50  0001 C CNN
	1    3700 10050
	0    -1   1    0   
$EndComp
Entry Wire Line
	4000 9850 3900 9750
Text Label 3900 9750 2    60   ~ 0
CL0
Entry Wire Line
	4000 10000 3900 9900
Text Label 3900 9900 2    60   ~ 0
MCP
Entry Wire Line
	4000 10150 3900 10050
Text Label 3900 10050 2    60   ~ 0
BL
$Comp
L TEST_1P J?
U 1 1 5AFC4EB1
P 2550 10200
F 0 "J?" V 2475 10275 50  0000 C CNN
F 1 "25M" V 2550 10450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 2750 10200 50  0001 C CNN
F 3 "" H 2750 10200 50  0001 C CNN
	1    2550 10200
	0    1    1    0   
$EndComp
Entry Wire Line
	2250 10300 2350 10200
Text Label 2350 10200 0    60   ~ 0
YRn
$Comp
L TEST_1P J?
U 1 1 5AFC5A03
P 2550 9600
F 0 "J?" V 2475 9675 50  0000 C CNN
F 1 "25M" V 2550 9850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 2750 9600 50  0001 C CNN
F 3 "" H 2750 9600 50  0001 C CNN
	1    2550 9600
	0    1    1    0   
$EndComp
Entry Wire Line
	2250 9700 2350 9600
Text Label 2350 9600 0    60   ~ 0
HSP
$Comp
L TEST_1P J?
U 1 1 5AFC5A0C
P 3700 9600
F 0 "J?" V 3625 9675 50  0000 C CNN
F 1 "25M" V 3700 9850 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 3900 9600 50  0001 C CNN
F 3 "" H 3900 9600 50  0001 C CNN
	1    3700 9600
	0    -1   1    0   
$EndComp
Entry Wire Line
	4000 9700 3900 9600
Text Label 3900 9600 2    60   ~ 0
HS
$Comp
L ATF22V10 DD?
U 1 1 5AFCEC37
P 4850 7000
F 0 "DD?" H 4850 7650 60  0000 C CNN
F 1 "ATF22V10" H 4950 6450 60  0000 C CNN
F 2 "" H 4850 6950 60  0001 C CNN
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
	4000 8500 4100 8400
Text Label 4100 8400 0    60   ~ 0
FL2
Entry Wire Line
	4000 8400 4100 8300
Text Label 4100 8300 0    60   ~ 0
FL1
Entry Wire Line
	4000 8300 4100 8200
Text Label 4100 8200 0    60   ~ 0
FL0
$Comp
L 28C256 U?
U 1 1 5AFFDE7E
P 4800 9900
F 0 "U?" H 5000 10900 50  0000 C CNN
F 1 "28C256" H 4950 9000 50  0000 C CNN
F 2 "" H 4800 9900 50  0001 C CNN
F 3 "" H 4800 9900 50  0001 C CNN
	1    4800 9900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5B0059A2
P 4150 10850
F 0 "#PWR?" H 4150 10600 50  0001 C CNN
F 1 "GND" H 4275 10800 50  0000 C CNN
F 2 "" H 4150 10850 50  0001 C CNN
F 3 "" H 4150 10850 50  0001 C CNN
	1    4150 10850
	1    0    0    -1  
$EndComp
$Comp
L IR23 DD?
U 1 1 5B02416D
P 3100 3300
F 0 "DD?" H 3100 3850 60  0000 C CNN
F 1 "IR23" H 3100 2850 60  0000 C CNN
F 2 "" H 3050 3450 60  0001 C CNN
F 3 "" H 3050 3450 60  0001 C CNN
	1    3100 3300
	1    0    0    -1  
$EndComp
$Comp
L IR22 DD?
U 1 1 5B0267E7
P 3100 4400
F 0 "DD?" H 3100 4950 60  0000 C CNN
F 1 "IR22" H 3100 3950 60  0000 C CNN
F 2 "" H 3050 4550 60  0001 C CNN
F 3 "" H 3050 4550 60  0001 C CNN
	1    3100 4400
	1    0    0    -1  
$EndComp
$Comp
L IR22 DD?
U 1 1 5B02C736
P 3100 5500
F 0 "DD?" H 3100 6050 60  0000 C CNN
F 1 "IR22" H 3100 5050 60  0000 C CNN
F 2 "" H 3050 5650 60  0001 C CNN
F 3 "" H 3050 5650 60  0001 C CNN
	1    3100 5500
	1    0    0    -1  
$EndComp
$Comp
L IR22 DD?
U 1 1 5B02C88B
P 3100 6600
F 0 "DD?" H 3100 7150 60  0000 C CNN
F 1 "IR22" H 3100 6150 60  0000 C CNN
F 2 "" H 3050 6750 60  0001 C CNN
F 3 "" H 3050 6750 60  0001 C CNN
	1    3100 6600
	1    0    0    -1  
$EndComp
$Comp
L IR22 DD?
U 1 1 5B02D3E9
P 3100 7700
F 0 "DD?" H 3100 8250 60  0000 C CNN
F 1 "IR22" H 3100 7250 60  0000 C CNN
F 2 "" H 3050 7850 60  0001 C CNN
F 3 "" H 3050 7850 60  0001 C CNN
	1    3100 7700
	1    0    0    -1  
$EndComp
$Comp
L IR22 DD?
U 1 1 5B02DDCC
P 3100 8800
F 0 "DD?" H 3100 9350 60  0000 C CNN
F 1 "IR22" H 3100 8350 60  0000 C CNN
F 2 "" H 3050 8950 60  0001 C CNN
F 3 "" H 3050 8950 60  0001 C CNN
	1    3100 8800
	1    0    0    -1  
$EndComp
$Comp
L AP5 DD?
U 1 1 5B03F203
P 6450 1950
F 0 "DD?" H 6450 2500 60  0000 C CNN
F 1 "AP5" H 6450 1500 60  0000 C CNN
F 2 "" H 6400 2100 60  0001 C CNN
F 3 "" H 6400 2100 60  0001 C CNN
	1    6450 1950
	1    0    0    -1  
$EndComp
$Comp
L AP5 DD?
U 1 1 5B03FF2F
P 6450 3050
F 0 "DD?" H 6450 3600 60  0000 C CNN
F 1 "AP5" H 6450 2600 60  0000 C CNN
F 2 "" H 6400 3200 60  0001 C CNN
F 3 "" H 6400 3200 60  0001 C CNN
	1    6450 3050
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 5B043231
P 5850 4650
F 0 "R?" V 5775 4625 50  0000 L CNN
F 1 "2R" V 5850 4600 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 5850 4650 50  0001 C CNN
F 3 "" H 5850 4650 50  0001 C CNN
	1    5850 4650
	0    1    1    0   
$EndComp
$Comp
L R_Small R?
U 1 1 5B043237
P 6150 4650
F 0 "R?" V 6075 4625 50  0000 L CNN
F 1 "R" V 6150 4625 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6150 4650 50  0001 C CNN
F 3 "" H 6150 4650 50  0001 C CNN
	1    6150 4650
	0    1    1    0   
$EndComp
$Comp
L R_Small R?
U 1 1 5B04323D
P 6450 4650
F 0 "R?" V 6375 4625 50  0000 L CNN
F 1 "R" V 6450 4625 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6450 4650 50  0001 C CNN
F 3 "" H 6450 4650 50  0001 C CNN
	1    6450 4650
	0    1    1    0   
$EndComp
$Comp
L R_Small R?
U 1 1 5B043243
P 6750 4650
F 0 "R?" V 6675 4625 50  0000 L CNN
F 1 "R" V 6750 4625 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6750 4650 50  0001 C CNN
F 3 "" H 6750 4650 50  0001 C CNN
	1    6750 4650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5B043249
P 5750 4700
F 0 "#PWR?" H 5750 4450 50  0001 C CNN
F 1 "GND" H 5775 4550 50  0000 C CNN
F 2 "" H 5750 4700 50  0001 C CNN
F 3 "" H 5750 4700 50  0001 C CNN
	1    5750 4700
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 5B04324F
P 6000 4800
F 0 "R?" H 5875 4775 50  0000 L CNN
F 1 "2R" V 6000 4750 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6000 4800 50  0001 C CNN
F 3 "" H 6000 4800 50  0001 C CNN
	1    6000 4800
	-1   0    0    1   
$EndComp
$Comp
L R_Small R?
U 1 1 5B043255
P 6300 4800
F 0 "R?" H 6175 4775 50  0000 L CNN
F 1 "2R" V 6300 4750 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6300 4800 50  0001 C CNN
F 3 "" H 6300 4800 50  0001 C CNN
	1    6300 4800
	-1   0    0    1   
$EndComp
$Comp
L R_Small R?
U 1 1 5B04325B
P 6600 4800
F 0 "R?" H 6475 4775 50  0000 L CNN
F 1 "2R" V 6600 4750 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6600 4800 50  0001 C CNN
F 3 "" H 6600 4800 50  0001 C CNN
	1    6600 4800
	-1   0    0    1   
$EndComp
$Comp
L R_Small R?
U 1 1 5B043261
P 6900 4800
F 0 "R?" H 6775 4775 50  0000 L CNN
F 1 "2R" V 6900 4750 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6900 4800 50  0001 C CNN
F 3 "" H 6900 4800 50  0001 C CNN
	1    6900 4800
	-1   0    0    1   
$EndComp
Entry Wire Line
	5650 5350 5750 5250
Text Label 5750 5250 0    60   ~ 0
G4
Entry Wire Line
	5650 5250 5750 5150
Text Label 5750 5150 0    60   ~ 0
G3
Entry Wire Line
	5650 5150 5750 5050
Text Label 5750 5050 0    60   ~ 0
G2
Entry Wire Line
	5650 5050 5750 4950
Text Label 5750 4950 0    60   ~ 0
G1
Entry Wire Line
	7050 4650 7150 4750
Text Label 6950 4650 0    60   ~ 0
VG
$Comp
L R_Small R?
U 1 1 5B0436AA
P 5850 5400
F 0 "R?" V 5775 5375 50  0000 L CNN
F 1 "2R" V 5850 5350 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 5850 5400 50  0001 C CNN
F 3 "" H 5850 5400 50  0001 C CNN
	1    5850 5400
	0    1    1    0   
$EndComp
$Comp
L R_Small R?
U 1 1 5B0436B0
P 6150 5400
F 0 "R?" V 6075 5375 50  0000 L CNN
F 1 "R" V 6150 5375 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6150 5400 50  0001 C CNN
F 3 "" H 6150 5400 50  0001 C CNN
	1    6150 5400
	0    1    1    0   
$EndComp
$Comp
L R_Small R?
U 1 1 5B0436B6
P 6450 5400
F 0 "R?" V 6375 5375 50  0000 L CNN
F 1 "R" V 6450 5375 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6450 5400 50  0001 C CNN
F 3 "" H 6450 5400 50  0001 C CNN
	1    6450 5400
	0    1    1    0   
$EndComp
$Comp
L R_Small R?
U 1 1 5B0436BC
P 6750 5400
F 0 "R?" V 6675 5375 50  0000 L CNN
F 1 "R" V 6750 5375 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6750 5400 50  0001 C CNN
F 3 "" H 6750 5400 50  0001 C CNN
	1    6750 5400
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5B0436C2
P 5750 5450
F 0 "#PWR?" H 5750 5200 50  0001 C CNN
F 1 "GND" H 5775 5300 50  0000 C CNN
F 2 "" H 5750 5450 50  0001 C CNN
F 3 "" H 5750 5450 50  0001 C CNN
	1    5750 5450
	1    0    0    -1  
$EndComp
$Comp
L R_Small R?
U 1 1 5B0436C8
P 6000 5550
F 0 "R?" H 5875 5525 50  0000 L CNN
F 1 "2R" V 6000 5500 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6000 5550 50  0001 C CNN
F 3 "" H 6000 5550 50  0001 C CNN
	1    6000 5550
	-1   0    0    1   
$EndComp
$Comp
L R_Small R?
U 1 1 5B0436CE
P 6300 5550
F 0 "R?" H 6175 5525 50  0000 L CNN
F 1 "2R" V 6300 5500 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6300 5550 50  0001 C CNN
F 3 "" H 6300 5550 50  0001 C CNN
	1    6300 5550
	-1   0    0    1   
$EndComp
$Comp
L R_Small R?
U 1 1 5B0436D4
P 6600 5550
F 0 "R?" H 6475 5525 50  0000 L CNN
F 1 "2R" V 6600 5500 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6600 5550 50  0001 C CNN
F 3 "" H 6600 5550 50  0001 C CNN
	1    6600 5550
	-1   0    0    1   
$EndComp
$Comp
L R_Small R?
U 1 1 5B0436DA
P 6900 5550
F 0 "R?" H 6775 5525 50  0000 L CNN
F 1 "2R" V 6900 5500 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6900 5550 50  0001 C CNN
F 3 "" H 6900 5550 50  0001 C CNN
	1    6900 5550
	-1   0    0    1   
$EndComp
Entry Wire Line
	5650 6100 5750 6000
Text Label 5750 6000 0    60   ~ 0
B4
Entry Wire Line
	5650 6000 5750 5900
Text Label 5750 5900 0    60   ~ 0
B3
Entry Wire Line
	5650 5900 5750 5800
Text Label 5750 5800 0    60   ~ 0
B2
Entry Wire Line
	5650 5800 5750 5700
Text Label 5750 5700 0    60   ~ 0
B1
Entry Wire Line
	7050 5400 7150 5500
Text Label 6950 5400 0    60   ~ 0
VB
$Comp
L Conn_02x08_Counter_Clockwise J?
U 1 1 5B06F458
P 6350 8300
F 0 "J?" H 6400 8700 50  0000 C CNN
F 1 "GDS" H 6400 7800 50  0000 C CNN
F 2 "" H 6350 8300 50  0001 C CNN
F 3 "" H 6350 8300 50  0001 C CNN
	1    6350 8300
	1    0    0    -1  
$EndComp
Entry Wire Line
	7050 8000 7150 8100
Text Label 6900 8000 0    60   ~ 0
VD0
Entry Wire Line
	7050 8100 7150 8200
Text Label 6900 8100 0    60   ~ 0
VD1
Entry Wire Line
	7050 8200 7150 8300
Text Label 6900 8200 0    60   ~ 0
VD2
Entry Wire Line
	7050 8300 7150 8400
Text Label 6900 8300 0    60   ~ 0
VD3
Entry Wire Line
	7050 8400 7150 8500
Text Label 6900 8400 0    60   ~ 0
VD4
Entry Wire Line
	7050 8500 7150 8600
Text Label 6900 8500 0    60   ~ 0
VD5
Entry Wire Line
	7050 8600 7150 8700
Text Label 6900 8600 0    60   ~ 0
VD6
Entry Wire Line
	7050 8700 7150 8800
Text Label 6900 8700 0    60   ~ 0
VD7
Entry Wire Line
	5650 8700 5750 8600
Text Label 5750 8600 0    60   ~ 0
V6
Entry Wire Line
	5650 8600 5750 8500
Text Label 5750 8500 0    60   ~ 0
V5
Entry Wire Line
	5650 8500 5750 8400
Text Label 5750 8400 0    60   ~ 0
V4
Entry Wire Line
	5650 8400 5750 8300
Text Label 5750 8300 0    60   ~ 0
V3
Entry Wire Line
	5650 8300 5750 8200
Text Label 5750 8200 0    60   ~ 0
V2
Entry Wire Line
	5650 8200 5750 8100
Text Label 5750 8100 0    60   ~ 0
V1
Entry Wire Line
	5650 8100 5750 8000
Text Label 5750 8000 0    60   ~ 0
V0
Entry Wire Line
	5650 8800 5750 8700
Text Label 5750 8700 0    60   ~ 0
V7
$Comp
L 74AHC1G02 U?
U 1 1 5AF0E99E
P 6250 1000
F 0 "U?" H 6150 1150 50  0000 C CNN
F 1 "74AHC1G02" H 6250 850 50  0000 C CNN
F 2 "" H 6250 1000 50  0001 C CNN
F 3 "" H 6250 1000 50  0001 C CNN
	1    6250 1000
	1    0    0    -1  
$EndComp
$Comp
L 74AHC1G08 U?
U 1 1 5AF0EC42
P 6800 950
F 0 "U?" H 6700 1100 50  0000 C CNN
F 1 "74AHC1G08" H 6800 800 50  0000 C CNN
F 2 "" H 6800 950 50  0001 C CNN
F 3 "" H 6800 950 50  0001 C CNN
	1    6800 950 
	1    0    0    -1  
$EndComp
Entry Wire Line
	5650 1150 5750 1050
Text Label 5750 1050 0    60   ~ 0
VM4
Entry Wire Line
	5650 1050 5750 950 
Text Label 5750 950  0    60   ~ 0
VM2
Entry Wire Line
	5650 900  5750 800 
Text Label 5750 800  0    60   ~ 0
VM1
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
YR1
Text Label 2000 10050 0    60   ~ 0
YR2
Text Label 2000 10150 0    60   ~ 0
YR3
Entry Wire Line
	2150 10250 2250 10350
Text Label 2000 10250 0    60   ~ 0
YR4
Entry Wire Line
	2150 8900 2250 9000
Text Label 2000 8900 0    60   ~ 0
XR1
$Comp
L TEST_1P J?
U 1 1 5AF6B525
P 2550 10500
F 0 "J?" V 2475 10575 50  0000 C CNN
F 1 "25M" V 2550 10750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 2750 10500 50  0001 C CNN
F 3 "" H 2750 10500 50  0001 C CNN
	1    2550 10500
	0    1    1    0   
$EndComp
$Comp
L TEST_1P J?
U 1 1 5AF6B52B
P 2550 10650
F 0 "J?" V 2475 10725 50  0000 C CNN
F 1 "X0" V 2550 10875 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 2750 10650 50  0001 C CNN
F 3 "" H 2750 10650 50  0001 C CNN
	1    2550 10650
	0    1    1    0   
$EndComp
$Comp
L TEST_1P J?
U 1 1 5AF6B531
P 2550 10800
F 0 "J?" V 2475 10875 50  0000 C CNN
F 1 "X4" V 2550 11025 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 2750 10800 50  0001 C CNN
F 3 "" H 2750 10800 50  0001 C CNN
	1    2550 10800
	0    1    1    0   
$EndComp
Entry Wire Line
	2250 10600 2350 10500
Text Label 2350 10500 0    60   ~ 0
YR2
Entry Wire Line
	2250 10750 2350 10650
Text Label 2350 10650 0    60   ~ 0
YR4
Entry Wire Line
	2250 10900 2350 10800
Text Label 2350 10800 0    60   ~ 0
SL
$Comp
L TEST_1P J?
U 1 1 5AF6B540
P 3700 10500
F 0 "J?" V 3625 10575 50  0000 C CNN
F 1 "25M" V 3700 10750 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 3900 10500 50  0001 C CNN
F 3 "" H 3900 10500 50  0001 C CNN
	1    3700 10500
	0    -1   1    0   
$EndComp
$Comp
L TEST_1P J?
U 1 1 5AF6B546
P 3700 10650
F 0 "J?" V 3625 10725 50  0000 C CNN
F 1 "X0" V 3700 10875 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 3900 10650 50  0001 C CNN
F 3 "" H 3900 10650 50  0001 C CNN
	1    3700 10650
	0    -1   1    0   
$EndComp
$Comp
L TEST_1P J?
U 1 1 5AF6B54C
P 3700 10800
F 0 "J?" V 3625 10875 50  0000 C CNN
F 1 "X4" V 3700 11025 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 3900 10800 50  0001 C CNN
F 3 "" H 3900 10800 50  0001 C CNN
	1    3700 10800
	0    -1   1    0   
$EndComp
Entry Wire Line
	4000 10600 3900 10500
Text Label 3900 10500 2    60   ~ 0
YR3
Entry Wire Line
	4000 10750 3900 10650
Text Label 3900 10650 2    60   ~ 0
CE0
Entry Wire Line
	4000 10900 3900 10800
Text Label 3900 10800 2    60   ~ 0
SU
$Comp
L TEST_1P J?
U 1 1 5AF6B55B
P 2550 10350
F 0 "J?" V 2475 10425 50  0000 C CNN
F 1 "25M" V 2550 10600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 2750 10350 50  0001 C CNN
F 3 "" H 2750 10350 50  0001 C CNN
	1    2550 10350
	0    1    1    0   
$EndComp
Entry Wire Line
	2250 10450 2350 10350
Text Label 2350 10350 0    60   ~ 0
VS
$Comp
L TEST_1P J?
U 1 1 5AF6B564
P 3700 10350
F 0 "J?" V 3625 10425 50  0000 C CNN
F 1 "25M" V 3700 10600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 3900 10350 50  0001 C CNN
F 3 "" H 3900 10350 50  0001 C CNN
	1    3700 10350
	0    -1   1    0   
$EndComp
Entry Wire Line
	4000 10450 3900 10350
Text Label 3900 10350 2    60   ~ 0
YR1
$Comp
L TEST_1P J?
U 1 1 5AF6B7BD
P 3700 10200
F 0 "J?" V 3625 10275 50  0000 C CNN
F 1 "25M" V 3700 10450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 3900 10200 50  0001 C CNN
F 3 "" H 3900 10200 50  0001 C CNN
	1    3700 10200
	0    -1   1    0   
$EndComp
Entry Wire Line
	4000 10300 3900 10200
Text Label 3900 10200 2    60   ~ 0
FEN
$Comp
L TEST_1P J?
U 1 1 5AF6C7AB
P 2550 10950
F 0 "J?" V 2475 11025 50  0000 C CNN
F 1 "X4" V 2550 11175 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 2750 10950 50  0001 C CNN
F 3 "" H 2750 10950 50  0001 C CNN
	1    2550 10950
	0    1    1    0   
$EndComp
Entry Wire Line
	2250 11050 2350 10950
Text Label 2350 10950 0    60   ~ 0
WE
$Comp
L TEST_1P J?
U 1 1 5AF6C7B4
P 3700 10950
F 0 "J?" V 3625 11025 50  0000 C CNN
F 1 "X4" V 3700 11175 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.00mm" H 3900 10950 50  0001 C CNN
F 3 "" H 3900 10950 50  0001 C CNN
	1    3700 10950
	0    -1   1    0   
$EndComp
Entry Wire Line
	4000 11050 3900 10950
Text Label 3900 10950 2    60   ~ 0
OE
$Comp
L ATF22V10 DD?
U 1 1 5AF91BA7
P 6400 9750
F 0 "DD?" H 6400 10400 60  0000 C CNN
F 1 "ATF22V10" H 6500 9200 60  0000 C CNN
F 2 "" H 6400 9700 60  0001 C CNN
F 3 "" H 6400 9700 60  0001 C CNN
	1    6400 9750
	1    0    0    -1  
$EndComp
Entry Wire Line
	5650 9300 5750 9200
Entry Wire Line
	5650 9400 5750 9300
Entry Wire Line
	5650 9500 5750 9400
Entry Wire Line
	5650 9600 5750 9500
Entry Wire Line
	5650 9700 5750 9600
Entry Wire Line
	5650 9800 5750 9700
Entry Wire Line
	5650 9900 5750 9800
Entry Wire Line
	5650 10000 5750 9900
Entry Wire Line
	5650 10100 5750 10000
Entry Wire Line
	5650 10200 5750 10100
Entry Wire Line
	5650 10300 5750 10200
Entry Wire Line
	5650 10400 5750 10300
Entry Wire Line
	7050 9200 7150 9300
Entry Wire Line
	7050 9300 7150 9400
Entry Wire Line
	7050 9400 7150 9500
Entry Wire Line
	7050 9500 7150 9600
Entry Wire Line
	7050 9600 7150 9700
Entry Wire Line
	7050 9700 7150 9800
Entry Wire Line
	7050 9800 7150 9900
Entry Wire Line
	7050 9900 7150 10000
Entry Wire Line
	7050 10000 7150 10100
Text Label 5750 9200 0    60   ~ 0
VC
Text Label 5750 9300 0    60   ~ 0
VM4
Text Label 5750 9400 0    60   ~ 0
VB0
Text Label 5750 9500 0    60   ~ 0
VB1
Text Label 5750 9600 0    60   ~ 0
VA16
Text Label 5750 9700 0    60   ~ 0
VA17
Text Label 5750 9800 0    60   ~ 0
VA18
Text Label 5750 9900 0    60   ~ 0
VA19
Text Label 5750 10000 0    60   ~ 0
MW
Text Label 5750 10100 0    60   ~ 0
MR
Text Label 5750 10200 0    60   ~ 0
MCP
Text Label 5750 10300 0    60   ~ 0
WS
Text Label 6900 9200 0    60   ~ 0
S16
Text Label 6900 9300 0    60   ~ 0
S17
Text Label 6900 9400 0    60   ~ 0
CE0
Text Label 6900 9500 0    60   ~ 0
CE1
Text Label 6950 9600 0    60   ~ 0
SL
Text Label 6950 9700 0    60   ~ 0
SU
Text Label 6950 9800 0    60   ~ 0
WE
Text Label 6950 9900 0    60   ~ 0
OE
Text Label 6950 10000 0    60   ~ 0
B0
Entry Wire Line
	7050 10100 7150 10200
Text Label 6950 10100 0    60   ~ 0
B1
$Comp
L Conn_01x02 J?
U 1 1 5AFCDA70
P 6250 10800
F 0 "J?" H 6250 10900 50  0000 C CNN
F 1 "MEM_W" H 6450 10750 50  0000 C CNN
F 2 "" H 6250 10800 50  0001 C CNN
F 3 "" H 6250 10800 50  0001 C CNN
	1    6250 10800
	1    0    0    -1  
$EndComp
Entry Wire Line
	5650 10900 5750 10800
Text Label 5750 10800 0    60   ~ 0
WS
$Comp
L R_Small R?
U 1 1 5AFD1C9D
P 6200 10600
F 0 "R?" V 6125 10575 50  0000 L CNN
F 1 "1k" V 6200 10550 50  0000 L CNN
F 2 "Resistors_SMD:R_0805" H 6200 10600 50  0001 C CNN
F 3 "" H 6200 10600 50  0001 C CNN
	1    6200 10600
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR?
U 1 1 5AFD1CA3
P 6300 10600
F 0 "#PWR?" H 6300 10450 50  0001 C CNN
F 1 "VCC" V 6300 10775 50  0000 C CNN
F 2 "" H 6300 10600 50  0001 C CNN
F 3 "" H 6300 10600 50  0001 C CNN
	1    6300 10600
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5AFD2B37
P 6000 10950
F 0 "#PWR?" H 6000 10700 50  0001 C CNN
F 1 "GND" H 6125 10900 50  0000 C CNN
F 2 "" H 6000 10950 50  0001 C CNN
F 3 "" H 6000 10950 50  0001 C CNN
	1    6000 10950
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x12_Odd_Even J?
U 1 1 5AFEFDEE
P 8150 5700
F 0 "J?" H 8200 6300 50  0000 C CNN
F 1 "MEM1" H 8200 5000 50  0000 C CNN
F 2 "" H 8150 5700 50  0001 C CNN
F 3 "" H 8150 5700 50  0001 C CNN
	1    8150 5700
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x12_Odd_Even J?
U 1 1 5AFEFF45
P 8150 7050
F 0 "J?" H 8200 7650 50  0000 C CNN
F 1 "MEM2" H 8200 6350 50  0000 C CNN
F 2 "" H 8150 7050 50  0001 C CNN
F 3 "" H 8150 7050 50  0001 C CNN
	1    8150 7050
	1    0    0    -1  
$EndComp
Entry Wire Line
	7150 7450 7250 7350
Text Label 7250 7350 0    60   ~ 0
MD14
Entry Wire Line
	7150 7350 7250 7250
Text Label 7250 7250 0    60   ~ 0
MD12
Entry Wire Line
	7150 7250 7250 7150
Text Label 7250 7150 0    60   ~ 0
MD10
Entry Wire Line
	7150 7150 7250 7050
Text Label 7250 7050 0    60   ~ 0
MD8
Entry Wire Line
	7150 7050 7250 6950
Text Label 7250 6950 0    60   ~ 0
MD6
Entry Wire Line
	7150 6950 7250 6850
Text Label 7250 6850 0    60   ~ 0
MD4
Entry Wire Line
	7150 6850 7250 6750
Text Label 7250 6750 0    60   ~ 0
MD2
Entry Wire Line
	7150 6750 7250 6650
Text Label 7250 6650 0    60   ~ 0
MD0
Entry Wire Line
	7150 6300 7250 6200
Text Label 7250 6200 0    60   ~ 0
MA19
Entry Wire Line
	7150 6200 7250 6100
Text Label 7250 6100 0    60   ~ 0
S16
Entry Wire Line
	7150 6100 7250 6000
Text Label 7250 6000 0    60   ~ 0
MA14
Entry Wire Line
	7150 6000 7250 5900
Text Label 7250 5900 0    60   ~ 0
MA12
Entry Wire Line
	7150 5900 7250 5800
Text Label 7250 5800 0    60   ~ 0
MA10
Entry Wire Line
	7150 5800 7250 5700
Text Label 7250 5700 0    60   ~ 0
MA8
Entry Wire Line
	7150 5700 7250 5600
Text Label 7250 5600 0    60   ~ 0
MA6
Entry Wire Line
	7150 5600 7250 5500
Text Label 7250 5500 0    60   ~ 0
MA4
Entry Wire Line
	7150 5500 7250 5400
Text Label 7250 5400 0    60   ~ 0
MA2
Entry Wire Line
	7150 5400 7250 5300
Text Label 7250 5300 0    60   ~ 0
MA0
Entry Wire Line
	9100 5300 9200 5400
Text Label 8950 5300 0    60   ~ 0
MA1
Entry Wire Line
	9100 5400 9200 5500
Text Label 8950 5400 0    60   ~ 0
MA3
Entry Wire Line
	9100 5500 9200 5600
Text Label 8950 5500 0    60   ~ 0
MA5
Entry Wire Line
	9100 5600 9200 5700
Text Label 8950 5600 0    60   ~ 0
MA7
Entry Wire Line
	9100 5700 9200 5800
Text Label 8950 5700 0    60   ~ 0
MA9
Entry Wire Line
	9100 5800 9200 5900
Text Label 8900 5800 0    60   ~ 0
MA11
Entry Wire Line
	9100 5900 9200 6000
Text Label 8900 5900 0    60   ~ 0
MA13
Entry Wire Line
	9100 6000 9200 6100
Text Label 8900 6000 0    60   ~ 0
MA15
Entry Wire Line
	9100 6100 9200 6200
Text Label 8950 6100 0    60   ~ 0
S17
Entry Wire Line
	9100 6650 9200 6750
Text Label 8925 6650 0    60   ~ 0
MD1
Entry Wire Line
	9100 6750 9200 6850
Text Label 8925 6750 0    60   ~ 0
MD3
Entry Wire Line
	9100 6850 9200 6950
Text Label 8925 6850 0    60   ~ 0
MD5
Entry Wire Line
	9100 6950 9200 7050
Text Label 8925 6950 0    60   ~ 0
MD7
Entry Wire Line
	9100 7050 9200 7150
Text Label 8925 7050 0    60   ~ 0
MD9
Entry Wire Line
	9100 7150 9200 7250
Text Label 8900 7150 0    60   ~ 0
MD11
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
	12200 9600 12200 9700
Wire Wire Line
	12200 9300 12200 9400
Wire Wire Line
	12200 9350 15200 9350
Wire Wire Line
	15200 9350 15200 9400
Connection ~ 12200 9350
Wire Wire Line
	12200 9650 15200 9650
Wire Wire Line
	15200 9650 15200 9600
Connection ~ 12200 9650
Wire Wire Line
	12400 9400 12400 9350
Connection ~ 12400 9350
Wire Wire Line
	12600 9350 12600 9400
Connection ~ 12600 9350
Wire Wire Line
	12800 9350 12800 9400
Connection ~ 12800 9350
Wire Wire Line
	13000 9400 13000 9350
Connection ~ 13000 9350
Wire Wire Line
	13200 9400 13200 9350
Connection ~ 13200 9350
Wire Wire Line
	13400 9400 13400 9350
Connection ~ 13400 9350
Wire Wire Line
	13600 9400 13600 9350
Connection ~ 13600 9350
Wire Wire Line
	13800 9400 13800 9350
Connection ~ 13800 9350
Wire Wire Line
	14000 9400 14000 9350
Connection ~ 14000 9350
Wire Wire Line
	14200 9400 14200 9350
Connection ~ 14200 9350
Wire Wire Line
	14400 9400 14400 9350
Connection ~ 14400 9350
Wire Wire Line
	14600 9400 14600 9350
Connection ~ 14600 9350
Wire Wire Line
	14800 9400 14800 9350
Connection ~ 14800 9350
Wire Wire Line
	15000 9400 15000 9350
Connection ~ 15000 9350
Wire Wire Line
	15000 9600 15000 9650
Connection ~ 15000 9650
Wire Wire Line
	14800 9600 14800 9650
Connection ~ 14800 9650
Wire Wire Line
	14600 9600 14600 9650
Connection ~ 14600 9650
Wire Wire Line
	14400 9600 14400 9650
Connection ~ 14400 9650
Wire Wire Line
	14200 9600 14200 9650
Connection ~ 14200 9650
Wire Wire Line
	14000 9600 14000 9650
Connection ~ 14000 9650
Wire Wire Line
	13800 9600 13800 9650
Connection ~ 13800 9650
Wire Wire Line
	13600 9600 13600 9650
Connection ~ 13600 9650
Wire Wire Line
	13400 9600 13400 9650
Connection ~ 13400 9650
Wire Wire Line
	13200 9600 13200 9650
Connection ~ 13200 9650
Wire Wire Line
	13000 9600 13000 9650
Connection ~ 13000 9650
Wire Wire Line
	12800 9600 12800 9650
Connection ~ 12800 9650
Wire Wire Line
	12600 9600 12600 9650
Connection ~ 12600 9650
Wire Wire Line
	12400 9600 12400 9650
Connection ~ 12400 9650
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
	6000 6350 6000 7650
Wire Wire Line
	6000 7600 6050 7600
Connection ~ 6000 7600
Wire Wire Line
	6250 7600 6400 7600
Wire Wire Line
	6400 7600 6400 7550
Connection ~ 6000 6550
Connection ~ 6000 6750
Connection ~ 6000 7150
Connection ~ 6000 7250
Wire Wire Line
	11800 3250 12050 3250
Wire Wire Line
	11800 3150 12050 3150
Wire Wire Line
	11800 3050 12050 3050
Wire Wire Line
	11800 2950 12050 2950
Wire Wire Line
	11800 2850 12050 2850
Wire Wire Line
	11800 2650 12050 2650
Wire Wire Line
	11800 2550 12050 2550
Wire Wire Line
	11800 2450 12050 2450
Wire Wire Line
	11800 2350 12050 2350
Wire Wire Line
	11800 2250 12050 2250
Wire Wire Line
	11800 2150 12050 2150
Wire Wire Line
	11800 2050 12050 2050
Wire Wire Line
	11800 1950 12050 1950
Wire Wire Line
	11800 1850 12050 1850
Wire Wire Line
	11800 1750 12050 1750
Wire Wire Line
	11800 1650 12050 1650
Wire Wire Line
	11800 1550 12050 1550
Wire Wire Line
	11800 1450 12050 1450
Wire Wire Line
	11800 1350 12050 1350
Wire Wire Line
	11800 1250 12050 1250
Wire Wire Line
	11800 1150 12050 1150
Wire Wire Line
	11800 1050 12050 1050
Wire Wire Line
	11800 950  12050 950 
Wire Wire Line
	13450 950  13650 950 
Wire Wire Line
	13450 1050 13650 1050
Wire Wire Line
	13450 1150 13650 1150
Wire Wire Line
	13450 1250 13650 1250
Wire Wire Line
	13450 1350 13650 1350
Wire Wire Line
	13450 1450 13650 1450
Wire Wire Line
	13450 1550 13650 1550
Wire Wire Line
	13450 1650 13650 1650
Wire Wire Line
	13450 1750 13650 1750
Wire Wire Line
	13450 1850 13650 1850
Wire Wire Line
	13450 1950 13650 1950
Wire Wire Line
	13450 2050 13650 2050
Wire Wire Line
	13450 2150 13650 2150
Wire Wire Line
	13450 2250 13650 2250
Wire Wire Line
	13450 2350 13650 2350
Wire Wire Line
	13450 2450 13650 2450
Wire Wire Line
	8650 4100 9100 4100
Wire Wire Line
	8650 4200 9100 4200
Wire Wire Line
	8650 4300 9100 4300
Wire Wire Line
	7250 4900 7750 4900
Wire Wire Line
	7250 4100 7750 4100
Wire Wire Line
	7250 4200 7750 4200
Wire Wire Line
	7250 4300 7750 4300
Wire Wire Line
	7250 4500 7750 4500
Wire Wire Line
	7250 4600 7750 4600
Wire Wire Line
	7250 4700 7750 4700
Wire Wire Line
	8650 4400 9100 4400
Wire Wire Line
	7250 4400 7750 4400
Wire Wire Line
	7250 4800 7750 4800
Wire Wire Line
	8650 2950 9100 2950
Wire Wire Line
	8650 3050 9100 3050
Wire Wire Line
	8650 3150 9100 3150
Wire Wire Line
	7250 3750 7750 3750
Wire Wire Line
	7250 2950 7750 2950
Wire Wire Line
	7250 3050 7750 3050
Wire Wire Line
	7250 3150 7750 3150
Wire Wire Line
	7250 3350 7750 3350
Wire Wire Line
	7250 3450 7750 3450
Wire Wire Line
	7250 3550 7750 3550
Wire Wire Line
	8650 3250 9100 3250
Wire Wire Line
	7250 3250 7750 3250
Wire Wire Line
	7250 3650 7750 3650
Wire Wire Line
	8650 1800 9100 1800
Wire Wire Line
	8650 1900 9100 1900
Wire Wire Line
	8650 2000 9100 2000
Wire Wire Line
	7250 2600 7750 2600
Wire Wire Line
	7250 1800 7750 1800
Wire Wire Line
	7250 1900 7750 1900
Wire Wire Line
	7250 2000 7750 2000
Wire Wire Line
	7250 2200 7750 2200
Wire Wire Line
	7250 2300 7750 2300
Wire Wire Line
	7250 2400 7750 2400
Wire Wire Line
	8650 2100 9100 2100
Wire Wire Line
	7250 2100 7750 2100
Wire Wire Line
	7250 2500 7750 2500
Wire Wire Line
	8650 650  9100 650 
Wire Wire Line
	8650 750  9100 750 
Wire Wire Line
	8650 850  9100 850 
Wire Wire Line
	7250 1450 7750 1450
Wire Wire Line
	7250 650  7750 650 
Wire Wire Line
	7250 750  7750 750 
Wire Wire Line
	7250 850  7750 850 
Wire Wire Line
	7250 1050 7750 1050
Wire Wire Line
	7250 1150 7750 1150
Wire Wire Line
	7250 1250 7750 1250
Wire Wire Line
	8650 950  9100 950 
Wire Wire Line
	7250 950  7750 950 
Wire Wire Line
	7250 1350 7750 1350
Wire Wire Line
	11800 5850 12050 5850
Wire Wire Line
	11800 5750 12050 5750
Wire Wire Line
	11800 5650 12050 5650
Wire Wire Line
	11800 5550 12050 5550
Wire Wire Line
	11800 5450 12050 5450
Wire Wire Line
	11800 5250 12050 5250
Wire Wire Line
	11800 5150 12050 5150
Wire Wire Line
	11800 5050 12050 5050
Wire Wire Line
	11800 4950 12050 4950
Wire Wire Line
	11800 4850 12050 4850
Wire Wire Line
	11800 4750 12050 4750
Wire Wire Line
	11800 4650 12050 4650
Wire Wire Line
	11800 4550 12050 4550
Wire Wire Line
	11800 4450 12050 4450
Wire Wire Line
	11800 4350 12050 4350
Wire Wire Line
	11800 4250 12050 4250
Wire Wire Line
	11800 4150 12050 4150
Wire Wire Line
	11800 4050 12050 4050
Wire Wire Line
	11800 3950 12050 3950
Wire Wire Line
	11800 3850 12050 3850
Wire Wire Line
	11800 3750 12050 3750
Wire Wire Line
	11800 3650 12050 3650
Wire Wire Line
	11800 3550 12050 3550
Wire Wire Line
	13450 3550 13650 3550
Wire Wire Line
	13450 3650 13650 3650
Wire Wire Line
	13450 3750 13650 3750
Wire Wire Line
	13450 3850 13650 3850
Wire Wire Line
	13450 3950 13650 3950
Wire Wire Line
	13450 4050 13650 4050
Wire Wire Line
	13450 4150 13650 4150
Wire Wire Line
	13450 4250 13650 4250
Wire Wire Line
	13450 4350 13650 4350
Wire Wire Line
	13450 4450 13650 4450
Wire Wire Line
	13450 4550 13650 4550
Wire Wire Line
	13450 4650 13650 4650
Wire Wire Line
	13450 4750 13650 4750
Wire Wire Line
	13450 4850 13650 4850
Wire Wire Line
	13450 4950 13650 4950
Wire Wire Line
	13450 5050 13650 5050
Wire Wire Line
	7250 9900 7700 9900
Wire Wire Line
	7250 10000 7700 10000
Wire Wire Line
	7250 8000 7700 8000
Wire Wire Line
	7250 8100 7700 8100
Wire Wire Line
	7250 8200 7700 8200
Wire Wire Line
	7250 8300 7700 8300
Wire Wire Line
	7250 8400 7700 8400
Wire Wire Line
	7250 8500 7700 8500
Wire Wire Line
	7250 8600 7700 8600
Wire Wire Line
	7250 8700 7700 8700
Wire Wire Line
	7250 8800 7700 8800
Wire Wire Line
	7250 8900 7700 8900
Wire Wire Line
	8700 8000 9100 8000
Wire Wire Line
	9100 8100 8700 8100
Wire Wire Line
	8700 8200 9100 8200
Wire Wire Line
	9100 8300 8700 8300
Wire Wire Line
	8700 8400 9100 8400
Wire Wire Line
	8700 8500 9100 8500
Wire Wire Line
	9100 8600 8700 8600
Wire Wire Line
	8700 8700 9100 8700
Wire Wire Line
	7250 9100 7700 9100
Wire Wire Line
	7250 9200 7700 9200
Wire Wire Line
	7250 9300 7700 9300
Wire Wire Line
	7250 9400 7700 9400
Wire Wire Line
	7250 9500 7700 9500
Wire Wire Line
	7250 9600 7700 9600
Wire Wire Line
	7250 9700 7700 9700
Wire Wire Line
	7250 9800 7700 9800
Wire Wire Line
	8700 9100 9100 9100
Wire Wire Line
	9100 9200 8700 9200
Wire Wire Line
	8700 9300 9100 9300
Wire Wire Line
	9100 9400 8700 9400
Wire Wire Line
	8700 9500 9100 9500
Wire Wire Line
	9100 9600 8700 9600
Wire Wire Line
	8700 9700 9100 9700
Wire Wire Line
	9100 9800 8700 9800
Wire Wire Line
	9300 2550 9900 2550
Wire Wire Line
	9300 2350 9900 2350
Wire Wire Line
	9450 2250 9900 2250
Wire Wire Line
	9300 2150 9900 2150
Wire Wire Line
	9300 2050 9900 2050
Wire Wire Line
	9300 1950 9900 1950
Wire Wire Line
	9300 1850 9900 1850
Wire Wire Line
	9300 1750 9900 1750
Wire Wire Line
	9300 1650 9900 1650
Wire Wire Line
	9300 1450 9900 1450
Wire Wire Line
	9300 1250 9900 1250
Wire Wire Line
	9300 1050 9900 1050
Wire Wire Line
	9300 850  9900 850 
Wire Wire Line
	9300 3850 9900 3850
Wire Wire Line
	9300 3650 9900 3650
Wire Wire Line
	9300 3450 9900 3450
Wire Wire Line
	9300 3350 9900 3350
Wire Wire Line
	9300 3250 9900 3250
Wire Wire Line
	9300 3150 9900 3150
Wire Wire Line
	9300 3050 9900 3050
Wire Wire Line
	9300 2950 9900 2950
Wire Wire Line
	9300 2850 9900 2850
Wire Wire Line
	9300 2750 9900 2750
Wire Wire Line
	9300 2650 9900 2650
Wire Wire Line
	10400 2450 10900 2450
Wire Wire Line
	10400 2350 10900 2350
Wire Wire Line
	10400 2250 10900 2250
Wire Wire Line
	10400 2150 10900 2150
Wire Wire Line
	10400 2050 10900 2050
Wire Wire Line
	10400 1950 10900 1950
Wire Wire Line
	10400 1850 10900 1850
Wire Wire Line
	10400 1750 10900 1750
Wire Wire Line
	10400 1650 10900 1650
Wire Wire Line
	10400 1550 10900 1550
Wire Wire Line
	10400 1450 10900 1450
Wire Wire Line
	10400 1350 10900 1350
Wire Wire Line
	10400 1250 10900 1250
Wire Wire Line
	10400 1150 10900 1150
Wire Wire Line
	10400 1050 10900 1050
Wire Wire Line
	10400 950  10900 950 
Wire Wire Line
	10400 850  10900 850 
Wire Wire Line
	10400 3850 10900 3850
Wire Wire Line
	10400 3750 10900 3750
Wire Wire Line
	10400 3650 10900 3650
Wire Wire Line
	10400 3550 10900 3550
Wire Wire Line
	10400 3450 10900 3450
Wire Wire Line
	10400 3350 10900 3350
Wire Wire Line
	10400 3250 10900 3250
Wire Wire Line
	10400 3150 10900 3150
Wire Wire Line
	10400 3050 10900 3050
Wire Wire Line
	10400 2950 10900 2950
Wire Wire Line
	10400 2850 10900 2850
Wire Wire Line
	10400 2750 10900 2750
Wire Wire Line
	10400 2650 10900 2650
Wire Wire Line
	10400 2550 10900 2550
Wire Wire Line
	9300 4200 9900 4200
Wire Wire Line
	9300 5200 9900 5200
Wire Wire Line
	9300 5100 9900 5100
Wire Wire Line
	9300 5000 9900 5000
Wire Wire Line
	9300 4900 9900 4900
Wire Wire Line
	9300 4800 9900 4800
Wire Wire Line
	9300 4700 9900 4700
Wire Wire Line
	9300 4600 9900 4600
Wire Wire Line
	9300 4400 9900 4400
Wire Wire Line
	9300 4300 9900 4300
Wire Wire Line
	9300 4500 9900 4500
Wire Wire Line
	9300 5300 9900 5300
Wire Wire Line
	9300 5800 9900 5800
Wire Wire Line
	9300 5700 9900 5700
Wire Wire Line
	9300 5500 9900 5500
Wire Wire Line
	9300 5400 9900 5400
Wire Wire Line
	9300 5600 9900 5600
Wire Bus Line
	25350 9400 21050 9400
Wire Bus Line
	21050 9400 21050 10800
Wire Wire Line
	15450 950  15650 950 
Wire Wire Line
	15450 1050 15650 1050
Wire Wire Line
	15450 1150 15650 1150
Wire Wire Line
	15450 1250 15650 1250
Wire Wire Line
	15450 1350 15650 1350
Wire Wire Line
	15450 1450 15650 1450
Wire Wire Line
	15450 1550 15650 1550
Wire Wire Line
	15450 1650 15650 1650
Wire Wire Line
	650  10650 850  10650
Wire Wire Line
	650  10800 850  10800
Wire Wire Line
	650  10950 850  10950
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
	5750 1800 6000 1800
Wire Wire Line
	5750 1700 6000 1700
Wire Wire Line
	5750 1600 6000 1600
Wire Wire Line
	5750 1500 6000 1500
Wire Wire Line
	5750 2300 6000 2300
Wire Wire Line
	5750 2200 6000 2200
Wire Wire Line
	5750 2100 6000 2100
Wire Wire Line
	5750 2000 6000 2000
Wire Wire Line
	5950 2400 6000 2400
Connection ~ 5950 2400
Wire Wire Line
	5750 2900 6000 2900
Wire Wire Line
	5750 2800 6000 2800
Wire Wire Line
	5750 2700 6000 2700
Wire Wire Line
	5750 2600 6000 2600
Wire Wire Line
	5950 3500 6000 3500
Wire Wire Line
	5750 4500 6900 4500
Wire Wire Line
	5750 4400 6600 4400
Wire Wire Line
	5750 4300 6300 4300
Wire Wire Line
	5750 4200 6000 4200
Wire Wire Line
	5750 3900 5750 3950
Wire Wire Line
	5950 3900 6050 3900
Wire Wire Line
	6000 3950 6000 3900
Connection ~ 6000 3900
Wire Wire Line
	6250 3900 6350 3900
Wire Wire Line
	6300 3950 6300 3900
Connection ~ 6300 3900
Wire Wire Line
	6550 3900 6650 3900
Wire Wire Line
	6600 3950 6600 3900
Connection ~ 6600 3900
Wire Wire Line
	6900 3950 6900 3900
Connection ~ 6900 3900
Wire Wire Line
	6850 3900 7050 3900
Wire Wire Line
	6000 4200 6000 4150
Wire Wire Line
	6300 4300 6300 4150
Wire Wire Line
	6600 4400 6600 4150
Wire Wire Line
	6900 4500 6900 4150
Wire Wire Line
	4300 2900 4300 3325
Wire Wire Line
	15450 3350 15650 3350
Wire Wire Line
	15450 3450 15650 3450
Wire Wire Line
	15450 3550 15650 3550
Wire Wire Line
	15450 3650 15650 3650
Wire Wire Line
	15450 3750 15650 3750
Wire Wire Line
	15450 3850 15650 3850
Wire Wire Line
	15450 3950 15650 3950
Wire Wire Line
	15450 4050 15650 4050
Wire Wire Line
	13850 5500 14050 5500
Wire Wire Line
	14050 5400 13850 5400
Wire Wire Line
	13850 5300 14050 5300
Wire Wire Line
	13850 3100 14050 3100
Wire Wire Line
	14050 3000 13850 3000
Wire Wire Line
	13850 2900 14050 2900
Wire Wire Line
	13850 950  14050 950 
Wire Wire Line
	13850 1050 14050 1050
Wire Wire Line
	14050 1150 13850 1150
Wire Wire Line
	13850 1250 14050 1250
Wire Wire Line
	14050 1350 13850 1350
Wire Wire Line
	13850 1450 14050 1450
Wire Wire Line
	13850 1550 14050 1550
Wire Wire Line
	14050 1650 13850 1650
Wire Wire Line
	13850 1750 14050 1750
Wire Wire Line
	13850 1850 14050 1850
Wire Wire Line
	13850 1950 14050 1950
Wire Wire Line
	14050 2050 13850 2050
Wire Wire Line
	13850 2150 14050 2150
Wire Wire Line
	14050 2250 13850 2250
Wire Wire Line
	13850 2350 14050 2350
Wire Wire Line
	13850 2450 14050 2450
Wire Wire Line
	13850 2550 14050 2550
Wire Wire Line
	13850 2650 14050 2650
Wire Wire Line
	14050 2750 13850 2750
Wire Wire Line
	13850 3350 14050 3350
Wire Wire Line
	13850 3450 14050 3450
Wire Wire Line
	14050 3550 13850 3550
Wire Wire Line
	13850 3650 14050 3650
Wire Wire Line
	14050 3750 13850 3750
Wire Wire Line
	13850 3850 14050 3850
Wire Wire Line
	13850 3950 14050 3950
Wire Wire Line
	14050 4050 13850 4050
Wire Wire Line
	13850 4150 14050 4150
Wire Wire Line
	13850 4250 14050 4250
Wire Wire Line
	13850 4350 14050 4350
Wire Wire Line
	14050 4450 13850 4450
Wire Wire Line
	13850 4550 14050 4550
Wire Wire Line
	14050 4650 13850 4650
Wire Wire Line
	13850 4750 14050 4750
Wire Wire Line
	13850 4850 14050 4850
Wire Wire Line
	13850 4950 14050 4950
Wire Wire Line
	13850 5050 14050 5050
Wire Wire Line
	14050 5150 13850 5150
Wire Wire Line
	5400 9700 5550 9700
Wire Wire Line
	5550 9600 5400 9600
Wire Wire Line
	5400 9500 5550 9500
Wire Wire Line
	5400 9400 5550 9400
Wire Wire Line
	5550 9300 5400 9300
Wire Wire Line
	5400 9200 5550 9200
Wire Wire Line
	5400 9100 5550 9100
Wire Wire Line
	5400 9000 5550 9000
Wire Wire Line
	4100 9000 4200 9000
Wire Wire Line
	4100 9100 4200 9100
Wire Wire Line
	4100 9200 4200 9200
Wire Wire Line
	4100 9300 4200 9300
Wire Wire Line
	4100 9400 4200 9400
Wire Wire Line
	4100 9500 4200 9500
Wire Wire Line
	4100 9600 4200 9600
Wire Wire Line
	4100 9700 4200 9700
Wire Wire Line
	4100 9800 4200 9800
Wire Wire Line
	4100 9900 4200 9900
Wire Wire Line
	4100 10000 4200 10000
Wire Wire Line
	4100 10100 4200 10100
Wire Wire Line
	4100 10200 4200 10200
Wire Wire Line
	4100 10300 4200 10300
Wire Wire Line
	4100 10400 4200 10400
Wire Wire Line
	6900 1500 7050 1500
Wire Wire Line
	4400 8700 4350 8700
Wire Wire Line
	6900 1600 7050 1600
Wire Wire Line
	7050 1700 6900 1700
Wire Wire Line
	6900 1800 7050 1800
Wire Wire Line
	7050 1900 6900 1900
Wire Wire Line
	6900 2000 7050 2000
Wire Wire Line
	6900 2100 7050 2100
Wire Wire Line
	6900 2200 7050 2200
Wire Wire Line
	6900 2600 7050 2600
Wire Wire Line
	6900 2700 7050 2700
Wire Wire Line
	7050 2800 6900 2800
Wire Wire Line
	6900 2900 7050 2900
Wire Wire Line
	10400 4200 10900 4200
Wire Wire Line
	10400 4300 10900 4300
Wire Wire Line
	10400 4400 10900 4400
Wire Wire Line
	10400 4500 10900 4500
Wire Wire Line
	10400 4600 10900 4600
Wire Wire Line
	10400 4700 10900 4700
Wire Wire Line
	10400 4800 10900 4800
Wire Wire Line
	10400 4900 10900 4900
Wire Wire Line
	10400 5000 10900 5000
Wire Wire Line
	10400 5100 10900 5100
Wire Wire Line
	10400 5200 10900 5200
Wire Wire Line
	10400 5300 10900 5300
Wire Wire Line
	10400 5400 10900 5400
Wire Wire Line
	10400 5500 10900 5500
Wire Wire Line
	10400 5600 10900 5600
Wire Wire Line
	10400 5700 10900 5700
Wire Wire Line
	10400 5800 10900 5800
Wire Wire Line
	650  8000 950  8000
Wire Wire Line
	950  8100 650  8100
Wire Wire Line
	650  8200 950  8200
Wire Wire Line
	950  8300 650  8300
Wire Wire Line
	650  8400 950  8400
Wire Wire Line
	950  8500 650  8500
Wire Wire Line
	650  8600 950  8600
Wire Wire Line
	950  8700 650  8700
Wire Wire Line
	650  8800 950  8800
Wire Wire Line
	650  8900 950  8900
Wire Wire Line
	950  9000 650  9000
Wire Wire Line
	650  9100 950  9100
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
	2150 10650 1950 10650
Wire Wire Line
	2150 10800 1950 10800
Wire Wire Line
	2150 10950 1950 10950
Wire Wire Line
	2350 9750 2550 9750
Wire Wire Line
	2350 9900 2550 9900
Wire Wire Line
	2350 10050 2550 10050
Wire Wire Line
	3900 9750 3700 9750
Wire Wire Line
	3900 9900 3700 9900
Wire Wire Line
	3900 10050 3700 10050
Wire Wire Line
	2350 10200 2550 10200
Wire Wire Line
	2350 9600 2550 9600
Wire Wire Line
	3900 9600 3700 9600
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
	4100 7800 4400 7800
Wire Wire Line
	4400 7900 4100 7900
Wire Wire Line
	4100 8000 4400 8000
Wire Wire Line
	4100 8600 4400 8600
Wire Wire Line
	5300 7800 5550 7800
Wire Wire Line
	5550 7900 5300 7900
Wire Wire Line
	5300 8000 5550 8000
Wire Wire Line
	4350 8700 4350 8750
Wire Wire Line
	4100 8200 4400 8200
Wire Wire Line
	4400 8300 4100 8300
Wire Wire Line
	4100 8400 4400 8400
Wire Wire Line
	4150 10600 4150 10850
Wire Wire Line
	4150 10700 4200 10700
Wire Wire Line
	4200 10800 4150 10800
Connection ~ 4150 10800
Wire Wire Line
	4200 10600 4150 10600
Connection ~ 4150 10700
Wire Bus Line
	5650 900  5650 11150
Wire Wire Line
	5950 1300 5950 3500
Wire Wire Line
	5950 1900 6000 1900
Wire Wire Line
	5950 3000 6000 3000
Wire Wire Line
	5750 5250 6900 5250
Wire Wire Line
	5750 5150 6600 5150
Wire Wire Line
	5750 5050 6300 5050
Wire Wire Line
	5750 4950 6000 4950
Wire Wire Line
	5750 4650 5750 4700
Wire Wire Line
	5950 4650 6050 4650
Wire Wire Line
	6000 4700 6000 4650
Connection ~ 6000 4650
Wire Wire Line
	6250 4650 6350 4650
Wire Wire Line
	6300 4700 6300 4650
Connection ~ 6300 4650
Wire Wire Line
	6550 4650 6650 4650
Wire Wire Line
	6600 4700 6600 4650
Connection ~ 6600 4650
Wire Wire Line
	6900 4700 6900 4650
Connection ~ 6900 4650
Wire Wire Line
	6850 4650 7050 4650
Wire Wire Line
	6000 4950 6000 4900
Wire Wire Line
	6300 5050 6300 4900
Wire Wire Line
	6600 5150 6600 4900
Wire Wire Line
	6900 5250 6900 4900
Wire Wire Line
	5750 6000 6900 6000
Wire Wire Line
	5750 5900 6600 5900
Wire Wire Line
	5750 5800 6300 5800
Wire Wire Line
	5750 5700 6000 5700
Wire Wire Line
	5750 5400 5750 5450
Wire Wire Line
	5950 5400 6050 5400
Wire Wire Line
	6000 5450 6000 5400
Connection ~ 6000 5400
Wire Wire Line
	6250 5400 6350 5400
Wire Wire Line
	6300 5450 6300 5400
Connection ~ 6300 5400
Wire Wire Line
	6550 5400 6650 5400
Wire Wire Line
	6600 5450 6600 5400
Connection ~ 6600 5400
Wire Wire Line
	6900 5450 6900 5400
Connection ~ 6900 5400
Wire Wire Line
	6850 5400 7050 5400
Wire Wire Line
	6000 5700 6000 5650
Wire Wire Line
	6300 5800 6300 5650
Wire Wire Line
	6600 5900 6600 5650
Wire Wire Line
	6900 6000 6900 5650
Wire Wire Line
	7050 6850 6900 6850
Wire Wire Line
	6900 7050 7050 7050
Wire Wire Line
	6100 7250 6000 7250
Wire Wire Line
	6000 7150 6100 7150
Wire Wire Line
	6100 6850 5750 6850
Wire Wire Line
	6000 6750 6100 6750
Wire Wire Line
	6100 6650 5750 6650
Wire Wire Line
	6000 6550 6100 6550
Wire Wire Line
	6100 6450 5750 6450
Wire Wire Line
	6000 6350 6100 6350
Wire Bus Line
	7150 750  7150 11150
Wire Wire Line
	6650 8700 7050 8700
Wire Wire Line
	6650 8600 7050 8600
Wire Wire Line
	6650 8500 7050 8500
Wire Wire Line
	6650 8400 7050 8400
Wire Wire Line
	6650 8300 7050 8300
Wire Wire Line
	6650 8200 7050 8200
Wire Wire Line
	6650 8100 7050 8100
Wire Wire Line
	6650 8000 7050 8000
Wire Wire Line
	5750 8000 6150 8000
Wire Wire Line
	5750 8100 6150 8100
Wire Wire Line
	5750 8200 6150 8200
Wire Wire Line
	5750 8300 6150 8300
Wire Wire Line
	5750 8400 6150 8400
Wire Wire Line
	5750 8500 6150 8500
Wire Wire Line
	5750 8600 6150 8600
Wire Wire Line
	5750 8700 6150 8700
Wire Wire Line
	1850 1150 2150 1150
Wire Wire Line
	5750 1050 5950 1050
Wire Wire Line
	5750 950  5950 950 
Wire Wire Line
	5750 800  6500 800 
Wire Wire Line
	6500 800  6500 900 
Connection ~ 5950 3000
Wire Wire Line
	5950 1300 7050 1300
Connection ~ 5950 1900
Wire Wire Line
	7050 1300 7050 950 
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
	2350 10500 2550 10500
Wire Wire Line
	2350 10650 2550 10650
Wire Wire Line
	2350 10800 2550 10800
Wire Wire Line
	3900 10500 3700 10500
Wire Wire Line
	3900 10650 3700 10650
Wire Wire Line
	3900 10800 3700 10800
Wire Wire Line
	2350 10350 2550 10350
Wire Wire Line
	3900 10350 3700 10350
Wire Wire Line
	3900 10200 3700 10200
Wire Wire Line
	2350 10950 2550 10950
Wire Wire Line
	3900 10950 3700 10950
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
	5750 9200 5900 9200
Wire Wire Line
	5900 9300 5750 9300
Wire Wire Line
	5750 9400 5900 9400
Wire Wire Line
	5900 9500 5750 9500
Wire Wire Line
	5750 9600 5900 9600
Wire Wire Line
	5900 9700 5750 9700
Wire Wire Line
	5750 9800 5900 9800
Wire Wire Line
	5900 9900 5750 9900
Wire Wire Line
	5750 10000 5900 10000
Wire Wire Line
	5750 10100 5900 10100
Wire Wire Line
	5900 10200 5750 10200
Wire Wire Line
	5750 10300 5900 10300
Wire Wire Line
	6900 10100 7050 10100
Wire Wire Line
	7050 10000 6900 10000
Wire Wire Line
	6900 9900 7050 9900
Wire Wire Line
	7050 9800 6900 9800
Wire Wire Line
	6900 9700 7050 9700
Wire Wire Line
	7050 9600 6900 9600
Wire Wire Line
	6900 9500 7050 9500
Wire Wire Line
	6900 9400 7050 9400
Wire Wire Line
	7050 9300 6900 9300
Wire Wire Line
	6900 9200 7050 9200
Wire Wire Line
	5750 10800 6050 10800
Wire Wire Line
	6100 10600 6000 10600
Wire Wire Line
	6000 10600 6000 10800
Connection ~ 6000 10800
Wire Wire Line
	6000 10950 6000 10900
Wire Wire Line
	6000 10900 6050 10900
Wire Bus Line
	9200 750  9200 11150
Wire Wire Line
	7250 7350 7950 7350
Wire Wire Line
	7250 7250 7950 7250
Wire Wire Line
	7250 7150 7950 7150
Wire Wire Line
	7250 7050 7950 7050
Wire Wire Line
	7250 6950 7950 6950
Wire Wire Line
	7250 6850 7950 6850
Wire Wire Line
	7250 6750 7950 6750
Wire Wire Line
	7250 6650 7950 6650
Wire Wire Line
	7250 6200 7950 6200
Wire Wire Line
	7250 6100 7950 6100
Wire Wire Line
	7250 6000 7950 6000
Wire Wire Line
	7250 5900 7950 5900
Wire Wire Line
	7250 5800 7950 5800
Wire Wire Line
	7250 5700 7950 5700
Wire Wire Line
	7250 5600 7950 5600
Wire Wire Line
	7250 5500 7950 5500
Wire Wire Line
	7250 5400 7950 5400
Wire Wire Line
	7250 5300 7950 5300
Wire Wire Line
	8450 5300 9100 5300
Wire Wire Line
	8450 5400 9100 5400
Wire Wire Line
	8450 5500 9100 5500
Wire Wire Line
	8450 5600 9100 5600
Wire Wire Line
	8450 5700 9100 5700
Wire Wire Line
	8450 5800 9100 5800
Wire Wire Line
	8450 5900 9100 5900
Wire Wire Line
	8450 6000 9100 6000
Wire Wire Line
	8450 6100 9100 6100
Wire Wire Line
	8450 6650 9100 6650
Wire Wire Line
	8450 6750 9100 6750
Wire Wire Line
	8450 6850 9100 6850
Wire Wire Line
	8450 6950 9100 6950
Wire Wire Line
	8450 7050 9100 7050
Wire Wire Line
	8450 7150 9100 7150
$Comp
L VCC #PWR?
U 1 1 5AFF94F3
P 8450 5200
F 0 "#PWR?" H 8450 5050 50  0001 C CNN
F 1 "VCC" V 8450 5375 50  0000 C CNN
F 2 "" H 8450 5200 50  0001 C CNN
F 3 "" H 8450 5200 50  0001 C CNN
	1    8450 5200
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR?
U 1 1 5AFF9BE6
P 7950 6300
F 0 "#PWR?" H 7950 6150 50  0001 C CNN
F 1 "VCC" V 7950 6475 50  0000 C CNN
F 2 "" H 7950 6300 50  0001 C CNN
F 3 "" H 7950 6300 50  0001 C CNN
	1    7950 6300
	0    -1   -1   0   
$EndComp
$Comp
L VCC #PWR?
U 1 1 5AFF9F21
P 8450 6200
F 0 "#PWR?" H 8450 6050 50  0001 C CNN
F 1 "VCC" V 8450 6375 50  0000 C CNN
F 2 "" H 8450 6200 50  0001 C CNN
F 3 "" H 8450 6200 50  0001 C CNN
	1    8450 6200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5AFFA504
P 7950 5200
F 0 "#PWR?" H 7950 4950 50  0001 C CNN
F 1 "GND" V 7950 5025 50  0000 C CNN
F 2 "" H 7950 5200 50  0001 C CNN
F 3 "" H 7950 5200 50  0001 C CNN
	1    7950 5200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5AFFAFB9
P 8450 6300
F 0 "#PWR?" H 8450 6050 50  0001 C CNN
F 1 "GND" V 8450 6125 50  0000 C CNN
F 2 "" H 8450 6300 50  0001 C CNN
F 3 "" H 8450 6300 50  0001 C CNN
	1    8450 6300
	0    -1   -1   0   
$EndComp
$Comp
L VCC #PWR?
U 1 1 5B00A3CC
P 8450 6550
F 0 "#PWR?" H 8450 6400 50  0001 C CNN
F 1 "VCC" V 8450 6725 50  0000 C CNN
F 2 "" H 8450 6550 50  0001 C CNN
F 3 "" H 8450 6550 50  0001 C CNN
	1    8450 6550
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5B00A56F
P 7950 6550
F 0 "#PWR?" H 7950 6300 50  0001 C CNN
F 1 "GND" V 7950 6375 50  0000 C CNN
F 2 "" H 7950 6550 50  0001 C CNN
F 3 "" H 7950 6550 50  0001 C CNN
	1    7950 6550
	0    1    1    0   
$EndComp
Entry Wire Line
	9100 7250 9200 7350
Text Label 8900 7250 0    60   ~ 0
MD13
Entry Wire Line
	9100 7350 9200 7450
Text Label 8900 7350 0    60   ~ 0
MD15
Entry Wire Line
	9100 7450 9200 7550
Text Label 9000 7450 0    60   ~ 0
WE
Entry Wire Line
	9100 7550 9200 7650
Text Label 9000 7550 0    60   ~ 0
SL
Entry Wire Line
	9100 7650 9200 7750
Text Label 8950 7650 0    60   ~ 0
CE1
Wire Wire Line
	8450 7250 9100 7250
Wire Wire Line
	8450 7350 9100 7350
Wire Wire Line
	8450 7450 9100 7450
Wire Wire Line
	8450 7550 9100 7550
Wire Wire Line
	8450 7650 9100 7650
Entry Wire Line
	7150 7750 7250 7650
Text Label 7250 7650 0    60   ~ 0
CE0
Entry Wire Line
	7150 7650 7250 7550
Text Label 7250 7550 0    60   ~ 0
SU
Entry Wire Line
	7150 7550 7250 7450
Text Label 7250 7450 0    60   ~ 0
OE
Wire Wire Line
	7250 7650 7950 7650
Wire Wire Line
	7250 7550 7950 7550
Wire Wire Line
	7250 7450 7950 7450
$Comp
L C_Small C?
U 1 1 5B037798
P 14400 8675
F 0 "C?" H 14410 8745 50  0000 L CNN
F 1 "0.1u" H 14410 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 14400 8675 50  0001 C CNN
F 3 "" H 14400 8675 50  0001 C CNN
	1    14400 8675
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5B03779E
P 14200 8675
F 0 "C?" H 14210 8745 50  0000 L CNN
F 1 "0.1u" H 14210 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 14200 8675 50  0001 C CNN
F 3 "" H 14200 8675 50  0001 C CNN
	1    14200 8675
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5B0377A4
P 14000 8675
F 0 "C?" H 14010 8745 50  0000 L CNN
F 1 "0.1u" H 14010 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 14000 8675 50  0001 C CNN
F 3 "" H 14000 8675 50  0001 C CNN
	1    14000 8675
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5B0377AA
P 13800 8675
F 0 "C?" H 13810 8745 50  0000 L CNN
F 1 "0.1u" H 13810 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 13800 8675 50  0001 C CNN
F 3 "" H 13800 8675 50  0001 C CNN
	1    13800 8675
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5B0377B0
P 13600 8675
F 0 "C?" H 13610 8745 50  0000 L CNN
F 1 "0.1u" H 13610 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 13600 8675 50  0001 C CNN
F 3 "" H 13600 8675 50  0001 C CNN
	1    13600 8675
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5B0377B6
P 13400 8675
F 0 "C?" H 13410 8745 50  0000 L CNN
F 1 "0.1u" H 13410 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 13400 8675 50  0001 C CNN
F 3 "" H 13400 8675 50  0001 C CNN
	1    13400 8675
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5B0377BC
P 13200 8675
F 0 "C?" H 13210 8745 50  0000 L CNN
F 1 "0.1u" H 13210 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 13200 8675 50  0001 C CNN
F 3 "" H 13200 8675 50  0001 C CNN
	1    13200 8675
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5B0377C2
P 13000 8675
F 0 "C?" H 13010 8745 50  0000 L CNN
F 1 "0.1u" H 13010 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 13000 8675 50  0001 C CNN
F 3 "" H 13000 8675 50  0001 C CNN
	1    13000 8675
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5B0377C8
P 12800 8675
F 0 "C?" H 12810 8745 50  0000 L CNN
F 1 "0.1u" H 12810 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 12800 8675 50  0001 C CNN
F 3 "" H 12800 8675 50  0001 C CNN
	1    12800 8675
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5B0377CE
P 12600 8675
F 0 "C?" H 12610 8745 50  0000 L CNN
F 1 "0.1u" H 12610 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 12600 8675 50  0001 C CNN
F 3 "" H 12600 8675 50  0001 C CNN
	1    12600 8675
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5B0377D4
P 12400 8675
F 0 "C?" H 12410 8745 50  0000 L CNN
F 1 "0.1u" H 12410 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 12400 8675 50  0001 C CNN
F 3 "" H 12400 8675 50  0001 C CNN
	1    12400 8675
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5B0377DA
P 12200 8675
F 0 "C?" H 12210 8745 50  0000 L CNN
F 1 "0.1u" H 12210 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 12200 8675 50  0001 C CNN
F 3 "" H 12200 8675 50  0001 C CNN
	1    12200 8675
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 5B0377E0
P 12200 8475
F 0 "#PWR?" H 12200 8325 50  0001 C CNN
F 1 "VCC" H 12200 8625 50  0000 C CNN
F 2 "" H 12200 8475 50  0001 C CNN
F 3 "" H 12200 8475 50  0001 C CNN
	1    12200 8475
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5B0377E6
P 12200 8875
F 0 "#PWR?" H 12200 8625 50  0001 C CNN
F 1 "GND" H 12200 8725 50  0000 C CNN
F 2 "" H 12200 8875 50  0001 C CNN
F 3 "" H 12200 8875 50  0001 C CNN
	1    12200 8875
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5B0377EC
P 15200 8675
F 0 "C?" H 15210 8745 50  0000 L CNN
F 1 "0.1u" H 15210 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 15200 8675 50  0001 C CNN
F 3 "" H 15200 8675 50  0001 C CNN
	1    15200 8675
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5B0377F2
P 15000 8675
F 0 "C?" H 15010 8745 50  0000 L CNN
F 1 "0.1u" H 15010 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 15000 8675 50  0001 C CNN
F 3 "" H 15000 8675 50  0001 C CNN
	1    15000 8675
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5B0377F8
P 14800 8675
F 0 "C?" H 14810 8745 50  0000 L CNN
F 1 "0.1u" H 14810 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 14800 8675 50  0001 C CNN
F 3 "" H 14800 8675 50  0001 C CNN
	1    14800 8675
	1    0    0    -1  
$EndComp
$Comp
L C_Small C?
U 1 1 5B0377FE
P 14600 8675
F 0 "C?" H 14610 8745 50  0000 L CNN
F 1 "0.1u" H 14610 8595 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 14600 8675 50  0001 C CNN
F 3 "" H 14600 8675 50  0001 C CNN
	1    14600 8675
	1    0    0    -1  
$EndComp
Wire Wire Line
	12200 8775 12200 8875
Wire Wire Line
	12200 8475 12200 8575
Wire Wire Line
	12200 8525 15200 8525
Wire Wire Line
	15200 8525 15200 8575
Connection ~ 12200 8525
Wire Wire Line
	12200 8825 15200 8825
Wire Wire Line
	15200 8825 15200 8775
Connection ~ 12200 8825
Wire Wire Line
	12400 8575 12400 8525
Connection ~ 12400 8525
Wire Wire Line
	12600 8525 12600 8575
Connection ~ 12600 8525
Wire Wire Line
	12800 8525 12800 8575
Connection ~ 12800 8525
Wire Wire Line
	13000 8575 13000 8525
Connection ~ 13000 8525
Wire Wire Line
	13200 8575 13200 8525
Connection ~ 13200 8525
Wire Wire Line
	13400 8575 13400 8525
Connection ~ 13400 8525
Wire Wire Line
	13600 8575 13600 8525
Connection ~ 13600 8525
Wire Wire Line
	13800 8575 13800 8525
Connection ~ 13800 8525
Wire Wire Line
	14000 8575 14000 8525
Connection ~ 14000 8525
Wire Wire Line
	14200 8575 14200 8525
Connection ~ 14200 8525
Wire Wire Line
	14400 8575 14400 8525
Connection ~ 14400 8525
Wire Wire Line
	14600 8575 14600 8525
Connection ~ 14600 8525
Wire Wire Line
	14800 8575 14800 8525
Connection ~ 14800 8525
Wire Wire Line
	15000 8575 15000 8525
Connection ~ 15000 8525
Wire Wire Line
	15000 8775 15000 8825
Connection ~ 15000 8825
Wire Wire Line
	14800 8775 14800 8825
Connection ~ 14800 8825
Wire Wire Line
	14600 8775 14600 8825
Connection ~ 14600 8825
Wire Wire Line
	14400 8775 14400 8825
Connection ~ 14400 8825
Wire Wire Line
	14200 8775 14200 8825
Connection ~ 14200 8825
Wire Wire Line
	14000 8775 14000 8825
Connection ~ 14000 8825
Wire Wire Line
	13800 8775 13800 8825
Connection ~ 13800 8825
Wire Wire Line
	13600 8775 13600 8825
Connection ~ 13600 8825
Wire Wire Line
	13400 8775 13400 8825
Connection ~ 13400 8825
Wire Wire Line
	13200 8775 13200 8825
Connection ~ 13200 8825
Wire Wire Line
	13000 8775 13000 8825
Connection ~ 13000 8825
Wire Wire Line
	12800 8775 12800 8825
Connection ~ 12800 8825
Wire Wire Line
	12600 8775 12600 8825
Connection ~ 12600 8825
Wire Wire Line
	12400 8775 12400 8825
Connection ~ 12400 8825
$Comp
L VCC #PWR?
U 1 1 5B037CF5
P 12200 7625
F 0 "#PWR?" H 12200 7475 50  0001 C CNN
F 1 "VCC" H 12200 7775 50  0000 C CNN
F 2 "" H 12200 7625 50  0001 C CNN
F 3 "" H 12200 7625 50  0001 C CNN
	1    12200 7625
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5B037CFB
P 12200 8025
F 0 "#PWR?" H 12200 7775 50  0001 C CNN
F 1 "GND" H 12200 7875 50  0000 C CNN
F 2 "" H 12200 8025 50  0001 C CNN
F 3 "" H 12200 8025 50  0001 C CNN
	1    12200 8025
	1    0    0    -1  
$EndComp
Wire Wire Line
	12200 7925 12200 8025
Wire Wire Line
	12200 7625 12200 7725
Wire Wire Line
	12200 7675 12800 7675
Connection ~ 12200 7675
Connection ~ 12200 7975
Wire Wire Line
	12400 7725 12400 7675
Connection ~ 12400 7675
Wire Wire Line
	12600 7675 12600 7725
Connection ~ 12600 7675
Wire Wire Line
	12400 7925 12400 7975
Connection ~ 12400 7975
Wire Wire Line
	12600 7975 12600 7925
Connection ~ 12600 7975
Wire Wire Line
	12200 7975 12800 7975
Wire Wire Line
	12800 7675 12800 7725
Wire Wire Line
	12800 7975 12800 7925
Wire Bus Line
	11000 950  11000 11150
Wire Bus Line
	11000 11150 550  11150
NoConn ~ 1900 3950
NoConn ~ 1900 4050
NoConn ~ 1900 4250
NoConn ~ 1050 1150
NoConn ~ 1900 7250
NoConn ~ 1900 7150
NoConn ~ 1900 7450
NoConn ~ 4400 8100
NoConn ~ 4400 8500
NoConn ~ 5300 8100
NoConn ~ 6000 3100
NoConn ~ 6000 3200
NoConn ~ 6000 3300
NoConn ~ 6000 3400
NoConn ~ 6900 3300
NoConn ~ 6900 3200
NoConn ~ 6900 3100
NoConn ~ 6900 3000
$Comp
L VCC #PWR?
U 1 1 5B080DD3
P 5950 6950
F 0 "#PWR?" H 5950 6800 50  0001 C CNN
F 1 "VCC" V 5950 7125 50  0000 C CNN
F 2 "" H 5950 6950 50  0001 C CNN
F 3 "" H 5950 6950 50  0001 C CNN
	1    5950 6950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 6950 5950 6950
NoConn ~ 6100 7050
NoConn ~ 6700 7250
NoConn ~ 6700 6650
NoConn ~ 6700 6450
$EndSCHEMATC
