import tkinter as tk





class Zutaten:
    def __init__(self, datenbank, master_tk):
        self.datenbank = datenbank
        self.master_tk = master_tk

        self.sql = """
            Select 
                idZutaten as id, 
                Name as Name, 
                vorhanden,
                alc_vol_prozent as prozent,
                preis_ml,
                angeschlossen
            from 
                Zutaten order by Name"""

        self.sql_insert = """
            INSERT INTO Zutaten
                (Name)
            VALUES
                ('{0}')"""

        self.sql_update = """
            Update Zutaten
            Set
                Name = '{0}'
            where
                Name = '{1}'"""


        self.sql_loeschen = "Delete from Zutaten where (Name = '{0}')"

        # self.groesse = IntVar()
        # self.moegliche = IntVar()
        # self.groesse_in_ml = 0
        # self.moegliche.set(1)
        # self.master_tk.geometry("%dx%d+%d+%d" % (self.master_tk.winfo_screenwidth(),
        #                                          self.master_tk.winfo_screenheight(),
        #                                          0, 0))
        # self.master_tk.wm_overrideredirect(True)

    def init_tk(self, parent):
        self.scrollbar = tk.Scrollbar(parent)
        self.scrollbar.grid(row=10, rowspan=9, column=7, sticky=tk.N + tk.S)

        # self.listbox_id = tk.Listbox(parent, yscrollcommand=self.scrollbar.set)
        # self.listbox_id.grid(row=10, rowspan=9, column=3, columnspan=1, sticky=tk.W)
        # self.listbox_id.bind('<<ListboxSelect>>', self.on_select_evn)

        self.listbox_name = tk.Listbox(parent, yscrollcommand=self.scrollbar.set)
        self.listbox_name.grid(row=10, rowspan=9, column=4, columnspan=3, sticky=tk.E + tk.W)
        self.listbox_name.bind('<<ListboxSelect>>', self.on_select_evn)

        # self.listbox_menge = tk.Listbox(parent, yscrollcommand=self.scrollbar.set)
        # self.listbox_menge.grid(row=10, rowspan=9, column=5, columnspan=1, sticky=tk.W)
        # self.listbox_menge.bind('<<ListboxSelect>>', self.on_select_evn)

        self.scrollbar.config(command=self.listbox_name.yview)

        self.lable_name = tk.Label(parent , text="Name:")
        self.lable_name.grid(row=20, rowspan=1, column=4)

        self.text_name = tk.Text(parent, height=1, width=20)
        self.text_name.grid(row=20, rowspan=1, column=5 , columnspan=3)

        # self.lable_menge = tk.Label(parent , text="Menge")
        # self.lable_menge.grid(row=21, rowspan=1, column=4)

        # self.text_menge = tk.Text(parent, height=1, width=20)
        # self.text_menge.grid(row=21, rowspan=1, column=5 , columnspan=3)

        self.bok = tk.Button(parent, text="OK" , command=self.ok)
        self.bok.grid(row=30, column=2)

        self.babbruch = tk.Button(parent, text="abbruch" , command=self.abbruch)
        self.babbruch.grid(row=30, column=3)

        self.bneu = tk.Button(parent, text="neu" , command = self.neu)
        self.bneu.grid(row=30, column=4)

        self.baendern = tk.Button(parent, text="ändern" , command = self.aendern)
        self.baendern.grid(row=30, column=5,)

        self.bloeschen = tk.Button(parent, text="löschen" , command = self.loeschen)
        self.bloeschen.grid(row=30, column=6, columnspan=2)


    def on_select_evn(self, evn):
        self.on_select()

    def on_select(self):
        listeAusgewaehlt = self.listbox_name.curselection()
        itemAusgewaehlt = listeAusgewaehlt[0]
        nameAusgewaehlt = self.listbox_name.get(itemAusgewaehlt)

        sql = """
            Select
                IdZutaten as id, 
                Name as Name
            from 
                Zutaten
            where
                Name = %s"""
        abfrage = self.datenbank.abfrage(sql, nameAusgewaehlt)
        for row in abfrage:
            self.id = row["id"]
            self.name = row["Name"]
            #self.menge = row["menge"]

        self.text_name.delete(1.0, tk.END)
        self.text_name.insert(tk.END,self.name)

        #self.text_menge.delete(1.0, tk.END)
        #self.text_menge.insert(tk.END,"{} ml".format(self.menge))
#
        # self.text.delete(1.0, END)
        # self.text.tag_config("normal", background="red", foreground="yellow")
        # self.text.tag_config("vorhanden", background="yellow", foreground="black")
        # self.text.tag_config("angeschlossen", background="white", foreground="black")
        # abfrage = self.datenbank.abfrage(self.sql, nameAusgewaehlt)

    def aufbau_listbox(self):
        #self.listbox_id.delete(0, "end")
        self.listbox_name.delete(0, "end")
        # self.listbox_menge.delete(0, "end")
        abfrage = self.datenbank.abfrage(self.sql, ())

        for row in abfrage:
            #self.listbox_id.insert(tk.END, row["id"])
            self.listbox_name.insert(tk.END, row["Name"])
            # self.listbox_menge.insert(tk.END, "{0:10.1f}ml".format(row["menge"]))

    def abbruch(self):
        print("Abbruch")
        self.datenbank.ausfuehren("rollback")
        self.master_tk.destroy()

    def ok(self):
        self.datenbank.ausfuehren("commit")
        self.master_tk.destroy()


    def ablauf(self):
        self.aufbau_listbox()

    def neu(self):
        name = self.text_name.get(1.0 , "1.end")

        sql = self.sql_insert.format(name )
        self.datenbank.ausfuehren(sql)
        #self.datenbank.ausfuehren("commit")
        self.aufbau_listbox()

    def aendern(self):
        name = self.text_name.get(1.0 , "1.end")

        listeAusgewaehlt = self.listbox_name.curselection()
        itemAusgewaehlt = listeAusgewaehlt[0]
        nameAusgewaehlt = self.listbox_name.get(itemAusgewaehlt)

        sql = self.sql_update.format(name ,  nameAusgewaehlt)
        self.datenbank.ausfuehren(sql)
        #self.datenbank.ausfuehren("commit")
        self.aufbau_listbox()

    def loeschen(self):
        name = self.text_name.get(1.0 , "1.end")
        # menge = self.text_menge.get(1.0 , "1.end" )

        sql = self.sql_loeschen.format(name)
        self.datenbank.ausfuehren(sql)
        #self.datenbank.ausfuehren("commit")
        self.aufbau_listbox()
