EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Automatic Water Filler"
Date "2020-09-18"
Rev "1"
Comp "MegansProjects"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 5550 2900 2    60   ~ 0
1(Tx)
Text Label 5550 2800 2    60   ~ 0
0(Rx)
Text Label 5550 2700 2    60   ~ 0
Reset
Text Label 5550 2500 2    60   ~ 0
2
Text Label 5550 2400 2    60   ~ 0
3(**)
Text Label 5550 2300 2    60   ~ 0
4
Text Label 5550 2200 2    60   ~ 0
5(**)
Text Label 5550 2100 2    60   ~ 0
6(**)
Text Label 5550 2000 2    60   ~ 0
7
Text Label 5550 1900 2    60   ~ 0
8
Text Label 5550 1800 2    60   ~ 0
9(**)
Text Label 5550 1700 2    60   ~ 0
10(**/SS)
Text Label 5550 1600 2    60   ~ 0
11(**/MOSI)
Text Label 5550 1500 2    60   ~ 0
12(MISO)
Text Label 3700 1500 2    60   ~ 0
13(SCK)
Text Label 3700 1800 2    60   ~ 0
A0
Text Label 3700 1900 2    60   ~ 0
A1
Text Label 3700 2000 2    60   ~ 0
A2
Text Label 3700 2100 2    60   ~ 0
A3
Text Label 3700 2200 2    60   ~ 0
A4
Text Label 3700 2300 2    60   ~ 0
A5
Text Label 3700 2400 2    60   ~ 0
A6
Text Label 3700 2500 2    60   ~ 0
A7
Text Label 3700 1700 2    60   ~ 0
AREF
Text Label 3700 2700 2    60   ~ 0
Reset
Text Notes 11000 760  2    60   ~ 0
Holes
$Comp
L Connector_Generic:Conn_01x01 P3
U 1 1 56D73ADD
P 11000 1050
F 0 "P3" V 11100 1050 50  0000 C CNN
F 1 "CONN_01X01" V 11100 1050 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 11000 1050 50  0001 C CNN
F 3 "" H 11000 1050 50  0000 C CNN
	1    11000 1050
	0    1    1    0   
$EndComp
NoConn ~ 11000 850 
$Comp
L Connector_Generic:Conn_01x01 P4
U 1 1 56D73D86
P 10900 1050
F 0 "P4" V 11000 1050 50  0000 C CNN
F 1 "CONN_01X01" V 11000 1050 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 10900 1050 50  0001 C CNN
F 3 "" H 10900 1050 50  0000 C CNN
	1    10900 1050
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P5
U 1 1 56D73DAE
P 10800 1050
F 0 "P5" V 10900 1050 50  0000 C CNN
F 1 "CONN_01X01" V 10900 1050 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 10800 1050 50  0001 C CNN
F 3 "" H 10800 1050 50  0000 C CNN
	1    10800 1050
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x01 P6
U 1 1 56D73DD9
P 10700 1050
F 0 "P6" V 10800 1050 50  0000 C CNN
F 1 "CONN_01X01" V 10800 1050 50  0001 C CNN
F 2 "Socket_Arduino_Nano:1pin_Nano" H 10700 1050 50  0001 C CNN
F 3 "" H 10700 1050 50  0000 C CNN
	1    10700 1050
	0    1    1    0   
$EndComp
NoConn ~ 10900 850 
NoConn ~ 10800 850 
NoConn ~ 10700 850 
$Comp
L Connector_Generic:Conn_01x15 P1
U 1 1 56D73FAC
P 4700 2200
F 0 "P1" H 4700 3000 50  0000 C CNN
F 1 "Digital" V 4800 2200 50  0000 C CNN
F 2 "Socket_Arduino_Nano:Socket_Strip_Arduino_1x15" H 4700 2200 50  0001 C CNN
F 3 "" H 4700 2200 50  0000 C CNN
	1    4700 2200
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x15 P2
U 1 1 56D740C7
P 4300 2200
F 0 "P2" H 4300 3000 50  0000 C CNN
F 1 "Analog" V 4400 2200 50  0000 C CNN
F 2 "Socket_Arduino_Nano:Socket_Strip_Arduino_1x15" H 4300 2200 50  0001 C CNN
F 3 "" H 4300 2200 50  0000 C CNN
	1    4300 2200
	1    0    0    1   
$EndComp
Wire Wire Line
	4900 2600 5000 2600
Wire Wire Line
	4900 2900 5550 2900
Wire Wire Line
	5550 2800 4900 2800
Wire Wire Line
	4900 2700 5550 2700
Wire Wire Line
	5550 1500 4900 1500
$Comp
L power:GND #PWR02
U 1 1 56D746ED
P 4000 3500
F 0 "#PWR02" H 4000 3250 50  0001 C CNN
F 1 "GND" H 4000 3350 50  0000 C CNN
F 2 "" H 4000 3500 50  0000 C CNN
F 3 "" H 4000 3500 50  0000 C CNN
	1    4000 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2800 4100 2800
$Comp
L power:+5V #PWR03
U 1 1 56D747E8
P 3300 2600
F 0 "#PWR03" H 3300 2450 50  0001 C CNN
F 1 "+5V" V 3300 2800 28  0000 C CNN
F 2 "" H 3300 2600 50  0000 C CNN
F 3 "" H 3300 2600 50  0000 C CNN
	1    3300 2600
	0    -1   -1   0   
$EndComp
$Comp
L power:+3V3 #PWR04
U 1 1 56D74854
P 3150 1500
F 0 "#PWR04" H 3150 1350 50  0001 C CNN
F 1 "+3.3V" V 3150 1700 28  0000 C CNN
F 2 "" H 3150 1500 50  0000 C CNN
F 3 "" H 3150 1500 50  0000 C CNN
	1    3150 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2700 4100 2700
Wire Wire Line
	3700 2400 4100 2400
Wire Wire Line
	3700 2300 4100 2300
Wire Wire Line
	4100 2200 3700 2200
Wire Wire Line
	3700 2100 4100 2100
Wire Wire Line
	3700 2000 4100 2000
Wire Wire Line
	4100 1900 3700 1900
Wire Wire Line
	3700 1800 4100 1800
Wire Wire Line
	3700 1700 4100 1700
Wire Wire Line
	4100 1500 3700 1500
Wire Notes Line
	10600 650  11150 650 
Wire Notes Line
	11150 650  11150 1200
Text Notes 4600 2960 2    60   ~ 0
1
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5F637107
P 700 2050
F 0 "J1" H 850 1700 50  0000 R CNN
F 1 "Power" H 900 1800 50  0000 R CNN
F 2 "Connector_JST:JST_EH_B2B-EH-A_1x02_P2.50mm_Vertical" H 700 2050 50  0001 C CNN
F 3 "~" H 700 2050 50  0001 C CNN
	1    700  2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5F63A09D
P 1550 2000
F 0 "R1" H 1620 2046 50  0000 L CNN
F 1 "3k3" H 1620 1955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1480 2000 50  0001 C CNN
F 3 "~" H 1550 2000 50  0001 C CNN
	1    1550 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5F63B1D5
P 1550 3150
F 0 "R2" H 1620 3196 50  0000 L CNN
F 1 "1k" H 1620 3105 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 1480 3150 50  0001 C CNN
F 3 "~" H 1550 3150 50  0001 C CNN
	1    1550 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5F63BAE4
P 2050 2000
F 0 "C1" H 2168 2046 50  0000 L CNN
F 1 "220uF 16V" H 2168 1955 50  0000 L CNN
F 2 "Capacitor_THT:CP_Axial_L10.0mm_D4.5mm_P15.00mm_Horizontal" H 2088 1850 50  0001 C CNN
F 3 "~" H 2050 2000 50  0001 C CNN
	1    2050 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 1600 2050 1850
Wire Wire Line
	2650 2900 4100 2900
Wire Wire Line
	4000 2800 4000 3450
Wire Wire Line
	5000 2600 5000 3450
Wire Wire Line
	3800 3450 2050 3450
Wire Wire Line
	1550 3450 1550 3300
Connection ~ 4000 3450
Wire Wire Line
	4000 3450 4000 3500
Wire Wire Line
	1550 3000 1550 2500
Wire Wire Line
	1200 2150 1200 3450
Connection ~ 1550 3450
Wire Wire Line
	1550 1850 1550 1600
Wire Wire Line
	1200 1600 1550 1600
Wire Wire Line
	2050 2150 2050 3450
Connection ~ 2050 3450
Wire Wire Line
	2050 3450 1550 3450
Connection ~ 1550 2500
Wire Wire Line
	1550 2500 1550 2150
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5F6AA78D
P 10300 1600
F 0 "J5" H 10408 1781 50  0000 C CNN
F 1 "Valve" H 10408 1690 50  0000 C CNN
F 2 "Connector_JST:JST_EH_B2B-EH-A_1x02_P2.50mm_Vertical" H 10300 1600 50  0001 C CNN
F 3 "~" H 10300 1600 50  0001 C CNN
	1    10300 1600
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J4
U 1 1 5F6AB652
P 7950 2450
F 0 "J4" H 7922 2332 50  0000 R CNN
F 1 "Sensor" H 7922 2423 50  0000 R CNN
F 2 "Connector_JST:JST_EH_B2B-EH-A_1x02_P2.50mm_Vertical" H 7950 2450 50  0001 C CNN
F 3 "~" H 7950 2450 50  0001 C CNN
	1    7950 2450
	-1   0    0    1   
$EndComp
$Comp
L Device:R R4
U 1 1 5F6AC5AC
P 7300 3000
F 0 "R4" H 7370 3046 50  0000 L CNN
F 1 "10K" H 7370 2955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7230 3000 50  0001 C CNN
F 3 "~" H 7300 3000 50  0001 C CNN
	1    7300 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5F6ACF77
P 7750 3000
F 0 "R5" H 7820 3046 50  0000 L CNN
F 1 "10K" H 7820 2955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 7680 3000 50  0001 C CNN
F 3 "~" H 7750 3000 50  0001 C CNN
	1    7750 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5F6AD61F
P 9350 2750
F 0 "R7" H 9420 2796 50  0000 L CNN
F 1 "10K" H 9420 2705 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 9280 2750 50  0001 C CNN
F 3 "~" H 9350 2750 50  0001 C CNN
	1    9350 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5F6AD7BD
P 9050 2150
F 0 "R6" V 8843 2150 50  0000 C CNN
F 1 "1K" V 8934 2150 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 8980 2150 50  0001 C CNN
F 3 "~" H 9050 2150 50  0001 C CNN
	1    9050 2150
	0    1    1    0   
$EndComp
$Comp
L Diode:1N4001 D2
U 1 1 5F6AD94A
P 9400 1600
F 0 "D2" V 9354 1680 50  0000 L CNN
F 1 "1N4001" V 9445 1680 50  0000 L CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 9400 1425 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 9400 1600 50  0001 C CNN
	1    9400 1600
	0    1    1    0   
$EndComp
$Comp
L Transistor_FET:IRF540N Q1
U 1 1 5F6AE129
P 9750 2150
F 0 "Q1" H 9954 2196 50  0000 L CNN
F 1 "IRF540N" H 9954 2105 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 10000 2075 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 9750 2150 50  0001 L CNN
	1    9750 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 1150 9400 1150
Wire Wire Line
	9850 3450 9850 2350
Wire Wire Line
	9850 1150 9850 1600
Wire Wire Line
	9850 1600 10500 1600
Wire Wire Line
	10500 1700 9850 1700
Wire Wire Line
	9850 1700 9850 1850
Wire Wire Line
	1200 2050 900  2050
Wire Wire Line
	1200 2150 900  2150
Wire Wire Line
	9400 1450 9400 1150
Connection ~ 9400 1150
Wire Wire Line
	9400 1150 2650 1150
Wire Wire Line
	9400 1750 9400 1850
Wire Wire Line
	9400 1850 9850 1850
Connection ~ 9850 1850
Wire Wire Line
	9850 1850 9850 1950
$Comp
L power:+5V #PWR0101
U 1 1 5F6C197E
P 7100 2100
F 0 "#PWR0101" H 7100 1950 50  0001 C CNN
F 1 "+5V" V 7000 2100 28  0000 C CNN
F 2 "" H 7100 2100 50  0000 C CNN
F 3 "" H 7100 2100 50  0000 C CNN
	1    7100 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 3150 7300 3450
Wire Wire Line
	7750 3150 7750 3450
Connection ~ 7300 3450
Wire Wire Line
	7300 3450 7750 3450
Connection ~ 7750 3450
Wire Wire Line
	7750 3450 9350 3450
Wire Wire Line
	5000 3450 6100 3450
$Comp
L Connector:Conn_01x10_Male J2
U 1 1 5F6D628C
P 6300 2500
F 0 "J2" H 6272 2382 50  0000 R CNN
F 1 "LCD" H 6272 2473 50  0000 R CNN
F 2 "Connector_JST:JST_EH_B10B-EH-A_1x10_P2.50mm_Vertical" H 6300 2500 50  0001 C CNN
F 3 "~" H 6300 2500 50  0001 C CNN
	1    6300 2500
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 2000 6100 2000
Wire Wire Line
	4900 2100 6100 2100
Wire Wire Line
	4900 2200 6100 2200
Wire Wire Line
	4900 2300 6100 2300
Wire Wire Line
	4900 2400 6100 2400
Wire Wire Line
	4900 2500 6100 2500
$Comp
L Device:R R3
U 1 1 5F6E73E4
P 5850 2600
F 0 "R3" V 6100 2600 50  0000 C CNN
F 1 "220R" V 6000 2600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 5780 2600 50  0001 C CNN
F 3 "~" H 5850 2600 50  0001 C CNN
	1    5850 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 1700 5650 1700
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5F6ABF06
P 7500 2650
F 0 "J3" H 7450 2650 50  0000 R CNN
F 1 "PushBut" H 7600 2750 50  0000 R CNN
F 2 "Connector_JST:JST_EH_B2B-EH-A_1x02_P2.50mm_Vertical" H 7500 2650 50  0001 C CNN
F 3 "~" H 7500 2650 50  0001 C CNN
	1    7500 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	9200 2150 9350 2150
Wire Wire Line
	9350 2150 9350 2600
Connection ~ 9350 2150
Wire Wire Line
	9350 2150 9550 2150
Wire Wire Line
	9350 2900 9350 3450
Connection ~ 9350 3450
Wire Wire Line
	9350 3450 9850 3450
Wire Wire Line
	8800 2150 8800 1800
Wire Wire Line
	4900 1800 8800 1800
Wire Wire Line
	8800 2150 8900 2150
Wire Wire Line
	6100 2900 6100 3450
Connection ~ 6100 3450
Wire Wire Line
	6100 3450 6800 3450
Wire Wire Line
	6800 3100 6800 3450
Connection ~ 6800 3450
Wire Wire Line
	6800 3450 7300 3450
$Comp
L Device:R_POT_TRIM RV1
U 1 1 5F704A64
P 6800 2950
F 0 "RV1" H 6730 2904 50  0000 R CNN
F 1 "10K" H 6730 2995 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_ACP_CA9-H2,5_Horizontal" H 6800 2950 50  0001 C CNN
F 3 "~" H 6800 2950 50  0001 C CNN
	1    6800 2950
	-1   0    0    1   
$EndComp
Wire Wire Line
	6100 2700 6800 2700
Wire Wire Line
	6800 2700 6800 2800
Wire Wire Line
	6650 2950 6500 2950
Wire Wire Line
	6500 2950 6500 2800
Wire Wire Line
	6500 2800 6100 2800
Wire Wire Line
	5650 1700 5650 2600
Wire Wire Line
	5650 2600 5700 2600
Wire Wire Line
	6000 2600 6100 2600
Wire Wire Line
	4000 3450 5000 3450
Connection ~ 5000 3450
Wire Wire Line
	3150 1600 3150 1500
Wire Wire Line
	3150 1600 4100 1600
Wire Wire Line
	3300 2600 4100 2600
Wire Wire Line
	4900 1600 6600 1600
Wire Wire Line
	1200 1600 1200 2050
Wire Wire Line
	2650 1150 2650 1600
$Comp
L Diode:1N4001 D1
U 1 1 5F63C7A5
P 1800 1600
F 0 "D1" H 1800 1383 50  0000 C CNN
F 1 "1N4001" H 1800 1474 50  0000 C CNN
F 2 "Diode_THT:D_DO-41_SOD81_P10.16mm_Horizontal" H 1800 1425 50  0001 C CNN
F 3 "http://www.vishay.com/docs/88503/1n4001.pdf" H 1800 1600 50  0001 C CNN
	1    1800 1600
	-1   0    0    1   
$EndComp
Wire Wire Line
	1550 1600 1650 1600
Wire Wire Line
	1200 3450 1550 3450
Connection ~ 1550 1600
Wire Wire Line
	1950 1600 2050 1600
Connection ~ 2050 1600
Wire Wire Line
	2050 1600 2650 1600
Connection ~ 2650 1600
Wire Wire Line
	2650 1600 2650 2900
Wire Wire Line
	1550 2500 4100 2500
Wire Wire Line
	7300 2650 7300 2850
Wire Wire Line
	7750 2450 7750 2850
Wire Wire Line
	7750 2350 7750 1900
Wire Wire Line
	7750 1900 4900 1900
Wire Wire Line
	6600 2550 7100 2550
Wire Wire Line
	6600 1600 6600 2550
Wire Wire Line
	7100 2100 7100 2350
Wire Wire Line
	7100 2350 7750 2350
Connection ~ 7750 2350
Wire Wire Line
	7100 2350 7100 2550
Connection ~ 7100 2350
Connection ~ 7100 2550
Wire Wire Line
	7100 2550 7300 2550
Wire Wire Line
	6800 2700 6800 2350
Wire Wire Line
	6800 2350 7100 2350
Connection ~ 6800 2700
$EndSCHEMATC
