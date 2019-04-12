EESchema Schematic File Version 4
LIBS:Motorteiber002-cache
LIBS:Motortreiber001-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
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
S 4650 1550 950  1150
U 5CB48D70
F0 "Motortreiber3" 50
F1 "Motortreiber.sch" 50
$EndSheet
$Sheet
S 6300 1550 900  1150
U 5CB4900E
F0 "Motortreiber4" 50
F1 "Motortreiber.sch" 50
$EndSheet
$Sheet
S 2950 1550 1000 1150
U 5CAFBDFD
F0 "Motortreiber2" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 2950 1700 50 
F3 "Sleep" I L 2950 1800 50 
F4 "Data" I L 2950 1950 50 
F5 "Clock" I L 2950 2050 50 
F6 "CS" I L 2950 2200 50 
F7 "Uebernahme" I L 2950 2300 50 
$EndSheet
$Sheet
S 1200 1550 1050 1150
U 5CAFB649
F0 "Motortreiber1" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 1200 1700 50 
F3 "Sleep" I L 1200 1800 50 
F4 "Data" I L 1200 1950 50 
F5 "Clock" I L 1200 2050 50 
F6 "CS" I L 1200 2200 50 
F7 "Uebernahme" I L 1200 2300 50 
$EndSheet
Wire Wire Line
	1200 1700 1050 1700
Wire Wire Line
	1050 1800 1200 1800
Wire Wire Line
	1050 1950 1200 1950
Wire Wire Line
	1050 2050 1200 2050
Wire Wire Line
	1050 2200 1200 2200
Wire Wire Line
	1050 2300 1200 2300
Entry Wire Line
	950  1600 1050 1700
Entry Wire Line
	950  1700 1050 1800
Entry Wire Line
	950  1850 1050 1950
Entry Wire Line
	950  1950 1050 2050
Entry Wire Line
	950  2100 1050 2200
Entry Wire Line
	950  2200 1050 2300
Text Label 1100 1700 2    50   ~ 0
R
Text Label 1100 1800 2    50   ~ 0
S
Text Label 1100 1950 2    50   ~ 0
D
Text Label 1100 2050 2    50   ~ 0
C
Text Label 1150 2200 2    50   ~ 0
CS1
Text Label 1150 2300 2    50   ~ 0
Ue1
Entry Bus Bus
	2600 1300 2700 1200
Entry Wire Line
	2600 2200 2700 2300
Entry Wire Line
	2600 2100 2700 2200
Entry Wire Line
	2600 1950 2700 2050
Entry Wire Line
	2600 1850 2700 1950
Entry Wire Line
	2600 1700 2700 1800
Entry Wire Line
	2600 1600 2700 1700
Wire Wire Line
	2950 1700 2700 1700
Wire Wire Line
	2700 1800 2950 1800
Wire Wire Line
	2950 1950 2700 1950
Wire Wire Line
	2700 2050 2950 2050
Wire Wire Line
	2950 2200 2700 2200
Wire Wire Line
	2700 2300 2950 2300
Wire Bus Line
	2600 1300 2600 2200
Text Label 2850 1700 2    50   ~ 0
R
Text Label 2850 1800 2    50   ~ 0
S
Text Label 2850 1950 2    50   ~ 0
D
Text Label 2850 2050 2    50   ~ 0
C
Text Label 2850 2200 2    50   ~ 0
CS2
Text Label 2850 2300 2    50   ~ 0
Ue2
Entry Bus Bus
	950  1300 1050 1200
Wire Bus Line
	1050 1200 7650 1200
Wire Bus Line
	950  1300 950  2200
$EndSCHEMATC
