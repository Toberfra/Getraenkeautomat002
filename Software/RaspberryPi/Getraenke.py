import xml.etree.ElementTree as ET


class Zutat:
    def __init__(self, rezept_bestandteil, name):
        self.name = name
        self.zutaten = rezept_bestandteil.rezept.getraenk.getraenke.zutaten
        self.rezepte = list()
        self.zutaten.add(self)

    def add_rezept(self, rezept):
        self.rezepte.append(rezept)

    def get_name(self):
        return self.name


class Zutaten:
    def __init__(self):
        self.zutaten = list()

    def add(self, zutat):
        self.zutaten.append(zutat)


class RezeptBestandteil:
    def __init__(self, rezept, zutat_name, menge, einheit, reihenfolge):
        self.menge = menge
        self.einheit = einheit
        self.rezept = rezept
        self.reihenfolge = reihenfolge
        zutat = None
        for vorhanden in self.rezept.getraenk.getraenke.zutaten.zutaten:
            if zutat_name == vorhanden.name:
                zutat = vorhanden
        if not zutat:
            zutat = Zutat(self, zutat_name)
        zutat.add_rezept(self.rezept)
        self.zutat = zutat

    def get_menge_ml(self):
        if self.einheit == "ml":
            return self.menge

        if self.einheit == "cl":
            return self.menge * 10

        if self.einheit == "spritzer":
            return self.menge * 2


class Rezept:
    def __init__(self, getraenk, name):
        self.name = name
        self.bestandteile = list()
        self.getraenk = getraenk
        self.gesamt_menge_ml = 0
        print(self.name)

    def add(self, name, menge, einheit, reihenfolge):
        bestandteil = RezeptBestandteil(self, name, menge, einheit, reihenfolge)
        # print(name, menge, einheit, reihenfolge)
        self.bestandteile.append(bestandteil)


class Getraenk:
    def __init__(self, getraenke, name):
        self.rezept = None
        self.name = name
        self.getraenke = getraenke
        self.rezept = Rezept(self, name)

    def add_zutat(self, name, menge, einheit, reihenfolge):
        self.rezept.add(name, menge, einheit, reihenfolge)


class Getraenke:
    def __init__(self):
        self.getraenke = dict()
        self.name = None
        self.zutaten = Zutaten()

    def lese_xml(self, name_xml):
        tree = ET.parse(name_xml)
        root = tree.getroot()
        # print(root.tag)
        for r in root.findall('getraenk'):
            getraenk_name = r.get('name')

            if not getraenk_name in self.getraenke:
                getraenk = Getraenk(self, getraenk_name)

                for z in r.findall('zutat'):
                    zutat_name = z.text
                    zutat_menge = z.get('menge')
                    zutat_einheit = z.get('einheit')
                    zutat_reihenfolge = z.get('reihenfolge')
                    getraenk.add_zutat(zutat_name, zutat_menge, zutat_einheit, zutat_reihenfolge)

                self.getraenke[getraenk_name] = getraenk


def test(name):
    def get_name(elm):
        elm.name
        print(elm.name , type(elm.name) , type(elm))

    g = Getraenke()
    g.lese_xml(name)
    print(len(g.zutaten.zutaten))
    zutaten = g.zutaten.zutaten
    zutaten.sort(key=get_name)
    for z in zutaten:
        print(z.name , type(z.name))


if __name__ == "__main__":
    test("Rezepte.xml")
