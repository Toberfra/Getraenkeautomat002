import Startbildschirm as sb
import Datenbank as db
import tkinter as tk


class Getraenkeautomat:
    def __init__(self):
        pass


class Global:
    projekt_tittel = "Cocktailmixer"

    def __init__(self):
        pass

    def Get_Projekt_Tittel(self):
        return "Cocktailmixer"


if __name__ == "__main__":
    datenbank = db.Datenbank()
    datenbank.open_connection()

    sbs = sb.Startbildschirm(datenbank)
    sbs.start()

    tk.mainloop()
    datenbank.close_connection()
