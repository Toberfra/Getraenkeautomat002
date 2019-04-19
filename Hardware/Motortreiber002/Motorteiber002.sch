EESchema Schematic File Version 4
LIBS:Motorteiber002-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 19
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
S 8800 750  950  1150
U 5CB48D70
F0 "Motortreiber4" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 8800 900 50 
F3 "Sleep" I L 8800 1000 50 
F4 "Data" I L 8800 1150 50 
F5 "Clock" I L 8800 1250 50 
F6 "CS" I L 8800 1400 50 
F7 "Uebernahme" I L 8800 1700 50 
$EndSheet
$Sheet
S 10300 750  900  1150
U 5CB4900E
F0 "Motortreiber5" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 10300 900 50 
F3 "Sleep" I L 10300 1000 50 
F4 "Data" I L 10300 1150 50 
F5 "Clock" I L 10300 1250 50 
F6 "CS" I L 10300 1400 50 
F7 "Uebernahme" I L 10300 1700 50 
$EndSheet
$Sheet
S 7400 750  1000 1150
U 5CAFBDFD
F0 "Motortreiber3" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 7400 900 50 
F3 "Sleep" I L 7400 1000 50 
F4 "Data" I L 7400 1150 50 
F5 "Clock" I L 7400 1250 50 
F6 "CS" I L 7400 1400 50 
F7 "Uebernahme" I L 7400 1700 50 
$EndSheet
$Sheet
S 5900 750  1050 1150
U 5CAFB649
F0 "Motortreiber2" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 5900 900 50 
F3 "Sleep" I L 5900 1000 50 
F4 "Data" I L 5900 1150 50 
F5 "Clock" I L 5900 1250 50 
F6 "CS" I L 5900 1400 50 
F7 "Uebernahme" I L 5900 1700 50 
$EndSheet
Wire Wire Line
	5900 900  5750 900 
Wire Wire Line
	5750 1000 5900 1000
Wire Wire Line
	5750 1150 5900 1150
Wire Wire Line
	5750 1250 5900 1250
Wire Wire Line
	5750 1400 5900 1400
Entry Wire Line
	5650 800  5750 900 
Entry Wire Line
	5650 900  5750 1000
Entry Wire Line
	5650 1050 5750 1150
Entry Wire Line
	5650 1150 5750 1250
Entry Wire Line
	5650 1300 5750 1400
Text Label 5800 900  2    50   ~ 0
R
Text Label 5800 1000 2    50   ~ 0
S
Text Label 5800 1150 2    50   ~ 0
D
Text Label 5800 1250 2    50   ~ 0
C
Text Label 5850 1400 2    50   ~ 0
CS
Entry Wire Line
	7050 1300 7150 1400
Entry Wire Line
	7050 1150 7150 1250
Entry Wire Line
	7050 1050 7150 1150
Entry Wire Line
	7050 900  7150 1000
Entry Wire Line
	7050 800  7150 900 
Wire Wire Line
	7400 900  7150 900 
Wire Wire Line
	7150 1000 7400 1000
Wire Wire Line
	7400 1150 7150 1150
Wire Wire Line
	7150 1250 7400 1250
Wire Wire Line
	7400 1400 7150 1400
Text Label 7300 900  2    50   ~ 0
R
Text Label 7300 1000 2    50   ~ 0
S
Text Label 7300 1150 2    50   ~ 0
D
Text Label 7300 1250 2    50   ~ 0
C
Text Label 7300 1400 2    50   ~ 0
CS
Wire Wire Line
	8800 900  8600 900 
Wire Wire Line
	8600 1000 8800 1000
Wire Wire Line
	8600 1150 8800 1150
Wire Wire Line
	8600 1250 8800 1250
Wire Wire Line
	8600 1400 8800 1400
Entry Wire Line
	10100 900  10000 800 
Entry Wire Line
	10100 1000 10000 900 
Entry Wire Line
	10100 1150 10000 1050
Entry Wire Line
	10100 1250 10000 1150
Entry Wire Line
	10100 1400 10000 1300
Entry Wire Line
	8600 1400 8500 1300
Entry Wire Line
	8600 1250 8500 1150
Entry Wire Line
	8600 1150 8500 1050
Entry Wire Line
	8600 1000 8500 900 
Entry Wire Line
	8600 900  8500 800 
Text Label 8750 900  2    50   ~ 0
R
Text Label 8750 1000 2    50   ~ 0
S
Text Label 8750 1150 2    50   ~ 0
D
Text Label 8750 1250 2    50   ~ 0
C
Text Label 8750 1400 2    50   ~ 0
CS
Text Label 10250 900  2    50   ~ 0
R
Text Label 10250 1000 2    50   ~ 0
S
Text Label 10250 1150 2    50   ~ 0
D
Text Label 10250 1250 2    50   ~ 0
C
Text Label 10250 1400 2    50   ~ 0
CS
$Sheet
S 600  650  900  2200
U 5CB22923
F0 "Controller" 50
F1 "Controller.sch" 50
F2 "Clock" O R 1500 1150 50 
F3 "Data" O R 1500 1050 50 
F4 "Sleep" O R 1500 900 50 
F5 "ResetOut" O R 1500 800 50 
F6 "CS" O R 1500 1300 50 
F7 "Strobe[0..15]" O R 1500 1750 50 
F8 "TMS" B R 1500 2600 50 
F9 "TDI" B R 1500 2700 50 
F10 "TCK" I R 1500 2800 50 
F11 "TDO" B R 1500 2500 50 
F12 "DAC0" O R 1500 1450 50 
F13 "DAC1" O R 1500 1550 50 
$EndSheet
Wire Wire Line
	1950 1300 1500 1300
Wire Wire Line
	1950 1150 1500 1150
Wire Wire Line
	1950 1050 1500 1050
Wire Wire Line
	1950 900  1500 900 
Wire Wire Line
	1950 800  1500 800 
Entry Wire Line
	1950 1300 2050 1200
Entry Wire Line
	1950 1150 2050 1050
Entry Wire Line
	1950 1050 2050 950 
Entry Wire Line
	1950 900  2050 800 
Entry Wire Line
	1950 800  2050 700 
Text Label 1850 800  2    50   ~ 0
R
Text Label 1850 900  2    50   ~ 0
S
Text Label 1850 1050 2    50   ~ 0
D
Text Label 1850 1150 2    50   ~ 0
C
Text Label 1850 1300 2    50   ~ 0
CS
Wire Wire Line
	1950 1450 1500 1450
Wire Wire Line
	1950 1550 1500 1550
Entry Wire Line
	1950 1450 2050 1350
Entry Wire Line
	1950 1550 2050 1450
Wire Bus Line
	1500 1750 2100 1750
Wire Bus Line
	8450 1600 8450 550 
Connection ~ 8450 550 
Wire Bus Line
	7000 1600 7000 550 
Wire Bus Line
	5600 1600 5600 550 
Entry Wire Line
	5600 1600 5700 1700
Entry Wire Line
	7000 1600 7100 1700
Entry Wire Line
	8450 1600 8550 1700
Entry Wire Line
	9950 1600 10050 1700
Wire Wire Line
	5700 1700 5900 1700
Wire Wire Line
	8800 1700 8550 1700
Wire Wire Line
	7400 1700 7100 1700
Text Label 5850 1700 2    50   ~ 0
Strobe2
Text Label 7350 1700 2    50   ~ 0
Strobe3
Text Label 8750 1700 2    50   ~ 0
Strobe4
Text Label 10250 1700 2    50   ~ 0
Strobe5
Connection ~ 8500 500 
Wire Bus Line
	8450 550  8900 550 
Wire Bus Line
	8500 500  8950 500 
Wire Wire Line
	10300 1700 10050 1700
Wire Wire Line
	10100 1400 10300 1400
Wire Wire Line
	10300 1250 10100 1250
Wire Wire Line
	10100 1150 10300 1150
Wire Wire Line
	10300 1000 10100 1000
Wire Wire Line
	10100 900  10300 900 
Wire Bus Line
	8450 550  9950 550 
Wire Bus Line
	8500 500  10000 500 
Connection ~ 5600 550 
Wire Bus Line
	5600 550  7000 550 
Connection ~ 5650 500 
Wire Bus Line
	5650 500  7050 500 
Wire Bus Line
	9950 1600 9950 550 
Wire Bus Line
	7050 500  8500 500 
Connection ~ 7050 500 
Wire Bus Line
	7000 550  8450 550 
Connection ~ 7000 550 
$Sheet
S 4450 750  1050 1150
U 5CBEA5F1
F0 "Motortreiber1" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 4450 900 50 
F3 "Sleep" I L 4450 1000 50 
F4 "Data" I L 4450 1150 50 
F5 "Clock" I L 4450 1250 50 
F6 "CS" I L 4450 1400 50 
F7 "Uebernahme" I L 4450 1700 50 
$EndSheet
Wire Wire Line
	4450 900  4300 900 
Wire Wire Line
	4300 1000 4450 1000
Wire Wire Line
	4300 1150 4450 1150
Wire Wire Line
	4300 1250 4450 1250
Wire Wire Line
	4300 1400 4450 1400
Entry Wire Line
	4200 800  4300 900 
Entry Wire Line
	4200 900  4300 1000
Entry Wire Line
	4200 1050 4300 1150
Entry Wire Line
	4200 1150 4300 1250
Entry Wire Line
	4200 1300 4300 1400
Text Label 4350 900  2    50   ~ 0
R
Text Label 4350 1000 2    50   ~ 0
S
Text Label 4350 1150 2    50   ~ 0
D
Text Label 4350 1250 2    50   ~ 0
C
Text Label 4400 1400 2    50   ~ 0
CS
Wire Bus Line
	4150 1600 4150 550 
Entry Wire Line
	4150 1600 4250 1700
Wire Wire Line
	4250 1700 4450 1700
Text Label 4400 1700 2    50   ~ 0
Strobe1
Connection ~ 4200 500 
Wire Bus Line
	4200 500  5650 500 
Connection ~ 4150 550 
Wire Bus Line
	4150 550  5600 550 
Wire Bus Line
	2050 500  2750 500 
Wire Bus Line
	2100 550  2100 1750
Wire Bus Line
	2100 550  2700 550 
$Sheet
S 3000 750  1050 1150
U 5CBF1A9C
F0 "Motortreiber0" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 3000 900 50 
F3 "Sleep" I L 3000 1000 50 
F4 "Data" I L 3000 1150 50 
F5 "Clock" I L 3000 1250 50 
F6 "CS" I L 3000 1400 50 
F7 "Uebernahme" I L 3000 1700 50 
$EndSheet
Wire Wire Line
	3000 900  2850 900 
Wire Wire Line
	2850 1000 3000 1000
Wire Wire Line
	2850 1150 3000 1150
Wire Wire Line
	2850 1250 3000 1250
Wire Wire Line
	2850 1400 3000 1400
Entry Wire Line
	2750 800  2850 900 
Entry Wire Line
	2750 900  2850 1000
Entry Wire Line
	2750 1050 2850 1150
Entry Wire Line
	2750 1150 2850 1250
Entry Wire Line
	2750 1300 2850 1400
Text Label 2900 900  2    50   ~ 0
R
Text Label 2900 1000 2    50   ~ 0
S
Text Label 2900 1150 2    50   ~ 0
D
Text Label 2900 1250 2    50   ~ 0
C
Text Label 2950 1400 2    50   ~ 0
CS
Wire Bus Line
	2700 1600 2700 550 
Entry Wire Line
	2700 1600 2800 1700
Wire Wire Line
	2800 1700 3000 1700
Text Label 2950 1700 2    50   ~ 0
Strobe0
Connection ~ 2700 550 
Wire Bus Line
	2700 550  4150 550 
Connection ~ 2750 500 
Wire Bus Line
	2750 500  4200 500 
$Sheet
S 8800 2300 950  1150
U 5CC655CA
F0 "Motortreiber10" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 8800 2450 50 
F3 "Sleep" I L 8800 2550 50 
F4 "Data" I L 8800 2700 50 
F5 "Clock" I L 8800 2800 50 
F6 "CS" I L 8800 2950 50 
F7 "Uebernahme" I L 8800 3250 50 
$EndSheet
$Sheet
S 10300 2300 900  1150
U 5CC655D2
F0 "Motortreiber11" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 10300 2450 50 
F3 "Sleep" I L 10300 2550 50 
F4 "Data" I L 10300 2700 50 
F5 "Clock" I L 10300 2800 50 
F6 "CS" I L 10300 2950 50 
F7 "Uebernahme" I L 10300 3250 50 
$EndSheet
$Sheet
S 7400 2300 1000 1150
U 5CC655DA
F0 "Motortreiber9" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 7400 2450 50 
F3 "Sleep" I L 7400 2550 50 
F4 "Data" I L 7400 2700 50 
F5 "Clock" I L 7400 2800 50 
F6 "CS" I L 7400 2950 50 
F7 "Uebernahme" I L 7400 3250 50 
$EndSheet
$Sheet
S 5900 2300 1050 1150
U 5CC655E2
F0 "Motortreiber8" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 5900 2450 50 
F3 "Sleep" I L 5900 2550 50 
F4 "Data" I L 5900 2700 50 
F5 "Clock" I L 5900 2800 50 
F6 "CS" I L 5900 2950 50 
F7 "Uebernahme" I L 5900 3250 50 
$EndSheet
Wire Wire Line
	5900 2450 5750 2450
Wire Wire Line
	5750 2550 5900 2550
Wire Wire Line
	5750 2700 5900 2700
Wire Wire Line
	5750 2800 5900 2800
Wire Wire Line
	5750 2950 5900 2950
Entry Wire Line
	5650 2350 5750 2450
Entry Wire Line
	5650 2450 5750 2550
Entry Wire Line
	5650 2600 5750 2700
Entry Wire Line
	5650 2700 5750 2800
Entry Wire Line
	5650 2850 5750 2950
Text Label 5800 2450 2    50   ~ 0
R
Text Label 5800 2550 2    50   ~ 0
S
Text Label 5800 2700 2    50   ~ 0
D
Text Label 5800 2800 2    50   ~ 0
C
Text Label 5850 2950 2    50   ~ 0
CS
Entry Wire Line
	7050 2850 7150 2950
Entry Wire Line
	7050 2700 7150 2800
Entry Wire Line
	7050 2600 7150 2700
Entry Wire Line
	7050 2450 7150 2550
Entry Wire Line
	7050 2350 7150 2450
Wire Wire Line
	7400 2450 7150 2450
Wire Wire Line
	7150 2550 7400 2550
Wire Wire Line
	7400 2700 7150 2700
Wire Wire Line
	7150 2800 7400 2800
Wire Wire Line
	7400 2950 7150 2950
Text Label 7300 2450 2    50   ~ 0
R
Text Label 7300 2550 2    50   ~ 0
S
Text Label 7300 2700 2    50   ~ 0
D
Text Label 7300 2800 2    50   ~ 0
C
Text Label 7300 2950 2    50   ~ 0
CS
Wire Wire Line
	8800 2450 8600 2450
Wire Wire Line
	8600 2550 8800 2550
Wire Wire Line
	8600 2700 8800 2700
Wire Wire Line
	8600 2800 8800 2800
Wire Wire Line
	8600 2950 8800 2950
Entry Wire Line
	10100 2450 10000 2350
Entry Wire Line
	10100 2550 10000 2450
Entry Wire Line
	10100 2700 10000 2600
Entry Wire Line
	10100 2800 10000 2700
Entry Wire Line
	10100 2950 10000 2850
Entry Wire Line
	8600 2950 8500 2850
Entry Wire Line
	8600 2800 8500 2700
Entry Wire Line
	8600 2700 8500 2600
Entry Wire Line
	8600 2550 8500 2450
Entry Wire Line
	8600 2450 8500 2350
Text Label 8750 2450 2    50   ~ 0
R
Text Label 8750 2550 2    50   ~ 0
S
Text Label 8750 2700 2    50   ~ 0
D
Text Label 8750 2800 2    50   ~ 0
C
Text Label 8750 2950 2    50   ~ 0
CS
Text Label 10250 2450 2    50   ~ 0
R
Text Label 10250 2550 2    50   ~ 0
S
Text Label 10250 2700 2    50   ~ 0
D
Text Label 10250 2800 2    50   ~ 0
C
Text Label 10250 2950 2    50   ~ 0
CS
Wire Bus Line
	8450 3150 8450 2100
Connection ~ 8450 2100
Wire Bus Line
	7000 3150 7000 2100
Wire Bus Line
	5600 3150 5600 2100
Entry Wire Line
	5600 3150 5700 3250
Entry Wire Line
	7000 3150 7100 3250
Entry Wire Line
	8450 3150 8550 3250
Entry Wire Line
	9950 3150 10050 3250
Wire Wire Line
	5700 3250 5900 3250
Wire Wire Line
	8800 3250 8550 3250
Wire Wire Line
	7400 3250 7100 3250
Text Label 5850 3250 2    50   ~ 0
Strobe8
Text Label 7350 3250 2    50   ~ 0
Strobe9
Text Label 8750 3250 2    50   ~ 0
Strobe10
Text Label 10250 3250 2    50   ~ 0
Strobe11
Connection ~ 8500 2050
Wire Bus Line
	8450 2100 8900 2100
Wire Bus Line
	8500 2050 8950 2050
Wire Wire Line
	10300 3250 10050 3250
Wire Wire Line
	10100 2950 10300 2950
Wire Wire Line
	10300 2800 10100 2800
Wire Wire Line
	10100 2700 10300 2700
Wire Wire Line
	10300 2550 10100 2550
Wire Wire Line
	10100 2450 10300 2450
Wire Bus Line
	8450 2100 9950 2100
Wire Bus Line
	8500 2050 10000 2050
Connection ~ 5600 2100
Wire Bus Line
	5600 2100 7000 2100
Connection ~ 5650 2050
Wire Bus Line
	5650 2050 7050 2050
Wire Bus Line
	9950 3150 9950 2100
Wire Bus Line
	7050 2050 8500 2050
Connection ~ 7050 2050
Wire Bus Line
	7000 2100 8450 2100
Connection ~ 7000 2100
$Sheet
S 4450 2300 1050 1150
U 5CC65644
F0 "Motortreiber7" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 4450 2450 50 
F3 "Sleep" I L 4450 2550 50 
F4 "Data" I L 4450 2700 50 
F5 "Clock" I L 4450 2800 50 
F6 "CS" I L 4450 2950 50 
F7 "Uebernahme" I L 4450 3250 50 
$EndSheet
Wire Wire Line
	4450 2450 4300 2450
Wire Wire Line
	4300 2550 4450 2550
Wire Wire Line
	4300 2700 4450 2700
Wire Wire Line
	4300 2800 4450 2800
Wire Wire Line
	4300 2950 4450 2950
Entry Wire Line
	4200 2350 4300 2450
Entry Wire Line
	4200 2450 4300 2550
Entry Wire Line
	4200 2600 4300 2700
Entry Wire Line
	4200 2700 4300 2800
Entry Wire Line
	4200 2850 4300 2950
Text Label 4350 2450 2    50   ~ 0
R
Text Label 4350 2550 2    50   ~ 0
S
Text Label 4350 2700 2    50   ~ 0
D
Text Label 4350 2800 2    50   ~ 0
C
Text Label 4400 2950 2    50   ~ 0
CS
Wire Bus Line
	4150 3150 4150 2100
Entry Wire Line
	4150 3150 4250 3250
Wire Wire Line
	4250 3250 4450 3250
Text Label 4400 3250 2    50   ~ 0
Strobe7
Connection ~ 4200 2050
Wire Bus Line
	4200 2050 5650 2050
Connection ~ 4150 2100
Wire Bus Line
	4150 2100 5600 2100
Wire Bus Line
	2050 2050 2750 2050
Wire Bus Line
	2100 2100 2700 2100
$Sheet
S 3000 2300 1050 1150
U 5CC65665
F0 "Motortreiber6" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 3000 2450 50 
F3 "Sleep" I L 3000 2550 50 
F4 "Data" I L 3000 2700 50 
F5 "Clock" I L 3000 2800 50 
F6 "CS" I L 3000 2950 50 
F7 "Uebernahme" I L 3000 3250 50 
$EndSheet
Wire Wire Line
	3000 2450 2850 2450
Wire Wire Line
	2850 2550 3000 2550
Wire Wire Line
	2850 2700 3000 2700
Wire Wire Line
	2850 2800 3000 2800
Wire Wire Line
	2850 2950 3000 2950
Entry Wire Line
	2750 2350 2850 2450
Entry Wire Line
	2750 2450 2850 2550
Entry Wire Line
	2750 2600 2850 2700
Entry Wire Line
	2750 2700 2850 2800
Entry Wire Line
	2750 2850 2850 2950
Text Label 2900 2450 2    50   ~ 0
R
Text Label 2900 2550 2    50   ~ 0
S
Text Label 2900 2700 2    50   ~ 0
D
Text Label 2900 2800 2    50   ~ 0
C
Text Label 2950 2950 2    50   ~ 0
CS
Wire Bus Line
	2700 3150 2700 2100
Entry Wire Line
	2700 3150 2800 3250
Wire Wire Line
	2800 3250 3000 3250
Text Label 2950 3250 2    50   ~ 0
Strobe6
Connection ~ 2700 2100
Wire Bus Line
	2700 2100 4150 2100
Connection ~ 2750 2050
Wire Bus Line
	2750 2050 4200 2050
$Sheet
S 8800 3850 950  1150
U 5CC75215
F0 "Motortreiber14" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 8800 4000 50 
F3 "Sleep" I L 8800 4100 50 
F4 "Data" I L 8800 4250 50 
F5 "Clock" I L 8800 4350 50 
F6 "CS" I L 8800 4500 50 
F7 "Uebernahme" I L 8800 4800 50 
$EndSheet
$Sheet
S 10300 3850 900  1150
U 5CC7521D
F0 "Motortreiber15" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 10300 4000 50 
F3 "Sleep" I L 10300 4100 50 
F4 "Data" I L 10300 4250 50 
F5 "Clock" I L 10300 4350 50 
F6 "CS" I L 10300 4500 50 
F7 "Uebernahme" I L 10300 4800 50 
$EndSheet
$Sheet
S 7400 3850 1000 1150
U 5CC75225
F0 "Motortreiber13" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 7400 4000 50 
F3 "Sleep" I L 7400 4100 50 
F4 "Data" I L 7400 4250 50 
F5 "Clock" I L 7400 4350 50 
F6 "CS" I L 7400 4500 50 
F7 "Uebernahme" I L 7400 4800 50 
$EndSheet
$Sheet
S 5900 3850 1050 1150
U 5CC7522D
F0 "Motortreiber12" 50
F1 "Motortreiber.sch" 50
F2 "Reset" I L 5900 4000 50 
F3 "Sleep" I L 5900 4100 50 
F4 "Data" I L 5900 4250 50 
F5 "Clock" I L 5900 4350 50 
F6 "CS" I L 5900 4500 50 
F7 "Uebernahme" I L 5900 4800 50 
$EndSheet
Wire Wire Line
	5900 4000 5750 4000
Wire Wire Line
	5750 4100 5900 4100
Wire Wire Line
	5750 4250 5900 4250
Wire Wire Line
	5750 4350 5900 4350
Wire Wire Line
	5750 4500 5900 4500
Entry Wire Line
	5650 3900 5750 4000
Entry Wire Line
	5650 4000 5750 4100
Entry Wire Line
	5650 4150 5750 4250
Entry Wire Line
	5650 4250 5750 4350
Entry Wire Line
	5650 4400 5750 4500
Text Label 5800 4000 2    50   ~ 0
R
Text Label 5800 4100 2    50   ~ 0
S
Text Label 5800 4250 2    50   ~ 0
D
Text Label 5800 4350 2    50   ~ 0
C
Text Label 5850 4500 2    50   ~ 0
CS
Entry Wire Line
	7050 4400 7150 4500
Entry Wire Line
	7050 4250 7150 4350
Entry Wire Line
	7050 4150 7150 4250
Entry Wire Line
	7050 4000 7150 4100
Entry Wire Line
	7050 3900 7150 4000
Wire Wire Line
	7400 4000 7150 4000
Wire Wire Line
	7150 4100 7400 4100
Wire Wire Line
	7400 4250 7150 4250
Wire Wire Line
	7150 4350 7400 4350
Wire Wire Line
	7400 4500 7150 4500
Text Label 7300 4000 2    50   ~ 0
R
Text Label 7300 4100 2    50   ~ 0
S
Text Label 7300 4250 2    50   ~ 0
D
Text Label 7300 4350 2    50   ~ 0
C
Text Label 7300 4500 2    50   ~ 0
CS
Wire Wire Line
	8800 4000 8600 4000
Wire Wire Line
	8600 4100 8800 4100
Wire Wire Line
	8600 4250 8800 4250
Wire Wire Line
	8600 4350 8800 4350
Wire Wire Line
	8600 4500 8800 4500
Entry Wire Line
	10100 4000 10000 3900
Entry Wire Line
	10100 4100 10000 4000
Entry Wire Line
	10100 4250 10000 4150
Entry Wire Line
	10100 4350 10000 4250
Entry Wire Line
	10100 4500 10000 4400
Entry Wire Line
	8600 4500 8500 4400
Entry Wire Line
	8600 4350 8500 4250
Entry Wire Line
	8600 4250 8500 4150
Entry Wire Line
	8600 4100 8500 4000
Entry Wire Line
	8600 4000 8500 3900
Text Label 8750 4000 2    50   ~ 0
R
Text Label 8750 4100 2    50   ~ 0
S
Text Label 8750 4250 2    50   ~ 0
D
Text Label 8750 4350 2    50   ~ 0
C
Text Label 8750 4500 2    50   ~ 0
CS
Text Label 10250 4000 2    50   ~ 0
R
Text Label 10250 4100 2    50   ~ 0
S
Text Label 10250 4250 2    50   ~ 0
D
Text Label 10250 4350 2    50   ~ 0
C
Text Label 10250 4500 2    50   ~ 0
CS
Wire Bus Line
	8450 4700 8450 3650
Connection ~ 8450 3650
Wire Bus Line
	7000 4700 7000 3650
Wire Bus Line
	5600 4700 5600 3650
Entry Wire Line
	5600 4700 5700 4800
Entry Wire Line
	7000 4700 7100 4800
Entry Wire Line
	8450 4700 8550 4800
Entry Wire Line
	9950 4700 10050 4800
Wire Wire Line
	5700 4800 5900 4800
Wire Wire Line
	8800 4800 8550 4800
Wire Wire Line
	7400 4800 7100 4800
Text Label 5850 4800 2    50   ~ 0
Strobe12
Text Label 7350 4800 2    50   ~ 0
Strobe13
Text Label 8750 4800 2    50   ~ 0
Strobe14
Text Label 10250 4800 2    50   ~ 0
Strobe15
Connection ~ 8500 3600
Wire Bus Line
	8450 3650 8900 3650
Wire Bus Line
	8500 3600 8950 3600
Wire Wire Line
	10300 4800 10050 4800
Wire Wire Line
	10100 4500 10300 4500
Wire Wire Line
	10300 4350 10100 4350
Wire Wire Line
	10100 4250 10300 4250
Wire Wire Line
	10300 4100 10100 4100
Wire Wire Line
	10100 4000 10300 4000
Wire Bus Line
	8450 3650 9950 3650
Wire Bus Line
	8500 3600 10000 3600
Connection ~ 5600 3650
Wire Bus Line
	5600 3650 7000 3650
Connection ~ 5650 3600
Wire Bus Line
	5650 3600 7050 3600
Wire Bus Line
	9950 4700 9950 3650
Wire Bus Line
	7050 3600 8500 3600
Connection ~ 7050 3600
Wire Bus Line
	7000 3650 8450 3650
Connection ~ 7000 3650
Wire Bus Line
	2100 3650 5600 3650
Wire Bus Line
	2050 3600 5650 3600
Connection ~ 2050 2050
Wire Bus Line
	2050 2050 2050 3600
Wire Bus Line
	2100 3650 2100 2100
Wire Bus Line
	5650 500  5650 1300
Wire Bus Line
	10000 500  10000 1300
Wire Bus Line
	4200 500  4200 1300
Wire Bus Line
	2750 500  2750 1300
Wire Bus Line
	5650 2050 5650 2850
Wire Bus Line
	10000 2050 10000 2850
Wire Bus Line
	4200 2050 4200 2850
Wire Bus Line
	2750 2050 2750 2850
Wire Bus Line
	5650 3600 5650 4400
Wire Bus Line
	10000 3600 10000 4400
Wire Bus Line
	7050 500  7050 1300
Wire Bus Line
	8500 500  8500 1300
Wire Bus Line
	7050 2050 7050 2850
Wire Bus Line
	8500 2050 8500 2850
Wire Bus Line
	7050 3600 7050 4400
Wire Bus Line
	8500 3600 8500 4400
Wire Bus Line
	2050 500  2050 2050
Connection ~ 2100 1750
Connection ~ 2100 2100
Wire Bus Line
	2100 2100 2100 1750
Text Label 2000 1750 2    50   ~ 0
Strobe[0..15]
$EndSCHEMATC
