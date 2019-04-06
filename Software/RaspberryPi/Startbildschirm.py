import tkinter as tk
import Rezept_auswaehlen as ra
import Datenbank as db
import Getraenkeautomat as ga
import Einheiten as eh
import Zutaten as zt


class Startbildschirm():

    def __init__(self, datenbank):
        self.datenbank = datenbank
        self.tk = tk.Tk()
        self.seiteaufbauen()

    def start(self):
        pass

    def seiteaufbauen(self):
        self.tk.title(ga.Global.projekt_tittel)
        self.bok = tk.Button(self.tk, text="START", command=self.rezept_auswaehlen)
        self.bok.grid(row=3, column=3, sticky=tk.N + tk.S + tk.E + tk.W)

        self.besc = tk.Button(self.tk, text="Ende", command=self.Abbruch)
        self.besc.grid(row=3, column=4, columnspan=1, sticky=tk.N + tk.S + tk.E + tk.W)

        self.beinheiten = tk.Button(self.tk, text="Einheiten", command=self.einheiten_auswaehlen)
        self.beinheiten.grid(row=4, column=3, columnspan=1, sticky=tk.N + tk.S + tk.E + tk.W)

        self.bzutaten = tk.Button(self.tk, text="Zutaten" , command = self.zutaten_auswaehlen)
        self.bzutaten.grid(row=4, column=4, columnspan=1, sticky=tk.N + tk.S + tk.E + tk.W)

        self.bflaschen = tk.Button(self.tk, text="Flaschen")
        self.bflaschen.grid(row=5, column=3, columnspan=1, sticky=tk.N + tk.S + tk.E + tk.W)

        self.bflasche = tk.Button(self.tk, text="Flasche")
        self.bflasche.grid(row=5, column=4, columnspan=1, sticky=tk.N + tk.S + tk.E + tk.W)

        self.bpumpen = tk.Button(self.tk, text="Pumpen")
        self.bpumpen.grid(row=6, column=3, columnspan=1, sticky=tk.N + tk.S + tk.E + tk.W)

        # self.bfrei = tk.Button(self.tk, text="")
        # self.bfrei.grid(row=6, column=4, columnspan=1, sticky=tk.N + tk.S + tk.E + tk.W)

    def rezept_auswaehlen(self):
        self.rezept_tk = tk.Toplevel(self.tk)
        self.rezept = ra.Rezept(self.datenbank, self.rezept_tk)
        self.rezept.init_tk(self.rezept_tk)
        self.rezept.ablauf()

    def einheiten_auswaehlen(self):
        self.einheiten_tk = tk.Toplevel(self.tk)
        self.einheiten = eh.Einheiten(self.datenbank, self.einheiten_tk)
        self.einheiten.init_tk(self.einheiten_tk)
        self.einheiten.ablauf()

    def zutaten_auswaehlen(self):
        self.zutaten_tk = tk.Toplevel(self.tk)
        self.zutaten = zt.Zutaten(self.datenbank, self.zutaten_tk)
        self.zutaten.init_tk(self.zutaten_tk)
        self.zutaten.ablauf()

    def Abbruch(self):
        self.tk.destroy()


if __name__ == "__main__":
    datenbank = db.Datenbank()
    datenbank.open_connection()

    sbs = Startbildschirm(datenbank)
    sbs.start()

    tk.mainloop()
    datenbank.close_connection()
