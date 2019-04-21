EESchema Schematic File Version 4
LIBS:Motorteiber002-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 19
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 5650 3150 2    50   Output ~ 0
ResetOut
Text HLabel 5650 3050 2    50   Output ~ 0
Sleep
Text HLabel 5650 3350 2    50   Output ~ 0
Data
Text HLabel 5650 3550 2    50   Output ~ 0
Clock
Text HLabel 5650 3250 2    50   Output ~ 0
CS
$Comp
L Interface_USB:ADUM3160 U501
U 1 1 5CBAA042
P 2100 4050
F 0 "U501" H 2100 4831 50  0000 C CNN
F 1 "ADUM3160" H 2100 4740 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_7.5x10.3mm_P1.27mm" H 2100 3350 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/ADuM3160.pdf" H 1900 4050 50  0001 C CNN
	1    2100 4050
	1    0    0    -1  
$EndComp
$Comp
L MCU_Microchip_ATmega:ATxmega128C3-AU U502
U 1 1 5CBAF1B3
P 4400 2550
F 0 "U502" H 4400 1200 50  0000 C CNN
F 1 "ATxmega128C3-AU" H 4400 1100 50  0000 C CNN
F 2 "Package_QFP:TQFP-64_14x14mm_P0.8mm" H 4400 2550 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8492-8-and-16-bit-AVR-microcontroller-ATxmega32C3_64C3_128C3_192C3_256C3_datasheet.pdf" H 4400 2550 50  0001 C CNN
	1    4400 2550
	1    0    0    -1  
$EndComp
Text Label 3550 3950 0    50   ~ 0
D-
Text Label 3550 4050 0    50   ~ 0
D+
Wire Wire Line
	2600 3950 3000 3950
Wire Wire Line
	3150 3950 3700 3950
Wire Wire Line
	5100 2150 5650 2150
Wire Wire Line
	5650 2250 5100 2250
Text Label 5250 2150 0    50   ~ 0
DAC0
Text Label 5250 2250 0    50   ~ 0
DAC1
Text Label 5250 1950 0    50   ~ 0
ARef
Wire Wire Line
	5100 1950 5650 1950
Wire Wire Line
	5650 3350 5100 3350
Wire Wire Line
	5650 3550 5100 3550
Text Label 5250 3350 0    50   ~ 0
MoSi
Text Label 5250 3550 0    50   ~ 0
Sck
Wire Wire Line
	3150 4050 3700 4050
Wire Wire Line
	2600 4050 3000 4050
Wire Wire Line
	3000 3950 3150 4050
Wire Wire Line
	3000 4050 3150 3950
Text HLabel 2850 1800 0    50   Output ~ 0
Strobe[0..15]
Wire Wire Line
	5650 3050 5100 3050
Wire Wire Line
	5100 3150 5650 3150
Wire Wire Line
	5650 3250 5100 3250
Wire Wire Line
	5650 2350 5100 2350
Wire Wire Line
	5650 2450 5100 2450
Wire Wire Line
	5650 2550 5100 2550
Wire Wire Line
	5650 2650 5100 2650
Text HLabel 5650 2350 2    50   BiDi ~ 0
TMS
Text HLabel 5650 2450 2    50   BiDi ~ 0
TDI
Text HLabel 5650 2550 2    50   Input ~ 0
TCK
Text HLabel 5650 2650 2    50   BiDi ~ 0
TDO
Text Label 3250 1950 0    50   ~ 0
Strobe0
Wire Wire Line
	3200 1950 3700 1950
Wire Wire Line
	3200 2050 3700 2050
Wire Wire Line
	3200 2150 3700 2150
Wire Wire Line
	3200 2250 3700 2250
Wire Wire Line
	3200 2350 3700 2350
Wire Wire Line
	3200 2450 3700 2450
Wire Wire Line
	3200 2550 3700 2550
Wire Wire Line
	3200 2650 3700 2650
Wire Wire Line
	3200 2850 3700 2850
Wire Wire Line
	3200 2950 3700 2950
Wire Wire Line
	3200 3050 3700 3050
Wire Wire Line
	3200 3150 3700 3150
Wire Wire Line
	3200 3250 3700 3250
Wire Wire Line
	3200 3350 3700 3350
Wire Wire Line
	3200 3450 3700 3450
Wire Wire Line
	3200 3550 3700 3550
Text Label 3250 2050 0    50   ~ 0
Strobe1
Text Label 3250 2150 0    50   ~ 0
Strobe2
Text Label 3250 2250 0    50   ~ 0
Strobe3
Text Label 3250 2350 0    50   ~ 0
Strobe4
Text Label 3250 2450 0    50   ~ 0
Strobe5
Text Label 3250 2550 0    50   ~ 0
Strobe6
Text Label 3250 2650 0    50   ~ 0
Strobe7
Text Label 3250 2850 0    50   ~ 0
Strobe8
Text Label 3250 2950 0    50   ~ 0
Strobe9
Text Label 3250 3050 0    50   ~ 0
Strobe10
Text Label 3250 3150 0    50   ~ 0
Strobe11
Text Label 3250 3250 0    50   ~ 0
Strobe12
Text Label 3250 3350 0    50   ~ 0
Strobe13
Text Label 3250 3450 0    50   ~ 0
Strobe14
Text Label 3250 3550 0    50   ~ 0
Strobe15
Entry Wire Line
	3200 1950 3100 1850
Entry Wire Line
	3200 2050 3100 1950
Entry Wire Line
	3200 2150 3100 2050
Entry Wire Line
	3200 2250 3100 2150
Entry Wire Line
	3200 2350 3100 2250
Entry Wire Line
	3200 2450 3100 2350
Entry Wire Line
	3200 2550 3100 2450
Entry Wire Line
	3200 2650 3100 2550
Entry Wire Line
	3200 2850 3100 2750
Entry Wire Line
	3200 2950 3100 2850
Entry Wire Line
	3200 3050 3100 2950
Entry Wire Line
	3200 3150 3100 3050
Entry Wire Line
	3200 3250 3100 3150
Entry Wire Line
	3200 3350 3100 3250
Entry Wire Line
	3200 3450 3100 3350
Entry Wire Line
	3200 3550 3100 3450
Wire Bus Line
	3100 1800 2850 1800
Text HLabel 5650 2150 2    50   Output ~ 0
DAC0
Text HLabel 5650 2250 2    50   Output ~ 0
DAC1
$Comp
L power:+5V #PWR0501
U 1 1 5CC9E9BA
P 4300 750
F 0 "#PWR0501" H 4300 600 50  0001 C CNN
F 1 "+5V" H 4315 923 50  0000 C CNN
F 2 "" H 4300 750 50  0001 C CNN
F 3 "" H 4300 750 50  0001 C CNN
	1    4300 750 
	1    0    0    -1  
$EndComp
$Comp
L power:+5VA #PWR0503
U 1 1 5CC9EE6C
P 4600 750
F 0 "#PWR0503" H 4600 600 50  0001 C CNN
F 1 "+5VA" H 4615 923 50  0000 C CNN
F 2 "" H 4600 750 50  0001 C CNN
F 3 "" H 4600 750 50  0001 C CNN
	1    4600 750 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 750  4500 750 
Wire Wire Line
	4400 750  4300 750 
Wire Bus Line
	3100 1800 3100 3450
$Comp
L power:+5VA #PWR0504
U 1 1 5CCA0B35
P 5650 1950
F 0 "#PWR0504" H 5650 1800 50  0001 C CNN
F 1 "+5VA" H 5665 2123 50  0000 C CNN
F 2 "" H 5650 1950 50  0001 C CNN
F 3 "" H 5650 1950 50  0001 C CNN
	1    5650 1950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0502
U 1 1 5CCA0D2B
P 4400 4350
F 0 "#PWR0502" H 4400 4100 50  0001 C CNN
F 1 "GND" H 4405 4177 50  0000 C CNN
F 2 "" H 4400 4350 50  0001 C CNN
F 3 "" H 4400 4350 50  0001 C CNN
	1    4400 4350
	1    0    0    -1  
$EndComp
$EndSCHEMATC
