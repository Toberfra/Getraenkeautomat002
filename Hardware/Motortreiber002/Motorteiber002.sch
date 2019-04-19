EESchema Schematic File Version 4
LIBS:Motorteiber002-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1400 6100 1350 1100
U 5CAF974C
F0 "Stromversorgung" 50
F1 "Stromversorgung.sch" 50
$EndSheet
$Sheet
S 8550 1550 950  1150
U 5CB48D70
F0 "Motortreiber3" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 8550 1700 50 
F3 "Sleep" I L 8550 1800 50 
F4 "Data" I L 8550 1950 50 
F5 "Clock" I L 8550 2050 50 
F6 "CS" I L 8550 2200 50 
F7 "Uebernahme" I L 8550 2300 50 
$EndSheet
$Sheet
S 10200 1550 900  1150
U 5CB4900E
F0 "Motortreiber4" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 10200 1700 50 
F3 "Sleep" I L 10200 1800 50 
F4 "Data" I L 10200 1950 50 
F5 "Clock" I L 10200 2050 50 
F6 "CS" I L 10200 2200 50 
F7 "Uebernahme" I L 10200 2300 50 
$EndSheet
$Sheet
S 6850 1550 1000 1150
U 5CAFBDFD
F0 "Motortreiber2" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 6850 1700 50 
F3 "Sleep" I L 6850 1800 50 
F4 "Data" I L 6850 1950 50 
F5 "Clock" I L 6850 2050 50 
F6 "CS" I L 6850 2200 50 
F7 "Uebernahme" I L 6850 2300 50 
$EndSheet
$Sheet
S 5100 1550 1050 1150
U 5CAFB649
F0 "Motortreiber1" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 5100 1700 50 
F3 "Sleep" I L 5100 1800 50 
F4 "Data" I L 5100 1950 50 
F5 "Clock" I L 5100 2050 50 
F6 "CS" I L 5100 2200 50 
F7 "Uebernahme" I L 5100 2300 50 
$EndSheet
Wire Wire Line
	5100 1700 4950 1700
Wire Wire Line
	4950 1800 5100 1800
Wire Wire Line
	4950 1950 5100 1950
Wire Wire Line
	4950 2050 5100 2050
Wire Wire Line
	4950 2200 5100 2200
Wire Wire Line
	4950 2300 5100 2300
Entry Wire Line
	4850 1600 4950 1700
Entry Wire Line
	4850 1700 4950 1800
Entry Wire Line
	4850 1850 4950 1950
Entry Wire Line
	4850 1950 4950 2050
Entry Wire Line
	4850 2100 4950 2200
Entry Wire Line
	4850 2200 4950 2300
Text Label 5000 1700 2    50   ~ 0
R
Text Label 5000 1800 2    50   ~ 0
S
Text Label 5000 1950 2    50   ~ 0
D
Text Label 5000 2050 2    50   ~ 0
C
Text Label 5050 2200 2    50   ~ 0
CS1
Text Label 5050 2300 2    50   ~ 0
Ue1
Entry Wire Line
	6500 2200 6600 2300
Entry Wire Line
	6500 2100 6600 2200
Entry Wire Line
	6500 1950 6600 2050
Entry Wire Line
	6500 1850 6600 1950
Entry Wire Line
	6500 1700 6600 1800
Entry Wire Line
	6500 1600 6600 1700
Wire Wire Line
	6850 1700 6600 1700
Wire Wire Line
	6600 1800 6850 1800
Wire Wire Line
	6850 1950 6600 1950
Wire Wire Line
	6600 2050 6850 2050
Wire Wire Line
	6850 2200 6600 2200
Wire Wire Line
	6600 2300 6850 2300
Text Label 6750 1700 2    50   ~ 0
R
Text Label 6750 1800 2    50   ~ 0
S
Text Label 6750 1950 2    50   ~ 0
D
Text Label 6750 2050 2    50   ~ 0
C
Text Label 6750 2200 2    50   ~ 0
CS2
Text Label 6750 2300 2    50   ~ 0
Ue2
Wire Wire Line
	8550 1700 8350 1700
Wire Wire Line
	8350 1800 8550 1800
Wire Wire Line
	8350 1950 8550 1950
Wire Wire Line
	8350 2050 8550 2050
Wire Wire Line
	8350 2200 8550 2200
Wire Wire Line
	8350 2300 8550 2300
Wire Wire Line
	9950 1700 10200 1700
Wire Wire Line
	9950 1800 10200 1800
Wire Wire Line
	9950 1950 10200 1950
Wire Wire Line
	9950 2050 10200 2050
Wire Wire Line
	9950 2200 10200 2200
Wire Wire Line
	9950 2300 10200 2300
Entry Wire Line
	9950 1700 9850 1600
Entry Wire Line
	9950 1800 9850 1700
Entry Wire Line
	9950 1950 9850 1850
Entry Wire Line
	9950 2050 9850 1950
Entry Wire Line
	9950 2200 9850 2100
Entry Wire Line
	9950 2300 9850 2200
Entry Wire Line
	8350 2300 8250 2200
Entry Wire Line
	8350 2200 8250 2100
Entry Wire Line
	8350 2050 8250 1950
Entry Wire Line
	8350 1950 8250 1850
Entry Wire Line
	8350 1800 8250 1700
Entry Wire Line
	8350 1700 8250 1600
Entry Bus Bus
	9850 1300 9750 1200
Entry Bus Bus
	8250 1300 8150 1200
Entry Bus Bus
	6500 1300 6400 1200
Entry Bus Bus
	4850 1300 4750 1200
Text Label 8500 1700 2    50   ~ 0
R
Text Label 8500 1800 2    50   ~ 0
S
Text Label 8500 1950 2    50   ~ 0
D
Text Label 8500 2050 2    50   ~ 0
C
Text Label 8500 2200 2    50   ~ 0
CS3
Text Label 8500 2300 2    50   ~ 0
Ue3
Text Label 10150 1700 2    50   ~ 0
R
Text Label 10150 1800 2    50   ~ 0
S
Text Label 10150 1950 2    50   ~ 0
D
Text Label 10150 2050 2    50   ~ 0
C
Text Label 10150 2200 2    50   ~ 0
CS4
Text Label 10150 2300 2    50   ~ 0
Ue4
$Sheet
S 1350 1550 900  2200
U 5CB22923
F0 "Controller" 50
F1 "Controller.sch" 50
F2 "Uebernahme4" O R 2250 2950 50 
F3 "Uebernahme3" O R 2250 2850 50 
F4 "Uebernahme2" O R 2250 2750 50 
F5 "Uebernahme1" O R 2250 2650 50 
F6 "CS4" O R 2250 2500 50 
F7 "CS3" O R 2250 2400 50 
F8 "CS2" O R 2250 2300 50 
F9 "CS1" O R 2250 2200 50 
F10 "Clock" O R 2250 2050 50 
F11 "Data" O R 2250 1950 50 
F12 "Sleep" O R 2250 1800 50 
F13 "ResetOut" O R 2250 1700 50 
$EndSheet
Wire Wire Line
	2700 2950 2250 2950
Wire Wire Line
	2700 2850 2250 2850
Wire Wire Line
	2700 2750 2250 2750
Wire Wire Line
	2700 2650 2250 2650
Wire Wire Line
	2700 2500 2250 2500
Wire Wire Line
	2700 2400 2250 2400
Wire Wire Line
	2700 2300 2250 2300
Wire Wire Line
	2700 2200 2250 2200
Wire Wire Line
	2700 2050 2250 2050
Wire Wire Line
	2700 1950 2250 1950
Wire Wire Line
	2700 1800 2250 1800
Wire Wire Line
	2700 1700 2250 1700
Entry Wire Line
	2700 2950 2800 2850
Entry Wire Line
	2700 2850 2800 2750
Entry Wire Line
	2700 2750 2800 2650
Entry Wire Line
	2700 2650 2800 2550
Entry Wire Line
	2700 2500 2800 2400
Entry Wire Line
	2700 2400 2800 2300
Entry Wire Line
	2700 2300 2800 2200
Entry Wire Line
	2700 2200 2800 2100
Entry Wire Line
	2700 2050 2800 1950
Entry Wire Line
	2700 1950 2800 1850
Entry Wire Line
	2700 1800 2800 1700
Entry Wire Line
	2700 1700 2800 1600
Entry Bus Bus
	2800 1300 2900 1200
Text Label 2600 1700 2    50   ~ 0
R
Text Label 2600 1800 2    50   ~ 0
S
Text Label 2600 1950 2    50   ~ 0
D
Text Label 2600 2050 2    50   ~ 0
C
Text Label 2600 2200 2    50   ~ 0
CS1
Text Label 2600 2300 2    50   ~ 0
CS2
Text Label 2600 2400 2    50   ~ 0
CS3
Text Label 2600 2500 2    50   ~ 0
CS4
Text Label 2600 2650 2    50   ~ 0
Ue1
Text Label 2600 2750 2    50   ~ 0
Ue2
Text Label 2600 2850 2    50   ~ 0
Ue3
Text Label 2600 2950 2    50   ~ 0
Ue4
Wire Bus Line
	2900 1200 9750 1200
Wire Bus Line
	4850 1300 4850 2200
Wire Bus Line
	6500 1300 6500 2200
Wire Bus Line
	9850 1300 9850 2200
Wire Bus Line
	8250 1300 8250 2200
Wire Bus Line
	2800 1300 2800 2850
$EndSCHEMATC
