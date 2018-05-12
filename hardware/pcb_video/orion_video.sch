EESchema Schematic File Version 2
LIBS:orion_video-rescue
LIBS:device
LIBS:power
LIBS:conn
LIBS:Lattice
LIBS:orion
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
P 11300 10700
F 0 "C30" H 11310 10770 50  0000 L CNN
F 1 "0.1u" H 11310 10620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 11300 10700 50  0001 C CNN
F 3 "" H 11300 10700 50  0001 C CNN
	1    11300 10700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C29
U 1 1 5AA81A69
P 11100 10700
F 0 "C29" H 11110 10770 50  0000 L CNN
F 1 "0.1u" H 11110 10620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 11100 10700 50  0001 C CNN
F 3 "" H 11100 10700 50  0001 C CNN
	1    11100 10700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C28
U 1 1 5AA81BBB
P 10900 10700
F 0 "C28" H 10910 10770 50  0000 L CNN
F 1 "0.1u" H 10910 10620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 10900 10700 50  0001 C CNN
F 3 "" H 10900 10700 50  0001 C CNN
	1    10900 10700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C27
U 1 1 5AA81D4C
P 10700 10700
F 0 "C27" H 10710 10770 50  0000 L CNN
F 1 "0.1u" H 10710 10620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 10700 10700 50  0001 C CNN
F 3 "" H 10700 10700 50  0001 C CNN
	1    10700 10700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C26
U 1 1 5AA81D52
P 10500 10700
F 0 "C26" H 10510 10770 50  0000 L CNN
F 1 "0.1u" H 10510 10620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 10500 10700 50  0001 C CNN
F 3 "" H 10500 10700 50  0001 C CNN
	1    10500 10700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C25
U 1 1 5AA81D58
P 10300 10700
F 0 "C25" H 10310 10770 50  0000 L CNN
F 1 "0.1u" H 10310 10620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 10300 10700 50  0001 C CNN
F 3 "" H 10300 10700 50  0001 C CNN
	1    10300 10700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C24
U 1 1 5AA8200E
P 10100 10700
F 0 "C24" H 10110 10770 50  0000 L CNN
F 1 "0.1u" H 10110 10620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 10100 10700 50  0001 C CNN
F 3 "" H 10100 10700 50  0001 C CNN
	1    10100 10700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C23
U 1 1 5AA82014
P 9900 10700
F 0 "C23" H 9910 10770 50  0000 L CNN
F 1 "0.1u" H 9910 10620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 9900 10700 50  0001 C CNN
F 3 "" H 9900 10700 50  0001 C CNN
	1    9900 10700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C22
U 1 1 5AA8201A
P 9700 10700
F 0 "C22" H 9710 10770 50  0000 L CNN
F 1 "0.1u" H 9710 10620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 9700 10700 50  0001 C CNN
F 3 "" H 9700 10700 50  0001 C CNN
	1    9700 10700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C21
U 1 1 5AA82020
P 9500 10700
F 0 "C21" H 9510 10770 50  0000 L CNN
F 1 "0.1u" H 9510 10620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 9500 10700 50  0001 C CNN
F 3 "" H 9500 10700 50  0001 C CNN
	1    9500 10700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C20
U 1 1 5AA82026
P 9300 10700
F 0 "C20" H 9310 10770 50  0000 L CNN
F 1 "0.1u" H 9310 10620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 9300 10700 50  0001 C CNN
F 3 "" H 9300 10700 50  0001 C CNN
	1    9300 10700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C19
U 1 1 5AA8202C
P 9100 10700
F 0 "C19" H 9110 10770 50  0000 L CNN
F 1 "0.1u" H 9110 10620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 9100 10700 50  0001 C CNN
F 3 "" H 9100 10700 50  0001 C CNN
	1    9100 10700
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C5
U 1 1 5AA837D1
P 9700 9050
F 0 "C5" H 9710 9120 50  0000 L CNN
F 1 "10u" H 9710 8970 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 9700 9050 50  0001 C CNN
F 3 "" H 9700 9050 50  0001 C CNN
	1    9700 9050
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C4
U 1 1 5AA83A53
P 9500 9050
F 0 "C4" H 9510 9120 50  0000 L CNN
F 1 "10u" H 9510 8970 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 9500 9050 50  0001 C CNN
F 3 "" H 9500 9050 50  0001 C CNN
	1    9500 9050
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C3
U 1 1 5AA83BE7
P 9300 9050
F 0 "C3" H 9310 9120 50  0000 L CNN
F 1 "10u" H 9310 8970 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 9300 9050 50  0001 C CNN
F 3 "" H 9300 9050 50  0001 C CNN
	1    9300 9050
	1    0    0    -1  
$EndComp
$Comp
L CP_Small C2
U 1 1 5AA83BED
P 9100 9050
F 0 "C2" H 9110 9120 50  0000 L CNN
F 1 "10u" H 9110 8970 50  0000 L CNN
F 2 "Capacitors_Tantalum_SMD:CP_Tantalum_Case-B_EIA-3528-21_Hand" H 9100 9050 50  0001 C CNN
F 3 "" H 9100 9050 50  0001 C CNN
	1    9100 9050
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR02
U 1 1 5AA84C0F
P 9100 10500
F 0 "#PWR02" H 9100 10350 50  0001 C CNN
F 1 "VCC" H 9100 10650 50  0000 C CNN
F 2 "" H 9100 10500 50  0001 C CNN
F 3 "" H 9100 10500 50  0001 C CNN
	1    9100 10500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 5AA84C9F
P 9100 10900
F 0 "#PWR03" H 9100 10650 50  0001 C CNN
F 1 "GND" H 9100 10750 50  0000 C CNN
F 2 "" H 9100 10900 50  0001 C CNN
F 3 "" H 9100 10900 50  0001 C CNN
	1    9100 10900
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
P 11500 10700
F 0 "C31" H 11510 10770 50  0000 L CNN
F 1 "0.1u" H 11510 10620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 11500 10700 50  0001 C CNN
F 3 "" H 11500 10700 50  0001 C CNN
	1    11500 10700
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
	7150 2750 7250 2650
Entry Wire Line
	7150 2550 7250 2450
Text Label 7250 2450 0    60   ~ 0
X1
Entry Wire Line
	7150 2450 7250 2350
Text Label 7250 2350 0    60   ~ 0
66?
Entry Wire Line
	7150 2350 7250 2250
Text Label 7250 2250 0    60   ~ 0
HOLD
Entry Wire Line
	7150 2250 7250 2150
Text Label 7250 2150 0    60   ~ 0
RDn
Entry Wire Line
	7150 2150 7250 2050
Text Label 7250 2050 0    60   ~ 0
WRn
Entry Wire Line
	7150 2050 7250 1950
Text Label 7250 1950 0    60   ~ 0
MREQn
Entry Wire Line
	7150 1950 7250 1850
Text Label 7250 1850 0    60   ~ 0
IORQn
Entry Wire Line
	7150 1850 7250 1750
Text Label 7250 1750 0    60   ~ 0
BLIO
Entry Wire Line
	7150 1650 7250 1550
Text Label 7250 1550 0    60   ~ 0
BLRAM
Entry Wire Line
	7150 1450 7250 1350
Text Label 7250 1350 0    60   ~ 0
M1n
Entry Wire Line
	7150 1250 7250 1150
Text Label 7250 1150 0    60   ~ 0
INTAn
Entry Wire Line
	7150 1050 7250 950 
Text Label 7250 950  0    60   ~ 0
RESn
Entry Wire Line
	7150 4050 7250 3950
Text Label 7250 3950 0    60   ~ 0
BLn
Entry Wire Line
	7150 3850 7250 3750
Text Label 7250 3750 0    60   ~ 0
X0
Entry Wire Line
	7150 3650 7250 3550
Text Label 7250 3550 0    60   ~ 0
IRQS
Entry Wire Line
	7150 3550 7250 3450
Text Label 7250 3450 0    60   ~ 0
IRQ7
Entry Wire Line
	7150 3450 7250 3350
Text Label 7250 3350 0    60   ~ 0
IRQ6
Entry Wire Line
	7150 3350 7250 3250
Text Label 7250 3250 0    60   ~ 0
IRQ5
Entry Wire Line
	7150 3250 7250 3150
Text Label 7250 3150 0    60   ~ 0
IRQ4
Entry Wire Line
	7150 3150 7250 3050
Text Label 7250 3050 0    60   ~ 0
IRQ3
Entry Wire Line
	7150 3050 7250 2950
Text Label 7250 2950 0    60   ~ 0
IRQ2
Entry Wire Line
	7150 2950 7250 2850
Text Label 7250 2850 0    60   ~ 0
IRQ1
Entry Wire Line
	7150 2850 7250 2750
Text Label 7250 2750 0    60   ~ 0
CLC0?
Entry Wire Line
	8950 2650 8850 2550
Text Label 8850 2550 2    60   ~ 0
A13
Entry Wire Line
	8950 2550 8850 2450
Text Label 8850 2450 2    60   ~ 0
A14
Entry Wire Line
	8950 2450 8850 2350
Text Label 8850 2350 2    60   ~ 0
A15
Text Label 8850 1850 2    60   ~ 0
SND
Entry Wire Line
	8950 1850 8850 1750
Text Label 8850 1750 2    60   ~ 0
WAITn
Entry Wire Line
	8950 1750 8850 1650
Text Label 8850 1650 2    60   ~ 0
D7
Entry Wire Line
	8950 1650 8850 1550
Text Label 8850 1550 2    60   ~ 0
D6
Entry Wire Line
	8950 1550 8850 1450
Text Label 8850 1450 2    60   ~ 0
D5
Entry Wire Line
	8950 1450 8850 1350
Text Label 8850 1350 2    60   ~ 0
D4
Entry Wire Line
	8950 1350 8850 1250
Text Label 8850 1250 2    60   ~ 0
D3
Entry Wire Line
	8950 1250 8850 1150
Text Label 8850 1150 2    60   ~ 0
D2
Entry Wire Line
	8950 1150 8850 1050
Text Label 8850 1050 2    60   ~ 0
D1
Entry Wire Line
	8950 1050 8850 950 
Text Label 8850 950  2    60   ~ 0
D0
Entry Wire Line
	8950 4050 8850 3950
Text Label 8850 3950 2    60   ~ 0
HLDA
Entry Wire Line
	8950 3950 8850 3850
Text Label 8850 3850 2    60   ~ 0
A0
Entry Wire Line
	8950 3850 8850 3750
Text Label 8850 3750 2    60   ~ 0
A1
Entry Wire Line
	8950 3750 8850 3650
Text Label 8850 3650 2    60   ~ 0
A2
Entry Wire Line
	8950 3650 8850 3550
Text Label 8850 3550 2    60   ~ 0
A3
Entry Wire Line
	8950 3550 8850 3450
Text Label 8850 3450 2    60   ~ 0
A4
Entry Wire Line
	8950 3450 8850 3350
Text Label 8850 3350 2    60   ~ 0
A5
Entry Wire Line
	8950 3350 8850 3250
Text Label 8850 3250 2    60   ~ 0
A6
Entry Wire Line
	8950 3250 8850 3150
Text Label 8850 3150 2    60   ~ 0
A7
Entry Wire Line
	8950 3150 8850 3050
Text Label 8850 3050 2    60   ~ 0
A8
Entry Wire Line
	8950 3050 8850 2950
Text Label 8850 2950 2    60   ~ 0
A9
Entry Wire Line
	8950 2950 8850 2850
Text Label 8850 2850 2    60   ~ 0
A10
Entry Wire Line
	8950 2850 8850 2750
Text Label 8850 2750 2    60   ~ 0
A11
Entry Wire Line
	8950 2750 8850 2650
Text Label 8850 2650 2    60   ~ 0
A12
$Comp
L GND #PWR010
U 1 1 5AAFFE64
P 7800 850
F 0 "#PWR010" H 7800 600 50  0001 C CNN
F 1 "GND" V 7800 675 50  0000 C CNN
F 2 "" H 7800 850 50  0001 C CNN
F 3 "" H 7800 850 50  0001 C CNN
	1    7800 850 
	0    1    1    0   
$EndComp
$Comp
L VDD #PWR011
U 1 1 5AB00E1B
P 7800 1050
F 0 "#PWR011" H 7800 900 50  0001 C CNN
F 1 "VDD" V 7800 1225 50  0000 C CNN
F 2 "" H 7800 1050 50  0001 C CNN
F 3 "" H 7800 1050 50  0001 C CNN
	1    7800 1050
	0    -1   -1   0   
$EndComp
$Comp
L -12V #PWR5
U 1 1 5AB01A9F
P 7800 1450
F 0 "#PWR5" H 7800 1550 50  0001 C CNN
F 1 "-12V" V 7800 1675 50  0000 C CNN
F 2 "" H 7800 1450 50  0001 C CNN
F 3 "" H 7800 1450 50  0001 C CNN
	1    7800 1450
	0    -1   -1   0   
$EndComp
Text Label 7250 2650 0    60   ~ 0
RFSHn
$Comp
L +12V #PWR012
U 1 1 5AB08886
P 7800 1650
F 0 "#PWR012" H 7800 1500 50  0001 C CNN
F 1 "+12V" V 7800 1850 50  0000 C CNN
F 2 "" H 7800 1650 50  0001 C CNN
F 3 "" H 7800 1650 50  0001 C CNN
	1    7800 1650
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR013
U 1 1 5AB09CBA
P 7800 3850
F 0 "#PWR013" H 7800 3600 50  0001 C CNN
F 1 "GND" V 7800 3675 50  0000 C CNN
F 2 "" H 7800 3850 50  0001 C CNN
F 3 "" H 7800 3850 50  0001 C CNN
	1    7800 3850
	0    1    1    0   
$EndComp
$Comp
L Conn_02x32_Odd_Even J2
U 1 1 5AB0DEC8
P 8100 2350
F 0 "J2" H 8150 3950 50  0000 C CNN
F 1 "SYS_PRO" H 8150 650 50  0000 C CNN
F 2 "orion:DIN41612_B064M" H 8100 2350 50  0001 C CNN
F 3 "" H 8100 2350 50  0001 C CNN
	1    8100 2350
	-1   0    0    -1  
$EndComp
Entry Wire Line
	7150 4400 7250 4300
Entry Wire Line
	7150 5400 7250 5300
Text Label 7250 5300 0    60   ~ 0
1B8
Entry Wire Line
	7150 5300 7250 5200
Text Label 7250 5200 0    60   ~ 0
1B6
Entry Wire Line
	7150 5200 7250 5100
Text Label 7250 5100 0    60   ~ 0
1B4
Entry Wire Line
	7150 5100 7250 5000
Text Label 7250 5000 0    60   ~ 0
1B2
Entry Wire Line
	7150 5000 7250 4900
Text Label 7250 4900 0    60   ~ 0
ROM
Entry Wire Line
	7150 4900 7250 4800
Text Label 7250 4800 0    60   ~ 0
VA18
Entry Wire Line
	7150 4800 7250 4700
Text Label 7250 4700 0    60   ~ 0
VA16
Entry Wire Line
	7150 4600 7250 4500
Text Label 7250 4500 0    60   ~ 0
MW
Entry Wire Line
	7150 4500 7250 4400
Entry Wire Line
	8950 4400 8850 4300
Entry Wire Line
	8950 5400 8850 5300
Text Label 8850 5300 2    60   ~ 0
M2V
Entry Wire Line
	8950 5300 8850 5200
Text Label 8850 5200 2    60   ~ 0
1B7
Entry Wire Line
	8950 5200 8850 5100
Text Label 8850 5100 2    60   ~ 0
1B5
Entry Wire Line
	8950 5100 8850 5000
Text Label 8850 5000 2    60   ~ 0
1B3
Entry Wire Line
	8950 5000 8850 4900
Text Label 8850 4900 2    60   ~ 0
XROM
Entry Wire Line
	8950 4900 8850 4800
Text Label 8850 4800 2    60   ~ 0
VA19
Entry Wire Line
	8950 4800 8850 4700
Text Label 8850 4700 2    60   ~ 0
VA17
Entry Wire Line
	8950 4600 8850 4500
Text Label 8850 4500 2    60   ~ 0
MR
Entry Wire Line
	8950 4500 8850 4400
Text Label 8850 4400 2    60   ~ 0
CLC0?
Entry Wire Line
	7150 4700 7250 4600
Text Label 7250 4600 0    60   ~ 0
VA14
Entry Wire Line
	8950 4700 8850 4600
Text Label 8850 4600 2    60   ~ 0
VA15
Entry Wire Line
	7150 5500 7250 5400
Entry Wire Line
	7150 6000 7250 5900
Text Label 7250 5900 0    60   ~ 0
r6
Entry Wire Line
	7150 5900 7250 5800
Text Label 7250 5800 0    60   ~ 0
r4
Entry Wire Line
	7150 5700 7250 5600
Text Label 7250 5600 0    60   ~ 0
r0
Entry Wire Line
	7150 5600 7250 5500
Text Label 7250 5500 0    60   ~ 0
PFCn
Text Label 7250 5400 0    60   ~ 0
PF8
Entry Wire Line
	8950 5500 8850 5400
Entry Wire Line
	8950 6000 8850 5900
Text Label 8850 5900 2    60   ~ 0
r7
Entry Wire Line
	8950 5900 8850 5800
Text Label 8850 5800 2    60   ~ 0
r5
Entry Wire Line
	8950 5700 8850 5600
Text Label 8850 5600 2    60   ~ 0
r1
Entry Wire Line
	8950 5600 8850 5500
Text Label 8850 5500 2    60   ~ 0
FEN
Text Label 8850 5400 2    60   ~ 0
PFA
Entry Wire Line
	7150 5800 7250 5700
Text Label 7250 5700 0    60   ~ 0
r2
Entry Wire Line
	8950 5800 8850 5700
Text Label 8850 5700 2    60   ~ 0
r3
$Comp
L Conn_02x17_Odd_Even J3
U 1 1 5AB5E6A2
P 8000 5100
F 0 "J3" H 8050 6000 50  0000 C CNN
F 1 "SYS_EXT" H 8050 4200 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x18_Pitch2.54mm" H 8000 5100 50  0001 C CNN
F 3 "" H 8000 5100 50  0001 C CNN
	1    8000 5100
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
P 8000 6700
F 0 "J4" H 8050 7300 50  0000 C CNN
F 1 "MEM1" H 8050 6000 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x12_Pitch2.00mm" H 8000 6700 50  0001 C CNN
F 3 "" H 8000 6700 50  0001 C CNN
	1    8000 6700
	1    0    0    -1  
$EndComp
$Comp
L Conn_02x12_Odd_Even J5
U 1 1 5AFEFF45
P 8000 8050
F 0 "J5" H 8050 8650 50  0000 C CNN
F 1 "MEM2" H 8050 7350 50  0000 C CNN
F 2 "Socket_Strips:Socket_Strip_Straight_2x12_Pitch2.00mm" H 8000 8050 50  0001 C CNN
F 3 "" H 8000 8050 50  0001 C CNN
	1    8000 8050
	1    0    0    -1  
$EndComp
Entry Wire Line
	7150 8450 7250 8350
Text Label 7250 8350 0    60   ~ 0
MD14
Entry Wire Line
	7150 8350 7250 8250
Text Label 7250 8250 0    60   ~ 0
MD12
Entry Wire Line
	7150 8250 7250 8150
Text Label 7250 8150 0    60   ~ 0
MD10
Entry Wire Line
	7150 8150 7250 8050
Text Label 7250 8050 0    60   ~ 0
MD8
Entry Wire Line
	7150 8050 7250 7950
Text Label 7250 7950 0    60   ~ 0
MD6
Entry Wire Line
	7150 7950 7250 7850
Text Label 7250 7850 0    60   ~ 0
MD4
Entry Wire Line
	7150 7850 7250 7750
Text Label 7250 7750 0    60   ~ 0
MD2
Entry Wire Line
	7150 7750 7250 7650
Text Label 7250 7650 0    60   ~ 0
MD0
Entry Wire Line
	7150 7300 7250 7200
Text Label 7250 7200 0    60   ~ 0
MA19
Entry Wire Line
	7150 7200 7250 7100
Text Label 7250 7100 0    60   ~ 0
S16
Entry Wire Line
	7150 7100 7250 7000
Text Label 7250 7000 0    60   ~ 0
MA14
Entry Wire Line
	7150 7000 7250 6900
Text Label 7250 6900 0    60   ~ 0
MA12
Entry Wire Line
	7150 6900 7250 6800
Text Label 7250 6800 0    60   ~ 0
MA10
Entry Wire Line
	7150 6800 7250 6700
Text Label 7250 6700 0    60   ~ 0
MA8
Entry Wire Line
	7150 6700 7250 6600
Text Label 7250 6600 0    60   ~ 0
MA6
Entry Wire Line
	7150 6600 7250 6500
Text Label 7250 6500 0    60   ~ 0
MA4
Entry Wire Line
	7150 6500 7250 6400
Text Label 7250 6400 0    60   ~ 0
MA2
Entry Wire Line
	7150 6400 7250 6300
Text Label 7250 6300 0    60   ~ 0
MA0
Entry Wire Line
	8850 6300 8950 6400
Text Label 8700 6300 0    60   ~ 0
MA1
Entry Wire Line
	8850 6400 8950 6500
Text Label 8700 6400 0    60   ~ 0
MA3
Entry Wire Line
	8850 6500 8950 6600
Text Label 8700 6500 0    60   ~ 0
MA5
Entry Wire Line
	8850 6600 8950 6700
Text Label 8700 6600 0    60   ~ 0
MA7
Entry Wire Line
	8850 6700 8950 6800
Text Label 8700 6700 0    60   ~ 0
MA9
Entry Wire Line
	8850 6800 8950 6900
Text Label 8650 6800 0    60   ~ 0
MA11
Entry Wire Line
	8850 6900 8950 7000
Text Label 8650 6900 0    60   ~ 0
MA13
Entry Wire Line
	8850 7000 8950 7100
Text Label 8650 7000 0    60   ~ 0
MA15
Entry Wire Line
	8850 7100 8950 7200
Text Label 8700 7100 0    60   ~ 0
S17
Entry Wire Line
	8850 7650 8950 7750
Text Label 8675 7650 0    60   ~ 0
MD1
Entry Wire Line
	8850 7750 8950 7850
Text Label 8675 7750 0    60   ~ 0
MD3
Entry Wire Line
	8850 7850 8950 7950
Text Label 8675 7850 0    60   ~ 0
MD5
Entry Wire Line
	8850 7950 8950 8050
Text Label 8675 7950 0    60   ~ 0
MD7
Entry Wire Line
	8850 8050 8950 8150
Text Label 8675 8050 0    60   ~ 0
MD9
Entry Wire Line
	8850 8150 8950 8250
Text Label 8650 8150 0    60   ~ 0
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
	9100 10800 9100 10900
Wire Wire Line
	9100 10500 9100 10600
Wire Wire Line
	9100 10550 11500 10550
Connection ~ 9100 10550
Wire Wire Line
	9100 10850 11500 10850
Connection ~ 9100 10850
Wire Wire Line
	9300 10600 9300 10550
Connection ~ 9300 10550
Wire Wire Line
	9500 10550 9500 10600
Connection ~ 9500 10550
Wire Wire Line
	9700 10550 9700 10600
Connection ~ 9700 10550
Wire Wire Line
	9900 10600 9900 10550
Connection ~ 9900 10550
Wire Wire Line
	10100 10600 10100 10550
Connection ~ 10100 10550
Wire Wire Line
	10300 10600 10300 10550
Connection ~ 10300 10550
Wire Wire Line
	10500 10600 10500 10550
Connection ~ 10500 10550
Wire Wire Line
	10700 10600 10700 10550
Connection ~ 10700 10550
Wire Wire Line
	10900 10600 10900 10550
Connection ~ 10900 10550
Wire Wire Line
	11100 10600 11100 10550
Connection ~ 11100 10550
Wire Wire Line
	11300 10600 11300 10550
Connection ~ 11300 10550
Wire Wire Line
	11500 10550 11500 10600
Wire Wire Line
	11500 10850 11500 10800
Wire Wire Line
	11300 10800 11300 10850
Connection ~ 11300 10850
Wire Wire Line
	11100 10800 11100 10850
Connection ~ 11100 10850
Wire Wire Line
	10900 10800 10900 10850
Connection ~ 10900 10850
Wire Wire Line
	10700 10800 10700 10850
Connection ~ 10700 10850
Wire Wire Line
	10500 10800 10500 10850
Connection ~ 10500 10850
Wire Wire Line
	10300 10800 10300 10850
Connection ~ 10300 10850
Wire Wire Line
	10100 10800 10100 10850
Connection ~ 10100 10850
Wire Wire Line
	9900 10800 9900 10850
Connection ~ 9900 10850
Wire Wire Line
	9700 10800 9700 10850
Connection ~ 9700 10850
Wire Wire Line
	9500 10800 9500 10850
Connection ~ 9500 10850
Wire Wire Line
	9300 10800 9300 10850
Connection ~ 9300 10850
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
	8950 1050 8950 11150
$Comp
L VCC #PWR028
U 1 1 5AFF94F3
P 8300 6200
F 0 "#PWR028" H 8300 6050 50  0001 C CNN
F 1 "VCC" V 8300 6375 50  0000 C CNN
F 2 "" H 8300 6200 50  0001 C CNN
F 3 "" H 8300 6200 50  0001 C CNN
	1    8300 6200
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR029
U 1 1 5AFF9BE6
P 7800 7300
F 0 "#PWR029" H 7800 7150 50  0001 C CNN
F 1 "VCC" V 7800 7475 50  0000 C CNN
F 2 "" H 7800 7300 50  0001 C CNN
F 3 "" H 7800 7300 50  0001 C CNN
	1    7800 7300
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR030
U 1 1 5AFFA504
P 7800 6200
F 0 "#PWR030" H 7800 5950 50  0001 C CNN
F 1 "GND" V 7800 6025 50  0000 C CNN
F 2 "" H 7800 6200 50  0001 C CNN
F 3 "" H 7800 6200 50  0001 C CNN
	1    7800 6200
	0    1    1    0   
$EndComp
$Comp
L GND #PWR031
U 1 1 5AFFAFB9
P 8300 7300
F 0 "#PWR031" H 8300 7050 50  0001 C CNN
F 1 "GND" V 8300 7125 50  0000 C CNN
F 2 "" H 8300 7300 50  0001 C CNN
F 3 "" H 8300 7300 50  0001 C CNN
	1    8300 7300
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
	8850 8250 8950 8350
Text Label 8650 8250 0    60   ~ 0
MD13
Entry Wire Line
	8850 8350 8950 8450
Text Label 8650 8350 0    60   ~ 0
MD15
Entry Wire Line
	8850 8450 8950 8550
Text Label 8750 8450 0    60   ~ 0
WE
Entry Wire Line
	8850 8550 8950 8650
Text Label 8750 8550 0    60   ~ 0
SL
Entry Wire Line
	8850 8650 8950 8750
Text Label 8700 8650 0    60   ~ 0
CE1
Entry Wire Line
	7150 8750 7250 8650
Text Label 7250 8650 0    60   ~ 0
CE0
Entry Wire Line
	7150 8650 7250 8550
Text Label 7250 8550 0    60   ~ 0
SU
Entry Wire Line
	7150 8550 7250 8450
Text Label 7250 8450 0    60   ~ 0
OE
$Comp
L C_Small C17
U 1 1 5B037798
P 11300 9875
F 0 "C17" H 11310 9945 50  0000 L CNN
F 1 "0.1u" H 11310 9795 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 11300 9875 50  0001 C CNN
F 3 "" H 11300 9875 50  0001 C CNN
	1    11300 9875
	1    0    0    -1  
$EndComp
$Comp
L C_Small C16
U 1 1 5B03779E
P 11100 9875
F 0 "C16" H 11110 9945 50  0000 L CNN
F 1 "0.1u" H 11110 9795 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 11100 9875 50  0001 C CNN
F 3 "" H 11100 9875 50  0001 C CNN
	1    11100 9875
	1    0    0    -1  
$EndComp
$Comp
L C_Small C15
U 1 1 5B0377A4
P 10900 9875
F 0 "C15" H 10910 9945 50  0000 L CNN
F 1 "0.1u" H 10910 9795 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 10900 9875 50  0001 C CNN
F 3 "" H 10900 9875 50  0001 C CNN
	1    10900 9875
	1    0    0    -1  
$EndComp
$Comp
L C_Small C14
U 1 1 5B0377AA
P 10700 9875
F 0 "C14" H 10710 9945 50  0000 L CNN
F 1 "0.1u" H 10710 9795 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 10700 9875 50  0001 C CNN
F 3 "" H 10700 9875 50  0001 C CNN
	1    10700 9875
	1    0    0    -1  
$EndComp
$Comp
L C_Small C13
U 1 1 5B0377B0
P 10500 9875
F 0 "C13" H 10510 9945 50  0000 L CNN
F 1 "0.1u" H 10510 9795 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 10500 9875 50  0001 C CNN
F 3 "" H 10500 9875 50  0001 C CNN
	1    10500 9875
	1    0    0    -1  
$EndComp
$Comp
L C_Small C12
U 1 1 5B0377B6
P 10300 9875
F 0 "C12" H 10310 9945 50  0000 L CNN
F 1 "0.1u" H 10310 9795 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 10300 9875 50  0001 C CNN
F 3 "" H 10300 9875 50  0001 C CNN
	1    10300 9875
	1    0    0    -1  
$EndComp
$Comp
L C_Small C11
U 1 1 5B0377BC
P 10100 9875
F 0 "C11" H 10110 9945 50  0000 L CNN
F 1 "0.1u" H 10110 9795 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 10100 9875 50  0001 C CNN
F 3 "" H 10100 9875 50  0001 C CNN
	1    10100 9875
	1    0    0    -1  
$EndComp
$Comp
L C_Small C10
U 1 1 5B0377C2
P 9900 9875
F 0 "C10" H 9910 9945 50  0000 L CNN
F 1 "0.1u" H 9910 9795 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 9900 9875 50  0001 C CNN
F 3 "" H 9900 9875 50  0001 C CNN
	1    9900 9875
	1    0    0    -1  
$EndComp
$Comp
L C_Small C9
U 1 1 5B0377C8
P 9700 9875
F 0 "C9" H 9710 9945 50  0000 L CNN
F 1 "0.1u" H 9710 9795 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 9700 9875 50  0001 C CNN
F 3 "" H 9700 9875 50  0001 C CNN
	1    9700 9875
	1    0    0    -1  
$EndComp
$Comp
L C_Small C8
U 1 1 5B0377CE
P 9500 9875
F 0 "C8" H 9510 9945 50  0000 L CNN
F 1 "0.1u" H 9510 9795 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 9500 9875 50  0001 C CNN
F 3 "" H 9500 9875 50  0001 C CNN
	1    9500 9875
	1    0    0    -1  
$EndComp
$Comp
L C_Small C7
U 1 1 5B0377D4
P 9300 9875
F 0 "C7" H 9310 9945 50  0000 L CNN
F 1 "0.1u" H 9310 9795 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 9300 9875 50  0001 C CNN
F 3 "" H 9300 9875 50  0001 C CNN
	1    9300 9875
	1    0    0    -1  
$EndComp
$Comp
L C_Small C6
U 1 1 5B0377DA
P 9100 9875
F 0 "C6" H 9110 9945 50  0000 L CNN
F 1 "0.1u" H 9110 9795 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 9100 9875 50  0001 C CNN
F 3 "" H 9100 9875 50  0001 C CNN
	1    9100 9875
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR034
U 1 1 5B0377E0
P 9100 9675
F 0 "#PWR034" H 9100 9525 50  0001 C CNN
F 1 "VCC" H 9100 9825 50  0000 C CNN
F 2 "" H 9100 9675 50  0001 C CNN
F 3 "" H 9100 9675 50  0001 C CNN
	1    9100 9675
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR035
U 1 1 5B0377E6
P 9100 10075
F 0 "#PWR035" H 9100 9825 50  0001 C CNN
F 1 "GND" H 9100 9925 50  0000 C CNN
F 2 "" H 9100 10075 50  0001 C CNN
F 3 "" H 9100 10075 50  0001 C CNN
	1    9100 10075
	1    0    0    -1  
$EndComp
$Comp
L C_Small C18
U 1 1 5B0377FE
P 11500 9875
F 0 "C18" H 11510 9945 50  0000 L CNN
F 1 "0.1u" H 11510 9795 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 11500 9875 50  0001 C CNN
F 3 "" H 11500 9875 50  0001 C CNN
	1    11500 9875
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 9975 9100 10075
Wire Wire Line
	9100 9675 9100 9775
Wire Wire Line
	9100 9725 11500 9725
Connection ~ 9100 9725
Wire Wire Line
	9100 10025 11500 10025
Connection ~ 9100 10025
Wire Wire Line
	9300 9775 9300 9725
Connection ~ 9300 9725
Wire Wire Line
	9500 9725 9500 9775
Connection ~ 9500 9725
Wire Wire Line
	9700 9725 9700 9775
Connection ~ 9700 9725
Wire Wire Line
	9900 9775 9900 9725
Connection ~ 9900 9725
Wire Wire Line
	10100 9775 10100 9725
Connection ~ 10100 9725
Wire Wire Line
	10300 9775 10300 9725
Connection ~ 10300 9725
Wire Wire Line
	10500 9775 10500 9725
Connection ~ 10500 9725
Wire Wire Line
	10700 9775 10700 9725
Connection ~ 10700 9725
Wire Wire Line
	10900 9775 10900 9725
Connection ~ 10900 9725
Wire Wire Line
	11100 9775 11100 9725
Connection ~ 11100 9725
Wire Wire Line
	11300 9775 11300 9725
Connection ~ 11300 9725
Wire Wire Line
	11500 9725 11500 9775
Wire Wire Line
	11500 10025 11500 9975
Wire Wire Line
	11300 9975 11300 10025
Connection ~ 11300 10025
Wire Wire Line
	11100 9975 11100 10025
Connection ~ 11100 10025
Wire Wire Line
	10900 9975 10900 10025
Connection ~ 10900 10025
Wire Wire Line
	10700 9975 10700 10025
Connection ~ 10700 10025
Wire Wire Line
	10500 9975 10500 10025
Connection ~ 10500 10025
Wire Wire Line
	10300 9975 10300 10025
Connection ~ 10300 10025
Wire Wire Line
	10100 9975 10100 10025
Connection ~ 10100 10025
Wire Wire Line
	9900 9975 9900 10025
Connection ~ 9900 10025
Wire Wire Line
	9700 9975 9700 10025
Connection ~ 9700 10025
Wire Wire Line
	9500 9975 9500 10025
Connection ~ 9500 10025
Wire Wire Line
	9300 9975 9300 10025
Connection ~ 9300 10025
$Comp
L VCC #PWR036
U 1 1 5B037CF5
P 9100 8850
F 0 "#PWR036" H 9100 8700 50  0001 C CNN
F 1 "VCC" H 9100 9000 50  0000 C CNN
F 2 "" H 9100 8850 50  0001 C CNN
F 3 "" H 9100 8850 50  0001 C CNN
	1    9100 8850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR037
U 1 1 5B037CFB
P 9100 9250
F 0 "#PWR037" H 9100 9000 50  0001 C CNN
F 1 "GND" H 9100 9100 50  0000 C CNN
F 2 "" H 9100 9250 50  0001 C CNN
F 3 "" H 9100 9250 50  0001 C CNN
	1    9100 9250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 9150 9100 9250
Wire Wire Line
	9100 8850 9100 8950
Wire Wire Line
	9100 8900 9700 8900
Connection ~ 9100 8900
Connection ~ 9100 9200
Wire Wire Line
	9300 8950 9300 8900
Connection ~ 9300 8900
Wire Wire Line
	9500 8900 9500 8950
Connection ~ 9500 8900
Wire Wire Line
	9300 9150 9300 9200
Connection ~ 9300 9200
Wire Wire Line
	9500 9200 9500 9150
Connection ~ 9500 9200
Wire Wire Line
	9100 9200 9700 9200
Wire Wire Line
	9700 8900 9700 8950
Wire Wire Line
	9700 9200 9700 9150
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
Wire Wire Line
	6100 3100 5950 3100
NoConn ~ 6100 3200
NoConn ~ 6700 3400
NoConn ~ 6700 2800
NoConn ~ 6700 2600
Wire Wire Line
	6600 950  6600 900 
Wire Wire Line
	6900 1050 6900 900 
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
Entry Wire Line
	8850 7200 8950 7300
Text Label 8725 7200 0    60   ~ 0
WS
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
Wire Wire Line
	7250 1550 7800 1550
Wire Wire Line
	7800 1350 7250 1350
Wire Wire Line
	7250 1150 7800 1150
Wire Wire Line
	7250 950  7800 950 
Wire Wire Line
	7250 1750 7800 1750
Wire Wire Line
	7800 1850 7250 1850
Wire Wire Line
	7250 1950 7800 1950
Wire Wire Line
	7250 2050 7800 2050
Wire Wire Line
	7250 2150 7800 2150
Wire Wire Line
	7800 2250 7250 2250
Wire Wire Line
	7250 2350 7800 2350
Wire Wire Line
	7800 2450 7250 2450
Wire Wire Line
	7250 2650 7800 2650
Wire Wire Line
	7800 2750 7250 2750
Wire Wire Line
	7250 2850 7800 2850
Wire Wire Line
	8300 950  8850 950 
Wire Wire Line
	8850 1050 8300 1050
Wire Wire Line
	8300 1150 8850 1150
Entry Wire Line
	3900 8350 4000 8450
Entry Wire Line
	8950 1950 8850 1850
Wire Wire Line
	8300 1250 8850 1250
Wire Wire Line
	8850 1350 8300 1350
Wire Wire Line
	8300 1450 8850 1450
Wire Wire Line
	8850 1550 8300 1550
Wire Wire Line
	8300 1650 8850 1650
Wire Wire Line
	8850 1750 8300 1750
Wire Wire Line
	8300 1850 8850 1850
Wire Wire Line
	8850 2350 8300 2350
Wire Wire Line
	8300 2450 8850 2450
Wire Wire Line
	8850 2550 8300 2550
Wire Wire Line
	8300 2650 8850 2650
Wire Wire Line
	8300 2750 8850 2750
Wire Wire Line
	8300 2850 8850 2850
Wire Wire Line
	7250 2950 7800 2950
Wire Wire Line
	7250 3050 7800 3050
Wire Wire Line
	7800 3150 7250 3150
Wire Wire Line
	7250 3250 7800 3250
Wire Wire Line
	7800 3350 7250 3350
Wire Wire Line
	7250 3450 7800 3450
Wire Wire Line
	7800 3550 7250 3550
Wire Wire Line
	7250 3750 7800 3750
Wire Wire Line
	7800 3950 7250 3950
Wire Wire Line
	8850 2950 8300 2950
Wire Wire Line
	8300 3050 8850 3050
Wire Wire Line
	8850 3150 8300 3150
Wire Wire Line
	8300 3250 8850 3250
Wire Wire Line
	8850 3350 8300 3350
Wire Wire Line
	8300 3450 8850 3450
Wire Wire Line
	8300 3550 8850 3550
Wire Wire Line
	8850 3650 8300 3650
Wire Wire Line
	8300 3750 8850 3750
Wire Wire Line
	8850 3850 8300 3850
Wire Wire Line
	8300 3950 8850 3950
Wire Wire Line
	7250 4300 7800 4300
Wire Wire Line
	7800 4400 7250 4400
Wire Wire Line
	7250 4500 7800 4500
Wire Wire Line
	7800 4600 7250 4600
Wire Wire Line
	7250 4700 7800 4700
Wire Wire Line
	7250 4800 7800 4800
Wire Wire Line
	7250 4900 7800 4900
Wire Wire Line
	7800 5000 7250 5000
Wire Wire Line
	7250 5100 7800 5100
Wire Wire Line
	7800 5200 7250 5200
Wire Wire Line
	7250 5300 7800 5300
Wire Wire Line
	7800 5400 7250 5400
Wire Wire Line
	7250 5500 7800 5500
Wire Wire Line
	7800 5600 7250 5600
Wire Wire Line
	7250 5700 7800 5700
Wire Wire Line
	7800 5800 7250 5800
Wire Wire Line
	7250 5900 7800 5900
Wire Wire Line
	8300 4300 8850 4300
Wire Wire Line
	8850 4400 8300 4400
Wire Wire Line
	8300 4500 8850 4500
Wire Wire Line
	8850 4600 8300 4600
Wire Wire Line
	8300 4700 8850 4700
Wire Wire Line
	8300 4800 8850 4800
Wire Wire Line
	8300 4900 8850 4900
Wire Wire Line
	8850 5000 8300 5000
Wire Wire Line
	8300 5100 8850 5100
Wire Wire Line
	8850 5200 8300 5200
Wire Wire Line
	8300 5300 8850 5300
Wire Wire Line
	8850 5400 8300 5400
Wire Wire Line
	8300 5500 8850 5500
Wire Wire Line
	8850 5600 8300 5600
Wire Wire Line
	8300 5700 8850 5700
Wire Wire Line
	8850 5800 8300 5800
Wire Wire Line
	8300 5900 8850 5900
Wire Wire Line
	7250 6300 7800 6300
Wire Wire Line
	7250 6400 7800 6400
Wire Wire Line
	7250 6500 7800 6500
Wire Wire Line
	7250 6600 7800 6600
Wire Wire Line
	7250 6700 7800 6700
Wire Wire Line
	7800 6800 7250 6800
Wire Wire Line
	7250 6900 7800 6900
Wire Wire Line
	7800 7000 7250 7000
Wire Wire Line
	7250 7100 7800 7100
Wire Wire Line
	7800 7200 7250 7200
Wire Wire Line
	8300 7200 8850 7200
Wire Wire Line
	8850 7100 8300 7100
Wire Wire Line
	8300 7000 8850 7000
Wire Wire Line
	8850 6900 8300 6900
Wire Wire Line
	8300 6800 8850 6800
Wire Wire Line
	8850 6700 8300 6700
Wire Wire Line
	8300 6600 8850 6600
Wire Wire Line
	8825 6500 8300 6500
Wire Wire Line
	8300 6400 8850 6400
Wire Wire Line
	8850 6300 8300 6300
Wire Wire Line
	7250 7650 7800 7650
Wire Wire Line
	7800 7750 7250 7750
Wire Wire Line
	7250 7850 7800 7850
Wire Wire Line
	7800 7950 7250 7950
Wire Wire Line
	7250 8050 7800 8050
Wire Wire Line
	7800 8150 7250 8150
Wire Wire Line
	7250 8250 7800 8250
Wire Wire Line
	7800 8350 7250 8350
Wire Wire Line
	7250 8450 7800 8450
Wire Wire Line
	7800 8550 7250 8550
Wire Wire Line
	7250 8650 7800 8650
Wire Wire Line
	8300 8650 8850 8650
Wire Wire Line
	8850 8550 8300 8550
Wire Wire Line
	8300 8450 8850 8450
Wire Wire Line
	8850 8350 8300 8350
Wire Wire Line
	8300 8250 8850 8250
Wire Wire Line
	8825 8150 8300 8150
Wire Wire Line
	8300 8050 8850 8050
Wire Wire Line
	8850 7950 8300 7950
Wire Wire Line
	8300 7850 8850 7850
Wire Wire Line
	8850 7750 8300 7750
Wire Wire Line
	8300 7650 8850 7650
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
Wire Wire Line
	3125 10850 3200 10850
Wire Wire Line
	2750 11050 2650 11050
Wire Wire Line
	2650 11050 2650 10850
Connection ~ 2650 10850
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
Wire Wire Line
	14050 5150 13850 5150
Wire Wire Line
	13850 5050 14050 5050
Wire Wire Line
	13850 4950 14050 4950
Wire Wire Line
	13850 4850 14050 4850
Wire Wire Line
	13850 4750 14050 4750
Wire Wire Line
	14050 4650 13850 4650
Wire Wire Line
	13850 4550 14050 4550
Wire Wire Line
	14050 4450 13850 4450
Wire Wire Line
	13850 4350 14050 4350
Wire Wire Line
	13850 4250 14050 4250
Wire Wire Line
	13850 4150 14050 4150
Wire Wire Line
	14050 4050 13850 4050
Wire Wire Line
	13850 3950 14050 3950
Wire Wire Line
	13850 3850 14050 3850
Wire Wire Line
	14050 3750 13850 3750
Wire Wire Line
	13850 3650 14050 3650
Wire Wire Line
	14050 3550 13850 3550
Wire Wire Line
	13850 3450 14050 3450
Wire Wire Line
	13850 3350 14050 3350
Wire Wire Line
	14050 2750 13850 2750
Wire Wire Line
	13850 2650 14050 2650
Wire Wire Line
	13850 2550 14050 2550
Wire Wire Line
	13850 2450 14050 2450
Wire Wire Line
	13850 2350 14050 2350
Wire Wire Line
	14050 2250 13850 2250
Wire Wire Line
	13850 2150 14050 2150
Wire Wire Line
	14050 2050 13850 2050
Wire Wire Line
	13850 1950 14050 1950
Wire Wire Line
	13850 1850 14050 1850
Wire Wire Line
	13850 1750 14050 1750
Wire Wire Line
	14050 1650 13850 1650
Wire Wire Line
	13850 1550 14050 1550
Wire Wire Line
	13850 1450 14050 1450
Wire Wire Line
	14050 1350 13850 1350
Wire Wire Line
	13850 1250 14050 1250
Wire Wire Line
	14050 1150 13850 1150
Wire Wire Line
	13850 1050 14050 1050
Wire Wire Line
	13850 950  14050 950 
Wire Wire Line
	13850 2900 14050 2900
Wire Wire Line
	14050 3000 13850 3000
Wire Wire Line
	13850 3100 14050 3100
Wire Wire Line
	13850 5300 14050 5300
Wire Wire Line
	14050 5400 13850 5400
Wire Wire Line
	13850 5500 14050 5500
Wire Wire Line
	15450 4050 15650 4050
Wire Wire Line
	15450 3950 15650 3950
Wire Wire Line
	15450 3850 15650 3850
Wire Wire Line
	15450 3750 15650 3750
Wire Wire Line
	15450 3650 15650 3650
Wire Wire Line
	15450 3550 15650 3550
Wire Wire Line
	15450 3450 15650 3450
Wire Wire Line
	15450 3350 15650 3350
Wire Wire Line
	15450 1650 15650 1650
Wire Wire Line
	15450 1550 15650 1550
Wire Wire Line
	15450 1450 15650 1450
Wire Wire Line
	15450 1350 15650 1350
Wire Wire Line
	15450 1250 15650 1250
Wire Wire Line
	15450 1150 15650 1150
Wire Wire Line
	15450 1050 15650 1050
Wire Wire Line
	15450 950  15650 950 
Wire Wire Line
	13450 5050 13650 5050
Wire Wire Line
	13450 4950 13650 4950
Wire Wire Line
	13450 4850 13650 4850
Wire Wire Line
	13450 4750 13650 4750
Wire Wire Line
	13450 4650 13650 4650
Wire Wire Line
	13450 4550 13650 4550
Wire Wire Line
	13450 4450 13650 4450
Wire Wire Line
	13450 4350 13650 4350
Wire Wire Line
	13450 4250 13650 4250
Wire Wire Line
	13450 4150 13650 4150
Wire Wire Line
	13450 4050 13650 4050
Wire Wire Line
	13450 3950 13650 3950
Wire Wire Line
	13450 3850 13650 3850
Wire Wire Line
	13450 3750 13650 3750
Wire Wire Line
	13450 3650 13650 3650
Wire Wire Line
	13450 3550 13650 3550
Wire Wire Line
	11800 3550 12050 3550
Wire Wire Line
	11800 3650 12050 3650
Wire Wire Line
	11800 3750 12050 3750
Wire Wire Line
	11800 3850 12050 3850
Wire Wire Line
	11800 3950 12050 3950
Wire Wire Line
	11800 4050 12050 4050
Wire Wire Line
	11800 4150 12050 4150
Wire Wire Line
	11800 4250 12050 4250
Wire Wire Line
	11800 4350 12050 4350
Wire Wire Line
	11800 4450 12050 4450
Wire Wire Line
	11800 4550 12050 4550
Wire Wire Line
	11800 4650 12050 4650
Wire Wire Line
	11800 4750 12050 4750
Wire Wire Line
	11800 4850 12050 4850
Wire Wire Line
	11800 4950 12050 4950
Wire Wire Line
	11800 5050 12050 5050
Wire Wire Line
	11800 5150 12050 5150
Wire Wire Line
	11800 5250 12050 5250
Wire Wire Line
	11800 5450 12050 5450
Wire Wire Line
	11800 5550 12050 5550
Wire Wire Line
	11800 5650 12050 5650
Wire Wire Line
	11800 5750 12050 5750
Wire Wire Line
	11800 5850 12050 5850
Wire Wire Line
	13450 2450 13650 2450
Wire Wire Line
	13450 2350 13650 2350
Wire Wire Line
	13450 2250 13650 2250
Wire Wire Line
	13450 2150 13650 2150
Wire Wire Line
	13450 2050 13650 2050
Wire Wire Line
	13450 1950 13650 1950
Wire Wire Line
	13450 1850 13650 1850
Wire Wire Line
	13450 1750 13650 1750
Wire Wire Line
	13450 1650 13650 1650
Wire Wire Line
	13450 1550 13650 1550
Wire Wire Line
	13450 1450 13650 1450
Wire Wire Line
	13450 1350 13650 1350
Wire Wire Line
	13450 1250 13650 1250
Wire Wire Line
	13450 1150 13650 1150
Wire Wire Line
	13450 1050 13650 1050
Wire Wire Line
	13450 950  13650 950 
Wire Wire Line
	11800 950  12050 950 
Wire Wire Line
	11800 1050 12050 1050
Wire Wire Line
	11800 1150 12050 1150
Wire Wire Line
	11800 1250 12050 1250
Wire Wire Line
	11800 1350 12050 1350
Wire Wire Line
	11800 1450 12050 1450
Wire Wire Line
	11800 1550 12050 1550
Wire Wire Line
	11800 1650 12050 1650
Wire Wire Line
	11800 1750 12050 1750
Wire Wire Line
	11800 1850 12050 1850
Wire Wire Line
	11800 1950 12050 1950
Wire Wire Line
	11800 2050 12050 2050
Wire Wire Line
	11800 2150 12050 2150
Wire Wire Line
	11800 2250 12050 2250
Wire Wire Line
	11800 2350 12050 2350
Wire Wire Line
	11800 2450 12050 2450
Wire Wire Line
	11800 2550 12050 2550
Wire Wire Line
	11800 2650 12050 2650
Wire Wire Line
	11800 2850 12050 2850
Wire Wire Line
	11800 2950 12050 2950
Wire Wire Line
	11800 3050 12050 3050
Wire Wire Line
	11800 3150 12050 3150
Wire Wire Line
	11800 3250 12050 3250
Text Label 13850 5150 0    60   ~ 0
MA19
Entry Wire Line
	13750 5250 13850 5150
Text Label 13850 3350 0    60   ~ 0
MA0
Entry Wire Line
	13750 3450 13850 3350
Text Label 13850 3450 0    60   ~ 0
MA1
Entry Wire Line
	13750 3550 13850 3450
Text Label 13850 3550 0    60   ~ 0
MA2
Entry Wire Line
	13750 3650 13850 3550
Text Label 13850 3650 0    60   ~ 0
MA3
Entry Wire Line
	13750 3750 13850 3650
Text Label 13850 3750 0    60   ~ 0
MA4
Entry Wire Line
	13750 3850 13850 3750
Text Label 13850 3850 0    60   ~ 0
MA5
Entry Wire Line
	13750 3950 13850 3850
Text Label 13850 3950 0    60   ~ 0
MA6
Entry Wire Line
	13750 4050 13850 3950
Text Label 13850 4050 0    60   ~ 0
MA7
Entry Wire Line
	13750 4150 13850 4050
Text Label 13850 4150 0    60   ~ 0
MA8
Entry Wire Line
	13750 4250 13850 4150
Text Label 13850 4250 0    60   ~ 0
MA9
Entry Wire Line
	13750 4350 13850 4250
Text Label 13850 4350 0    60   ~ 0
MA10
Entry Wire Line
	13750 4450 13850 4350
Text Label 13850 4450 0    60   ~ 0
MA11
Entry Wire Line
	13750 4550 13850 4450
Text Label 13850 4550 0    60   ~ 0
MA12
Entry Wire Line
	13750 4650 13850 4550
Text Label 13850 4650 0    60   ~ 0
MA13
Entry Wire Line
	13750 4750 13850 4650
Text Label 13850 4750 0    60   ~ 0
MA14
Entry Wire Line
	13750 4850 13850 4750
Text Label 13850 4850 0    60   ~ 0
MA15
Entry Wire Line
	13750 4950 13850 4850
Text Label 13850 4950 0    60   ~ 0
S16
Entry Wire Line
	13750 5050 13850 4950
Text Label 13850 5050 0    60   ~ 0
S17
Entry Wire Line
	13750 5150 13850 5050
Text Label 15450 1650 0    60   ~ 0
MD15
Entry Wire Line
	15650 1650 15750 1750
Text Label 15450 1550 0    60   ~ 0
MD14
Entry Wire Line
	15650 1550 15750 1650
Text Label 15450 1450 0    60   ~ 0
MD13
Entry Wire Line
	15650 1450 15750 1550
Text Label 15450 1350 0    60   ~ 0
MD12
Entry Wire Line
	15650 1350 15750 1450
Text Label 15450 1250 0    60   ~ 0
MD11
Entry Wire Line
	15650 1250 15750 1350
Text Label 15450 1150 0    60   ~ 0
MD10
Entry Wire Line
	15650 1150 15750 1250
Text Label 15500 1050 0    60   ~ 0
MD9
Entry Wire Line
	15650 1050 15750 1150
Text Label 15500 950  0    60   ~ 0
MD8
Entry Wire Line
	15650 950  15750 1050
Text Label 13850 3100 0    60   ~ 0
OE
Entry Wire Line
	13750 3000 13850 2900
Text Label 13850 3000 0    60   ~ 0
WE
Entry Wire Line
	13750 3100 13850 3000
Text Label 13850 2900 0    60   ~ 0
CE0
Entry Wire Line
	13750 3200 13850 3100
Text Label 13850 2750 0    60   ~ 0
MA19
Entry Wire Line
	13750 2850 13850 2750
Text Label 13850 950  0    60   ~ 0
MA0
Entry Wire Line
	13750 1050 13850 950 
Text Label 13850 1050 0    60   ~ 0
MA1
Entry Wire Line
	13750 1150 13850 1050
Text Label 13850 1150 0    60   ~ 0
MA2
Entry Wire Line
	13750 1250 13850 1150
Text Label 13850 1250 0    60   ~ 0
MA3
Entry Wire Line
	13750 1350 13850 1250
Text Label 13850 1350 0    60   ~ 0
MA4
Entry Wire Line
	13750 1450 13850 1350
Text Label 13850 1450 0    60   ~ 0
MA5
Entry Wire Line
	13750 1550 13850 1450
Text Label 13850 1550 0    60   ~ 0
MA6
Entry Wire Line
	13750 1650 13850 1550
Text Label 13850 1650 0    60   ~ 0
MA7
Entry Wire Line
	13750 1750 13850 1650
Text Label 13850 1750 0    60   ~ 0
MA8
Entry Wire Line
	13750 1850 13850 1750
Text Label 13850 1850 0    60   ~ 0
MA9
Entry Wire Line
	13750 1950 13850 1850
Text Label 13850 1950 0    60   ~ 0
MA10
Entry Wire Line
	13750 2050 13850 1950
Text Label 13850 2050 0    60   ~ 0
MA11
Entry Wire Line
	13750 2150 13850 2050
Text Label 13850 2150 0    60   ~ 0
MA12
Entry Wire Line
	13750 2250 13850 2150
Text Label 13850 2250 0    60   ~ 0
MA13
Entry Wire Line
	13750 2350 13850 2250
Text Label 13850 2350 0    60   ~ 0
MA14
Entry Wire Line
	13750 2450 13850 2350
Text Label 13850 2450 0    60   ~ 0
MA15
Entry Wire Line
	13750 2550 13850 2450
Text Label 13850 2550 0    60   ~ 0
S16
Entry Wire Line
	13750 2650 13850 2550
Text Label 13850 2650 0    60   ~ 0
S17
Entry Wire Line
	13750 2750 13850 2650
$Comp
L CY7C1049B DD31
U 1 1 5AAF621D
P 14750 2000
F 0 "DD31" H 14750 3150 50  0000 C CNN
F 1 "CY7C1049B" H 14900 900 50  0000 C CNN
F 2 "andreil:SOJ-36" H 14750 2000 50  0001 C CNN
F 3 "" H 14750 2000 50  0001 C CNN
	1    14750 2000
	1    0    0    -1  
$EndComp
Text Label 15500 4050 0    60   ~ 0
MD7
Entry Wire Line
	15650 4050 15750 4150
Text Label 15500 3950 0    60   ~ 0
MD6
Entry Wire Line
	15650 3950 15750 4050
Text Label 15500 3850 0    60   ~ 0
MD5
Entry Wire Line
	15650 3850 15750 3950
Text Label 15500 3750 0    60   ~ 0
MD4
Entry Wire Line
	15650 3750 15750 3850
Text Label 15500 3650 0    60   ~ 0
MD3
Entry Wire Line
	15650 3650 15750 3750
Text Label 15500 3550 0    60   ~ 0
MD2
Entry Wire Line
	15650 3550 15750 3650
Text Label 15500 3450 0    60   ~ 0
MD1
Entry Wire Line
	15650 3450 15750 3550
Text Label 15500 3350 0    60   ~ 0
MD0
Entry Wire Line
	15650 3350 15750 3450
Text Label 13850 5500 0    60   ~ 0
OE
Entry Wire Line
	13750 5400 13850 5300
Text Label 13850 5400 0    60   ~ 0
WE
Entry Wire Line
	13750 5500 13850 5400
Text Label 13850 5300 0    60   ~ 0
CE1
Entry Wire Line
	13750 5600 13850 5500
$Comp
L CY7C1049B DD32
U 1 1 5AABA02C
P 14750 4400
F 0 "DD32" H 14750 5550 50  0000 C CNN
F 1 "CY7C1049B" H 14900 3300 50  0000 C CNN
F 2 "andreil:SOJ-36" H 14750 4400 50  0001 C CNN
F 3 "" H 14750 4400 50  0001 C CNN
	1    14750 4400
	1    0    0    -1  
$EndComp
Text Label 13450 5050 0    60   ~ 0
MD15
Entry Wire Line
	13650 5050 13750 5150
Text Label 13450 4950 0    60   ~ 0
MD14
Entry Wire Line
	13650 4950 13750 5050
Text Label 13450 4850 0    60   ~ 0
MD13
Entry Wire Line
	13650 4850 13750 4950
Text Label 13450 4750 0    60   ~ 0
MD12
Entry Wire Line
	13650 4750 13750 4850
Text Label 13450 4650 0    60   ~ 0
MD11
Entry Wire Line
	13650 4650 13750 4750
Text Label 13450 4550 0    60   ~ 0
MD10
Entry Wire Line
	13650 4550 13750 4650
Text Label 13500 4450 0    60   ~ 0
MD9
Entry Wire Line
	13650 4450 13750 4550
Text Label 13500 4350 0    60   ~ 0
MD8
Entry Wire Line
	13650 4350 13750 4450
Text Label 13500 4250 0    60   ~ 0
MD7
Entry Wire Line
	13650 4250 13750 4350
Text Label 13500 4150 0    60   ~ 0
MD6
Entry Wire Line
	13650 4150 13750 4250
Text Label 13500 4050 0    60   ~ 0
MD5
Entry Wire Line
	13650 4050 13750 4150
Text Label 13500 3950 0    60   ~ 0
MD4
Entry Wire Line
	13650 3950 13750 4050
Text Label 13500 3850 0    60   ~ 0
MD3
Entry Wire Line
	13650 3850 13750 3950
Text Label 13500 3750 0    60   ~ 0
MD2
Entry Wire Line
	13650 3750 13750 3850
Text Label 13500 3650 0    60   ~ 0
MD1
Entry Wire Line
	13650 3650 13750 3750
Text Label 13500 3550 0    60   ~ 0
MD0
Entry Wire Line
	13650 3550 13750 3650
Text Label 11800 3550 0    60   ~ 0
MA0
Entry Wire Line
	11700 3650 11800 3550
Text Label 11800 3650 0    60   ~ 0
MA1
Entry Wire Line
	11700 3750 11800 3650
Text Label 11800 3750 0    60   ~ 0
MA2
Entry Wire Line
	11700 3850 11800 3750
Text Label 11800 3850 0    60   ~ 0
MA3
Entry Wire Line
	11700 3950 11800 3850
Text Label 11800 3950 0    60   ~ 0
MA4
Entry Wire Line
	11700 4050 11800 3950
Text Label 11800 4050 0    60   ~ 0
MA5
Entry Wire Line
	11700 4150 11800 4050
Text Label 11800 4150 0    60   ~ 0
MA6
Entry Wire Line
	11700 4250 11800 4150
Text Label 11800 4250 0    60   ~ 0
MA7
Entry Wire Line
	11700 4350 11800 4250
Text Label 11800 4350 0    60   ~ 0
MA8
Entry Wire Line
	11700 4450 11800 4350
Text Label 11800 4450 0    60   ~ 0
MA9
Entry Wire Line
	11700 4550 11800 4450
Text Label 11800 4550 0    60   ~ 0
MA10
Entry Wire Line
	11700 4650 11800 4550
Text Label 11800 4650 0    60   ~ 0
MA11
Entry Wire Line
	11700 4750 11800 4650
Text Label 11800 4750 0    60   ~ 0
MA12
Entry Wire Line
	11700 4850 11800 4750
Text Label 11800 4850 0    60   ~ 0
MA13
Entry Wire Line
	11700 4950 11800 4850
Text Label 11800 4950 0    60   ~ 0
MA14
Entry Wire Line
	11700 5050 11800 4950
Text Label 11800 5050 0    60   ~ 0
MA15
Entry Wire Line
	11700 5150 11800 5050
Text Label 11800 5150 0    60   ~ 0
S16
Entry Wire Line
	11700 5250 11800 5150
Text Label 11800 5250 0    60   ~ 0
S17
Entry Wire Line
	11700 5350 11800 5250
Text Label 11800 5450 0    60   ~ 0
OE
Entry Wire Line
	11700 5550 11800 5450
Text Label 11800 5550 0    60   ~ 0
WE
Entry Wire Line
	11700 5650 11800 5550
Text Label 11800 5650 0    60   ~ 0
SU
Entry Wire Line
	11700 5750 11800 5650
Text Label 11800 5750 0    60   ~ 0
SL
Entry Wire Line
	11700 5850 11800 5750
Text Label 11800 5850 0    60   ~ 0
CE1
Entry Wire Line
	11700 5950 11800 5850
$Comp
L AS7C4098A U2
U 1 1 5AB272C7
P 12750 4600
F 0 "U2" H 12800 4600 50  0000 C CNN
F 1 "AS7C4098A" H 12900 3350 50  0000 C CNN
F 2 "andreil:SOJ-44" H 12750 4600 50  0001 C CNN
F 3 "" H 12750 4600 50  0001 C CNN
	1    12750 4600
	1    0    0    -1  
$EndComp
Text Label 13450 2450 0    60   ~ 0
MD15
Entry Wire Line
	13650 2450 13750 2550
Text Label 13450 2350 0    60   ~ 0
MD14
Entry Wire Line
	13650 2350 13750 2450
Text Label 13450 2250 0    60   ~ 0
MD13
Entry Wire Line
	13650 2250 13750 2350
Text Label 13450 2150 0    60   ~ 0
MD12
Entry Wire Line
	13650 2150 13750 2250
Text Label 13450 2050 0    60   ~ 0
MD11
Entry Wire Line
	13650 2050 13750 2150
Text Label 13450 1950 0    60   ~ 0
MD10
Entry Wire Line
	13650 1950 13750 2050
Text Label 13500 1850 0    60   ~ 0
MD9
Entry Wire Line
	13650 1850 13750 1950
Text Label 13500 1750 0    60   ~ 0
MD8
Entry Wire Line
	13650 1750 13750 1850
Text Label 13500 1650 0    60   ~ 0
MD7
Entry Wire Line
	13650 1650 13750 1750
Text Label 13500 1550 0    60   ~ 0
MD6
Entry Wire Line
	13650 1550 13750 1650
Text Label 13500 1450 0    60   ~ 0
MD5
Entry Wire Line
	13650 1450 13750 1550
Text Label 13500 1350 0    60   ~ 0
MD4
Entry Wire Line
	13650 1350 13750 1450
Text Label 13500 1250 0    60   ~ 0
MD3
Entry Wire Line
	13650 1250 13750 1350
Text Label 13500 1150 0    60   ~ 0
MD2
Entry Wire Line
	13650 1150 13750 1250
Text Label 13500 1050 0    60   ~ 0
MD1
Entry Wire Line
	13650 1050 13750 1150
Text Label 13500 950  0    60   ~ 0
MD0
Entry Wire Line
	13650 950  13750 1050
Text Label 11800 950  0    60   ~ 0
MA0
Entry Wire Line
	11700 1050 11800 950 
Text Label 11800 1050 0    60   ~ 0
MA1
Entry Wire Line
	11700 1150 11800 1050
Text Label 11800 1150 0    60   ~ 0
MA2
Entry Wire Line
	11700 1250 11800 1150
Text Label 11800 1250 0    60   ~ 0
MA3
Entry Wire Line
	11700 1350 11800 1250
Text Label 11800 1350 0    60   ~ 0
MA4
Entry Wire Line
	11700 1450 11800 1350
Text Label 11800 1450 0    60   ~ 0
MA5
Entry Wire Line
	11700 1550 11800 1450
Text Label 11800 1550 0    60   ~ 0
MA6
Entry Wire Line
	11700 1650 11800 1550
Text Label 11800 1650 0    60   ~ 0
MA7
Entry Wire Line
	11700 1750 11800 1650
Text Label 11800 1750 0    60   ~ 0
MA8
Entry Wire Line
	11700 1850 11800 1750
Text Label 11800 1850 0    60   ~ 0
MA9
Entry Wire Line
	11700 1950 11800 1850
Text Label 11800 1950 0    60   ~ 0
MA10
Entry Wire Line
	11700 2050 11800 1950
Text Label 11800 2050 0    60   ~ 0
MA11
Entry Wire Line
	11700 2150 11800 2050
Text Label 11800 2150 0    60   ~ 0
MA12
Entry Wire Line
	11700 2250 11800 2150
Text Label 11800 2250 0    60   ~ 0
MA13
Entry Wire Line
	11700 2350 11800 2250
Text Label 11800 2350 0    60   ~ 0
MA14
Entry Wire Line
	11700 2450 11800 2350
Text Label 11800 2450 0    60   ~ 0
MA15
Entry Wire Line
	11700 2550 11800 2450
Text Label 11800 2550 0    60   ~ 0
S16
Entry Wire Line
	11700 2650 11800 2550
Text Label 11800 2650 0    60   ~ 0
S17
Entry Wire Line
	11700 2750 11800 2650
Text Label 11800 2850 0    60   ~ 0
OE
Entry Wire Line
	11700 2950 11800 2850
Text Label 11800 2950 0    60   ~ 0
WE
Entry Wire Line
	11700 3050 11800 2950
Text Label 11800 3050 0    60   ~ 0
SU
Entry Wire Line
	11700 3150 11800 3050
Text Label 11800 3150 0    60   ~ 0
SL
Entry Wire Line
	11700 3250 11800 3150
Text Label 11800 3250 0    60   ~ 0
CE0
Entry Wire Line
	11700 3350 11800 3250
$Comp
L AS7C4098A U1
U 1 1 5AAEAA65
P 12750 2000
F 0 "U1" H 12800 2000 50  0000 C CNN
F 1 "AS7C4098A" H 12900 750 50  0000 C CNN
F 2 "andreil:SOJ-44" H 12750 2000 50  0001 C CNN
F 3 "" H 12750 2000 50  0001 C CNN
	1    12750 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 10750 4150 10900
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
Wire Wire Line
	5950 3100 5950 3300
Wire Wire Line
	5950 3300 5575 3300
Wire Wire Line
	5575 3200 5725 3200
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
	4100 10550 4200 10550
$EndSCHEMATC
