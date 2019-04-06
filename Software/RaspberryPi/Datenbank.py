# import pymysql

import pymysql.cursors

from tkinter import *


class Datenbank:
    def __init__(self):
        pass

    def open_connection(self):
        self.connection = pymysql.connect(host="localhost",
                                          user="remote",
                                          password="remote",
                                          db="Getraenke",
                                          charset="utf8mb4",
                                          cursorclass=pymysql.cursors.DictCursor)

    def close_connection(self):
        self.connection.close()

    def abfrage(self, sql, auswahl):
        cursor = self.connection.cursor()
        cursor.execute(sql, auswahl)

        for row in cursor:
            yield row

    def ausfuehren(self, sql):
        cursor = self.connection.cursor()
        cursor.execute(sql)
