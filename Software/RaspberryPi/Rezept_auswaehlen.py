# import pymysql

from tkinter import *

import Datenbank


# import pymysql.cursors


class Rezept:
    def __init__(self, datenbank, master_tk):
        self.datenbank = datenbank
        self.master_tk = master_tk
        self.sql_alle = "Select Name from Rezept order by Name"
        self.sql_vorhanden = "Select Name from Rezept where (Rezept.vorhanden_alle = 1) order by Name"
        self.sql_angeschlossen = "Select Name from Rezept where (Rezept.angeschlossen_alle = 1) order by Name"
        self.groesse = IntVar()
        self.moegliche = IntVar()
        self.groesse_in_ml = 0
        self.moegliche.set(1)
        self.master_tk.geometry("%dx%d+%d+%d" % (self.master_tk.winfo_screenwidth(),
                                                 self.master_tk.winfo_screenheight(),
                                                 0, 0))
        self.master_tk.wm_overrideredirect(True)
        self.sql2 = """
         
select
    `Rezept_Zutat_Menge_Name`.`Zutat_Name` AS `Zutat_Name`,
    `Rezept_Zutat_Menge_Name`.`vorhanden`,
    `Rezept_Zutat_Menge_Name`.`angeschlossen`,
    `Rezept_Zutat_Menge_Name`.`Menge` AS `Menge`,
    `Rezept_Zutat_Menge_Name`.`Menge_in_ml` AS `Menge_in_ml`,
    `Rezept_Zutat_Menge_Name`.`Rezept_Gesamt_ml` AS `Rezept_Gesamt_ml`,
    Einheiten.Einheiten_Name as Einheiten_Name
from
    `Rezept_Zutat_Menge_Name`
join
	Einheiten
where
    ( (`Rezept_Zutat_Menge_Name`.`Rezept_Name` = %s)
    AND
    (Einheiten.idEinheiten = `Rezept_Zutat_Menge_Name`.idEinheit) )
ORDER by `Rezept_Zutat_Menge_Name`.`Menge_in_ml` DESC
         
        """

        # self.init_tk(self.master_tk)

    def init_tk(self, parent):
        self.scrollbar = Scrollbar(parent)
        self.scrollbar.grid(row=10, rowspan=9, column=5, sticky=N + S)

        self.listbox = Listbox(parent, yscrollcommand=self.scrollbar.set)
        self.listbox.grid(row=10, rowspan=9, column=3, columnspan=2, sticky=N + S + E + W)
        self.listbox.bind('<<ListboxSelect>>', self.on_select_evn)

        self.scrollbar.config(command=self.listbox.yview)

        self.text = Text(parent, height=10, width=50)
        self.text.grid(row=20, rowspan=9, column=3, columnspan=2)

        self.bok = Button(parent, text="Füllen", command=self.OK)
        self.bok.grid(row=30, column=3)

        self.besc = Button(parent, text="System", command=self.Abbruch)
        self.besc.grid(row=30, column=4, columnspan=1)


        sql = "select idAusgabe_Groesse,Name,Menge_in_ml from Ausgabe_Groesse"
        abfrage = self.datenbank.abfrage(sql, ())
        zeile = 20
        radio = list()
        for row in abfrage:
            text = "{0}:{1}".format(row["idAusgabe_Groesse"], row["Name"])
            radio.append(Radiobutton(parent,
                                     text=text,
                                     padx=20,
                                     variable=self.groesse,
                                     command=self.on_select,
                                     value=int(row["idAusgabe_Groesse"])).grid(row=zeile, column=1, sticky=W))

            if row["Name"] != "Original":
                text = "{0} ml".format(row["Menge_in_ml"])
                Label(parent, text=text).grid(row=zeile, column=2, sticky=E)
            else:
                self.groesse.set(int(row["idAusgabe_Groesse"]))

            zeile = zeile + 1

        radio.append(Radiobutton(parent,
                                 text="alle",
                                 padx=20,
                                 variable=self.moegliche,
                                 command=self.on_select_moeglich,
                                 value=1).grid(row=10, column=1, sticky=W))

        radio.append(Radiobutton(parent,
                                 text="vorhanden",
                                 padx=20,
                                 variable=self.moegliche,
                                 command=self.on_select_moeglich,
                                 value=2).grid(row=11, column=1, sticky=W))

        radio.append(Radiobutton(parent,
                                 text="angeschlossen",
                                 padx=20,
                                 variable=self.moegliche,
                                 command=self.on_select_moeglich,
                                 value=3).grid(row=12, column=1, sticky=W))

    def on_select_moeglich(self):
        nr = self.moegliche.get()
        print(nr)
        self.aufbau_listbox(nr)
        self.text.delete(1.0, END)

    def on_select_evn(self, evn):
        self.on_select()

    def on_select(self):
        listeAusgewaehlt = self.listbox.curselection()
        itemAusgewaehlt = listeAusgewaehlt[0]
        nameAusgewaehlt = self.listbox.get(itemAusgewaehlt)

        sql = "select idAusgabe_Groesse,Name,Menge_in_ml from Ausgabe_Groesse where idAusgabe_Groesse = %s"
        abfrage = self.datenbank.abfrage(sql, self.groesse.get())
        for row in abfrage:
            self.groesse_in_ml = row["Menge_in_ml"]

        self.text.delete(1.0, END)
        self.text.tag_config("normal", background="red", foreground="yellow")
        self.text.tag_config("vorhanden", background="yellow", foreground="black")
        self.text.tag_config("angeschlossen", background="white", foreground="black")
        abfrage = self.datenbank.abfrage(self.sql2, nameAusgewaehlt)
        zeile = 0

        for row in abfrage:
            zeile += 1
            art = "normal"

            if row["vorhanden"] != None:
                if int(row["vorhanden"]) >= 1:
                    art = "vorhanden"

            if row["angeschlossen"] != None:
                if int(row["angeschlossen"]) >= 1:
                    art = "angeschlossen"

            if self.groesse.get() == 1:
                self.text.insert(END,
                                 "{0:3.0f} {1} {2} \n".format(row["Menge"], row["Einheiten_Name"], row["Zutat_Name"], ))
            else:
                self.text.insert(END, "{0:5.2f} {1} {2} \n".format(
                    float(row["Menge_in_ml"]) / float(row["Rezept_Gesamt_ml"]) * self.groesse_in_ml, "ml",
                    row["Zutat_Name"], ))
            self.text.tag_add(art, "{}.0".format(zeile), "{}.end".format(zeile))

    def aufbau_listbox(self, was):
        self.listbox.delete(0, "end")
        if was == 1:
            abfrage = self.datenbank.abfrage(self.sql_alle, ())
        if was == 2:
            abfrage = self.datenbank.abfrage(self.sql_vorhanden, ())
        if was == 3:
            abfrage = self.datenbank.abfrage(self.sql_angeschlossen, ())

        for row in abfrage:
            self.listbox.insert(END, row["Name"])

    def OK(self):
        # print("OK")
        listeAusgewaehlt = self.listbox.curselection()
        itemAusgewaehlt = listeAusgewaehlt[0]
        nameAusgewaehlt = self.listbox.get(itemAusgewaehlt)

        print(nameAusgewaehlt, self.groesse_in_ml)
        # self.master_tk.destroy()

    def Abbruch(self):
        print("Abbruch")
        self.master_tk.destroy()

    def ablauf(self):
        self.aufbau_listbox(1)


if __name__ == "__main__":

    datenbank = Datenbank.Datenbank()
    datenbank.open_connection()

    zutaten = Rezept(datenbank, Tk())

    zutaten.ablauf()

    mainloop()
    datenbank.close_connection()
