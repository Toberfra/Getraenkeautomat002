import array
import RPi.GPIO as GPIO
import time


class hx711:
    def __init__(self, dout, clk):
        self.receive_array = array.array('B',
                                         [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21,
                                          22, 23])
        self.clk = clk
        self.dout = dout
        self.gain_pulse = 1

        GPIO.setmode(GPIO.BCM)
        GPIO.setup(self.clk, GPIO.OUT)
        GPIO.setup(self.dout, GPIO.IN)

        self.reset()
        self.raw_a = 0
        self.raw_b = 0
        self.offset_a = 0

    def erfasse_a(self , anzahl_a):
        self.gain_pulse = 1
        self.list_a = list()
        for x in range(anzahl_a ):
            self.transfer()
            self.list_a.append(self.raw_wert)

        self.list_a.sort()

        if anzahl_a >=7:
            wert = 0
            for x in range(2, anzahl_a - 2):
                wert += self.list_a[x]
            self.raw_a = wert / (anzahl_a - 4)
        elif anzahl_a >=3:
            wert = 0
            for x in range(1, anzahl_a - 1):
                wert += self.list_a[x]
            self.raw_a = wert / (anzahl_a -2)
        elif anzahl_a == 2:
            self.raw_a = (self.list_a[0] + self.list_a[1]) / 2
        elif anzahl_a == 1:
            self.raw_a = self.list_a[0]
        else:
            self.raw_a = 0

    def erfasse_beide(self , anzahl_a , anzahl_b):
        self.list_a = list()
        for x in range(anzahl_a -1):
            self.transfer()
            self.list_a.append(self.raw_wert)
        self.gain_pulse = 2
        self.transfer()
        self.list_a.append(self.raw_wert)

        self.list_b = list()
        for x in range(anzahl_b -1):
            self.transfer()
            self.list_b.append(self.raw_wert)
        self.gain_pulse = 1
        self.transfer()
        self.list_b.append(self.raw_wert)

        self.list_a.sort()
        self.list_b.sort()

        if anzahl_a > 10:
            ohne = int(anzahl_a / 5)
            wert = 0
            for x in range(ohne, anzahl_a - ohne):
                wert += self.list_a[x]
            self.raw_a = wert / (anzahl_a - ohne * 2)
        elif anzahl_a >=7:
            wert = 0
            for x in range(2, anzahl_a - 2):
                wert += self.list_a[x]
            self.raw_a = wert / (anzahl_a - 4)
        elif anzahl_a >=3:
            wert = 0
            for x in range(1, anzahl_a - 1):
                wert += self.list_a[x]
            self.raw_a = wert / (anzahl_a -2)
        elif anzahl_a == 2:
            self.raw_a = (self.list_a[0] + self.list_a[1]) / 2
        elif anzahl_a == 1:
            self.raw_a = self.list_a[0]
        else:
            self.raw_a = 0


        if anzahl_b > 10:
            ohne = int(anzahl_b / 5)
            wert = 0
            for x in range(ohne, anzahl_b - ohne):
                wert += self.list_b[x]
            self.raw_b = wert / (anzahl_b - ohne * 2)
        elif anzahl_b >= 7:
            wert = 0
            for x in range(2, anzahl_b - 2):
                wert += self.list_b[x]
            self.raw_b = wert / (anzahl_b - 4)
        elif anzahl_b >= 3:
            wert = 0
            for x in range(1, anzahl_b - 1):
                wert += self.list_b[x]
            self.raw_b = wert / (anzahl_b -2)
        elif anzahl_b == 2:
            self.raw_b = (self.list_b[0] + self.list_b[1]) / 2
        elif anzahl_b == 1:
            self.raw_b = self.list_b[0]
        else:
            self.raw_b = 0

    def transfer(self):
        time.sleep(0.001)
        while GPIO.input(self.dout) == 1:
            time.sleep(0.001)
        start = time.clock_gettime(time.CLOCK_MONOTONIC_RAW)
        for pos in range(24):
            GPIO.output(self.clk, True)
            pin = GPIO.input(self.dout)
            GPIO.output(self.clk, False)
            self.receive_array[pos] = pin
        for pos in range(self.gain_pulse):
            GPIO.output(self.clk, True)
            GPIO.output(self.clk, False)
        stopp = time.clock_gettime(time.CLOCK_MONOTONIC_RAW)
        self.zeit = stopp - start

        wert = 0
        for pos in range(24):
            wert *= 2
            wert += self.receive_array[pos]
        self.raw_wert = wert

    # HX711 datasheet states that setting the PDA_CLOCK pin on high for >60 microseconds would power off the chip.
    # I used 100 microseconds, just in case.
    # I've found it is good practice to reset the hx711 if it wasn't used for
    # more than a few seconds.
    def power_down(self):
        GPIO.output(self.clk, False)
        GPIO.output(self.clk, True)
        time.sleep(0.0001)

    def power_up(self):
        GPIO.output(self.clk, False)
        time.sleep(0.4)

    def reset(self):
        self.power_down()
        self.power_up()


def test():
    hx = hx711(27, 17)
    gewicht_alt = 0
    gewicht = 0
    while True:
        hx.erfasse_beide(30, 30)
        hx.list_a.sort()
        hx.list_b.sort()
        gewicht_raw = (hx.raw_a  / hx.raw_b - 0.343252 -60.25e-5) * 7988.6946992
        #print("A:{0:9.0f} B:{1:9.0f} gramm:{2:7.1f}".format(hx.raw_a, hx.raw_b, gewicht))
        if abs(gewicht_raw - gewicht_alt) < 10:
            gewicht = gewicht_raw - hx.offset_a
            if abs(gewicht_raw) < 10:
                hx.offset_a += gewicht / 10
        print("A:{0:9.0f} B:{1:9.0f} gramm:{2:7.2f}".format(hx.raw_a, hx.raw_b, gewicht))

        gewicht_alt = gewicht_raw
        # print(hx.list_a , hx.list_b)

def test2():
    gewicht = 0
    hx = hx711(27, 17)
    gewicht_alt = 0
    gewicht_raw_alt = 0
    gefaess_name = None
    gefaess = {"Glass Watt Extra":178 , "Tasse Volksbank":388 , "blauer Becher":23 , "grüner Becher":29 , "gelber Becher":40 }

    while True:
        hx.erfasse_a(10)
        gewicht_raw = (hx.raw_wert - 939100)/342
        if abs(gewicht_raw - gewicht_raw_alt) < 10:
            gewicht = gewicht_raw - hx.offset_a
            if abs(gewicht_raw) < 10:
                hx.offset_a += gewicht / 3
                gefaess_name = None
                gefaess_tara = 0

        if gefaess_name == None:
            for name,tara in gefaess.items():
                if abs(gewicht - tara) < 5:  ## glass erkannt
                    # if abs(gewicht - gewicht_alt) < 0.2:  ## gewicht stabil
                    gefaess_tara = gewicht
                    gefaess_name = name

        #print(glass)
        if gefaess_name:
            # print("{0:7.1f} ml in {1}".format(gewicht - gefaess_tara , gefaess_name))
            pass
        else:
            # print("Kein Glass")
            # print("{0:7.1f} gramm   ".format(gewicht ))
            pass
        gewicht_raw_alt = gewicht_raw
        gewicht_alt = gewicht
        yield (gefaess_name, gewicht - gefaess_tara)

if __name__ == "__main__":
    Test2 = test2()
    for name, menge in Test2:
        print(name, menge)
