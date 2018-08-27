EESchema Schematic File Version 4
LIBS:orion_video-cache
EELAYER 26 0
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
Text Label 2150 750  0    60   ~ 0
CLK
Entry Wire Line
	2300 750  2400 850 
NoConn ~ 1150 650 
$Comp
L orion:ATF22V10 DD18
U 1 1 5B2AE833
P 5500 7000
F 0 "DD18" H 5500 7650 60  0000 C CNN
F 1 "ATF22V10" H 5600 6450 60  0000 C CNN
F 2 "Package_DIP:DIP-24_W7.62mm" H 5500 6950 60  0001 C CNN
F 3 "" H 5500 6950 60  0001 C CNN
	1    5500 7000
	1    0    0    -1  
$EndComp
Text Label 4700 6450 0    60   ~ 0
~BL
Entry Wire Line
	4700 6450 4600 6550
Text Label 4700 6750 0    60   ~ 0
VM1
Entry Wire Line
	4700 6550 4600 6650
Text Label 4700 6850 0    60   ~ 0
VM0
Entry Wire Line
	4700 6650 4600 6750
Text Label 4700 6950 0    60   ~ 0
VM4
Entry Wire Line
	4700 6750 4600 6850
Text Label 6300 7350 2    60   ~ 0
PS6
Entry Wire Line
	4700 6850 4600 6950
Text Label 6300 7250 2    60   ~ 0
PS5
Entry Wire Line
	4700 6950 4600 7050
Text Label 6300 7150 2    60   ~ 0
PS4
Entry Wire Line
	4700 7050 4600 7150
Text Label 4700 7150 0    60   ~ 0
PS3
Entry Wire Line
	4700 7150 4600 7250
Text Label 4700 7250 0    60   ~ 0
PS2
Entry Wire Line
	4700 7250 4600 7350
Text Label 4700 7350 0    60   ~ 0
PS1
Entry Wire Line
	4700 7350 4600 7450
Text Label 4700 7450 0    60   ~ 0
PS0
Entry Wire Line
	4700 7450 4600 7550
Text Label 4700 7550 0    60   ~ 0
PS7
Entry Wire Line
	4700 7550 4600 7650
Text Label 6300 6850 2    60   ~ 0
IR
Entry Wire Line
	6300 6450 6400 6550
Text Label 6300 6950 2    60   ~ 0
R
Entry Wire Line
	6300 6550 6400 6650
Text Label 6300 6650 2    60   ~ 0
IG
Entry Wire Line
	6300 6650 6400 6750
Text Label 6300 6750 2    60   ~ 0
G
Entry Wire Line
	6300 6750 6400 6850
Text Label 6300 6450 2    60   ~ 0
IB
Entry Wire Line
	6300 6850 6400 6950
Text Label 6300 6550 2    60   ~ 0
B
Entry Wire Line
	6300 6950 6400 7050
Text Label 4700 6650 0    60   ~ 0
P1
Entry Wire Line
	6300 7050 6400 7150
Text Label 6300 7050 2    60   ~ 0
P2
Entry Wire Line
	6300 7150 6400 7250
Text Label 4700 6550 0    60   ~ 0
P3
Entry Wire Line
	6300 7250 6400 7350
Text Label 4700 7050 0    60   ~ 0
P0
Entry Wire Line
	6300 7350 6400 7450
$Comp
L orion:IR23 DD24
U 1 1 5B2AFB72
P 7300 6000
F 0 "DD24" H 7300 6550 60  0000 C CNN
F 1 "IR23" H 7300 5550 60  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 7250 6150 60  0001 C CNN
F 3 "" H 7250 6150 60  0001 C CNN
	1    7300 6000
	1    0    0    -1  
$EndComp
Text Label 6500 5550 0    60   ~ 0
D0
Entry Wire Line
	6500 5550 6400 5650
Text Label 6500 5650 0    60   ~ 0
D1
Entry Wire Line
	6500 5650 6400 5750
Text Label 6500 5750 0    60   ~ 0
D2
Entry Wire Line
	6500 5750 6400 5850
Text Label 6500 5850 0    60   ~ 0
D3
Entry Wire Line
	6500 5850 6400 5950
Text Label 6500 5950 0    60   ~ 0
D4
Entry Wire Line
	6500 5950 6400 6050
Text Label 6500 6050 0    60   ~ 0
D5
Entry Wire Line
	6500 6050 6400 6150
Text Label 6500 6150 0    60   ~ 0
D6
Entry Wire Line
	6500 6150 6400 6250
Text Label 6500 6250 0    60   ~ 0
D7
Entry Wire Line
	6500 6250 6400 6350
Text Label 6500 6350 0    60   ~ 0
PFC
Entry Wire Line
	6500 6350 6400 6450
Text Label 6500 6450 0    60   ~ 0
~VM3
Entry Wire Line
	6500 6450 6400 6550
Text Label 8100 5550 2    60   ~ 0
PS0
Entry Wire Line
	8100 5550 8200 5650
Text Label 8100 5650 2    60   ~ 0
PS1
Entry Wire Line
	8100 5650 8200 5750
Text Label 8100 5750 2    60   ~ 0
PS2
Entry Wire Line
	8100 5750 8200 5850
Text Label 8100 5850 2    60   ~ 0
PS3
Entry Wire Line
	8100 5850 8200 5950
Text Label 8100 5950 2    60   ~ 0
PS4
Entry Wire Line
	8100 5950 8200 6050
Text Label 8100 6050 2    60   ~ 0
PS5
Entry Wire Line
	8100 6050 8200 6150
Text Label 8100 6150 2    60   ~ 0
PS6
Entry Wire Line
	8100 6150 8200 6250
Text Label 8100 6250 2    60   ~ 0
PS7
Entry Wire Line
	8100 6250 8200 6350
Text Label 6500 7350 0    60   ~ 0
VD8
Entry Wire Line
	6500 6650 6400 6750
Text Label 6500 7150 0    60   ~ 0
VD10
Entry Wire Line
	6500 6750 6400 6850
Text Label 6500 7050 0    60   ~ 0
VD11
Entry Wire Line
	6500 6850 6400 6950
Text Label 6500 6850 0    60   ~ 0
VD13
Entry Wire Line
	6500 6950 6400 7050
Text Label 6500 6650 0    60   ~ 0
VD15
Entry Wire Line
	6500 7050 6400 7150
Text Label 6500 6750 0    60   ~ 0
VD14
Entry Wire Line
	6500 7150 6400 7250
Text Label 6500 6950 0    60   ~ 0
VD12
Entry Wire Line
	6500 7250 6400 7350
Text Label 6500 7250 0    60   ~ 0
VD9
Entry Wire Line
	6500 7350 6400 7450
Text Label 6500 7450 0    60   ~ 0
~BE
Entry Wire Line
	6500 7450 6400 7550
Text Label 6500 7550 0    60   ~ 0
VM3
Entry Wire Line
	6500 7550 6400 7650
Text Label 8100 6650 2    60   ~ 0
PS7
Entry Wire Line
	8100 6650 8200 6750
Text Label 8100 6750 2    60   ~ 0
PS6
Entry Wire Line
	8100 6750 8200 6850
Text Label 8100 6850 2    60   ~ 0
PS5
Entry Wire Line
	8100 6850 8200 6950
Text Label 8100 6950 2    60   ~ 0
PS4
Entry Wire Line
	8100 6950 8200 7050
Text Label 8100 7050 2    60   ~ 0
PS3
Entry Wire Line
	8100 7050 8200 7150
Text Label 8100 7150 2    60   ~ 0
PS2
Entry Wire Line
	8100 7150 8200 7250
Text Label 8100 7250 2    60   ~ 0
PS1
Entry Wire Line
	8100 7250 8200 7350
Text Label 8100 7350 2    60   ~ 0
PS0
Entry Wire Line
	8100 7350 8200 7450
$Comp
L orion:IR10 DD14
U 1 1 5B2B2417
P 5500 1200
F 0 "DD14" H 5500 1750 60  0000 C CNN
F 1 "IR10" H 5500 450 60  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 5450 1350 60  0001 C CNN
F 3 "" H 5450 1350 60  0001 C CNN
	1    5500 1200
	1    0    0    -1  
$EndComp
Text Label 4700 750  0    60   ~ 0
VL0
Entry Wire Line
	4700 750  4600 850 
Text Label 4700 850  0    60   ~ 0
VL1
Entry Wire Line
	4700 850  4600 950 
Text Label 4700 950  0    60   ~ 0
VL2
Entry Wire Line
	4700 950  4600 1050
Text Label 4700 1050 0    60   ~ 0
VL3
Entry Wire Line
	4700 1050 4600 1150
Text Label 4700 1150 0    60   ~ 0
VL4
Entry Wire Line
	4700 1150 4600 1250
Text Label 4700 1250 0    60   ~ 0
VL5
Entry Wire Line
	4700 1250 4600 1350
Text Label 4700 1350 0    60   ~ 0
VL6
Entry Wire Line
	4700 1350 4600 1450
Text Label 4700 1450 0    60   ~ 0
VL7
Entry Wire Line
	4700 1450 4600 1550
Text Label 6300 1450 2    60   ~ 0
P0
Entry Wire Line
	6300 1450 6400 1550
$Comp
L orion:IR10 DD15
U 1 1 5B2B293B
P 5500 2700
F 0 "DD15" H 5500 3250 60  0000 C CNN
F 1 "IR10" H 5500 1950 60  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 5450 2850 60  0001 C CNN
F 3 "" H 5450 2850 60  0001 C CNN
	1    5500 2700
	1    0    0    -1  
$EndComp
Text Label 4700 2250 0    60   ~ 0
VL8
Entry Wire Line
	4700 2250 4600 2350
Text Label 4700 2350 0    60   ~ 0
VL9
Entry Wire Line
	4700 2350 4600 2450
Text Label 4700 2450 0    60   ~ 0
VL10
Entry Wire Line
	4700 2450 4600 2550
Text Label 4700 2550 0    60   ~ 0
VL11
Entry Wire Line
	4700 2550 4600 2650
Text Label 4700 2650 0    60   ~ 0
VL12
Entry Wire Line
	4700 2650 4600 2750
Text Label 4700 2750 0    60   ~ 0
VL13
Entry Wire Line
	4700 2750 4600 2850
Text Label 4700 2850 0    60   ~ 0
VL14
Entry Wire Line
	4700 2850 4600 2950
Text Label 4700 2950 0    60   ~ 0
VL15
Entry Wire Line
	4700 2950 4600 3050
Text Label 6300 2950 2    60   ~ 0
P1
Entry Wire Line
	6300 2950 6400 3050
$Comp
L orion:IR10 DD16
U 1 1 5B2B2CF2
P 5500 4100
F 0 "DD16" H 5500 4650 60  0000 C CNN
F 1 "IR10" H 5500 3350 60  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 5450 4250 60  0001 C CNN
F 3 "" H 5450 4250 60  0001 C CNN
	1    5500 4100
	1    0    0    -1  
$EndComp
Text Label 4700 3650 0    60   ~ 0
VL16
Entry Wire Line
	4700 3650 4600 3750
Text Label 4700 3750 0    60   ~ 0
VL17
Entry Wire Line
	4700 3750 4600 3850
Text Label 4700 3850 0    60   ~ 0
VL18
Entry Wire Line
	4700 3850 4600 3950
Text Label 4700 3950 0    60   ~ 0
VL19
Entry Wire Line
	4700 3950 4600 4050
Text Label 4700 4050 0    60   ~ 0
VL20
Entry Wire Line
	4700 4050 4600 4150
Text Label 4700 4150 0    60   ~ 0
VL21
Entry Wire Line
	4700 4150 4600 4250
Text Label 4700 4250 0    60   ~ 0
VL22
Entry Wire Line
	4700 4250 4600 4350
Text Label 4700 4350 0    60   ~ 0
VL23
Entry Wire Line
	4700 4350 4600 4450
Text Label 6300 4350 2    60   ~ 0
P2
Entry Wire Line
	6300 4350 6400 4450
$Comp
L orion:IR10 DD17
U 1 1 5B2B2D13
P 5500 5500
F 0 "DD17" H 5500 6050 60  0000 C CNN
F 1 "IR10" H 5500 4750 60  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 5450 5650 60  0001 C CNN
F 3 "" H 5450 5650 60  0001 C CNN
	1    5500 5500
	1    0    0    -1  
$EndComp
Text Label 4700 5050 0    60   ~ 0
VL24
Entry Wire Line
	4700 5050 4600 5150
Text Label 4700 5150 0    60   ~ 0
VL25
Entry Wire Line
	4700 5150 4600 5250
Text Label 4700 5250 0    60   ~ 0
VL26
Entry Wire Line
	4700 5250 4600 5350
Text Label 4700 5350 0    60   ~ 0
VL27
Entry Wire Line
	4700 5350 4600 5450
Text Label 4700 5450 0    60   ~ 0
VL28
Entry Wire Line
	4700 5450 4600 5550
Text Label 4700 5550 0    60   ~ 0
VL29
Entry Wire Line
	4700 5550 4600 5650
Text Label 4700 5650 0    60   ~ 0
VL30
Entry Wire Line
	4700 5650 4600 5750
Text Label 4700 5750 0    60   ~ 0
VL31
Entry Wire Line
	4700 5750 4600 5850
Text Label 6300 5750 2    60   ~ 0
P3
Entry Wire Line
	6300 5750 6400 5850
$Comp
L orion:IR23 DD25
U 1 1 5B3111EA
P 7300 7100
F 0 "DD25" H 7300 7650 60  0000 C CNN
F 1 "IR23" H 7300 6650 60  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 7250 7250 60  0001 C CNN
F 3 "" H 7250 7250 60  0001 C CNN
	1    7300 7100
	1    0    0    -1  
$EndComp
Text Label 4700 1650 0    60   ~ 0
CLK
Entry Wire Line
	4700 1650 4600 1750
Text Label 4700 1950 0    60   ~ 0
~BE
Entry Wire Line
	4700 1950 4600 2050
Text Label 4700 3150 0    60   ~ 0
CLK
Entry Wire Line
	4700 3150 4600 3250
Text Label 4700 3350 0    60   ~ 0
VM2
Entry Wire Line
	4700 3350 4600 3450
Text Label 4700 3450 0    60   ~ 0
~BE
Entry Wire Line
	4700 3450 4600 3550
Text Label 4700 4550 0    60   ~ 0
CLK
Entry Wire Line
	4700 4550 4600 4650
Text Label 4700 4850 0    60   ~ 0
~BE
Entry Wire Line
	4700 4850 4600 4950
Text Label 4700 5950 0    60   ~ 0
CLK
Entry Wire Line
	4700 5950 4600 6050
Text Label 4700 6250 0    60   ~ 0
~BE
Entry Wire Line
	4700 6250 4600 6350
Text Label 2500 750  0    60   ~ 0
Y0
Entry Wire Line
	2500 750  2400 850 
Text Label 2500 850  0    60   ~ 0
Y1
Entry Wire Line
	2500 850  2400 950 
Text Label 2500 950  0    60   ~ 0
Y2
Entry Wire Line
	2500 950  2400 1050
Text Label 2500 1050 0    60   ~ 0
Y3
Entry Wire Line
	2500 1050 2400 1150
Text Label 2500 1150 0    60   ~ 0
Y4
Entry Wire Line
	2500 1150 2400 1250
Text Label 2500 1250 0    60   ~ 0
Y5
Entry Wire Line
	2500 1250 2400 1350
Text Label 2500 1350 0    60   ~ 0
Y6
Entry Wire Line
	2500 1350 2400 1450
Text Label 2500 1450 0    60   ~ 0
Y7
Entry Wire Line
	2500 1450 2400 1550
Text Label 2500 1550 0    60   ~ 0
X3
Entry Wire Line
	2500 1550 2400 1650
Text Label 2500 1650 0    60   ~ 0
X4
Entry Wire Line
	2500 1650 2400 1750
Text Label 2500 1750 0    60   ~ 0
X5
Entry Wire Line
	2500 1750 2400 1850
Text Label 2500 1850 0    60   ~ 0
X6
Entry Wire Line
	2500 1850 2400 1950
Text Label 2500 1950 0    60   ~ 0
X7
Entry Wire Line
	2500 1950 2400 2050
Text Label 2500 2050 0    60   ~ 0
X8
Entry Wire Line
	2500 2050 2400 2150
Text Label 2500 2150 0    60   ~ 0
VA14
Entry Wire Line
	2500 2150 2400 2250
Text Label 2500 2250 0    60   ~ 0
VA15
Entry Wire Line
	2500 2250 2400 2350
Text Label 4500 750  2    60   ~ 0
VD0
Entry Wire Line
	4500 750  4600 850 
Text Label 4500 950  2    60   ~ 0
VD1
Entry Wire Line
	4500 850  4600 950 
Text Label 4500 1050 2    60   ~ 0
VD2
Entry Wire Line
	4500 950  4600 1050
Text Label 4500 1250 2    60   ~ 0
VD3
Entry Wire Line
	4500 1050 4600 1150
Text Label 4500 1450 2    60   ~ 0
VD4
Entry Wire Line
	4500 1150 4600 1250
Text Label 4500 1350 2    60   ~ 0
VD5
Entry Wire Line
	4500 1250 4600 1350
Text Label 4500 1150 2    60   ~ 0
VD6
Entry Wire Line
	4500 1350 4600 1450
Text Label 4500 850  2    60   ~ 0
VD7
Entry Wire Line
	4500 1450 4600 1550
Text Label 4500 1550 2    60   ~ 0
VD8
Entry Wire Line
	4500 1550 4600 1650
Text Label 4500 1750 2    60   ~ 0
VD9
Entry Wire Line
	4500 1650 4600 1750
Text Label 4500 1850 2    60   ~ 0
VD10
Entry Wire Line
	4500 1750 4600 1850
Text Label 4500 2050 2    60   ~ 0
VD11
Entry Wire Line
	4500 1850 4600 1950
Text Label 4500 2250 2    60   ~ 0
VD12
Entry Wire Line
	4500 1950 4600 2050
Text Label 4500 2150 2    60   ~ 0
VD13
Entry Wire Line
	4500 2050 4600 2150
Text Label 4500 1950 2    60   ~ 0
VD14
Entry Wire Line
	4500 2150 4600 2250
Text Label 4500 1650 2    60   ~ 0
VD15
Entry Wire Line
	4500 2250 4600 2350
$Comp
L orion:DB15_Female_HighDensity_MountingHoles J2
U 1 1 5B35967E
P 5400 10450
F 0 "J2" H 5525 11125 50  0000 C CNN
F 1 "VGA" H 5875 10800 50  0000 C CNN
F 2 "w_conn_pc:DB_15F-VGA" H 4450 10850 50  0001 C CNN
F 3 "" H 4450 10850 50  0001 C CNN
	1    5400 10450
	1    0    0    -1  
$EndComp
Text Label 6300 7750 2    60   ~ 0
VR
Entry Wire Line
	6300 7750 6400 7850
Text Label 4700 8150 0    60   ~ 0
R
Entry Wire Line
	4700 8150 4600 8250
Text Label 4700 8250 0    60   ~ 0
IR
Entry Wire Line
	4700 8250 4600 8350
Text Label 6300 8450 2    60   ~ 0
VG
Entry Wire Line
	6300 8450 6400 8550
Text Label 4700 8850 0    60   ~ 0
G
Entry Wire Line
	4700 8850 4600 8950
Text Label 4700 8950 0    60   ~ 0
IG
Entry Wire Line
	4700 8950 4600 9050
Text Label 6300 9150 2    60   ~ 0
VB
Entry Wire Line
	6300 9150 6400 9250
Text Label 4700 9550 0    60   ~ 0
B
Entry Wire Line
	4700 9550 4600 9650
Text Label 4700 9650 0    60   ~ 0
IB
Entry Wire Line
	4700 9650 4600 9750
Text Label 6300 10650 2    60   ~ 0
VS
Entry Wire Line
	6300 10650 6400 10750
Text Label 6300 10450 2    60   ~ 0
HS
Entry Wire Line
	6300 10450 6400 10550
Text Label 4700 10050 0    60   ~ 0
VR
Entry Wire Line
	4700 10050 4600 10150
Text Label 4700 10250 0    60   ~ 0
VG
Entry Wire Line
	4700 10250 4600 10350
Text Label 4700 10450 0    60   ~ 0
VB
Entry Wire Line
	4700 10450 4600 10550
NoConn ~ 5100 10650
NoConn ~ 5700 10250
NoConn ~ 5700 10050
NoConn ~ 5700 10850
Text Label 6500 10650 0    60   ~ 0
WEN
Entry Wire Line
	6500 10650 6400 10750
Text Label 8300 4150 0    60   ~ 0
~RES
Entry Wire Line
	8300 4150 8200 4250
Text Label 8300 1550 0    60   ~ 0
D0
Entry Wire Line
	8300 1550 8200 1650
Text Label 8300 1450 0    60   ~ 0
D1
Entry Wire Line
	8300 1450 8200 1550
Text Label 8300 1350 0    60   ~ 0
D2
Entry Wire Line
	8300 1350 8200 1450
Text Label 8300 1250 0    60   ~ 0
D3
Entry Wire Line
	8300 1250 8200 1350
Text Label 8300 1150 0    60   ~ 0
D4
Entry Wire Line
	8300 1150 8200 1250
Text Label 8300 1050 0    60   ~ 0
D5
Entry Wire Line
	8300 1050 8200 1150
Text Label 8300 950  0    60   ~ 0
D6
Entry Wire Line
	8300 950  8200 1050
Text Label 8300 850  0    60   ~ 0
D7
Entry Wire Line
	8300 850  8200 950 
Text Label 8300 2750 0    60   ~ 0
A10
Entry Wire Line
	8300 2750 8200 2850
Text Label 8300 2650 0    60   ~ 0
A11
Entry Wire Line
	8300 2650 8200 2750
Text Label 8300 2350 0    60   ~ 0
A14
Entry Wire Line
	8300 2350 8200 2450
Text Label 8300 2450 0    60   ~ 0
A13
Entry Wire Line
	8300 2450 8200 2550
Text Label 8300 2550 0    60   ~ 0
A12
Entry Wire Line
	8300 2550 8200 2650
Text Label 8300 2250 0    60   ~ 0
A15
Entry Wire Line
	8300 2250 8200 2350
Text Label 8300 2850 0    60   ~ 0
A9
Entry Wire Line
	8300 2850 8200 2950
Text Label 8300 2950 0    60   ~ 0
A8
Entry Wire Line
	8300 2950 8200 3050
Text Label 8300 5250 0    60   ~ 0
~WR
Entry Wire Line
	8300 5250 8200 5350
Text Label 8300 6750 0    60   ~ 0
~IRQS
Entry Wire Line
	8300 6750 8200 6850
Text Label 8300 3050 0    60   ~ 0
A7
Entry Wire Line
	8300 3050 8200 3150
Text Label 8300 3150 0    60   ~ 0
A6
Entry Wire Line
	8300 3150 8200 3250
Text Label 8300 3250 0    60   ~ 0
A5
Entry Wire Line
	8300 3250 8200 3350
Text Label 8300 3350 0    60   ~ 0
A4
Entry Wire Line
	8300 3350 8200 3450
Text Label 8300 3450 0    60   ~ 0
A3
Entry Wire Line
	8300 3450 8200 3550
Text Label 8300 3550 0    60   ~ 0
A2
Entry Wire Line
	8300 3550 8200 3650
Text Label 8300 3650 0    60   ~ 0
A1
Entry Wire Line
	8300 3650 8200 3750
Text Label 8300 3750 0    60   ~ 0
A0
Entry Wire Line
	8300 3750 8200 3850
Text Label 8300 5350 0    60   ~ 0
~RD
Entry Wire Line
	8300 5350 8200 5450
Text Label 8300 6550 0    60   ~ 0
~IRQ6
Entry Wire Line
	8300 6550 8200 6650
Text Label 8300 6250 0    60   ~ 0
~IRQ3
Entry Wire Line
	8300 6250 8200 6350
Text Label 8300 6150 0    60   ~ 0
~IRQ2
Entry Wire Line
	8300 6150 8200 6250
Text Label 8300 6650 0    60   ~ 0
~IRQ7
Entry Wire Line
	8300 6650 8200 6750
Text Label 8300 6350 0    60   ~ 0
~IRQ4
Entry Wire Line
	8300 6350 8200 6450
Text Label 8300 6450 0    60   ~ 0
~IRQ5
Entry Wire Line
	8300 6450 8200 6550
Text Label 6500 10850 0    60   ~ 0
CSL
Entry Wire Line
	6500 10850 6400 10950
Text Label 6500 5250 0    60   ~ 0
VM3
Entry Wire Line
	6500 5250 6400 5350
Text Label 8100 5250 2    60   ~ 0
~VM3
Entry Wire Line
	8100 5250 8200 5350
Text Label 6500 750  0    60   ~ 0
MD0
Entry Wire Line
	6500 750  6400 850 
Text Label 6500 850  0    60   ~ 0
MD7
Entry Wire Line
	6500 850  6400 950 
Text Label 6500 950  0    60   ~ 0
MD1
Entry Wire Line
	6500 950  6400 1050
Text Label 6500 1050 0    60   ~ 0
MD2
Entry Wire Line
	6500 1050 6400 1150
Text Label 6500 1150 0    60   ~ 0
MD6
Entry Wire Line
	6500 1150 6400 1250
Text Label 6500 1250 0    60   ~ 0
MD3
Entry Wire Line
	6500 1250 6400 1350
Text Label 6500 1350 0    60   ~ 0
MD5
Entry Wire Line
	6500 1350 6400 1450
Text Label 6500 1450 0    60   ~ 0
MD4
Entry Wire Line
	6500 1450 6400 1550
Text Label 6500 1550 0    60   ~ 0
~MWR
Entry Wire Line
	6500 1550 6400 1650
Text Label 6500 1650 0    60   ~ 0
~MVO0
Entry Wire Line
	6500 1650 6400 1750
Text Label 8100 750  2    60   ~ 0
D0
Entry Wire Line
	8100 750  8200 850 
Text Label 8100 850  2    60   ~ 0
D7
Entry Wire Line
	8100 850  8200 950 
Text Label 8100 950  2    60   ~ 0
D1
Entry Wire Line
	8100 950  8200 1050
Text Label 8100 1050 2    60   ~ 0
D2
Entry Wire Line
	8100 1050 8200 1150
Text Label 8100 1150 2    60   ~ 0
D6
Entry Wire Line
	8100 1150 8200 1250
Text Label 8100 1250 2    60   ~ 0
D3
Entry Wire Line
	8100 1250 8200 1350
Text Label 8100 1350 2    60   ~ 0
D5
Entry Wire Line
	8100 1350 8200 1450
Text Label 8100 1450 2    60   ~ 0
D4
Entry Wire Line
	8100 1450 8200 1550
Text Label 6500 1850 0    60   ~ 0
MD12
Entry Wire Line
	6500 1850 6400 1950
Text Label 6500 1950 0    60   ~ 0
MD13
Entry Wire Line
	6500 1950 6400 2050
Text Label 6500 2050 0    60   ~ 0
MD11
Entry Wire Line
	6500 2050 6400 2150
Text Label 6500 2150 0    60   ~ 0
MD14
Entry Wire Line
	6500 2150 6400 2250
Text Label 6500 2250 0    60   ~ 0
MD10
Entry Wire Line
	6500 2250 6400 2350
Text Label 6500 2350 0    60   ~ 0
MD9
Entry Wire Line
	6500 2350 6400 2450
Text Label 6500 2450 0    60   ~ 0
MD15
Entry Wire Line
	6500 2450 6400 2550
Text Label 6500 2550 0    60   ~ 0
MD8
Entry Wire Line
	6500 2550 6400 2650
Text Label 6500 2650 0    60   ~ 0
~MWR
Entry Wire Line
	6500 2650 6400 2750
Text Label 6500 2750 0    60   ~ 0
~MVO1
Entry Wire Line
	6500 2750 6400 2850
Text Label 8100 1850 2    60   ~ 0
D4
Entry Wire Line
	8100 1850 8200 1950
Text Label 8100 1950 2    60   ~ 0
D5
Entry Wire Line
	8100 1950 8200 2050
Text Label 8100 2050 2    60   ~ 0
D3
Entry Wire Line
	8100 2050 8200 2150
Text Label 8100 2150 2    60   ~ 0
D6
Entry Wire Line
	8100 2150 8200 2250
Text Label 8100 2250 2    60   ~ 0
D2
Entry Wire Line
	8100 2250 8200 2350
Text Label 8100 2350 2    60   ~ 0
D1
Entry Wire Line
	8100 2350 8200 2450
Text Label 8100 2450 2    60   ~ 0
D7
Entry Wire Line
	8100 2450 8200 2550
Text Label 8100 2550 2    60   ~ 0
D0
Entry Wire Line
	8100 2550 8200 2650
Text GLabel 7050 8000 0    60   Input ~ 0
PUP2
Text GLabel 1450 11000 0    60   Input ~ 0
PUP1
Text GLabel 5000 4750 0    60   Input ~ 0
PUP1
Text GLabel 5000 6150 0    60   Input ~ 0
PUP1
Text Label 8300 5150 0    60   ~ 0
~MREQ
Entry Wire Line
	8300 5150 8200 5250
Text Label 8300 5050 0    60   ~ 0
~IORQ
Entry Wire Line
	8300 5050 8200 5150
Text Label 8300 1650 0    60   ~ 0
~WAIT
Entry Wire Line
	8300 1650 8200 1750
Text Label 8300 6050 0    60   ~ 0
~IRQ1
Entry Wire Line
	8300 6050 8200 6150
Text Label 8300 4950 0    60   ~ 0
~BLIO
Entry Wire Line
	8300 4950 8200 5050
$Comp
L orion:IE18 DD1
U 1 1 5B6DA908
P 1500 1550
F 0 "DD1" H 1500 2050 60  0000 C CNN
F 1 "IE18" H 1500 1150 60  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 1400 1900 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1400 1900 60  0001 C CNN
	1    1500 1550
	1    0    0    -1  
$EndComp
$Comp
L orion:ATF22V10 DD4
U 1 1 5B6DE85F
P 1500 4700
F 0 "DD4" H 1500 5350 60  0000 C CNN
F 1 "ATF22V10" H 1600 4150 60  0000 C CNN
F 2 "Package_DIP:DIP-24_W7.62mm" H 1500 4650 60  0001 C CNN
F 3 "" H 1500 4650 60  0001 C CNN
	1    1500 4700
	1    0    0    -1  
$EndComp
Text Label 2300 1150 2    60   ~ 0
X0
Entry Wire Line
	2300 1150 2400 1250
Text Label 2300 1250 2    60   ~ 0
X1
Entry Wire Line
	2300 1250 2400 1350
Text Label 2300 1350 2    60   ~ 0
X2
Entry Wire Line
	2300 1350 2400 1450
Text Label 2300 1450 2    60   ~ 0
X3
Entry Wire Line
	2300 1450 2400 1550
Text Label 2300 1650 2    60   ~ 0
XH0
Entry Wire Line
	2300 1650 2400 1750
Text Label 700  1550 0    60   ~ 0
CLK
Entry Wire Line
	700  1550 600  1650
Text Label 700  1850 0    60   ~ 0
~XRES
Entry Wire Line
	700  1850 600  1950
$Comp
L orion:IE18 DD2
U 1 1 5B6F841E
P 1500 2550
F 0 "DD2" H 1500 3050 60  0000 C CNN
F 1 "IE18" H 1500 2150 60  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 1400 2900 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1400 2900 60  0001 C CNN
	1    1500 2550
	1    0    0    -1  
$EndComp
Text Label 2300 2150 2    60   ~ 0
X4
Entry Wire Line
	2300 2150 2400 2250
Text Label 2300 2250 2    60   ~ 0
X5
Entry Wire Line
	2300 2250 2400 2350
Text Label 2300 2350 2    60   ~ 0
X6
Entry Wire Line
	2300 2350 2400 2450
Text Label 2300 2450 2    60   ~ 0
X7
Entry Wire Line
	2300 2450 2400 2550
Text Label 2300 2650 2    60   ~ 0
XH1
Entry Wire Line
	2300 2650 2400 2750
Text Label 700  2550 0    60   ~ 0
CLK
Entry Wire Line
	700  2550 600  2650
Text Label 700  2850 0    60   ~ 0
~XRES
Entry Wire Line
	700  2850 600  2950
Text Label 700  2950 0    60   ~ 0
XH0
Entry Wire Line
	700  2950 600  3050
$Comp
L orion:IE18 DD3
U 1 1 5B6FCBE2
P 1500 3550
F 0 "DD3" H 1500 4050 60  0000 C CNN
F 1 "IE18" H 1500 3150 60  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 1400 3900 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1400 3900 60  0001 C CNN
	1    1500 3550
	1    0    0    -1  
$EndComp
Text Label 2300 3150 2    60   ~ 0
X8
Entry Wire Line
	2300 3150 2400 3250
Text Label 2300 3250 2    60   ~ 0
X9
Entry Wire Line
	2300 3250 2400 3350
Text Label 700  3550 0    60   ~ 0
CLK
Entry Wire Line
	700  3550 600  3650
Text Label 700  3850 0    60   ~ 0
~XRES
Entry Wire Line
	700  3850 600  3950
Text Label 700  3950 0    60   ~ 0
XH1
Entry Wire Line
	700  3950 600  4050
NoConn ~ 1050 1150
NoConn ~ 1050 1250
NoConn ~ 1050 1350
NoConn ~ 1050 1450
NoConn ~ 1050 2150
NoConn ~ 1050 2250
NoConn ~ 1050 2350
NoConn ~ 1050 2450
NoConn ~ 1050 3150
NoConn ~ 1050 3250
NoConn ~ 1050 3350
NoConn ~ 1050 3450
NoConn ~ 1950 3650
Text Label 700  4150 0    60   ~ 0
X0
Entry Wire Line
	700  4150 600  4250
Text Label 700  4250 0    60   ~ 0
X1
Entry Wire Line
	700  4250 600  4350
Text Label 700  4350 0    60   ~ 0
X2
Entry Wire Line
	700  4350 600  4450
Text Label 700  4450 0    60   ~ 0
X3
Entry Wire Line
	700  4450 600  4550
Text Label 700  4550 0    60   ~ 0
X4
Entry Wire Line
	700  4550 600  4650
Text Label 700  4650 0    60   ~ 0
X5
Entry Wire Line
	700  4650 600  4750
Text Label 700  4750 0    60   ~ 0
X6
Entry Wire Line
	700  4750 600  4850
Text Label 700  4850 0    60   ~ 0
X7
Entry Wire Line
	700  4850 600  4950
Text Label 700  4950 0    60   ~ 0
X8
Entry Wire Line
	700  4950 600  5050
Text Label 700  5050 0    60   ~ 0
X9
Entry Wire Line
	700  5050 600  5150
Text Label 2300 4550 2    60   ~ 0
~XRES
Entry Wire Line
	2300 4150 2400 4250
Text Label 2300 4650 2    60   ~ 0
BH
Entry Wire Line
	2300 4250 2400 4350
Text Label 700  5150 0    60   ~ 0
WEN
Entry Wire Line
	700  5150 600  5250
Text Label 2300 4450 2    60   ~ 0
HS
Entry Wire Line
	2300 4350 2400 4450
Text Label 2300 4750 2    60   ~ 0
XLE
Entry Wire Line
	2300 4450 2400 4550
Text Label 700  5250 0    60   ~ 0
SR16
Entry Wire Line
	700  5250 600  5350
$Comp
L orion:IE18 DD5
U 1 1 5B71B62C
P 1500 5950
F 0 "DD5" H 1500 6450 60  0000 C CNN
F 1 "IE18" H 1500 5550 60  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 1400 6300 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1400 6300 60  0001 C CNN
	1    1500 5950
	1    0    0    -1  
$EndComp
$Comp
L orion:ATF22V10 DD8
U 1 1 5B71B632
P 1500 9100
F 0 "DD8" H 1500 9750 60  0000 C CNN
F 1 "ATF22V10" H 1600 8550 60  0000 C CNN
F 2 "Package_DIP:DIP-24_W7.62mm" H 1500 9050 60  0001 C CNN
F 3 "" H 1500 9050 60  0001 C CNN
	1    1500 9100
	1    0    0    -1  
$EndComp
Text Label 2300 5550 2    60   ~ 0
Y0
Entry Wire Line
	2300 5550 2400 5650
Text Label 2300 5650 2    60   ~ 0
Y1
Entry Wire Line
	2300 5650 2400 5750
Text Label 2300 5750 2    60   ~ 0
Y2
Entry Wire Line
	2300 5750 2400 5850
Text Label 2300 5850 2    60   ~ 0
Y3
Entry Wire Line
	2300 5850 2400 5950
Text Label 2300 6050 2    60   ~ 0
YH0
Entry Wire Line
	2300 6050 2400 6150
Text Label 700  5950 0    60   ~ 0
XLE
Entry Wire Line
	700  5950 600  6050
Text Label 700  6250 0    60   ~ 0
~YRES
Entry Wire Line
	700  6250 600  6350
$Comp
L orion:IE18 DD6
U 1 1 5B71B65F
P 1500 6950
F 0 "DD6" H 1500 7450 60  0000 C CNN
F 1 "IE18" H 1500 6550 60  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 1400 7300 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1400 7300 60  0001 C CNN
	1    1500 6950
	1    0    0    -1  
$EndComp
Text Label 2300 6550 2    60   ~ 0
Y4
Entry Wire Line
	2300 6550 2400 6650
Text Label 2300 6650 2    60   ~ 0
Y5
Entry Wire Line
	2300 6650 2400 6750
Text Label 2300 6750 2    60   ~ 0
Y6
Entry Wire Line
	2300 6750 2400 6850
Text Label 2300 6850 2    60   ~ 0
Y7
Entry Wire Line
	2300 6850 2400 6950
Text Label 2300 7050 2    60   ~ 0
YH1
Entry Wire Line
	2300 7050 2400 7150
Text Label 700  6950 0    60   ~ 0
XLE
Entry Wire Line
	700  6950 600  7050
Text Label 700  7250 0    60   ~ 0
~YRES
Entry Wire Line
	700  7250 600  7350
Text Label 700  7350 0    60   ~ 0
YH0
Entry Wire Line
	700  7350 600  7450
$Comp
L orion:IE18 DD7
U 1 1 5B71B682
P 1500 7950
F 0 "DD7" H 1500 8450 60  0000 C CNN
F 1 "IE18" H 1500 7550 60  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 1400 8300 60  0001 C CNN
F 3 "http://www.ti.com/lit/ds/sdls060/sdls060.pdf" H 1400 8300 60  0001 C CNN
	1    1500 7950
	1    0    0    -1  
$EndComp
Text Label 2300 7550 2    60   ~ 0
Y8
Entry Wire Line
	2300 7550 2400 7650
Text Label 2300 7650 2    60   ~ 0
Y9
Entry Wire Line
	2300 7650 2400 7750
Text Label 700  7950 0    60   ~ 0
XLE
Entry Wire Line
	700  7950 600  8050
Text Label 700  8250 0    60   ~ 0
~YRES
Entry Wire Line
	700  8250 600  8350
Text Label 700  8350 0    60   ~ 0
YH1
Entry Wire Line
	700  8350 600  8450
NoConn ~ 1050 5550
NoConn ~ 1050 5650
NoConn ~ 1050 5750
NoConn ~ 1050 5850
NoConn ~ 1050 6550
NoConn ~ 1050 6650
NoConn ~ 1050 6750
NoConn ~ 1050 6850
NoConn ~ 1050 7550
NoConn ~ 1050 7650
NoConn ~ 1050 7750
NoConn ~ 1050 7850
NoConn ~ 1950 8050
Text Label 700  8550 0    60   ~ 0
Y9
Entry Wire Line
	700  8550 600  8650
Text Label 700  8650 0    60   ~ 0
Y8
Entry Wire Line
	700  8650 600  8750
Text Label 700  8750 0    60   ~ 0
Y7
Entry Wire Line
	700  8750 600  8850
Text Label 700  8850 0    60   ~ 0
Y6
Entry Wire Line
	700  8850 600  8950
Text Label 700  8950 0    60   ~ 0
Y5
Entry Wire Line
	700  8950 600  9050
Text Label 700  9050 0    60   ~ 0
Y4
Entry Wire Line
	700  9050 600  9150
Text Label 700  9150 0    60   ~ 0
Y3
Entry Wire Line
	700  9150 600  9250
Text Label 700  9250 0    60   ~ 0
Y2
Entry Wire Line
	700  9250 600  9350
Text Label 700  9350 0    60   ~ 0
Y1
Entry Wire Line
	700  9350 600  9450
Text Label 700  9450 0    60   ~ 0
Y0
Entry Wire Line
	700  9450 600  9550
Text Label 2300 9350 2    60   ~ 0
BH
Entry Wire Line
	2300 8550 2400 8650
Text Label 2300 9150 2    60   ~ 0
~XRES
Entry Wire Line
	2300 8650 2400 8750
Text Label 700  9550 0    60   ~ 0
WEN
Entry Wire Line
	700  9550 600  9650
Entry Wire Line
	2300 8750 2400 8850
Text Label 2300 8750 2    60   ~ 0
VS
Entry Wire Line
	2300 8850 2400 8950
Text Label 2300 4350 2    60   ~ 0
~BE
Entry Wire Line
	2300 4550 2400 4650
Text Label 2300 4850 2    60   ~ 0
CSL
Entry Wire Line
	2300 5050 2400 5150
$Comp
L orion:IDT7028PF DD9
U 2 1 5B71D1EB
P 3500 1800
F 0 "DD9" H 3500 2950 50  0000 C CNN
F 1 "IDT7028PF" H 3675 550 50  0000 C CNN
F 2 "Package_QFP:LQFP-100_14x14mm_P0.5mm" H 3500 1800 50  0001 C CNN
F 3 "" H 3500 1800 50  0001 C CNN
	2    3500 1800
	1    0    0    -1  
$EndComp
NoConn ~ 4200 2550
NoConn ~ 4200 2650
Text GLabel 2800 2850 0    60   Input ~ 0
PUP2
Text GLabel 2800 2950 0    60   Input ~ 0
PUP2
Text GLabel 4200 2750 2    60   Input ~ 0
PUP2
$Comp
L orion:AP6 DD19
U 1 1 5B73454F
P 7300 1200
F 0 "DD19" H 7300 1750 60  0000 C CNN
F 1 "AP6" H 7300 750 60  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 7250 1350 60  0001 C CNN
F 3 "" H 7250 1350 60  0001 C CNN
	1    7300 1200
	1    0    0    -1  
$EndComp
$Comp
L orion:AP6 DD20
U 1 1 5B7346A8
P 7300 2300
F 0 "DD20" H 7300 2850 60  0000 C CNN
F 1 "AP6" H 7300 1850 60  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 7250 2450 60  0001 C CNN
F 3 "" H 7250 2450 60  0001 C CNN
	1    7300 2300
	1    0    0    -1  
$EndComp
Text Label 2500 3250 0    60   ~ 0
A0
Entry Wire Line
	2500 3250 2400 3350
Text Label 2500 3350 0    60   ~ 0
A1
Entry Wire Line
	2500 3350 2400 3450
Text Label 2500 3450 0    60   ~ 0
A2
Entry Wire Line
	2500 3450 2400 3550
Text Label 2500 3550 0    60   ~ 0
A3
Entry Wire Line
	2500 3550 2400 3650
Text Label 2500 3650 0    60   ~ 0
A4
Entry Wire Line
	2500 3650 2400 3750
Text Label 2500 3750 0    60   ~ 0
A5
Entry Wire Line
	2500 3750 2400 3850
Text Label 2500 3850 0    60   ~ 0
A6
Entry Wire Line
	2500 3850 2400 3950
Text Label 2500 3950 0    60   ~ 0
A7
Entry Wire Line
	2500 3950 2400 4050
Text Label 2500 4050 0    60   ~ 0
A8
Entry Wire Line
	2500 4050 2400 4150
Text Label 2500 4150 0    60   ~ 0
A9
Entry Wire Line
	2500 4150 2400 4250
Text Label 2500 4250 0    60   ~ 0
A10
Entry Wire Line
	2500 4250 2400 4350
Text Label 2500 4350 0    60   ~ 0
A11
Entry Wire Line
	2500 4350 2400 4450
Text Label 2500 4450 0    60   ~ 0
A12
Entry Wire Line
	2500 4450 2400 4550
Text Label 2500 4550 0    60   ~ 0
A13
Entry Wire Line
	2500 4550 2400 4650
Text Label 2500 4650 0    60   ~ 0
MA14
Entry Wire Line
	2500 4650 2400 4750
Text Label 2500 4750 0    60   ~ 0
MA15
Entry Wire Line
	2500 4750 2400 4850
Text Label 2500 5050 0    60   ~ 0
~LB
Entry Wire Line
	2500 5050 2400 5150
Text Label 2500 5150 0    60   ~ 0
~UB
Entry Wire Line
	2500 5150 2400 5250
Text Label 4500 3250 2    60   ~ 0
MD0
Entry Wire Line
	4500 3250 4600 3350
Text Label 4500 3450 2    60   ~ 0
MD1
Entry Wire Line
	4500 3350 4600 3450
Text Label 4500 3550 2    60   ~ 0
MD2
Entry Wire Line
	4500 3450 4600 3550
Text Label 4500 3750 2    60   ~ 0
MD3
Entry Wire Line
	4500 3550 4600 3650
Text Label 4500 3950 2    60   ~ 0
MD4
Entry Wire Line
	4500 3650 4600 3750
Text Label 4500 3850 2    60   ~ 0
MD5
Entry Wire Line
	4500 3750 4600 3850
Text Label 4500 3650 2    60   ~ 0
MD6
Entry Wire Line
	4500 3850 4600 3950
Text Label 4500 3350 2    60   ~ 0
MD7
Entry Wire Line
	4500 3950 4600 4050
Text Label 4500 4050 2    60   ~ 0
MD8
Entry Wire Line
	4500 4050 4600 4150
Text Label 4500 4250 2    60   ~ 0
MD9
Entry Wire Line
	4500 4150 4600 4250
Text Label 4500 4350 2    60   ~ 0
MD10
Entry Wire Line
	4500 4250 4600 4350
Text Label 4500 4550 2    60   ~ 0
MD11
Entry Wire Line
	4500 4350 4600 4450
Text Label 4500 4750 2    60   ~ 0
MD12
Entry Wire Line
	4500 4450 4600 4550
Text Label 4500 4650 2    60   ~ 0
MD13
Entry Wire Line
	4500 4550 4600 4650
Text Label 4500 4450 2    60   ~ 0
MD14
Entry Wire Line
	4500 4650 4600 4750
Text Label 4500 4150 2    60   ~ 0
MD15
Entry Wire Line
	4500 4750 4600 4850
$Comp
L orion:IDT7028PF DD9
U 1 1 5B73C5B9
P 3500 4300
F 0 "DD9" H 3500 5450 50  0000 C CNN
F 1 "IDT7028PF" H 3675 3050 50  0000 C CNN
F 2 "Package_QFP:LQFP-100_14x14mm_P0.5mm" H 3500 4300 50  0001 C CNN
F 3 "" H 3500 4300 50  0001 C CNN
	1    3500 4300
	1    0    0    -1  
$EndComp
NoConn ~ 4200 5050
NoConn ~ 4200 5150
Text GLabel 4200 5250 2    60   Input ~ 0
PUP3
Text GLabel 2800 5350 0    60   Input ~ 0
PUP3
Text Label 2500 5250 0    60   ~ 0
~VCE0
Entry Wire Line
	2500 5250 2400 5350
Text Label 2500 5450 0    60   ~ 0
~MWR
Entry Wire Line
	2500 5450 2400 5550
Text Label 2500 5550 0    60   ~ 0
~MRD
Entry Wire Line
	2500 5550 2400 5650
Text Label 2300 5050 2    60   ~ 0
ZCLK
Entry Wire Line
	2300 4850 2400 4950
Text Label 2300 4950 2    60   ~ 0
~TRB
Entry Wire Line
	2300 4950 2400 5050
Text Label 2300 9050 2    60   ~ 0
~YRES
Entry Wire Line
	2300 9050 2400 9150
Text GLabel 4975 10550 0    60   Input ~ 0
VGAP
Text GLabel 6750 10250 0    60   Input ~ 0
VGAP
Text Label 6500 4050 0    60   ~ 0
D4
Entry Wire Line
	6500 4050 6400 4150
Text Label 6500 4150 0    60   ~ 0
D3
Entry Wire Line
	6500 4150 6400 4250
Text Label 6500 4250 0    60   ~ 0
D1
Entry Wire Line
	6500 4250 6400 4350
Text Label 6500 4350 0    60   ~ 0
D0
Entry Wire Line
	6500 4350 6400 4450
Text Label 6500 4450 0    60   ~ 0
D2
Entry Wire Line
	6500 4450 6400 4550
Text Label 6500 4650 0    60   ~ 0
PF8
Entry Wire Line
	6500 4650 6400 4750
Text Label 6500 4750 0    60   ~ 0
~RES
Entry Wire Line
	6500 4750 6400 4850
Text Label 8100 4050 2    60   ~ 0
VM4
Entry Wire Line
	8100 4050 8200 4150
Text Label 8100 4150 2    60   ~ 0
VM3
Entry Wire Line
	8100 4150 8200 4250
Text Label 8100 4250 2    60   ~ 0
VM1
Entry Wire Line
	8100 4250 8200 4350
Text Label 8100 4350 2    60   ~ 0
VM0
Entry Wire Line
	8100 4350 8200 4450
Text Label 8100 4450 2    60   ~ 0
VM2
Entry Wire Line
	8100 4450 8200 4550
Text Label 6500 3450 0    60   ~ 0
D7
Text Label 6500 3350 0    60   ~ 0
D3
Entry Wire Line
	6500 3050 6400 3150
Text Label 6500 3250 0    60   ~ 0
D1
Entry Wire Line
	6500 3150 6400 3250
Entry Wire Line
	6500 3250 6400 3350
Text Label 6500 3150 0    60   ~ 0
D0
Entry Wire Line
	6500 3350 6400 3450
Text Label 6500 3050 0    60   ~ 0
D2
Entry Wire Line
	6500 3450 6400 3550
Text Label 6500 3550 0    60   ~ 0
PFA
Entry Wire Line
	6500 3550 6400 3650
Text Label 6500 3650 0    60   ~ 0
~RES
Entry Wire Line
	6500 3650 6400 3750
Text Label 8100 2950 2    60   ~ 0
PGD
Entry Wire Line
	8100 2950 8200 3050
Text Label 8100 3450 2    60   ~ 0
SR16
Text Label 8100 3350 2    60   ~ 0
F1
Entry Wire Line
	8100 3050 8200 3150
Text Label 8100 3250 2    60   ~ 0
VB1
Entry Wire Line
	8100 3150 8200 3250
Entry Wire Line
	8100 3250 8200 3350
Text Label 8100 3150 2    60   ~ 0
VB0
Entry Wire Line
	8100 3350 8200 3450
Text Label 8100 3050 2    60   ~ 0
F0
Entry Wire Line
	8100 3450 8200 3550
$Comp
L orion:C96ABC J1
U 1 1 5B720FA5
P 8950 2300
F 0 "J1" H 9000 3950 50  0000 C CNN
F 1 "C96ABC" V 9200 2300 50  0001 C CNN
F 2 "Connectors_IEC_DIN:Socket_DIN41612-CaseC1-full-Male-96Pin-3rows" H 8950 2300 50  0001 C CNN
F 3 "" H 8950 2300 50  0001 C CNN
	1    8950 2300
	1    0    0    -1  
$EndComp
NoConn ~ 8550 1750
NoConn ~ 8550 1850
NoConn ~ 8550 1950
NoConn ~ 8550 2050
NoConn ~ 8550 2150
$Comp
L orion:C96ABC J1
U 3 1 5B728BC0
P 8950 5600
F 0 "J1" H 9000 7250 50  0000 C CNN
F 1 "C96ABC" V 9200 5600 50  0001 C CNN
F 2 "Connectors_IEC_DIN:Socket_DIN41612-CaseC1-full-Male-96Pin-3rows" H 8950 5600 50  0001 C CNN
F 3 "" H 8950 5600 50  0001 C CNN
	3    8950 5600
	1    0    0    -1  
$EndComp
Text Label 8300 4550 0    60   ~ 0
~M1
Entry Wire Line
	8300 4550 8200 4650
Text Label 8300 5850 0    60   ~ 0
~RFSH
Entry Wire Line
	8300 5850 8200 5950
Text Label 8300 6950 0    60   ~ 0
X0
Entry Wire Line
	8300 6950 8200 7050
Wire Wire Line
	5000 6450 4700 6450
Wire Wire Line
	5000 6550 4700 6550
Wire Wire Line
	5000 6650 4700 6650
Wire Wire Line
	5000 6750 4700 6750
Wire Wire Line
	5000 6850 4700 6850
Wire Wire Line
	5000 6950 4700 6950
Wire Wire Line
	5000 7050 4700 7050
Wire Wire Line
	5000 7150 4700 7150
Wire Wire Line
	5000 7250 4700 7250
Wire Wire Line
	5000 7350 4700 7350
Wire Wire Line
	5000 7450 4700 7450
Wire Wire Line
	5000 7550 4700 7550
Wire Wire Line
	6000 6450 6300 6450
Wire Wire Line
	6000 6550 6300 6550
Wire Wire Line
	6000 6650 6300 6650
Wire Wire Line
	6000 6750 6300 6750
Wire Wire Line
	6000 6850 6300 6850
Wire Wire Line
	6000 6950 6300 6950
Wire Wire Line
	6000 7050 6300 7050
Wire Wire Line
	6000 7150 6300 7150
Wire Wire Line
	6000 7250 6300 7250
Wire Wire Line
	6000 7350 6300 7350
Wire Wire Line
	5000 750  4700 750 
Wire Wire Line
	5000 850  4700 850 
Wire Wire Line
	5000 950  4700 950 
Wire Wire Line
	5000 1050 4700 1050
Wire Wire Line
	5000 1150 4700 1150
Wire Wire Line
	5000 1250 4700 1250
Wire Wire Line
	5000 1350 4700 1350
Wire Wire Line
	5000 1450 4700 1450
Wire Wire Line
	6000 1450 6300 1450
Wire Wire Line
	5000 2250 4700 2250
Wire Wire Line
	5000 2350 4700 2350
Wire Wire Line
	5000 2450 4700 2450
Wire Wire Line
	5000 2550 4700 2550
Wire Wire Line
	5000 2650 4700 2650
Wire Wire Line
	5000 2750 4700 2750
Wire Wire Line
	5000 2850 4700 2850
Wire Wire Line
	5000 2950 4700 2950
Wire Wire Line
	6000 2950 6300 2950
Wire Wire Line
	5000 3650 4700 3650
Wire Wire Line
	5000 3750 4700 3750
Wire Wire Line
	5000 3850 4700 3850
Wire Wire Line
	5000 3950 4700 3950
Wire Wire Line
	5000 4050 4700 4050
Wire Wire Line
	5000 4150 4700 4150
Wire Wire Line
	5000 4250 4700 4250
Wire Wire Line
	5000 4350 4700 4350
Wire Wire Line
	6000 4350 6300 4350
Wire Wire Line
	5000 5050 4700 5050
Wire Wire Line
	5000 5150 4700 5150
Wire Wire Line
	5000 5250 4700 5250
Wire Wire Line
	5000 5350 4700 5350
Wire Wire Line
	5000 5450 4700 5450
Wire Wire Line
	5000 5550 4700 5550
Wire Wire Line
	5000 5650 4700 5650
Wire Wire Line
	5000 5750 4700 5750
Wire Wire Line
	6000 5750 6300 5750
Wire Wire Line
	5000 1650 4700 1650
Wire Wire Line
	5000 1950 4700 1950
Wire Wire Line
	5000 3150 4700 3150
Wire Wire Line
	5000 3350 4700 3350
Wire Wire Line
	5000 3450 4700 3450
Wire Wire Line
	5000 4550 4700 4550
Wire Wire Line
	5000 4850 4700 4850
Wire Wire Line
	5000 5950 4700 5950
Wire Wire Line
	5000 6250 4700 6250
Wire Wire Line
	2800 750  2500 750 
Wire Wire Line
	2800 850  2500 850 
Wire Wire Line
	2800 950  2500 950 
Wire Wire Line
	2800 1050 2500 1050
Wire Wire Line
	2800 1150 2500 1150
Wire Wire Line
	2800 1250 2500 1250
Wire Wire Line
	2800 1350 2500 1350
Wire Wire Line
	2800 1450 2500 1450
Wire Wire Line
	2800 1550 2500 1550
Wire Wire Line
	2800 1650 2500 1650
Wire Wire Line
	2800 1750 2500 1750
Wire Wire Line
	2800 1850 2500 1850
Wire Wire Line
	2800 1950 2500 1950
Wire Wire Line
	2800 2050 2500 2050
Wire Wire Line
	2800 2150 2500 2150
Wire Wire Line
	2800 2250 2500 2250
Wire Wire Line
	4200 750  4500 750 
Wire Wire Line
	4200 850  4500 850 
Wire Wire Line
	4200 950  4500 950 
Wire Wire Line
	4200 1050 4500 1050
Wire Wire Line
	4200 1150 4500 1150
Wire Wire Line
	4200 1250 4500 1250
Wire Wire Line
	4200 1350 4500 1350
Wire Wire Line
	4200 1450 4500 1450
Wire Wire Line
	4200 1550 4500 1550
Wire Wire Line
	4200 1650 4500 1650
Wire Wire Line
	4200 1750 4500 1750
Wire Wire Line
	4200 1850 4500 1850
Wire Wire Line
	4200 1950 4500 1950
Wire Wire Line
	4200 2050 4500 2050
Wire Wire Line
	4200 2150 4500 2150
Wire Wire Line
	4200 2250 4500 2250
Wire Wire Line
	4700 8150 5600 8150
Wire Wire Line
	4700 8250 6000 8250
Wire Wire Line
	5950 7750 6000 7750
Wire Wire Line
	6000 7750 6300 7750
Wire Wire Line
	6000 7800 6000 7750
Connection ~ 6000 7750
Wire Wire Line
	5550 7750 5600 7750
Wire Wire Line
	5600 7750 5650 7750
Wire Wire Line
	5600 7800 5600 7750
Connection ~ 5600 7750
Wire Wire Line
	5600 8150 5600 8100
Wire Wire Line
	6000 8250 6000 8100
Wire Wire Line
	4700 8850 5600 8850
Wire Wire Line
	4700 8950 6000 8950
Wire Wire Line
	5950 8450 6000 8450
Wire Wire Line
	6000 8450 6300 8450
Wire Wire Line
	6000 8500 6000 8450
Connection ~ 6000 8450
Wire Wire Line
	5550 8450 5600 8450
Wire Wire Line
	5600 8450 5650 8450
Wire Wire Line
	5600 8500 5600 8450
Connection ~ 5600 8450
Wire Wire Line
	5600 8850 5600 8800
Wire Wire Line
	6000 8950 6000 8800
Wire Wire Line
	4700 9550 5600 9550
Wire Wire Line
	4700 9650 6000 9650
Wire Wire Line
	5950 9150 6000 9150
Wire Wire Line
	6000 9150 6300 9150
Wire Wire Line
	6000 9200 6000 9150
Connection ~ 6000 9150
Wire Wire Line
	5550 9150 5600 9150
Wire Wire Line
	5600 9150 5650 9150
Wire Wire Line
	5600 9200 5600 9150
Connection ~ 5600 9150
Wire Wire Line
	5600 9550 5600 9500
Wire Wire Line
	6000 9650 6000 9500
Wire Wire Line
	6000 10650 6300 10650
Wire Wire Line
	6000 10450 6300 10450
Wire Wire Line
	4700 10050 5100 10050
Wire Wire Line
	4700 10250 5100 10250
Wire Wire Line
	4700 10450 5100 10450
Wire Wire Line
	7200 10150 7200 10550
Wire Wire Line
	7200 10550 7200 10750
Wire Wire Line
	6700 10150 7200 10150
Wire Wire Line
	7200 10150 7350 10150
Wire Wire Line
	5000 9950 5000 10150
Wire Wire Line
	5000 10150 5000 10350
Wire Wire Line
	5000 10350 5000 10750
Wire Wire Line
	5000 10750 5000 10850
Wire Wire Line
	5000 10850 5000 10900
Wire Wire Line
	5000 10850 5100 10850
Wire Wire Line
	5000 9950 5100 9950
Wire Wire Line
	5100 10150 5000 10150
Connection ~ 5000 10150
Wire Wire Line
	5100 10350 5000 10350
Connection ~ 5000 10350
Wire Wire Line
	5100 10750 5000 10750
Connection ~ 5000 10750
Connection ~ 5000 10850
Wire Wire Line
	6750 10250 7350 10250
Connection ~ 7200 10150
Wire Wire Line
	6500 10650 7100 10650
Wire Wire Line
	7100 10650 7350 10650
Wire Wire Line
	7200 10550 7350 10550
Wire Wire Line
	6700 10350 6750 10350
Wire Wire Line
	6750 10350 7350 10350
Wire Wire Line
	7100 10550 7100 10650
Connection ~ 7100 10650
Wire Wire Line
	8300 4150 8550 4150
Wire Wire Line
	8300 1550 8550 1550
Wire Wire Line
	8300 1450 8550 1450
Wire Wire Line
	8300 1350 8550 1350
Wire Wire Line
	8300 1250 8550 1250
Wire Wire Line
	8300 1150 8550 1150
Wire Wire Line
	8300 1050 8550 1050
Wire Wire Line
	8300 950  8550 950 
Wire Wire Line
	8300 850  8550 850 
Wire Wire Line
	8300 2750 8550 2750
Wire Wire Line
	8300 2650 8550 2650
Wire Wire Line
	8300 2350 8550 2350
Wire Wire Line
	8300 2450 8550 2450
Wire Wire Line
	8300 2550 8550 2550
Wire Wire Line
	8300 2250 8550 2250
Wire Wire Line
	8300 2850 8550 2850
Wire Wire Line
	8300 2950 8550 2950
Wire Wire Line
	8300 5250 8550 5250
Wire Wire Line
	8300 6750 8550 6750
Wire Wire Line
	8300 3050 8550 3050
Wire Wire Line
	8300 3150 8550 3150
Wire Wire Line
	8300 3250 8550 3250
Wire Wire Line
	8300 3350 8550 3350
Wire Wire Line
	8300 3450 8550 3450
Wire Wire Line
	8300 3550 8550 3550
Wire Wire Line
	8300 3650 8550 3650
Wire Wire Line
	8300 3750 8550 3750
Wire Wire Line
	8300 5350 8550 5350
Wire Wire Line
	8300 6550 8550 6550
Wire Wire Line
	8300 6250 8550 6250
Wire Wire Line
	8300 6150 8550 6150
Wire Wire Line
	8300 6650 8550 6650
Wire Wire Line
	8300 6350 8550 6350
Wire Wire Line
	8300 6450 8550 6450
Wire Wire Line
	6500 10850 7100 10850
Wire Wire Line
	7100 10850 7350 10850
Wire Wire Line
	6800 10550 6750 10550
Wire Wire Line
	6750 10350 6750 10550
Wire Wire Line
	6750 10550 6750 10750
Connection ~ 6750 10350
Wire Wire Line
	6750 10750 6800 10750
Connection ~ 6750 10550
Wire Wire Line
	7200 10750 7350 10750
Connection ~ 7200 10550
Wire Wire Line
	7100 10750 7100 10850
Connection ~ 7100 10850
Wire Wire Line
	6500 750  6800 750 
Wire Wire Line
	6800 850  6500 850 
Wire Wire Line
	6500 950  6800 950 
Wire Wire Line
	6800 1050 6500 1050
Wire Wire Line
	6500 1150 6800 1150
Wire Wire Line
	6800 1250 6500 1250
Wire Wire Line
	6500 1350 6800 1350
Wire Wire Line
	6800 1450 6500 1450
Wire Wire Line
	6500 1550 6800 1550
Wire Wire Line
	6800 1650 6500 1650
Wire Wire Line
	7800 750  8100 750 
Wire Wire Line
	8100 850  7800 850 
Wire Wire Line
	7800 950  8100 950 
Wire Wire Line
	8100 1050 7800 1050
Wire Wire Line
	7800 1150 8100 1150
Wire Wire Line
	8100 1250 7800 1250
Wire Wire Line
	7800 1350 8100 1350
Wire Wire Line
	7800 1450 8100 1450
Wire Wire Line
	6500 1850 6800 1850
Wire Wire Line
	6800 1950 6500 1950
Wire Wire Line
	6500 2050 6800 2050
Wire Wire Line
	6800 2150 6500 2150
Wire Wire Line
	6500 2250 6800 2250
Wire Wire Line
	6800 2350 6500 2350
Wire Wire Line
	6500 2450 6800 2450
Wire Wire Line
	6800 2550 6500 2550
Wire Wire Line
	6500 2650 6800 2650
Wire Wire Line
	6800 2750 6500 2750
Wire Wire Line
	7800 1850 8100 1850
Wire Wire Line
	8100 1950 7800 1950
Wire Wire Line
	7800 2050 8100 2050
Wire Wire Line
	8100 2150 7800 2150
Wire Wire Line
	7800 2250 8100 2250
Wire Wire Line
	8100 2350 7800 2350
Wire Wire Line
	7800 2450 8100 2450
Wire Wire Line
	7800 2550 8100 2550
Wire Wire Line
	8300 5150 8550 5150
Wire Wire Line
	8300 5050 8550 5050
Wire Wire Line
	8300 1650 8550 1650
Wire Wire Line
	8300 6050 8550 6050
Wire Wire Line
	8300 4950 8550 4950
Wire Wire Line
	1750 750  2300 750 
Wire Wire Line
	1950 1150 2300 1150
Wire Wire Line
	1950 1250 2300 1250
Wire Wire Line
	1950 1350 2300 1350
Wire Wire Line
	1950 1450 2300 1450
Wire Wire Line
	1950 1650 2300 1650
Wire Wire Line
	700  1550 1050 1550
Wire Wire Line
	1000 1000 1050 1000
Wire Wire Line
	1050 1650 1000 1650
Wire Wire Line
	1000 1750 1050 1750
Connection ~ 1000 1650
Connection ~ 1000 1750
Wire Wire Line
	1000 1950 1050 1950
Wire Wire Line
	1000 1000 1000 1650
Wire Wire Line
	1000 1650 1000 1750
Wire Wire Line
	1000 1750 1000 1950
Wire Wire Line
	1000 1950 1000 2650
Wire Wire Line
	1000 2650 1000 2750
Wire Wire Line
	1000 2750 1000 3650
Wire Wire Line
	1000 3650 1000 3750
Wire Wire Line
	700  1850 1050 1850
Wire Wire Line
	1950 2150 2300 2150
Wire Wire Line
	1950 2250 2300 2250
Wire Wire Line
	1950 2350 2300 2350
Wire Wire Line
	1950 2450 2300 2450
Wire Wire Line
	1950 2650 2300 2650
Wire Wire Line
	700  2550 1050 2550
Wire Wire Line
	1050 2650 1000 2650
Wire Wire Line
	1000 2750 1050 2750
Connection ~ 1000 2650
Connection ~ 1000 2750
Wire Wire Line
	700  2850 1050 2850
Connection ~ 1000 1950
Wire Wire Line
	700  2950 1050 2950
Wire Wire Line
	1950 3150 2300 3150
Wire Wire Line
	1950 3250 2300 3250
Wire Wire Line
	700  3550 1050 3550
Wire Wire Line
	1050 3650 1000 3650
Wire Wire Line
	1000 3750 1050 3750
Connection ~ 1000 3650
Wire Wire Line
	700  3850 1050 3850
Wire Wire Line
	700  3950 1050 3950
Wire Wire Line
	1000 4150 700  4150
Wire Wire Line
	1000 4250 700  4250
Wire Wire Line
	1000 4350 700  4350
Wire Wire Line
	1000 4450 700  4450
Wire Wire Line
	1000 4550 700  4550
Wire Wire Line
	1000 4650 700  4650
Wire Wire Line
	1000 4750 700  4750
Wire Wire Line
	1000 4850 700  4850
Wire Wire Line
	1000 4950 700  4950
Wire Wire Line
	1000 5050 700  5050
Wire Wire Line
	2000 4150 2300 4150
Wire Wire Line
	2000 4250 2300 4250
Wire Wire Line
	1000 5150 700  5150
Wire Wire Line
	2000 4350 2300 4350
Wire Wire Line
	2000 4450 2300 4450
Wire Wire Line
	1000 5250 700  5250
Wire Wire Line
	1950 5550 2300 5550
Wire Wire Line
	1950 5650 2300 5650
Wire Wire Line
	1950 5750 2300 5750
Wire Wire Line
	1950 5850 2300 5850
Wire Wire Line
	1950 6050 2300 6050
Wire Wire Line
	700  5950 1050 5950
Wire Wire Line
	1050 6050 1000 6050
Wire Wire Line
	1000 6150 1050 6150
Connection ~ 1000 6050
Connection ~ 1000 6150
Wire Wire Line
	1000 6350 1050 6350
Wire Wire Line
	1000 5400 1000 6050
Wire Wire Line
	1000 6050 1000 6150
Wire Wire Line
	1000 6150 1000 6350
Wire Wire Line
	1000 6350 1000 7050
Wire Wire Line
	1000 7050 1000 7150
Wire Wire Line
	1000 7150 1000 8050
Wire Wire Line
	1000 8050 1000 8150
Wire Wire Line
	700  6250 1050 6250
Wire Wire Line
	1950 6550 2300 6550
Wire Wire Line
	1950 6650 2300 6650
Wire Wire Line
	1950 6750 2300 6750
Wire Wire Line
	1950 6850 2300 6850
Wire Wire Line
	1950 7050 2300 7050
Wire Wire Line
	700  6950 1050 6950
Wire Wire Line
	1050 7050 1000 7050
Wire Wire Line
	1000 7150 1050 7150
Connection ~ 1000 7050
Connection ~ 1000 7150
Wire Wire Line
	700  7250 1050 7250
Connection ~ 1000 6350
Wire Wire Line
	700  7350 1050 7350
Wire Wire Line
	1950 7550 2300 7550
Wire Wire Line
	1950 7650 2300 7650
Wire Wire Line
	700  7950 1050 7950
Wire Wire Line
	1050 8050 1000 8050
Wire Wire Line
	1000 8150 1050 8150
Connection ~ 1000 8050
Wire Wire Line
	700  8250 1050 8250
Wire Wire Line
	700  8350 1050 8350
Wire Wire Line
	1000 8550 700  8550
Wire Wire Line
	1000 8650 700  8650
Wire Wire Line
	1000 8750 700  8750
Wire Wire Line
	1000 8850 700  8850
Wire Wire Line
	1000 8950 700  8950
Wire Wire Line
	1000 9050 700  9050
Wire Wire Line
	1000 9150 700  9150
Wire Wire Line
	1000 9250 700  9250
Wire Wire Line
	1000 9350 700  9350
Wire Wire Line
	1000 9450 700  9450
Wire Wire Line
	2000 8550 2300 8550
Wire Wire Line
	2000 8650 2300 8650
Wire Wire Line
	1000 9550 700  9550
Wire Wire Line
	2000 8750 2300 8750
Wire Wire Line
	2000 8850 2300 8850
Wire Wire Line
	1050 5400 1000 5400
Wire Wire Line
	2000 4550 2300 4550
Wire Wire Line
	2000 5050 2300 5050
Wire Wire Line
	900  10000 950  10000
Wire Wire Line
	950  10000 1150 10000
Wire Wire Line
	1150 10000 1350 10000
Wire Wire Line
	1350 10000 1550 10000
Wire Wire Line
	1550 10000 1750 10000
Wire Wire Line
	1750 10000 1950 10000
Wire Wire Line
	1950 10000 2150 10000
Wire Wire Line
	900  10300 950  10300
Wire Wire Line
	950  10300 1150 10300
Wire Wire Line
	1150 10300 1350 10300
Wire Wire Line
	1350 10300 1550 10300
Wire Wire Line
	1550 10300 1750 10300
Wire Wire Line
	1750 10300 1950 10300
Wire Wire Line
	1950 10300 2150 10300
Wire Wire Line
	1750 10300 1750 10250
Wire Wire Line
	1550 10250 1550 10300
Connection ~ 1550 10300
Wire Wire Line
	1350 10250 1350 10300
Connection ~ 1350 10300
Wire Wire Line
	1150 10250 1150 10300
Connection ~ 1150 10300
Wire Wire Line
	950  10250 950  10300
Connection ~ 950  10300
Wire Wire Line
	950  10050 950  10000
Connection ~ 950  10000
Wire Wire Line
	1150 10050 1150 10000
Connection ~ 1150 10000
Wire Wire Line
	1350 10050 1350 10000
Connection ~ 1350 10000
Wire Wire Line
	1550 10050 1550 10000
Connection ~ 1550 10000
Wire Wire Line
	1750 10000 1750 10050
Wire Wire Line
	2150 10000 2150 10050
Connection ~ 1950 10000
Wire Wire Line
	1950 10000 1950 10050
Connection ~ 1950 10300
Wire Wire Line
	1950 10300 1950 10250
Wire Wire Line
	2150 10300 2150 10250
Connection ~ 1750 10000
Connection ~ 1750 10300
Wire Bus Line
	600  11150 2400 11150
Wire Wire Line
	6500 5250 7000 5250
Wire Wire Line
	7550 5250 8100 5250
Wire Wire Line
	8100 5550 7800 5550
Wire Wire Line
	7800 5650 8100 5650
Wire Wire Line
	7800 5750 8100 5750
Wire Wire Line
	7800 5850 8100 5850
Wire Wire Line
	8100 5950 7800 5950
Wire Wire Line
	7800 6050 8100 6050
Wire Wire Line
	8100 6150 7800 6150
Wire Wire Line
	7800 6250 8100 6250
Wire Wire Line
	8100 6650 7800 6650
Wire Wire Line
	8100 6750 7800 6750
Wire Wire Line
	7800 6850 8100 6850
Wire Wire Line
	8100 6950 7800 6950
Wire Wire Line
	7800 7050 8100 7050
Wire Wire Line
	8100 7150 7800 7150
Wire Wire Line
	7800 7250 8100 7250
Wire Wire Line
	8100 7350 7800 7350
Wire Wire Line
	6800 7550 6500 7550
Wire Wire Line
	6500 7450 6800 7450
Wire Wire Line
	6800 7350 6500 7350
Wire Wire Line
	6500 7250 6800 7250
Wire Wire Line
	6800 7150 6500 7150
Wire Wire Line
	6500 7050 6800 7050
Wire Wire Line
	6500 6950 6800 6950
Wire Wire Line
	6500 6850 6800 6850
Wire Wire Line
	6800 6750 6500 6750
Wire Wire Line
	6500 6650 6800 6650
Wire Wire Line
	6800 6450 6500 6450
Wire Wire Line
	6500 6350 6800 6350
Wire Wire Line
	6800 6250 6500 6250
Wire Wire Line
	6500 6150 6800 6150
Wire Wire Line
	6800 6050 6500 6050
Wire Wire Line
	6500 5950 6800 5950
Wire Wire Line
	6800 5850 6500 5850
Wire Wire Line
	6500 5750 6800 5750
Wire Wire Line
	6800 5650 6500 5650
Wire Wire Line
	6500 5550 6800 5550
Wire Wire Line
	2800 3250 2500 3250
Wire Wire Line
	2800 3350 2500 3350
Wire Wire Line
	2800 3450 2500 3450
Wire Wire Line
	2800 3550 2500 3550
Wire Wire Line
	2800 3650 2500 3650
Wire Wire Line
	2800 3750 2500 3750
Wire Wire Line
	2800 3850 2500 3850
Wire Wire Line
	2800 3950 2500 3950
Wire Wire Line
	2800 4050 2500 4050
Wire Wire Line
	2800 4150 2500 4150
Wire Wire Line
	2800 4250 2500 4250
Wire Wire Line
	2800 4350 2500 4350
Wire Wire Line
	2800 4450 2500 4450
Wire Wire Line
	2800 4550 2500 4550
Wire Wire Line
	2800 4650 2500 4650
Wire Wire Line
	2800 4750 2500 4750
Wire Wire Line
	2800 5050 2500 5050
Wire Wire Line
	2800 5150 2500 5150
Wire Wire Line
	4200 3250 4500 3250
Wire Wire Line
	4200 3350 4500 3350
Wire Wire Line
	4200 3450 4500 3450
Wire Wire Line
	4200 3550 4500 3550
Wire Wire Line
	4200 3650 4500 3650
Wire Wire Line
	4200 3750 4500 3750
Wire Wire Line
	4200 3850 4500 3850
Wire Wire Line
	4200 3950 4500 3950
Wire Wire Line
	4200 4050 4500 4050
Wire Wire Line
	4200 4150 4500 4150
Wire Wire Line
	4200 4250 4500 4250
Wire Wire Line
	4200 4350 4500 4350
Wire Wire Line
	4200 4450 4500 4450
Wire Wire Line
	4200 4550 4500 4550
Wire Wire Line
	4200 4650 4500 4650
Wire Wire Line
	4200 4750 4500 4750
Wire Wire Line
	2800 5250 2500 5250
Wire Wire Line
	2800 5450 2500 5450
Wire Wire Line
	2800 5550 2500 5550
Wire Wire Line
	900  10500 950  10500
Wire Wire Line
	950  10500 1150 10500
Wire Wire Line
	1150 10500 1350 10500
Wire Wire Line
	1350 10500 1550 10500
Wire Wire Line
	1550 10500 1750 10500
Wire Wire Line
	1750 10500 1950 10500
Wire Wire Line
	1950 10500 2150 10500
Wire Wire Line
	900  10800 950  10800
Wire Wire Line
	950  10800 1150 10800
Wire Wire Line
	1150 10800 1350 10800
Wire Wire Line
	1350 10800 1550 10800
Wire Wire Line
	1550 10800 1750 10800
Wire Wire Line
	1750 10800 1950 10800
Wire Wire Line
	1950 10800 2150 10800
Wire Wire Line
	1750 10800 1750 10750
Wire Wire Line
	1550 10750 1550 10800
Connection ~ 1550 10800
Wire Wire Line
	1350 10750 1350 10800
Connection ~ 1350 10800
Wire Wire Line
	1150 10750 1150 10800
Connection ~ 1150 10800
Wire Wire Line
	950  10750 950  10800
Connection ~ 950  10800
Wire Wire Line
	950  10550 950  10500
Connection ~ 950  10500
Wire Wire Line
	1150 10550 1150 10500
Connection ~ 1150 10500
Wire Wire Line
	1350 10550 1350 10500
Connection ~ 1350 10500
Wire Wire Line
	1550 10550 1550 10500
Connection ~ 1550 10500
Wire Wire Line
	1750 10500 1750 10550
Wire Wire Line
	2150 10500 2150 10550
Connection ~ 1950 10500
Wire Wire Line
	1950 10500 1950 10550
Connection ~ 1950 10800
Wire Wire Line
	1950 10800 1950 10750
Wire Wire Line
	2150 10800 2150 10750
Connection ~ 1750 10500
Connection ~ 1750 10800
Wire Wire Line
	2000 4850 2300 4850
Wire Wire Line
	2000 4950 2300 4950
Wire Wire Line
	2000 9050 2300 9050
Wire Wire Line
	6800 4750 6500 4750
Wire Wire Line
	6500 4650 6800 4650
Wire Wire Line
	6800 4450 6500 4450
Wire Wire Line
	6500 4350 6800 4350
Wire Wire Line
	6800 4250 6500 4250
Wire Wire Line
	6800 4150 6500 4150
Wire Wire Line
	6500 4050 6800 4050
Wire Wire Line
	8100 4050 7800 4050
Wire Wire Line
	7800 4150 8100 4150
Wire Wire Line
	7800 4250 8100 4250
Wire Wire Line
	8100 4350 7800 4350
Wire Wire Line
	7800 4450 8100 4450
Wire Wire Line
	6800 3650 6500 3650
Wire Wire Line
	6500 3550 6800 3550
Wire Wire Line
	6800 3450 6500 3450
Wire Wire Line
	6500 3350 6800 3350
Wire Wire Line
	6800 3250 6500 3250
Wire Wire Line
	6500 3150 6800 3150
Wire Wire Line
	6800 3050 6500 3050
Wire Wire Line
	8100 2950 7800 2950
Wire Wire Line
	7800 3050 8100 3050
Wire Wire Line
	8100 3150 7800 3150
Wire Wire Line
	7800 3250 8100 3250
Wire Wire Line
	8100 3350 7800 3350
Wire Wire Line
	7800 3450 8100 3450
Wire Wire Line
	8300 4550 8550 4550
Wire Wire Line
	8300 5850 8550 5850
Wire Wire Line
	8300 6950 8550 6950
NoConn ~ 5000 1550
NoConn ~ 5000 3050
NoConn ~ 5000 4450
NoConn ~ 5000 5850
NoConn ~ 1950 7750
NoConn ~ 1950 7850
NoConn ~ 1950 3350
NoConn ~ 1950 3450
$Comp
L orion:C96ABC J1
U 2 1 5B75B782
P 8950 8900
F 0 "J1" H 9000 10550 50  0000 C CNN
F 1 "C96ABC" V 9200 8900 50  0001 C CNN
F 2 "Connectors_IEC_DIN:Socket_DIN41612-CaseC1-full-Male-96Pin-3rows" H 8950 8900 50  0001 C CNN
F 3 "" H 8950 8900 50  0001 C CNN
	2    8950 8900
	1    0    0    -1  
$EndComp
Text Label 8300 10450 0    60   ~ 0
ZCLK
Entry Wire Line
	8300 10450 8200 10550
Wire Wire Line
	8300 10450 8550 10450
Text Label 8300 10350 0    60   ~ 0
~TRB
Entry Wire Line
	8300 10350 8200 10450
Wire Wire Line
	8300 10350 8550 10350
Text Label 8300 10250 0    60   ~ 0
INT50
Entry Wire Line
	8300 10250 8200 10350
Wire Wire Line
	8300 10250 8550 10250
Text GLabel 5000 1850 0    60   Input ~ 0
PUP1
Wire Wire Line
	5100 10550 4975 10550
Text Label 8300 8950 0    60   ~ 0
MA14
Entry Wire Line
	8300 8950 8200 9050
Wire Wire Line
	8300 8950 8550 8950
Text Label 8300 8850 0    60   ~ 0
MA15
Entry Wire Line
	8300 8850 8200 8950
Wire Wire Line
	8300 8850 8550 8850
Text Label 8300 8750 0    60   ~ 0
~LB
Entry Wire Line
	8300 8750 8200 8850
Wire Wire Line
	8300 8750 8550 8750
Text Label 8300 8650 0    60   ~ 0
~UB
Entry Wire Line
	8300 8650 8200 8750
Wire Wire Line
	8300 8650 8550 8650
Text Label 8300 8550 0    60   ~ 0
~VCE0
Entry Wire Line
	8300 8550 8200 8650
Wire Wire Line
	8300 8550 8550 8550
Text Label 8300 8350 0    60   ~ 0
~MRD
Entry Wire Line
	8300 8350 8200 8450
Wire Wire Line
	8300 8350 8550 8350
Text Label 8300 7750 0    60   ~ 0
~MVO0
Entry Wire Line
	8300 7750 8200 7850
Wire Wire Line
	8300 7750 8550 7750
Text Label 8300 7650 0    60   ~ 0
~MVO1
Entry Wire Line
	8300 7650 8200 7750
Wire Wire Line
	8300 7650 8550 7650
Text Label 8300 8050 0    60   ~ 0
PFA
Entry Wire Line
	8300 8050 8200 8150
Wire Wire Line
	8300 8050 8550 8050
Text Label 8300 7950 0    60   ~ 0
PF8
Entry Wire Line
	8300 7950 8200 8050
Wire Wire Line
	8300 7950 8550 7950
Text Label 8300 7850 0    60   ~ 0
PFC
Entry Wire Line
	8300 7850 8200 7950
Wire Wire Line
	8300 7850 8550 7850
Text Label 2300 4250 2    60   ~ 0
CL0
Entry Wire Line
	2300 4650 2400 4750
Text Label 2300 4150 2    60   ~ 0
CL1
Entry Wire Line
	2300 4750 2400 4850
Wire Wire Line
	2000 4650 2300 4650
Wire Wire Line
	2000 4750 2300 4750
Text Label 2300 9250 2    60   ~ 0
~BL
Text Label 2300 9450 2    60   ~ 0
INT50
Entry Wire Line
	2300 8950 2400 9050
Wire Wire Line
	2000 8950 2300 8950
NoConn ~ 8550 4450
NoConn ~ 8550 4650
NoConn ~ 8550 4850
Text Label 8300 4350 0    60   ~ 0
~INTA
Entry Wire Line
	8300 4350 8200 4450
Wire Wire Line
	8300 4350 8550 4350
Text Label 8300 4750 0    60   ~ 0
~BLRAM
Entry Wire Line
	8300 4750 8200 4850
Wire Wire Line
	8300 4750 8550 4750
Text Label 8300 5450 0    60   ~ 0
HOLD
Entry Wire Line
	8300 5450 8200 5550
Wire Wire Line
	8300 5450 8550 5450
Text Label 8300 5650 0    60   ~ 0
X1
Entry Wire Line
	8300 5650 8200 5750
Wire Wire Line
	8300 5650 8550 5650
Text Label 8300 3850 0    60   ~ 0
HLDA
Entry Wire Line
	8300 3850 8200 3950
Wire Wire Line
	8300 3850 8550 3850
NoConn ~ 8550 10050
NoConn ~ 8550 9950
NoConn ~ 8550 9850
NoConn ~ 8550 9750
NoConn ~ 8550 9650
NoConn ~ 8550 9550
NoConn ~ 8550 9450
NoConn ~ 8550 9350
NoConn ~ 8550 9150
NoConn ~ 8550 8150
NoConn ~ 8550 7450
Text Label 11500 9350 0    60   ~ 0
~IRQS
Entry Wire Line
	11500 9350 11400 9450
Text Label 11500 9150 0    60   ~ 0
~IRQ6
Entry Wire Line
	11500 9150 11400 9250
Text Label 11500 8850 0    60   ~ 0
~IRQ3
Entry Wire Line
	11500 8850 11400 8950
Text Label 11500 8750 0    60   ~ 0
~IRQ2
Entry Wire Line
	11500 8750 11400 8850
Text Label 11500 9250 0    60   ~ 0
~IRQ7
Entry Wire Line
	11500 9250 11400 9350
Text Label 11500 8950 0    60   ~ 0
~IRQ4
Entry Wire Line
	11500 8950 11400 9050
Text Label 11500 9050 0    60   ~ 0
~IRQ5
Entry Wire Line
	11500 9050 11400 9150
Text Label 11500 8650 0    60   ~ 0
~IRQ1
Entry Wire Line
	11500 8650 11400 8750
Wire Wire Line
	11500 9350 11750 9350
Wire Wire Line
	11500 9150 11750 9150
Wire Wire Line
	11500 8850 11750 8850
Wire Wire Line
	11500 8750 11750 8750
Wire Wire Line
	11500 9250 11750 9250
Wire Wire Line
	11500 8950 11750 8950
Wire Wire Line
	11500 9050 11750 9050
Wire Wire Line
	11500 8650 11750 8650
Text Label 11500 8550 0    60   ~ 0
~RFSH
Entry Wire Line
	11500 8550 11400 8650
Wire Wire Line
	11500 8550 11750 8550
Text Label 11500 8250 0    60   ~ 0
~WR
Entry Wire Line
	11500 8250 11400 8350
Text Label 11500 8350 0    60   ~ 0
~RD
Entry Wire Line
	11500 8350 11400 8450
Text Label 11500 8150 0    60   ~ 0
~MREQ
Entry Wire Line
	11500 8150 11400 8250
Text Label 11500 8050 0    60   ~ 0
~IORQ
Entry Wire Line
	11500 8050 11400 8150
Text Label 11500 7950 0    60   ~ 0
~BLIO
Entry Wire Line
	11500 7950 11400 8050
Wire Wire Line
	11500 8250 11750 8250
Wire Wire Line
	11500 8350 11750 8350
Wire Wire Line
	11500 8150 11750 8150
Wire Wire Line
	11500 8050 11750 8050
Wire Wire Line
	11500 7950 11750 7950
Text Label 11500 8450 0    60   ~ 0
HOLD
Entry Wire Line
	11500 8450 11400 8550
Wire Wire Line
	11500 8450 11750 8450
Text Label 11500 7750 0    60   ~ 0
~M1
Entry Wire Line
	11500 7750 11400 7850
Wire Wire Line
	11500 7750 11750 7750
Text Label 11500 7650 0    60   ~ 0
~INTA
Entry Wire Line
	11500 7650 11400 7750
Wire Wire Line
	11500 7650 11750 7650
Text Label 11500 7850 0    60   ~ 0
~BLRAM
Entry Wire Line
	11500 7850 11400 7950
Wire Wire Line
	11500 7850 11750 7850
NoConn ~ 11750 7650
NoConn ~ 11750 7750
NoConn ~ 11750 7850
NoConn ~ 11750 7950
NoConn ~ 11750 8050
NoConn ~ 11750 8150
NoConn ~ 11750 8250
NoConn ~ 11750 8350
NoConn ~ 11750 8450
NoConn ~ 11750 8550
NoConn ~ 11750 8650
NoConn ~ 11750 8750
NoConn ~ 11750 8850
NoConn ~ 11750 8950
NoConn ~ 11750 9050
NoConn ~ 11750 9150
NoConn ~ 11750 9250
NoConn ~ 11750 9350
Text Label 11500 7550 0    60   ~ 0
A14
Entry Wire Line
	11500 7550 11400 7650
Text Label 11500 7450 0    60   ~ 0
A15
Entry Wire Line
	11500 7450 11400 7550
Wire Wire Line
	11500 7550 11750 7550
Wire Wire Line
	11500 7450 11750 7450
Text Label 11500 7350 0    60   ~ 0
HLDA
Entry Wire Line
	11500 7350 11400 7450
Wire Wire Line
	11500 7350 11750 7350
Text Label 11500 7250 0    60   ~ 0
~WAIT
Entry Wire Line
	11500 7250 11400 7350
Wire Wire Line
	11500 7250 11750 7250
NoConn ~ 11750 7550
NoConn ~ 11750 7450
NoConn ~ 11750 7350
NoConn ~ 11750 7250
Text GLabel 7050 8175 0    60   Input ~ 0
PUP3
Text Label 11500 6600 0    60   ~ 0
F3
Entry Wire Line
	11500 6600 11400 6700
Text Label 11500 6500 0    60   ~ 0
F0
Entry Wire Line
	11500 6500 11400 6600
Wire Wire Line
	11500 6600 11750 6600
Wire Wire Line
	11500 6500 11750 6500
Text Label 11500 6400 0    60   ~ 0
F1
Entry Wire Line
	11500 6400 11400 6500
Wire Wire Line
	11500 6400 11750 6400
Text Label 11500 6300 0    60   ~ 0
F2
Entry Wire Line
	11500 6300 11400 6400
Wire Wire Line
	11500 6300 11750 6300
Text Label 11500 5850 0    60   ~ 0
FL2
Entry Wire Line
	11500 5850 11400 5950
Wire Wire Line
	11500 5850 11750 5850
Text Label 11500 5750 0    60   ~ 0
FL1
Entry Wire Line
	11500 5750 11400 5850
Wire Wire Line
	11500 5750 11750 5750
Text Label 11500 5650 0    60   ~ 0
FL0
Entry Wire Line
	11500 5650 11400 5750
Wire Wire Line
	11500 5650 11750 5650
Text Label 11500 5950 0    60   ~ 0
PGD
Entry Wire Line
	11500 5950 11400 6050
Wire Wire Line
	11500 5950 11750 5950
Text Label 11500 5300 0    60   ~ 0
BV
Entry Wire Line
	11500 5300 11400 5400
Wire Wire Line
	11500 5300 11750 5300
NoConn ~ 11750 5300
NoConn ~ 11750 5650
NoConn ~ 11750 5750
NoConn ~ 11750 5850
NoConn ~ 11750 5950
NoConn ~ 11750 6300
NoConn ~ 11750 6400
NoConn ~ 11750 6500
NoConn ~ 11750 6600
$Comp
L orion:TM9 DD21
U 1 1 5B75D4AF
P 7300 3400
F 0 "DD21" H 7300 3950 60  0000 C CNN
F 1 "TM9" H 7300 3150 60  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 7250 3550 60  0001 C CNN
F 3 "" H 7250 3550 60  0001 C CNN
	1    7300 3400
	1    0    0    -1  
$EndComp
Entry Wire Line
	6500 2950 6400 3050
Wire Wire Line
	6500 2950 6800 2950
Text Label 6500 2950 0    60   ~ 0
D6
$Comp
L orion:TM9 DD22
U 1 1 5B760A3E
P 7300 4500
F 0 "DD22" H 7300 5050 60  0000 C CNN
F 1 "TM9" H 7300 4250 60  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 7250 4650 60  0001 C CNN
F 3 "" H 7250 4650 60  0001 C CNN
	1    7300 4500
	1    0    0    -1  
$EndComp
$Comp
L orion:IR33 DD10
U 1 1 5B7DC7CD
P 3500 6200
F 0 "DD10" H 3500 6750 60  0000 C CNN
F 1 "IR33" H 3500 5750 60  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 3450 6350 60  0001 C CNN
F 3 "" H 3450 6350 60  0001 C CNN
	1    3500 6200
	1    0    0    -1  
$EndComp
Text Label 2500 5750 0    60   ~ 0
VD4
Entry Wire Line
	2500 5750 2400 5850
Entry Wire Line
	2500 5850 2400 5950
Entry Wire Line
	2500 5950 2400 6050
Entry Wire Line
	2500 6050 2400 6150
Text Label 2500 6150 0    60   ~ 0
VD2
Entry Wire Line
	2500 6150 2400 6250
Text Label 2500 5950 0    60   ~ 0
VD3
Entry Wire Line
	2500 6250 2400 6350
Text Label 2500 5850 0    60   ~ 0
VD5
Entry Wire Line
	2500 6350 2400 6450
Text Label 2500 6050 0    60   ~ 0
VD6
Entry Wire Line
	2500 6450 2400 6550
Text Label 2500 6250 0    60   ~ 0
VD1
Entry Wire Line
	2500 6550 2400 6650
Text Label 2500 6450 0    60   ~ 0
VD0
Text Label 2500 6350 0    60   ~ 0
VD7
Text Label 2500 6550 0    60   ~ 0
CL0
Wire Wire Line
	2500 5750 3000 5750
Wire Wire Line
	2500 5850 3000 5850
Wire Wire Line
	2500 5950 3000 5950
Wire Wire Line
	2500 6050 3000 6050
Wire Wire Line
	2500 6150 3000 6150
Wire Wire Line
	2500 6250 3000 6250
Wire Wire Line
	2500 6350 3000 6350
Wire Wire Line
	2500 6450 3000 6450
Wire Wire Line
	2500 6550 3000 6550
Text Label 4500 6350 2    60   ~ 0
VL7
Text Label 4500 6150 2    60   ~ 0
VL2
Entry Wire Line
	4500 5750 4600 5850
Text Label 4500 6250 2    60   ~ 0
VL1
Entry Wire Line
	4500 5850 4600 5950
Text Label 4500 5950 2    60   ~ 0
VL3
Entry Wire Line
	4500 5950 4600 6050
Text Label 4500 6050 2    60   ~ 0
VL6
Entry Wire Line
	4500 6050 4600 6150
Text Label 4500 5750 2    60   ~ 0
VL4
Entry Wire Line
	4500 6150 4600 6250
Text Label 4500 5850 2    60   ~ 0
VL5
Entry Wire Line
	4500 6250 4600 6350
Text Label 4500 6450 2    60   ~ 0
VL0
Entry Wire Line
	4500 6350 4600 6450
Entry Wire Line
	4500 6450 4600 6550
Wire Wire Line
	4000 5750 4500 5750
Wire Wire Line
	4000 5850 4500 5850
Wire Wire Line
	4000 5950 4500 5950
Wire Wire Line
	4000 6050 4500 6050
Wire Wire Line
	4000 6150 4500 6150
Wire Wire Line
	4000 6250 4500 6250
Wire Wire Line
	4000 6350 4500 6350
Wire Wire Line
	4000 6450 4500 6450
$Comp
L orion:IR33 DD11
U 1 1 5B7E4CF0
P 3500 7300
F 0 "DD11" H 3500 7850 60  0000 C CNN
F 1 "IR33" H 3500 6850 60  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 3450 7450 60  0001 C CNN
F 3 "" H 3450 7450 60  0001 C CNN
	1    3500 7300
	1    0    0    -1  
$EndComp
Text Label 2500 6850 0    60   ~ 0
VD12
Entry Wire Line
	2500 6850 2400 6950
Entry Wire Line
	2500 6950 2400 7050
Entry Wire Line
	2500 7050 2400 7150
Entry Wire Line
	2500 7150 2400 7250
Text Label 2500 7250 0    60   ~ 0
VD10
Entry Wire Line
	2500 7250 2400 7350
Text Label 2500 7050 0    60   ~ 0
VD11
Entry Wire Line
	2500 7350 2400 7450
Text Label 2500 6950 0    60   ~ 0
VD13
Entry Wire Line
	2500 7450 2400 7550
Text Label 2500 7150 0    60   ~ 0
VD14
Entry Wire Line
	2500 7550 2400 7650
Text Label 2500 7350 0    60   ~ 0
VD9
Entry Wire Line
	2500 7650 2400 7750
Text Label 2500 7550 0    60   ~ 0
VD8
Text Label 2500 7450 0    60   ~ 0
VD15
Text Label 2500 7650 0    60   ~ 0
CL0
Wire Wire Line
	2500 6850 3000 6850
Wire Wire Line
	2500 6950 3000 6950
Wire Wire Line
	2500 7050 3000 7050
Wire Wire Line
	2500 7150 3000 7150
Wire Wire Line
	2500 7250 3000 7250
Wire Wire Line
	2500 7350 3000 7350
Wire Wire Line
	2500 7450 3000 7450
Wire Wire Line
	2500 7550 3000 7550
Wire Wire Line
	2500 7650 3000 7650
Text Label 4500 7450 2    60   ~ 0
VL15
Text Label 4500 7250 2    60   ~ 0
VL10
Entry Wire Line
	4500 6850 4600 6950
Text Label 4500 7350 2    60   ~ 0
VL9
Entry Wire Line
	4500 6950 4600 7050
Text Label 4500 7050 2    60   ~ 0
VL11
Entry Wire Line
	4500 7050 4600 7150
Text Label 4500 7150 2    60   ~ 0
VL14
Entry Wire Line
	4500 7150 4600 7250
Text Label 4500 6850 2    60   ~ 0
VL12
Entry Wire Line
	4500 7250 4600 7350
Text Label 4500 6950 2    60   ~ 0
VL13
Entry Wire Line
	4500 7350 4600 7450
Text Label 4500 7550 2    60   ~ 0
VL8
Entry Wire Line
	4500 7450 4600 7550
Entry Wire Line
	4500 7550 4600 7650
Wire Wire Line
	4000 6850 4500 6850
Wire Wire Line
	4000 6950 4500 6950
Wire Wire Line
	4000 7050 4500 7050
Wire Wire Line
	4000 7150 4500 7150
Wire Wire Line
	4000 7250 4500 7250
Wire Wire Line
	4000 7350 4500 7350
Wire Wire Line
	4000 7450 4500 7450
Wire Wire Line
	4000 7550 4500 7550
$Comp
L orion:IR33 DD12
U 1 1 5B7EB132
P 3500 8400
F 0 "DD12" H 3500 8950 60  0000 C CNN
F 1 "IR33" H 3500 7950 60  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 3450 8550 60  0001 C CNN
F 3 "" H 3450 8550 60  0001 C CNN
	1    3500 8400
	1    0    0    -1  
$EndComp
Text Label 2500 7950 0    60   ~ 0
VD0
Entry Wire Line
	2500 7950 2400 8050
Entry Wire Line
	2500 8050 2400 8150
Entry Wire Line
	2500 8150 2400 8250
Entry Wire Line
	2500 8250 2400 8350
Text Label 2500 8350 0    60   ~ 0
VD6
Entry Wire Line
	2500 8350 2400 8450
Text Label 2500 8150 0    60   ~ 0
VD1
Entry Wire Line
	2500 8450 2400 8550
Text Label 2500 8050 0    60   ~ 0
VD7
Entry Wire Line
	2500 8550 2400 8650
Text Label 2500 8250 0    60   ~ 0
VD2
Entry Wire Line
	2500 8650 2400 8750
Text Label 2500 8450 0    60   ~ 0
VD3
Entry Wire Line
	2500 8750 2400 8850
Text Label 2500 8650 0    60   ~ 0
VD4
Text Label 2500 8550 0    60   ~ 0
VD5
Text Label 2500 8750 0    60   ~ 0
CL1
Wire Wire Line
	2500 7950 3000 7950
Wire Wire Line
	2500 8050 3000 8050
Wire Wire Line
	2500 8150 3000 8150
Wire Wire Line
	2500 8250 3000 8250
Wire Wire Line
	2500 8350 3000 8350
Wire Wire Line
	2500 8450 3000 8450
Wire Wire Line
	2500 8550 3000 8550
Wire Wire Line
	2500 8650 3000 8650
Wire Wire Line
	2500 8750 3000 8750
Text Label 4500 8550 2    60   ~ 0
VL21
Text Label 4500 8350 2    60   ~ 0
VL22
Entry Wire Line
	4500 7950 4600 8050
Text Label 4500 8450 2    60   ~ 0
VL19
Entry Wire Line
	4500 8050 4600 8150
Text Label 4500 8150 2    60   ~ 0
VL17
Entry Wire Line
	4500 8150 4600 8250
Text Label 4500 8250 2    60   ~ 0
VL18
Entry Wire Line
	4500 8250 4600 8350
Text Label 4500 7950 2    60   ~ 0
VL16
Entry Wire Line
	4500 8350 4600 8450
Text Label 4500 8050 2    60   ~ 0
VL23
Entry Wire Line
	4500 8450 4600 8550
Text Label 4500 8650 2    60   ~ 0
VL20
Entry Wire Line
	4500 8550 4600 8650
Entry Wire Line
	4500 8650 4600 8750
Wire Wire Line
	4000 7950 4500 7950
Wire Wire Line
	4000 8050 4500 8050
Wire Wire Line
	4000 8150 4500 8150
Wire Wire Line
	4000 8250 4500 8250
Wire Wire Line
	4000 8350 4500 8350
Wire Wire Line
	4000 8450 4500 8450
Wire Wire Line
	4000 8550 4500 8550
Wire Wire Line
	4000 8650 4500 8650
$Comp
L orion:IR33 DD13
U 1 1 5B7EB171
P 3500 9500
F 0 "DD13" H 3500 10050 60  0000 C CNN
F 1 "IR33" H 3500 9050 60  0000 C CNN
F 2 "Package_SO:SOIC-20W_7.5x12.8mm_P1.27mm" H 3450 9650 60  0001 C CNN
F 3 "" H 3450 9650 60  0001 C CNN
	1    3500 9500
	1    0    0    -1  
$EndComp
Text Label 2500 9050 0    60   ~ 0
VD8
Entry Wire Line
	2500 9050 2400 9150
Entry Wire Line
	2500 9150 2400 9250
Entry Wire Line
	2500 9250 2400 9350
Entry Wire Line
	2500 9350 2400 9450
Text Label 2500 9450 0    60   ~ 0
VD14
Entry Wire Line
	2500 9450 2400 9550
Text Label 2500 9250 0    60   ~ 0
VD9
Entry Wire Line
	2500 9550 2400 9650
Text Label 2500 9150 0    60   ~ 0
VD15
Entry Wire Line
	2500 9650 2400 9750
Text Label 2500 9350 0    60   ~ 0
VD10
Entry Wire Line
	2500 9750 2400 9850
Text Label 2500 9550 0    60   ~ 0
VD11
Entry Wire Line
	2500 9850 2400 9950
Text Label 2500 9750 0    60   ~ 0
VD12
Text Label 2500 9650 0    60   ~ 0
VD13
Text Label 2500 9850 0    60   ~ 0
CL1
Wire Wire Line
	2500 9050 3000 9050
Wire Wire Line
	2500 9150 3000 9150
Wire Wire Line
	2500 9250 3000 9250
Wire Wire Line
	2500 9350 3000 9350
Wire Wire Line
	2500 9450 3000 9450
Wire Wire Line
	2500 9550 3000 9550
Wire Wire Line
	2500 9650 3000 9650
Wire Wire Line
	2500 9750 3000 9750
Wire Wire Line
	2500 9850 3000 9850
Text Label 4500 9650 2    60   ~ 0
VL29
Text Label 4500 9450 2    60   ~ 0
VL30
Entry Wire Line
	4500 9050 4600 9150
Text Label 4500 9550 2    60   ~ 0
VL27
Entry Wire Line
	4500 9150 4600 9250
Text Label 4500 9250 2    60   ~ 0
VL25
Entry Wire Line
	4500 9250 4600 9350
Text Label 4500 9350 2    60   ~ 0
VL26
Entry Wire Line
	4500 9350 4600 9450
Text Label 4500 9050 2    60   ~ 0
VL24
Entry Wire Line
	4500 9450 4600 9550
Text Label 4500 9150 2    60   ~ 0
VL31
Entry Wire Line
	4500 9550 4600 9650
Text Label 4500 9750 2    60   ~ 0
VL28
Entry Wire Line
	4500 9650 4600 9750
Entry Wire Line
	4500 9750 4600 9850
Wire Wire Line
	4000 9050 4500 9050
Wire Wire Line
	4000 9150 4500 9150
Wire Wire Line
	4000 9250 4500 9250
Wire Wire Line
	4000 9350 4500 9350
Wire Wire Line
	4000 9450 4500 9450
Wire Wire Line
	4000 9550 4500 9550
Wire Wire Line
	4000 9650 4500 9650
Wire Wire Line
	4000 9750 4500 9750
$Comp
L orion:Gen Y1
U 1 1 5BA4F7F5
P 1450 750
F 0 "Y1" H 1850 875 50  0000 C CNN
F 1 "25MHz" H 1575 600 50  0000 C CNN
F 2 "Crystal:Crystal_SMD_7050-4Pin_7.0x5.0mm" H 2125 425 50  0001 C CNN
F 3 "http://www.iqdfrequencyproducts.com/products/details/iqxo-70-11-30.pdf" H 1350 750 50  0001 C CNN
	1    1450 750 
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0101
U 1 1 5BA503EC
P 1150 850
F 0 "#PWR0101" H 1150 700 50  0001 C CNN
F 1 "VCC" V 1150 975 50  0000 L CNN
F 2 "" H 1150 850 50  0001 C CNN
F 3 "" H 1150 850 50  0001 C CNN
	1    1150 850 
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5BA5074B
P 1150 750
F 0 "#PWR0102" H 1150 500 50  0001 C CNN
F 1 "GND" V 1155 622 50  0000 R CNN
F 2 "" H 1150 750 50  0001 C CNN
F 3 "" H 1150 750 50  0001 C CNN
	1    1150 750 
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5BA50C7A
P 1150 1000
F 0 "R1" V 1075 900 50  0000 C CNN
F 1 "1k" V 1150 1000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1150 1000 50  0001 C CNN
F 3 "~" H 1150 1000 50  0001 C CNN
	1    1150 1000
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0103
U 1 1 5BA510A7
P 1250 1000
F 0 "#PWR0103" H 1250 850 50  0001 C CNN
F 1 "VCC" V 1250 1125 50  0000 L CNN
F 2 "" H 1250 1000 50  0001 C CNN
F 3 "" H 1250 1000 50  0001 C CNN
	1    1250 1000
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 5BA51416
P 1150 5400
F 0 "R2" V 1075 5300 50  0000 C CNN
F 1 "1k" V 1150 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 1150 5400 50  0001 C CNN
F 3 "~" H 1150 5400 50  0001 C CNN
	1    1150 5400
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 5BA536D0
P 1250 5400
F 0 "#PWR0104" H 1250 5250 50  0001 C CNN
F 1 "VCC" V 1250 5525 50  0000 L CNN
F 2 "" H 1250 5400 50  0001 C CNN
F 3 "" H 1250 5400 50  0001 C CNN
	1    1250 5400
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0105
U 1 1 5BA53D2A
P 900 10000
F 0 "#PWR0105" H 900 9850 50  0001 C CNN
F 1 "VCC" V 900 10125 50  0000 L CNN
F 2 "" H 900 10000 50  0001 C CNN
F 3 "" H 900 10000 50  0001 C CNN
	1    900  10000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5BA54E32
P 900 10300
F 0 "#PWR0106" H 900 10050 50  0001 C CNN
F 1 "GND" V 905 10172 50  0000 R CNN
F 2 "" H 900 10300 50  0001 C CNN
F 3 "" H 900 10300 50  0001 C CNN
	1    900  10300
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5BA55826
P 950 10150
F 0 "C1" H 975 10225 50  0000 L CNN
F 1 "100n" H 950 10075 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 10150 50  0001 C CNN
F 3 "~" H 950 10150 50  0001 C CNN
	1    950  10150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5BA55D81
P 1150 10150
F 0 "C2" H 1175 10225 50  0000 L CNN
F 1 "100n" H 1150 10075 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1150 10150 50  0001 C CNN
F 3 "~" H 1150 10150 50  0001 C CNN
	1    1150 10150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5BA55E3F
P 1350 10150
F 0 "C3" H 1375 10225 50  0000 L CNN
F 1 "100n" H 1350 10075 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1350 10150 50  0001 C CNN
F 3 "~" H 1350 10150 50  0001 C CNN
	1    1350 10150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5BA55EFF
P 1550 10150
F 0 "C4" H 1575 10225 50  0000 L CNN
F 1 "100n" H 1550 10075 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1550 10150 50  0001 C CNN
F 3 "~" H 1550 10150 50  0001 C CNN
	1    1550 10150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5BA55FBF
P 1750 10150
F 0 "C5" H 1775 10225 50  0000 L CNN
F 1 "100n" H 1750 10075 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1750 10150 50  0001 C CNN
F 3 "~" H 1750 10150 50  0001 C CNN
	1    1750 10150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5BA56081
P 1950 10150
F 0 "C6" H 1975 10225 50  0000 L CNN
F 1 "100n" H 1950 10075 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1950 10150 50  0001 C CNN
F 3 "~" H 1950 10150 50  0001 C CNN
	1    1950 10150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5BA56149
P 2150 10150
F 0 "C7" H 2175 10225 50  0000 L CNN
F 1 "100n" H 2150 10075 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2150 10150 50  0001 C CNN
F 3 "~" H 2150 10150 50  0001 C CNN
	1    2150 10150
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5BA5666A
P 950 10650
F 0 "C8" H 975 10725 50  0000 L CNN
F 1 "100n" H 950 10575 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 10650 50  0001 C CNN
F 3 "~" H 950 10650 50  0001 C CNN
	1    950  10650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 5BA56754
P 1150 10650
F 0 "C9" H 1175 10725 50  0000 L CNN
F 1 "100n" H 1150 10575 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1150 10650 50  0001 C CNN
F 3 "~" H 1150 10650 50  0001 C CNN
	1    1150 10650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 5BA56810
P 1350 10650
F 0 "C10" H 1375 10725 50  0000 L CNN
F 1 "100n" H 1350 10575 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1350 10650 50  0001 C CNN
F 3 "~" H 1350 10650 50  0001 C CNN
	1    1350 10650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 5BA568D2
P 1550 10650
F 0 "C11" H 1575 10725 50  0000 L CNN
F 1 "100n" H 1550 10575 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1550 10650 50  0001 C CNN
F 3 "~" H 1550 10650 50  0001 C CNN
	1    1550 10650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 5BA5699C
P 1750 10650
F 0 "C12" H 1775 10725 50  0000 L CNN
F 1 "100n" H 1750 10575 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1750 10650 50  0001 C CNN
F 3 "~" H 1750 10650 50  0001 C CNN
	1    1750 10650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C13
U 1 1 5BA56A5E
P 1950 10650
F 0 "C13" H 1975 10725 50  0000 L CNN
F 1 "100n" H 1950 10575 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1950 10650 50  0001 C CNN
F 3 "~" H 1950 10650 50  0001 C CNN
	1    1950 10650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C14
U 1 1 5BA56B22
P 2150 10650
F 0 "C14" H 2175 10725 50  0000 L CNN
F 1 "100n" H 2150 10575 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2150 10650 50  0001 C CNN
F 3 "~" H 2150 10650 50  0001 C CNN
	1    2150 10650
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0107
U 1 1 5BA576B8
P 1750 11000
F 0 "#PWR0107" H 1750 10850 50  0001 C CNN
F 1 "VCC" V 1750 11125 50  0000 L CNN
F 2 "" H 1750 11000 50  0001 C CNN
F 3 "" H 1750 11000 50  0001 C CNN
	1    1750 11000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5BA57817
P 900 10800
F 0 "#PWR0108" H 900 10550 50  0001 C CNN
F 1 "GND" V 905 10672 50  0000 R CNN
F 2 "" H 900 10800 50  0001 C CNN
F 3 "" H 900 10800 50  0001 C CNN
	1    900  10800
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0109
U 1 1 5BA578CC
P 900 10500
F 0 "#PWR0109" H 900 10350 50  0001 C CNN
F 1 "VCC" V 900 10625 50  0000 L CNN
F 2 "" H 900 10500 50  0001 C CNN
F 3 "" H 900 10500 50  0001 C CNN
	1    900  10500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 5BA5803F
P 5000 10900
F 0 "#PWR0110" H 5000 10650 50  0001 C CNN
F 1 "GND" H 5005 10727 50  0000 C CNN
F 2 "" H 5000 10900 50  0001 C CNN
F 3 "" H 5000 10900 50  0001 C CNN
	1    5000 10900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 5BA58357
P 5850 10650
F 0 "R19" V 5925 10650 50  0000 C CNN
F 1 "47" V 5850 10650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5780 10650 50  0001 C CNN
F 3 "~" H 5850 10650 50  0001 C CNN
	1    5850 10650
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R18
U 1 1 5BA58975
P 5850 10450
F 0 "R18" V 5925 10450 50  0000 C CNN
F 1 "47" V 5850 10450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5780 10450 50  0001 C CNN
F 3 "~" H 5850 10450 50  0001 C CNN
	1    5850 10450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 5BA58A94
P 1600 11000
F 0 "R3" V 1675 11000 50  0000 C CNN
F 1 "1k" V 1600 11000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1530 11000 50  0001 C CNN
F 3 "~" H 1600 11000 50  0001 C CNN
	1    1600 11000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R17
U 1 1 5BA5950F
P 5800 9150
F 0 "R17" V 5875 9150 50  0000 C CNN
F 1 "470" V 5800 9150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5730 9150 50  0001 C CNN
F 3 "~" H 5800 9150 50  0001 C CNN
	1    5800 9150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R16
U 1 1 5BA599FF
P 5400 9150
F 0 "R16" V 5475 9150 50  0000 C CNN
F 1 "470" V 5400 9150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5330 9150 50  0001 C CNN
F 3 "~" H 5400 9150 50  0001 C CNN
	1    5400 9150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5BA59AD7
P 5250 9150
F 0 "#PWR0111" H 5250 8900 50  0001 C CNN
F 1 "GND" V 5255 9022 50  0000 R CNN
F 2 "" H 5250 9150 50  0001 C CNN
F 3 "" H 5250 9150 50  0001 C CNN
	1    5250 9150
	0    1    1    0   
$EndComp
$Comp
L Device:R R11
U 1 1 5BA59B8C
P 6000 9350
F 0 "R11" H 6100 9350 50  0000 C CNN
F 1 "510" V 6000 9350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5930 9350 50  0001 C CNN
F 3 "~" H 6000 9350 50  0001 C CNN
	1    6000 9350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5BA5A225
P 5600 9350
F 0 "R10" H 5700 9350 50  0000 C CNN
F 1 "1k" V 5600 9350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5530 9350 50  0001 C CNN
F 3 "~" H 5600 9350 50  0001 C CNN
	1    5600 9350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5BA5ABC6
P 6000 8650
F 0 "R9" H 6100 8650 50  0000 C CNN
F 1 "510" V 6000 8650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5930 8650 50  0001 C CNN
F 3 "~" H 6000 8650 50  0001 C CNN
	1    6000 8650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R15
U 1 1 5BA5ACB6
P 5800 8450
F 0 "R15" V 5875 8450 50  0000 C CNN
F 1 "470" V 5800 8450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5730 8450 50  0001 C CNN
F 3 "~" H 5800 8450 50  0001 C CNN
	1    5800 8450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R8
U 1 1 5BA5ADA2
P 5600 8650
F 0 "R8" H 5700 8650 50  0000 C CNN
F 1 "1k" V 5600 8650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5530 8650 50  0001 C CNN
F 3 "~" H 5600 8650 50  0001 C CNN
	1    5600 8650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 5BA5AE8E
P 5400 8450
F 0 "R14" V 5475 8450 50  0000 C CNN
F 1 "470" V 5400 8450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5330 8450 50  0001 C CNN
F 3 "~" H 5400 8450 50  0001 C CNN
	1    5400 8450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5BA5AF78
P 5250 8450
F 0 "#PWR0112" H 5250 8200 50  0001 C CNN
F 1 "GND" V 5255 8322 50  0000 R CNN
F 2 "" H 5250 8450 50  0001 C CNN
F 3 "" H 5250 8450 50  0001 C CNN
	1    5250 8450
	0    1    1    0   
$EndComp
$Comp
L Device:R R12
U 1 1 5BA5C0C0
P 5400 7750
F 0 "R12" V 5475 7750 50  0000 C CNN
F 1 "470" V 5400 7750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5330 7750 50  0001 C CNN
F 3 "~" H 5400 7750 50  0001 C CNN
	1    5400 7750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5BA5C1B2
P 5250 7750
F 0 "#PWR0113" H 5250 7500 50  0001 C CNN
F 1 "GND" V 5255 7622 50  0000 R CNN
F 2 "" H 5250 7750 50  0001 C CNN
F 3 "" H 5250 7750 50  0001 C CNN
	1    5250 7750
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5BA5C261
P 5600 7950
F 0 "R6" H 5700 7950 50  0000 C CNN
F 1 "1k" V 5600 7950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5530 7950 50  0001 C CNN
F 3 "~" H 5600 7950 50  0001 C CNN
	1    5600 7950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R13
U 1 1 5BA5C355
P 5800 7750
F 0 "R13" V 5875 7750 50  0000 C CNN
F 1 "470" V 5800 7750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5730 7750 50  0001 C CNN
F 3 "~" H 5800 7750 50  0001 C CNN
	1    5800 7750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R7
U 1 1 5BA5C43F
P 6000 7950
F 0 "R7" H 6100 7950 50  0000 C CNN
F 1 "510" V 6000 7950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5930 7950 50  0001 C CNN
F 3 "~" H 6000 7950 50  0001 C CNN
	1    6000 7950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5BA5CACF
P 5000 6050
F 0 "#PWR0114" H 5000 5800 50  0001 C CNN
F 1 "GND" V 5005 5922 50  0000 R CNN
F 2 "" H 5000 6050 50  0001 C CNN
F 3 "" H 5000 6050 50  0001 C CNN
	1    5000 6050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5BA5D229
P 5000 4650
F 0 "#PWR0115" H 5000 4400 50  0001 C CNN
F 1 "GND" V 5005 4522 50  0000 R CNN
F 2 "" H 5000 4650 50  0001 C CNN
F 3 "" H 5000 4650 50  0001 C CNN
	1    5000 4650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5BA5D9D8
P 5000 3250
F 0 "#PWR0116" H 5000 3000 50  0001 C CNN
F 1 "GND" V 5005 3122 50  0000 R CNN
F 2 "" H 5000 3250 50  0001 C CNN
F 3 "" H 5000 3250 50  0001 C CNN
	1    5000 3250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5BA5DF34
P 5000 1750
F 0 "#PWR0117" H 5000 1500 50  0001 C CNN
F 1 "GND" V 5005 1622 50  0000 R CNN
F 2 "" H 5000 1750 50  0001 C CNN
F 3 "" H 5000 1750 50  0001 C CNN
	1    5000 1750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5BA5E73B
P 2800 2550
F 0 "#PWR0118" H 2800 2300 50  0001 C CNN
F 1 "GND" V 2805 2422 50  0000 R CNN
F 2 "" H 2800 2550 50  0001 C CNN
F 3 "" H 2800 2550 50  0001 C CNN
	1    2800 2550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5BA5E7F0
P 2800 2650
F 0 "#PWR0119" H 2800 2400 50  0001 C CNN
F 1 "GND" V 2805 2522 50  0000 R CNN
F 2 "" H 2800 2650 50  0001 C CNN
F 3 "" H 2800 2650 50  0001 C CNN
	1    2800 2650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5BA5E8A5
P 2800 2750
F 0 "#PWR0120" H 2800 2500 50  0001 C CNN
F 1 "GND" V 2805 2622 50  0000 R CNN
F 2 "" H 2800 2750 50  0001 C CNN
F 3 "" H 2800 2750 50  0001 C CNN
	1    2800 2750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5BA5E95A
P 2800 3050
F 0 "#PWR0121" H 2800 2800 50  0001 C CNN
F 1 "GND" V 2805 2922 50  0000 R CNN
F 2 "" H 2800 3050 50  0001 C CNN
F 3 "" H 2800 3050 50  0001 C CNN
	1    2800 3050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5BA5F65A
P 3000 7750
F 0 "#PWR0122" H 3000 7500 50  0001 C CNN
F 1 "GND" V 3005 7622 50  0000 R CNN
F 2 "" H 3000 7750 50  0001 C CNN
F 3 "" H 3000 7750 50  0001 C CNN
	1    3000 7750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 5BA5F70F
P 3000 6650
F 0 "#PWR0123" H 3000 6400 50  0001 C CNN
F 1 "GND" V 3005 6522 50  0000 R CNN
F 2 "" H 3000 6650 50  0001 C CNN
F 3 "" H 3000 6650 50  0001 C CNN
	1    3000 6650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0124
U 1 1 5BA600BD
P 3000 8850
F 0 "#PWR0124" H 3000 8600 50  0001 C CNN
F 1 "GND" V 3005 8722 50  0000 R CNN
F 2 "" H 3000 8850 50  0001 C CNN
F 3 "" H 3000 8850 50  0001 C CNN
	1    3000 8850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 5BA60172
P 3000 9950
F 0 "#PWR0125" H 3000 9700 50  0001 C CNN
F 1 "GND" V 3005 9822 50  0000 R CNN
F 2 "" H 3000 9950 50  0001 C CNN
F 3 "" H 3000 9950 50  0001 C CNN
	1    3000 9950
	0    1    1    0   
$EndComp
Wire Wire Line
	2750 10650 2800 10650
Wire Wire Line
	2800 10650 3000 10650
Wire Wire Line
	3000 10650 3200 10650
Wire Wire Line
	3200 10650 3400 10650
Wire Wire Line
	3400 10650 3600 10650
Wire Wire Line
	3600 10650 3800 10650
Wire Wire Line
	3800 10650 4000 10650
Wire Wire Line
	2750 10950 2800 10950
Wire Wire Line
	2800 10950 3000 10950
Wire Wire Line
	3000 10950 3200 10950
Wire Wire Line
	3200 10950 3400 10950
Wire Wire Line
	3400 10950 3600 10950
Wire Wire Line
	3600 10950 3800 10950
Wire Wire Line
	3800 10950 4000 10950
Wire Wire Line
	3600 10950 3600 10900
Wire Wire Line
	3400 10900 3400 10950
Connection ~ 3400 10950
Wire Wire Line
	3200 10900 3200 10950
Connection ~ 3200 10950
Wire Wire Line
	3000 10900 3000 10950
Connection ~ 3000 10950
Wire Wire Line
	2800 10900 2800 10950
Connection ~ 2800 10950
Wire Wire Line
	2800 10700 2800 10650
Connection ~ 2800 10650
Wire Wire Line
	3000 10700 3000 10650
Connection ~ 3000 10650
Wire Wire Line
	3200 10700 3200 10650
Connection ~ 3200 10650
Wire Wire Line
	3400 10700 3400 10650
Connection ~ 3400 10650
Wire Wire Line
	3600 10650 3600 10700
Wire Wire Line
	4000 10650 4000 10700
Connection ~ 3800 10650
Wire Wire Line
	3800 10650 3800 10700
Connection ~ 3800 10950
Wire Wire Line
	3800 10950 3800 10900
Wire Wire Line
	4000 10950 4000 10900
Connection ~ 3600 10650
Connection ~ 3600 10950
$Comp
L power:VCC #PWR0126
U 1 1 5BA62A00
P 2750 10650
F 0 "#PWR0126" H 2750 10500 50  0001 C CNN
F 1 "VCC" V 2750 10775 50  0000 L CNN
F 2 "" H 2750 10650 50  0001 C CNN
F 3 "" H 2750 10650 50  0001 C CNN
	1    2750 10650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 5BA62A06
P 2750 10950
F 0 "#PWR0127" H 2750 10700 50  0001 C CNN
F 1 "GND" V 2755 10822 50  0000 R CNN
F 2 "" H 2750 10950 50  0001 C CNN
F 3 "" H 2750 10950 50  0001 C CNN
	1    2750 10950
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C15
U 1 1 5BA62A0C
P 2800 10800
F 0 "C15" H 2825 10875 50  0000 L CNN
F 1 "100n" H 2800 10725 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2800 10800 50  0001 C CNN
F 3 "~" H 2800 10800 50  0001 C CNN
	1    2800 10800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C16
U 1 1 5BA62A12
P 3000 10800
F 0 "C16" H 3025 10875 50  0000 L CNN
F 1 "100n" H 3000 10725 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3000 10800 50  0001 C CNN
F 3 "~" H 3000 10800 50  0001 C CNN
	1    3000 10800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C17
U 1 1 5BA62A18
P 3200 10800
F 0 "C17" H 3225 10875 50  0000 L CNN
F 1 "100n" H 3200 10725 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3200 10800 50  0001 C CNN
F 3 "~" H 3200 10800 50  0001 C CNN
	1    3200 10800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C18
U 1 1 5BA62A1E
P 3400 10800
F 0 "C18" H 3425 10875 50  0000 L CNN
F 1 "100n" H 3400 10725 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3400 10800 50  0001 C CNN
F 3 "~" H 3400 10800 50  0001 C CNN
	1    3400 10800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C19
U 1 1 5BA62A24
P 3600 10800
F 0 "C19" H 3625 10875 50  0000 L CNN
F 1 "100n" H 3600 10725 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3600 10800 50  0001 C CNN
F 3 "~" H 3600 10800 50  0001 C CNN
	1    3600 10800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C20
U 1 1 5BA62A2A
P 3800 10800
F 0 "C20" H 3825 10875 50  0000 L CNN
F 1 "100n" H 3800 10725 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3800 10800 50  0001 C CNN
F 3 "~" H 3800 10800 50  0001 C CNN
	1    3800 10800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C21
U 1 1 5BA62A30
P 4000 10800
F 0 "C21" H 4025 10875 50  0000 L CNN
F 1 "100n" H 4000 10725 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4000 10800 50  0001 C CNN
F 3 "~" H 4000 10800 50  0001 C CNN
	1    4000 10800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C22
U 1 1 5BB3C23A
P 4200 10800
F 0 "C22" H 4225 10875 50  0000 L CNN
F 1 "100n" H 4200 10725 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4200 10800 50  0001 C CNN
F 3 "~" H 4200 10800 50  0001 C CNN
	1    4200 10800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C23
U 1 1 5BB3C31A
P 4400 10800
F 0 "C23" H 4425 10875 50  0000 L CNN
F 1 "100n" H 4400 10725 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4400 10800 50  0001 C CNN
F 3 "~" H 4400 10800 50  0001 C CNN
	1    4400 10800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 10650 4200 10650
Wire Wire Line
	4200 10650 4200 10700
Connection ~ 4000 10650
Wire Wire Line
	4200 10650 4400 10650
Wire Wire Line
	4400 10650 4400 10700
Connection ~ 4200 10650
Wire Wire Line
	4000 10950 4200 10950
Wire Wire Line
	4200 10950 4200 10900
Connection ~ 4000 10950
Wire Wire Line
	4200 10950 4400 10950
Wire Wire Line
	4400 10950 4400 10900
Connection ~ 4200 10950
$Comp
L 74xGxx:74AHCT1G04 DD23
U 1 1 5C00CCC5
P 7300 5250
F 0 "DD23" H 7275 5517 50  0000 C CNN
F 1 "74AHCT1G04" H 7275 5426 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-353_SC-70-5_Handsoldering" H 7300 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 7300 5250 50  0001 C CNN
	1    7300 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5C00DBCA
P 7200 8000
F 0 "R4" V 7275 8000 50  0000 C CNN
F 1 "1k" V 7200 8000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7130 8000 50  0001 C CNN
F 3 "~" H 7200 8000 50  0001 C CNN
	1    7200 8000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 5C00DD6C
P 7200 8175
F 0 "R5" V 7275 8175 50  0000 C CNN
F 1 "1k" V 7200 8175 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7130 8175 50  0001 C CNN
F 3 "~" H 7200 8175 50  0001 C CNN
	1    7200 8175
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR0128
U 1 1 5C00E7E1
P 7350 8000
F 0 "#PWR0128" H 7350 7850 50  0001 C CNN
F 1 "VCC" V 7350 8125 50  0000 L CNN
F 2 "" H 7350 8000 50  0001 C CNN
F 3 "" H 7350 8000 50  0001 C CNN
	1    7350 8000
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0129
U 1 1 5C00EC92
P 7350 8175
F 0 "#PWR0129" H 7350 8025 50  0001 C CNN
F 1 "VCC" V 7350 8300 50  0000 L CNN
F 2 "" H 7350 8175 50  0001 C CNN
F 3 "" H 7350 8175 50  0001 C CNN
	1    7350 8175
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0130
U 1 1 5C00FB3A
P 6700 10150
F 0 "#PWR0130" H 6700 9900 50  0001 C CNN
F 1 "GND" V 6705 10022 50  0000 R CNN
F 2 "" H 6700 10150 50  0001 C CNN
F 3 "" H 6700 10150 50  0001 C CNN
	1    6700 10150
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0131
U 1 1 5C00FC45
P 6700 10350
F 0 "#PWR0131" H 6700 10200 50  0001 C CNN
F 1 "VCC" V 6700 10475 50  0000 L CNN
F 2 "" H 6700 10350 50  0001 C CNN
F 3 "" H 6700 10350 50  0001 C CNN
	1    6700 10350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R20
U 1 1 5C00FF95
P 6950 10550
F 0 "R20" V 7025 10550 50  0000 C CNN
F 1 "1k" V 6950 10550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6880 10550 50  0001 C CNN
F 3 "~" H 6950 10550 50  0001 C CNN
	1    6950 10550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R21
U 1 1 5C01009B
P 6950 10750
F 0 "R21" V 7025 10750 50  0000 C CNN
F 1 "1k" V 6950 10750 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6880 10750 50  0001 C CNN
F 3 "~" H 6950 10750 50  0001 C CNN
	1    6950 10750
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 5C0102BB
P 7550 10250
F 0 "J3" H 7523 10273 50  0000 R CNN
F 1 "VGAP" H 7523 10182 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7550 10250 50  0001 C CNN
F 3 "~" H 7550 10250 50  0001 C CNN
	1    7550 10250
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5C01081E
P 7550 10550
F 0 "J4" H 7522 10523 50  0000 R CNN
F 1 "4:3" H 7522 10432 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7550 10550 50  0001 C CNN
F 3 "~" H 7550 10550 50  0001 C CNN
	1    7550 10550
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5C0DF40F
P 7550 10750
F 0 "J5" H 7522 10723 50  0000 R CNN
F 1 "10/5" H 7522 10632 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7550 10750 50  0001 C CNN
F 3 "~" H 7550 10750 50  0001 C CNN
	1    7550 10750
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 5C0DF835
P 8550 10150
F 0 "#PWR0132" H 8550 9900 50  0001 C CNN
F 1 "GND" V 8555 10022 50  0000 R CNN
F 2 "" H 8550 10150 50  0001 C CNN
F 3 "" H 8550 10150 50  0001 C CNN
	1    8550 10150
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0133
U 1 1 5C0DF996
P 8550 9250
F 0 "#PWR0133" H 8550 9100 50  0001 C CNN
F 1 "VCC" V 8550 9375 50  0000 L CNN
F 2 "" H 8550 9250 50  0001 C CNN
F 3 "" H 8550 9250 50  0001 C CNN
	1    8550 9250
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR0134
U 1 1 5C0DFA4B
P 8550 9050
F 0 "#PWR0134" H 8550 8900 50  0001 C CNN
F 1 "VCC" V 8550 9175 50  0000 L CNN
F 2 "" H 8550 9050 50  0001 C CNN
F 3 "" H 8550 9050 50  0001 C CNN
	1    8550 9050
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR0135
U 1 1 5C0E089E
P 8550 7550
F 0 "#PWR0135" H 8550 7400 50  0001 C CNN
F 1 "VCC" V 8550 7675 50  0000 L CNN
F 2 "" H 8550 7550 50  0001 C CNN
F 3 "" H 8550 7550 50  0001 C CNN
	1    8550 7550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0136
U 1 1 5C0E0EFC
P 8550 7350
F 0 "#PWR0136" H 8550 7100 50  0001 C CNN
F 1 "GND" V 8555 7222 50  0000 R CNN
F 2 "" H 8550 7350 50  0001 C CNN
F 3 "" H 8550 7350 50  0001 C CNN
	1    8550 7350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0137
U 1 1 5C0E0FB1
P 8550 7150
F 0 "#PWR0137" H 8550 6900 50  0001 C CNN
F 1 "GND" V 8555 7022 50  0000 R CNN
F 2 "" H 8550 7150 50  0001 C CNN
F 3 "" H 8550 7150 50  0001 C CNN
	1    8550 7150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0138
U 1 1 5C0E1066
P 8550 7050
F 0 "#PWR0138" H 8550 6800 50  0001 C CNN
F 1 "GND" V 8555 6922 50  0000 R CNN
F 2 "" H 8550 7050 50  0001 C CNN
F 3 "" H 8550 7050 50  0001 C CNN
	1    8550 7050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0139
U 1 1 5C0E111B
P 8550 6850
F 0 "#PWR0139" H 8550 6600 50  0001 C CNN
F 1 "GND" V 8555 6722 50  0000 R CNN
F 2 "" H 8550 6850 50  0001 C CNN
F 3 "" H 8550 6850 50  0001 C CNN
	1    8550 6850
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0140
U 1 1 5C0E127C
P 8550 5950
F 0 "#PWR0140" H 8550 5800 50  0001 C CNN
F 1 "VCC" V 8550 6075 50  0000 L CNN
F 2 "" H 8550 5950 50  0001 C CNN
F 3 "" H 8550 5950 50  0001 C CNN
	1    8550 5950
	0    -1   -1   0   
$EndComp
$Comp
L power:VCC #PWR0141
U 1 1 5C0E1331
P 8550 5750
F 0 "#PWR0141" H 8550 5600 50  0001 C CNN
F 1 "VCC" V 8550 5875 50  0000 L CNN
F 2 "" H 8550 5750 50  0001 C CNN
F 3 "" H 8550 5750 50  0001 C CNN
	1    8550 5750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0142
U 1 1 5C0E143C
P 8550 5550
F 0 "#PWR0142" H 8550 5300 50  0001 C CNN
F 1 "GND" V 8555 5422 50  0000 R CNN
F 2 "" H 8550 5550 50  0001 C CNN
F 3 "" H 8550 5550 50  0001 C CNN
	1    8550 5550
	0    1    1    0   
$EndComp
$Comp
L power:VCC #PWR0143
U 1 1 5C0E2249
P 8550 4250
F 0 "#PWR0143" H 8550 4100 50  0001 C CNN
F 1 "VCC" V 8550 4375 50  0000 L CNN
F 2 "" H 8550 4250 50  0001 C CNN
F 3 "" H 8550 4250 50  0001 C CNN
	1    8550 4250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0144
U 1 1 5C0E22FE
P 8550 4050
F 0 "#PWR0144" H 8550 3800 50  0001 C CNN
F 1 "GND" V 8555 3922 50  0000 R CNN
F 2 "" H 8550 4050 50  0001 C CNN
F 3 "" H 8550 4050 50  0001 C CNN
	1    8550 4050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0145
U 1 1 5C0E2DAA
P 8550 750
F 0 "#PWR0145" H 8550 500 50  0001 C CNN
F 1 "GND" V 8555 622 50  0000 R CNN
F 2 "" H 8550 750 50  0001 C CNN
F 3 "" H 8550 750 50  0001 C CNN
	1    8550 750 
	0    1    1    0   
$EndComp
Connection ~ 4600 11150
Wire Bus Line
	4600 11150 6400 11150
Connection ~ 2400 11150
Wire Bus Line
	2400 11150 4600 11150
Connection ~ 6400 11150
Wire Bus Line
	6400 11150 8200 11150
Connection ~ 8200 11150
Wire Bus Line
	8200 11150 11400 11150
NoConn ~ 6800 4550
NoConn ~ 7800 4550
NoConn ~ 8550 8250
Text Label 2300 8950 2    60   ~ 0
VB0
Entry Wire Line
	2300 9150 2400 9250
Text Label 2300 8850 2    60   ~ 0
VB1
Entry Wire Line
	2300 9250 2400 9350
Entry Wire Line
	2300 9350 2400 9450
Entry Wire Line
	2300 9450 2400 9550
Text Label 2300 8550 2    60   ~ 0
VA14
Wire Wire Line
	2000 9150 2300 9150
Wire Wire Line
	2000 9250 2300 9250
Wire Wire Line
	2000 9350 2300 9350
Wire Wire Line
	2000 9450 2300 9450
Text Label 2300 8650 2    60   ~ 0
VA15
Text Label 700  9650 0    60   ~ 0
VM4
Entry Wire Line
	700  9650 600  9750
Wire Wire Line
	1000 9650 700  9650
Text Label 8300 8450 0    60   ~ 0
~MWR
Entry Wire Line
	8300 8450 8200 8550
Wire Wire Line
	8300 8450 8550 8450
Wire Bus Line
	11400 850  11400 11150
Wire Bus Line
	600  1650 600  11150
Wire Bus Line
	6400 850  6400 11150
Wire Bus Line
	8200 850  8200 11150
Wire Bus Line
	2400 850  2400 11150
Wire Bus Line
	4600 850  4600 11150
$EndSCHEMATC
