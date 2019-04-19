EESchema Schematic File Version 4
LIBS:Motorteiber002-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 6200 3400 2    50   Output ~ 0
ResetOut
Text HLabel 6200 3500 2    50   Output ~ 0
Sleep
Text HLabel 6200 3100 2    50   Output ~ 0
Data
Text HLabel 6200 3000 2    50   Output ~ 0
Clock
Text HLabel 6200 2400 2    50   Output ~ 0
Uebernahme1
Text HLabel 6200 2500 2    50   Output ~ 0
Uebernahme2
Text HLabel 6200 2600 2    50   Output ~ 0
Uebernahme3
Text HLabel 6200 2700 2    50   Output ~ 0
Uebernahme4
Text HLabel 6200 2300 2    50   Output ~ 0
CS4
Text HLabel 6200 2200 2    50   Output ~ 0
CS3
Text HLabel 6200 2100 2    50   Output ~ 0
CS2
Text HLabel 6200 2000 2    50   Output ~ 0
CS1
$Comp
L Interface_USB:ADUM3160 U?
U 1 1 5CBAA042
P 1300 1450
F 0 "U?" H 1300 2231 50  0000 C CNN
F 1 "ADUM3160" H 1300 2140 50  0000 C CNN
F 2 "Package_SO:SOIC-16W_7.5x10.3mm_P1.27mm" H 1300 750 50  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/ADuM3160.pdf" H 1100 1450 50  0001 C CNN
	1    1300 1450
	1    0    0    -1  
$EndComp
$Comp
L MCU_Microchip_ATmega:ATxmega128C3-AU U?
U 1 1 5CBAF1B3
P 4400 2550
F 0 "U?" H 4400 661 50  0000 C CNN
F 1 "ATxmega128C3-AU" H 4400 570 50  0000 C CNN
F 2 "Package_QFP:TQFP-64_14x14mm_P0.8mm" H 4400 2550 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-8492-8-and-16-bit-AVR-microcontroller-ATxmega32C3_64C3_128C3_192C3_256C3_datasheet.pdf" H 4400 2550 50  0001 C CNN
	1    4400 2550
	1    0    0    -1  
$EndComp
$EndSCHEMATC
