import RPi.GPIO as GPIO
import time
import hx711



class Pumpen:
    def __init__(self):
        self.pumpen_pins = {"P3v":2, "P3r":3 , "P2v":17, "P2r":4 ,"P1v":18, "P1r":27 ,"P0v":23, "P0r":22}
        self.anzahl_pumpen = 4
        self.pumpen = list()

    def init_Pumpen(self):
        for p in range(self.anzahl_pumpen):
            pin_vor = self.pumpen_pins["P{}v".format(p)]
            pin_zurueck = self.pumpen_pins["P{}r".format(p)]
            pumpe = Pumpe(pin_vor , pin_zurueck )
            self.pumpen.append(pumpe)

    def speed(self , pumpe , speed):
        self.pumpen[pumpe].speed(speed)


class Pumpe:
    def __init__(self , pin_vor , pin_zurueck):
        #print(pin_vor,pin_zurueck)
        self.pin_vor = pin_vor
        self.pin_zurueck = pin_zurueck
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(self.pin_vor, GPIO.OUT)
        GPIO.output(self.pin_vor, False)
        GPIO.setup(self.pin_zurueck, GPIO.OUT)
        GPIO.output(self.pin_zurueck, False)

    def speed(self , speed):
        vor = False
        rueck = False

        if speed > 0:
            vor = True
        if speed < 0:
            rueck = True
        GPIO.output(self.pin_vor, vor)
        GPIO.output(self.pin_zurueck, rueck)

def test2():
    gewicht = 0
    #hx = hx711(27, 17)
    hx = hx711.hx711(9, 10)
    gefaess_tara = 0
    gewicht_raw_alt = 0
    gefaess_name = None
    gefaess = {"Glass Watt Extra":178 , "Tasse Volksbank":388 , "blauer Becher":23 ,
               "IKEA oder Buchsteiner Becher":29 , "gelber Becher":40 , "Messbecher":152 ,
               "kleines Glass":169 , "grosses Glass":236,
               "Rückspülen":-58}

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




def Test():
    waage = test2()
    pumpen = Pumpen()
    pumpen.init_Pumpen()

    while True:
        print("Bereit")

        for name, menge in waage:
            # print(name, menge)
            if name:
                break

        print("{} erkannt".format(name))

        if name == "kleines Glass":
            pumpen.speed(0,1)
            pumpen.speed(1,0)

            for name, menge in waage:
                print("{0:4.1f}".format(menge))
                if menge >= 11:
                    break

            pumpen.speed(0,0)
            pumpen.speed(1,1)


            for name, menge in waage:
                print("{0:4.1f}".format(menge))
                if menge >= 22:
                    break

            pumpen.speed(0,1)
            pumpen.speed(1,0)


            for name, menge in waage:
                print("{0:4.1f}".format(menge))
                if menge >= 88:
                    break

            pumpen.speed(0,-1)
            pumpen.speed(1,-1)
            time.sleep(0.1)
            pumpen.speed(0,0)
            pumpen.speed(1,0)

            print("Fertig! bitte Glass entnehmen")


        if name == "Messbecher":
            pumpen.speed(0,1)
            pumpen.speed(1,1)
            pumpen.speed(2,1)
            pumpen.speed(3,1)

            print("Spüle zum Stoppen Messbecher anheben!")

            for name, menge in waage:
                print("{0:4.1f}".format(menge))
                if menge >= 1000:
                    break
                if not name:
                    break

            pumpen.speed(0,-1)
            pumpen.speed(1,-1)
            pumpen.speed(2,-1)
            pumpen.speed(3,-1)

            time.sleep(0.1)

            pumpen.speed(0,0)
            pumpen.speed(1,0)
            pumpen.speed(2,0)
            pumpen.speed(3,0)

            print("Fertig! bitte Messbercher entlehren")


        if name == "Rückspülen":

            pumpen.speed(0,-1)
            pumpen.speed(1,-1)
            pumpen.speed(2,-1)
            pumpen.speed(3,-1)

            for name, menge in waage:
                if not name:
                    break

            pumpen.speed(0,0)
            pumpen.speed(1,0)
            pumpen.speed(2,0)
            pumpen.speed(3,0)



        for name, menge in waage:
            if not name:
                break


if __name__ == "__main__":
    Test()
