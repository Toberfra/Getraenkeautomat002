EESchema Schematic File Version 4
LIBS:Motorteiber002-cache
LIBS:Motortreiber001-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 5800 2800 2    50   Input ~ 0
Reset
Text HLabel 5800 2900 2    50   Input ~ 0
Sleep
Text HLabel 5800 4000 2    50   Input ~ 0
Data
Text HLabel 5800 3800 2    50   Input ~ 0
Clock
$Comp
L power:+28V #PWR0106
U 1 1 5CAFBB89
P 1950 2050
AR Path="/5CAFB649/5CAFBB89" Ref="#PWR0106"  Part="1" 
AR Path="/5CAFBDFD/5CAFBB89" Ref="#PWR0108"  Part="1" 
AR Path="/5CB48D70/5CAFBB89" Ref="#PWR?"  Part="1" 
AR Path="/5CB4900E/5CAFBB89" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1950 1900 50  0001 C CNN
F 1 "+28V" H 1965 2223 50  0000 C CNN
F 2 "" H 2200 2100 50  0001 C CNN
F 3 "" H 2200 2100 50  0001 C CNN
	1    1950 2050
	1    0    0    -1  
$EndComp
$Comp
L Eigene:DRV8823 U1
U 1 1 5CA10EF0
P 4650 3500
AR Path="/5CAFB649/5CA10EF0" Ref="U1"  Part="1" 
AR Path="/5CAFBDFD/5CA10EF0" Ref="U2"  Part="1" 
AR Path="/5CB48D70/5CA10EF0" Ref="U?"  Part="1" 
AR Path="/5CB4900E/5CA10EF0" Ref="U?"  Part="1" 
F 0 "U?" H 4650 5065 50  0000 C CNN
F 1 "DRV8823" H 4650 4974 50  0000 C CNN
F 2 "Package_SO:TSSOP-48_6.1x12.5mm_P0.5mm" V 4550 3350 50  0001 C CNN
F 3 "" H 4000 3800 50  0001 C CNN
	1    4650 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3200 3900 3200
Wire Wire Line
	3900 3200 3900 3300
Wire Wire Line
	3900 3700 4000 3700
Wire Wire Line
	4000 3600 3900 3600
Connection ~ 3900 3600
Wire Wire Line
	3900 3600 3900 3700
Wire Wire Line
	4000 3500 3900 3500
Connection ~ 3900 3500
Wire Wire Line
	3900 3500 3900 3600
Wire Wire Line
	4000 3400 3900 3400
Connection ~ 3900 3400
Wire Wire Line
	3900 3400 3900 3500
Wire Wire Line
	4000 3300 3900 3300
Connection ~ 3900 3300
Wire Wire Line
	3900 3300 3900 3400
Wire Wire Line
	5300 3200 5400 3200
Wire Wire Line
	5400 3700 5300 3700
Wire Wire Line
	5300 3600 5400 3600
Connection ~ 5400 3600
Wire Wire Line
	5400 3600 5400 3700
Wire Wire Line
	5300 3500 5400 3500
Connection ~ 5400 3500
Wire Wire Line
	5400 3500 5400 3600
Wire Wire Line
	5400 3400 5300 3400
Connection ~ 5400 3400
Wire Wire Line
	5400 3400 5400 3500
Wire Wire Line
	5400 3300 5300 3300
Connection ~ 5400 3300
Wire Wire Line
	5400 3300 5400 3400
Wire Wire Line
	4000 2400 3900 2400
Wire Wire Line
	3900 2400 3900 2350
Wire Wire Line
	3900 2300 4000 2300
Wire Wire Line
	4000 4500 3900 4500
Wire Wire Line
	3900 4500 3900 4550
Wire Wire Line
	3900 4600 4000 4600
Wire Wire Line
	3900 4550 3700 4550
Wire Wire Line
	3700 2350 3900 2350
Connection ~ 3900 4550
Wire Wire Line
	3900 4550 3900 4600
Connection ~ 3900 2350
Wire Wire Line
	3900 2350 3900 2300
Wire Wire Line
	5300 4100 5800 4100
Wire Wire Line
	5400 3250 5400 3300
Wire Wire Line
	5400 3200 5400 3300
Wire Wire Line
	3700 2350 3700 3400
Wire Wire Line
	4000 3800 3650 3800
Wire Wire Line
	3650 3800 3650 3050
$Comp
L Connector:Screw_Terminal_01x04 J2
U 1 1 5CA5AEA1
P 4600 1600
AR Path="/5CAFB649/5CA5AEA1" Ref="J2"  Part="1" 
AR Path="/5CAFBDFD/5CA5AEA1" Ref="J4"  Part="1" 
AR Path="/5CB48D70/5CA5AEA1" Ref="J?"  Part="1" 
AR Path="/5CB4900E/5CA5AEA1" Ref="J?"  Part="1" 
F 0 "J?" V 4564 1312 50  0000 R CNN
F 1 "Screw_Terminal_01x04" V 4473 1312 50  0000 R CNN
F 2 "Connector_Phoenix_MC_HighVoltage:PhoenixContact_MCV_1,5_4-G-5.08_1x04_P5.08mm_Vertical" H 4600 1600 50  0001 C CNN
F 3 "~" H 4600 1600 50  0001 C CNN
	1    4600 1600
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Screw_Terminal_01x04 J3
U 1 1 5CA5CF1C
P 4650 5250
AR Path="/5CAFB649/5CA5CF1C" Ref="J3"  Part="1" 
AR Path="/5CAFBDFD/5CA5CF1C" Ref="J5"  Part="1" 
AR Path="/5CB48D70/5CA5CF1C" Ref="J?"  Part="1" 
AR Path="/5CB4900E/5CA5CF1C" Ref="J?"  Part="1" 
F 0 "J?" V 4522 5430 50  0000 L CNN
F 1 "Screw_Terminal_01x04" V 4613 5430 50  0000 L CNN
F 2 "Connector_Phoenix_MC_HighVoltage:PhoenixContact_MCV_1,5_4-G-5.08_1x04_P5.08mm_Vertical" H 4650 5250 50  0001 C CNN
F 3 "~" H 4650 5250 50  0001 C CNN
	1    4650 5250
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 4600 5400 4600
Wire Wire Line
	5400 4950 4650 4950
Wire Wire Line
	4750 5050 5450 5050
Wire Wire Line
	5450 4400 5300 4400
Wire Wire Line
	4550 4950 3850 4950
Wire Wire Line
	3850 4400 4000 4400
Wire Wire Line
	4000 4200 3800 4200
Wire Wire Line
	3800 5050 4450 5050
Wire Wire Line
	4000 2500 3850 2500
Wire Wire Line
	3850 2500 3850 2000
Wire Wire Line
	3850 2000 4600 2000
Wire Wire Line
	4600 2000 4600 1800
Wire Wire Line
	4500 1800 4500 1900
Wire Wire Line
	4500 1900 3800 1900
Wire Wire Line
	3800 2700 4000 2700
Wire Wire Line
	5300 2300 5450 2300
Wire Wire Line
	5450 2300 5450 2000
Wire Wire Line
	5450 2000 4700 2000
Wire Wire Line
	4700 2000 4700 1800
Wire Wire Line
	4800 1800 4800 1900
Wire Wire Line
	4800 1900 5500 1900
Wire Wire Line
	5500 2500 5300 2500
Text Label 4000 1900 0    50   ~ 0
MA1
Text Label 4000 2000 0    50   ~ 0
MA2
Text Label 5200 1900 0    50   ~ 0
MB1
Text Label 5200 2000 0    50   ~ 0
MB2
Wire Wire Line
	5500 1900 5500 2500
Wire Wire Line
	3800 1900 3800 2700
Wire Wire Line
	4650 4950 4650 5050
Wire Wire Line
	4550 4950 4550 5050
Wire Wire Line
	5450 4400 5450 5050
Wire Wire Line
	5400 4600 5400 4950
Wire Wire Line
	3850 4400 3850 4950
Wire Wire Line
	3800 4200 3800 5050
Text Label 5000 4950 0    50   ~ 0
MC2
Text Label 5000 5050 0    50   ~ 0
MC1
Text Label 4150 4950 0    50   ~ 0
MD1
Text Label 4150 5050 0    50   ~ 0
MD2
Wire Wire Line
	5300 3800 5800 3800
Wire Wire Line
	5300 2600 5500 2600
$Comp
L power:GND #PWR0109
U 1 1 5CB597A7
P 5600 3550
AR Path="/5CAFB649/5CB597A7" Ref="#PWR0109"  Part="1" 
AR Path="/5CAFBDFD/5CB597A7" Ref="#PWR0121"  Part="1" 
AR Path="/5CB48D70/5CB597A7" Ref="#PWR?"  Part="1" 
AR Path="/5CB4900E/5CB597A7" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5600 3300 50  0001 C CNN
F 1 "GND" H 5605 3377 50  0000 C CNN
F 2 "" H 5600 3550 50  0001 C CNN
F 3 "" H 5600 3550 50  0001 C CNN
	1    5600 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 3500 5600 3550
Wire Wire Line
	5600 3500 5400 3500
$Comp
L power:GND #PWR0110
U 1 1 5CB5E84A
P 3800 3550
AR Path="/5CAFB649/5CB5E84A" Ref="#PWR0110"  Part="1" 
AR Path="/5CAFBDFD/5CB5E84A" Ref="#PWR0122"  Part="1" 
AR Path="/5CB48D70/5CB5E84A" Ref="#PWR?"  Part="1" 
AR Path="/5CB4900E/5CB5E84A" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3800 3300 50  0001 C CNN
F 1 "GND" H 3805 3377 50  0000 C CNN
F 2 "" H 3800 3550 50  0001 C CNN
F 3 "" H 3800 3550 50  0001 C CNN
	1    3800 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 3550 3800 3500
Wire Wire Line
	3800 3500 3900 3500
$Comp
L Device:R R3
U 1 1 5CB640E6
P 3400 2600
AR Path="/5CAFB649/5CB640E6" Ref="R3"  Part="1" 
AR Path="/5CAFBDFD/5CB640E6" Ref="R9"  Part="1" 
AR Path="/5CB48D70/5CB640E6" Ref="R?"  Part="1" 
AR Path="/5CB4900E/5CB640E6" Ref="R?"  Part="1" 
F 0 "R?" V 3193 2600 50  0000 C CNN
F 1 "0R5" V 3284 2600 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P5.08mm_Vertical" V 3330 2600 50  0001 C CNN
F 3 "" H 3400 2600 50  0001 C CNN
F 4 "RND 0W2J050KA10" V 3400 2600 50  0001 C CNN "Reichelt"
	1    3400 2600
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 5CB64BF2
P 3400 4300
AR Path="/5CAFB649/5CB64BF2" Ref="R4"  Part="1" 
AR Path="/5CAFBDFD/5CB64BF2" Ref="R10"  Part="1" 
AR Path="/5CB48D70/5CB64BF2" Ref="R?"  Part="1" 
AR Path="/5CB4900E/5CB64BF2" Ref="R?"  Part="1" 
F 0 "R?" V 3193 4300 50  0000 C CNN
F 1 "0R5" V 3284 4300 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P5.08mm_Vertical" V 3330 4300 50  0001 C CNN
F 3 "~" H 3400 4300 50  0001 C CNN
F 4 "RND 0W2J050KA10" V 3400 4300 50  0001 C CNN "Reichelt"
	1    3400 4300
	0    1    1    0   
$EndComp
$Comp
L Device:R R6
U 1 1 5CB65616
P 5700 4500
AR Path="/5CAFB649/5CB65616" Ref="R6"  Part="1" 
AR Path="/5CAFBDFD/5CB65616" Ref="R12"  Part="1" 
AR Path="/5CB48D70/5CB65616" Ref="R?"  Part="1" 
AR Path="/5CB4900E/5CB65616" Ref="R?"  Part="1" 
F 0 "R?" V 5493 4500 50  0000 C CNN
F 1 "0R5" V 5584 4500 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P5.08mm_Vertical" V 5630 4500 50  0001 C CNN
F 3 "~" H 5700 4500 50  0001 C CNN
F 4 "RND 0W2J050KA10" V 5700 4500 50  0001 C CNN "Reichelt"
	1    5700 4500
	0    1    1    0   
$EndComp
$Comp
L Device:R R5
U 1 1 5CB65C0C
P 5700 2400
AR Path="/5CAFB649/5CB65C0C" Ref="R5"  Part="1" 
AR Path="/5CAFBDFD/5CB65C0C" Ref="R11"  Part="1" 
AR Path="/5CB48D70/5CB65C0C" Ref="R?"  Part="1" 
AR Path="/5CB4900E/5CB65C0C" Ref="R?"  Part="1" 
F 0 "R?" V 5493 2400 50  0000 C CNN
F 1 "0R5" V 5584 2400 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0411_L9.9mm_D3.6mm_P5.08mm_Vertical" V 5630 2400 50  0001 C CNN
F 3 "~" H 5700 2400 50  0001 C CNN
F 4 "RND 0W2J050KA10" V 5700 2400 50  0001 C CNN "Reichelt"
	1    5700 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 2400 5550 2400
Wire Wire Line
	5850 2400 5900 2400
Wire Wire Line
	5900 2400 5900 2450
Wire Wire Line
	4000 2600 3550 2600
Wire Wire Line
	3250 2600 3200 2600
Wire Wire Line
	3200 2600 3200 2650
Wire Wire Line
	4000 4300 3550 4300
Wire Wire Line
	3250 4300 3200 4300
Wire Wire Line
	3200 4300 3200 4350
Wire Wire Line
	5300 4500 5550 4500
Wire Wire Line
	5850 4500 5900 4500
Wire Wire Line
	5900 4500 5900 4550
$Comp
L power:GND #PWR0111
U 1 1 5CB99402
P 3200 2650
AR Path="/5CAFB649/5CB99402" Ref="#PWR0111"  Part="1" 
AR Path="/5CAFBDFD/5CB99402" Ref="#PWR0123"  Part="1" 
AR Path="/5CB48D70/5CB99402" Ref="#PWR?"  Part="1" 
AR Path="/5CB4900E/5CB99402" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3200 2400 50  0001 C CNN
F 1 "GND" H 3205 2477 50  0000 C CNN
F 2 "" H 3200 2650 50  0001 C CNN
F 3 "" H 3200 2650 50  0001 C CNN
	1    3200 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5CB99CB4
P 3200 4350
AR Path="/5CAFB649/5CB99CB4" Ref="#PWR0112"  Part="1" 
AR Path="/5CAFBDFD/5CB99CB4" Ref="#PWR0124"  Part="1" 
AR Path="/5CB48D70/5CB99CB4" Ref="#PWR?"  Part="1" 
AR Path="/5CB4900E/5CB99CB4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3200 4100 50  0001 C CNN
F 1 "GND" H 3205 4177 50  0000 C CNN
F 2 "" H 3200 4350 50  0001 C CNN
F 3 "" H 3200 4350 50  0001 C CNN
	1    3200 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5CB99D3F
P 5900 4550
AR Path="/5CAFB649/5CB99D3F" Ref="#PWR0113"  Part="1" 
AR Path="/5CAFBDFD/5CB99D3F" Ref="#PWR0125"  Part="1" 
AR Path="/5CB48D70/5CB99D3F" Ref="#PWR?"  Part="1" 
AR Path="/5CB4900E/5CB99D3F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5900 4300 50  0001 C CNN
F 1 "GND" H 5905 4377 50  0000 C CNN
F 2 "" H 5900 4550 50  0001 C CNN
F 3 "" H 5900 4550 50  0001 C CNN
	1    5900 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5CB9A10F
P 5900 2450
AR Path="/5CAFB649/5CB9A10F" Ref="#PWR0114"  Part="1" 
AR Path="/5CAFBDFD/5CB9A10F" Ref="#PWR0126"  Part="1" 
AR Path="/5CB48D70/5CB9A10F" Ref="#PWR?"  Part="1" 
AR Path="/5CB4900E/5CB9A10F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5900 2200 50  0001 C CNN
F 1 "GND" H 5905 2277 50  0000 C CNN
F 2 "" H 5900 2450 50  0001 C CNN
F 3 "" H 5900 2450 50  0001 C CNN
	1    5900 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2600 5500 2700
$Comp
L power:GND #PWR0115
U 1 1 5CBA118C
P 2950 4050
AR Path="/5CAFB649/5CBA118C" Ref="#PWR0115"  Part="1" 
AR Path="/5CAFBDFD/5CBA118C" Ref="#PWR0127"  Part="1" 
AR Path="/5CB48D70/5CBA118C" Ref="#PWR?"  Part="1" 
AR Path="/5CB4900E/5CBA118C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2950 3800 50  0001 C CNN
F 1 "GND" H 2955 3877 50  0000 C CNN
F 2 "" H 2950 4050 50  0001 C CNN
F 3 "" H 2950 4050 50  0001 C CNN
	1    2950 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5CBA147F
P 3150 4050
AR Path="/5CAFB649/5CBA147F" Ref="#PWR0116"  Part="1" 
AR Path="/5CAFBDFD/5CBA147F" Ref="#PWR0128"  Part="1" 
AR Path="/5CB48D70/5CBA147F" Ref="#PWR?"  Part="1" 
AR Path="/5CB4900E/5CBA147F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3150 3800 50  0001 C CNN
F 1 "GND" H 3155 3877 50  0000 C CNN
F 2 "" H 3150 4050 50  0001 C CNN
F 3 "" H 3150 4050 50  0001 C CNN
	1    3150 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5CBA1EF8
P 2950 3350
AR Path="/5CAFB649/5CBA1EF8" Ref="R1"  Part="1" 
AR Path="/5CAFBDFD/5CBA1EF8" Ref="R7"  Part="1" 
AR Path="/5CB48D70/5CBA1EF8" Ref="R?"  Part="1" 
AR Path="/5CB4900E/5CBA1EF8" Ref="R?"  Part="1" 
F 0 "R?" H 3020 3396 50  0000 L CNN
F 1 "R" H 3020 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 2880 3350 50  0001 C CNN
F 3 "~" H 2950 3350 50  0001 C CNN
	1    2950 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5CBA2D04
P 3150 3350
AR Path="/5CAFB649/5CBA2D04" Ref="R2"  Part="1" 
AR Path="/5CAFBDFD/5CBA2D04" Ref="R8"  Part="1" 
AR Path="/5CB48D70/5CBA2D04" Ref="R?"  Part="1" 
AR Path="/5CB4900E/5CBA2D04" Ref="R?"  Part="1" 
F 0 "R?" H 3220 3396 50  0000 L CNN
F 1 "R" H 3220 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.15x1.40mm_HandSolder" V 3080 3350 50  0001 C CNN
F 3 "~" H 3150 3350 50  0001 C CNN
	1    3150 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5CBA36F8
P 2600 3550
AR Path="/5CAFB649/5CBA36F8" Ref="C3"  Part="1" 
AR Path="/5CAFBDFD/5CBA36F8" Ref="C9"  Part="1" 
AR Path="/5CB48D70/5CBA36F8" Ref="C?"  Part="1" 
AR Path="/5CB4900E/5CBA36F8" Ref="C?"  Part="1" 
F 0 "C?" H 2715 3596 50  0000 L CNN
F 1 "100nF" H 2715 3505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 2638 3400 50  0001 C CNN
F 3 "~" H 2600 3550 50  0001 C CNN
	1    2600 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5CBA4977
P 2600 3800
AR Path="/5CAFB649/5CBA4977" Ref="#PWR0117"  Part="1" 
AR Path="/5CAFBDFD/5CBA4977" Ref="#PWR0129"  Part="1" 
AR Path="/5CB48D70/5CBA4977" Ref="#PWR?"  Part="1" 
AR Path="/5CB4900E/5CBA4977" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2600 3550 50  0001 C CNN
F 1 "GND" H 2605 3627 50  0000 C CNN
F 2 "" H 2600 3800 50  0001 C CNN
F 3 "" H 2600 3800 50  0001 C CNN
	1    2600 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3800 2600 3700
Wire Wire Line
	2600 3400 2600 3150
Wire Wire Line
	2600 3150 2950 3150
Wire Wire Line
	3150 3150 3150 3200
Wire Wire Line
	2950 3200 2950 3150
Connection ~ 2950 3150
Wire Wire Line
	2950 3150 3150 3150
Wire Wire Line
	3500 3900 4000 3900
Wire Wire Line
	4000 4000 3450 4000
Wire Wire Line
	3450 4000 3450 3900
$Comp
L Device:C C6
U 1 1 5CBD32BF
P 3450 2850
AR Path="/5CAFB649/5CBD32BF" Ref="C6"  Part="1" 
AR Path="/5CAFBDFD/5CBD32BF" Ref="C12"  Part="1" 
AR Path="/5CB48D70/5CBD32BF" Ref="C?"  Part="1" 
AR Path="/5CB4900E/5CBD32BF" Ref="C?"  Part="1" 
F 0 "C?" H 3565 2896 50  0000 L CNN
F 1 "10nF" H 3565 2805 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3488 2700 50  0001 C CNN
F 3 "~" H 3450 2850 50  0001 C CNN
	1    3450 2850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C7
U 1 1 5CBD3B7F
P 3450 3250
AR Path="/5CAFB649/5CBD3B7F" Ref="C7"  Part="1" 
AR Path="/5CAFBDFD/5CBD3B7F" Ref="C13"  Part="1" 
AR Path="/5CB48D70/5CBD3B7F" Ref="C?"  Part="1" 
AR Path="/5CB4900E/5CBD3B7F" Ref="C?"  Part="1" 
F 0 "C?" H 3565 3296 50  0000 L CNN
F 1 "100nf" H 3565 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 3488 3100 50  0001 C CNN
F 3 "~" H 3450 3250 50  0001 C CNN
	1    3450 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 3400 3450 3400
Connection ~ 3700 3400
Wire Wire Line
	3700 3400 3700 4550
Wire Wire Line
	3450 3100 4000 3100
Wire Wire Line
	3450 3000 4000 3000
Wire Wire Line
	4000 2900 3750 2900
Wire Wire Line
	3750 2900 3750 2700
Wire Wire Line
	3750 2700 3450 2700
Wire Wire Line
	3700 2350 3450 2350
Wire Wire Line
	3450 2350 3450 2050
Connection ~ 3700 2350
$Comp
L Device:C C2
U 1 1 5CC199C8
P 2150 2250
AR Path="/5CAFB649/5CC199C8" Ref="C2"  Part="1" 
AR Path="/5CAFBDFD/5CC199C8" Ref="C8"  Part="1" 
AR Path="/5CB48D70/5CC199C8" Ref="C?"  Part="1" 
AR Path="/5CB4900E/5CC199C8" Ref="C?"  Part="1" 
F 0 "C?" H 2265 2296 50  0000 L CNN
F 1 "100nF" H 2265 2205 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D8.0mm_W5.0mm_P5.00mm" H 2188 2100 50  0001 C CNN
F 3 "~" H 2150 2250 50  0001 C CNN
	1    2150 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 5CC1A57F
P 2650 2250
AR Path="/5CAFB649/5CC1A57F" Ref="C4"  Part="1" 
AR Path="/5CAFBDFD/5CC1A57F" Ref="C10"  Part="1" 
AR Path="/5CB48D70/5CC1A57F" Ref="C?"  Part="1" 
AR Path="/5CB4900E/5CC1A57F" Ref="C?"  Part="1" 
F 0 "C?" H 2765 2296 50  0000 L CNN
F 1 "100nF" H 2765 2205 50  0000 L CNN
F 2 "Capacitor_THT:C_Disc_D8.0mm_W5.0mm_P5.00mm" H 2688 2100 50  0001 C CNN
F 3 "~" H 2650 2250 50  0001 C CNN
	1    2650 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 5CC1B08E
P 2150 2400
AR Path="/5CAFB649/5CC1B08E" Ref="#PWR0118"  Part="1" 
AR Path="/5CAFBDFD/5CC1B08E" Ref="#PWR0130"  Part="1" 
AR Path="/5CB48D70/5CC1B08E" Ref="#PWR?"  Part="1" 
AR Path="/5CB4900E/5CC1B08E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2150 2150 50  0001 C CNN
F 1 "GND" H 2155 2227 50  0000 C CNN
F 2 "" H 2150 2400 50  0001 C CNN
F 3 "" H 2150 2400 50  0001 C CNN
	1    2150 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5CC1B34B
P 2650 2400
AR Path="/5CAFB649/5CC1B34B" Ref="#PWR0119"  Part="1" 
AR Path="/5CAFBDFD/5CC1B34B" Ref="#PWR0131"  Part="1" 
AR Path="/5CB48D70/5CC1B34B" Ref="#PWR?"  Part="1" 
AR Path="/5CB4900E/5CC1B34B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2650 2150 50  0001 C CNN
F 1 "GND" H 2655 2227 50  0000 C CNN
F 2 "" H 2650 2400 50  0001 C CNN
F 3 "" H 2650 2400 50  0001 C CNN
	1    2650 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C5
U 1 1 5CC1B722
P 3150 2250
AR Path="/5CAFB649/5CC1B722" Ref="C5"  Part="1" 
AR Path="/5CAFBDFD/5CC1B722" Ref="C11"  Part="1" 
AR Path="/5CB48D70/5CC1B722" Ref="C?"  Part="1" 
AR Path="/5CB4900E/5CC1B722" Ref="C?"  Part="1" 
F 0 "C?" H 3268 2296 50  0000 L CNN
F 1 "100uF" H 3268 2205 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 3188 2100 50  0001 C CNN
F 3 "~" H 3150 2250 50  0001 C CNN
F 4 "FM-A 100U 50" H 3150 2250 50  0001 C CNN "Reichelt"
	1    3150 2250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5CC1C247
P 3150 2400
AR Path="/5CAFB649/5CC1C247" Ref="#PWR0120"  Part="1" 
AR Path="/5CAFBDFD/5CC1C247" Ref="#PWR0132"  Part="1" 
AR Path="/5CB48D70/5CC1C247" Ref="#PWR?"  Part="1" 
AR Path="/5CB4900E/5CC1C247" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3150 2150 50  0001 C CNN
F 1 "GND" H 3155 2227 50  0000 C CNN
F 2 "" H 3150 2400 50  0001 C CNN
F 3 "" H 3150 2400 50  0001 C CNN
	1    3150 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2100 3150 2050
Connection ~ 3150 2050
Wire Wire Line
	3150 2050 3450 2050
Wire Wire Line
	2650 2100 2650 2050
Connection ~ 2650 2050
Wire Wire Line
	2650 2050 3150 2050
Wire Wire Line
	2150 2100 2150 2050
Connection ~ 2150 2050
Wire Wire Line
	2150 2050 2650 2050
$Comp
L Device:R_POT_TRIM RV1
U 1 1 5CA34474
P 2950 3700
AR Path="/5CAFB649/5CA34474" Ref="RV1"  Part="1" 
AR Path="/5CAFBDFD/5CA34474" Ref="RV3"  Part="1" 
AR Path="/5CB48D70/5CA34474" Ref="RV?"  Part="1" 
AR Path="/5CB4900E/5CA34474" Ref="RV?"  Part="1" 
F 0 "RV?" H 2880 3746 50  0000 R CNN
F 1 "R_POT_TRIM" H 2880 3655 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Vishay_43_Horizontal" H 2950 3700 50  0001 C CNN
F 3 "~" H 2950 3700 50  0001 C CNN
	1    2950 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT_TRIM RV2
U 1 1 5CA34D30
P 3150 3900
AR Path="/5CAFB649/5CA34D30" Ref="RV2"  Part="1" 
AR Path="/5CAFBDFD/5CA34D30" Ref="RV4"  Part="1" 
AR Path="/5CB48D70/5CA34D30" Ref="RV?"  Part="1" 
AR Path="/5CB4900E/5CA34D30" Ref="RV?"  Part="1" 
F 0 "RV?" H 3080 3946 50  0000 R CNN
F 1 "R_POT_TRIM" H 3080 3855 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Vishay_43_Horizontal" H 3150 3900 50  0001 C CNN
F 3 "~" H 3150 3900 50  0001 C CNN
	1    3150 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 3550 2950 3500
Wire Wire Line
	2950 3850 2950 4050
Wire Wire Line
	3150 3500 3150 3750
Wire Wire Line
	3300 3900 3450 3900
Wire Wire Line
	3100 3700 3500 3700
Wire Wire Line
	3500 3700 3500 3900
Wire Wire Line
	3650 3050 3200 3050
Wire Wire Line
	3200 3050 3200 3150
Wire Wire Line
	3200 3150 3150 3150
Connection ~ 3150 3150
Wire Wire Line
	1950 2050 2150 2050
Wire Wire Line
	5800 2800 5300 2800
Wire Wire Line
	5300 2900 5800 2900
Text HLabel 5800 2700 2    50   Input ~ 0
CS
Wire Wire Line
	5500 2700 5800 2700
Wire Wire Line
	5800 4000 5300 4000
Text HLabel 5800 4100 2    50   Input ~ 0
Uebernahme
$EndSCHEMATC
