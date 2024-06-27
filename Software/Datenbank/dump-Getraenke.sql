-- MySQL dump 10.15  Distrib 10.0.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: Getraenke
-- ------------------------------------------------------
-- Server version	10.0.38-MariaDB-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Ausgabe_Groesse`
--
use getraenke;
DROP TABLE IF EXISTS `Ausgabe_Groesse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ausgabe_Groesse` (
  `idAusgabe_Groesse` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Menge_in_ml` float DEFAULT NULL,
  `Kosten_gefaess` float DEFAULT NULL,
  UNIQUE KEY `Ausgabe_Groesse_idAusgabe_Groesse_IDX` (`idAusgabe_Groesse`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ausgabe_Groesse`
--

LOCK TABLES `Ausgabe_Groesse` WRITE;
/*!40000 ALTER TABLE `Ausgabe_Groesse` DISABLE KEYS */;
INSERT INTO `Ausgabe_Groesse` VALUES (1,'Original',NULL,0.1),(2,'Tester',20,0.02),(3,'klein',50,0.1),(4,'mittel',100,0.1),(5,'groß',200,0.1);
/*!40000 ALTER TABLE `Ausgabe_Groesse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Einheiten`
--

DROP TABLE IF EXISTS `Einheiten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Einheiten` (
  `idEinheiten` int(11) NOT NULL AUTO_INCREMENT,
  `Einheiten_Name` varchar(45) CHARACTER SET latin1 NOT NULL,
  `Einheiten_Menge_in_ml` float NOT NULL,
  PRIMARY KEY (`idEinheiten`),
  UNIQUE KEY `Einheiten_Name_UNIQUE` (`Einheiten_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Einheiten`
--

LOCK TABLES `Einheiten` WRITE;
/*!40000 ALTER TABLE `Einheiten` DISABLE KEYS */;
INSERT INTO `Einheiten` VALUES (1,'cl',10),(2,'ml',1),(3,'dl',100),(4,'l',1000),(5,'Spritzer',2.7),(6,'EL',10),(7,'TL',4),(8,'g',1);
/*!40000 ALTER TABLE `Einheiten` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`remote`@`localhost`*/ /*!50003 TRIGGER Einheiten_AU
AFTER UPDATE
ON Einheiten 
FOR EACH ROW
BEGIN
	update Rezept_Zutat
		set Menge_in_ml = 0
		where idEinheit = NEW.idEinheiten;

	update Rezept_Zutat
		set Menge_in_ml = 0
		where idEinheit = OLD.idEinheiten;



END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Flasche`
--

DROP TABLE IF EXISTS `Flasche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flasche` (
  `idFlasche` int(11) NOT NULL AUTO_INCREMENT,
  `idZutaten` int(11) DEFAULT NULL,
  `idPumpe` int(11) DEFAULT NULL,
  `alc_vol_prozent` float DEFAULT NULL,
  `idFlaschen` int(11) DEFAULT NULL,
  `voll_ml` float DEFAULT NULL,
  `entnommen_ml` float DEFAULT '0',
  `Rest_ml` float DEFAULT NULL,
  `MHD` date DEFAULT NULL,
  `geoeffnet_am` date DEFAULT NULL,
  `entnahme_ml` float DEFAULT NULL,
  UNIQUE KEY `Flasche_idFlasche_IDX` (`idFlasche`) USING BTREE,
  KEY `Flasche_Zutaten_FK` (`idZutaten`),
  KEY `Flasche_Pumpe_FK` (`idPumpe`),
  KEY `Flasche_Flaschen_FK` (`idFlaschen`),
  CONSTRAINT `Flasche_Flaschen_FK` FOREIGN KEY (`idFlaschen`) REFERENCES `Flaschen` (`idFlaschen`),
  CONSTRAINT `Flasche_Pumpe_FK` FOREIGN KEY (`idPumpe`) REFERENCES `Pumpe` (`idPumpe`),
  CONSTRAINT `Flasche_Zutaten_FK` FOREIGN KEY (`idZutaten`) REFERENCES `Zutaten` (`IdZutaten`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flasche`
--

LOCK TABLES `Flasche` WRITE;
/*!40000 ALTER TABLE `Flasche` DISABLE KEYS */;
INSERT INTO `Flasche` VALUES (1,15,NULL,NULL,1,250,25,225,'2021-07-30','2019-02-21',NULL),(3,15,1,NULL,1,250,8,242,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Flasche` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`remote`@`localhost`*/ /*!50003 TRIGGER Flasche_BU
BEFORE UPDATE
ON Flasche FOR EACH ROW

BEGIN
	set NEW.voll_ml = (
		select Volumen_in_ml from Flaschen
		where Flaschen.idFlaschen = NEW.idFlaschen);

	set NEW.idZutaten = (
		select idZutat from Flaschen
		where Flaschen.idFlaschen = NEW.idFlaschen);
	
	if new.entnahme_ml is not null THEN
		IF NEW.entnommen_ml IS NULL THEN
			SET NEW.entnommen_ml = NEW.entnahme_ml;
		ELSE
			set NEW.entnommen_ml = new.entnommen_ml + new.entnahme_ml;
		END IF; 
	 	set new.entnahme_ml=null;
	end if;
	
	IF NEW.entnommen_ml IS NULL THEN
		SET NEW.Rest_ml = NEW.voll_ml;
	ELSE
		SET NEW.Rest_ml = (NEW.voll_ml - NEW.entnommen_ml);
	END IF; 
	
	
	IF (NEW.geoeffnet_am IS NULL ) AND ((NEW.idPumpe is not null)OR(NEW.entnommen_ml is not null)  )THEN
		set new.geoeffnet_am = CURDATE() ;
	end if;

			
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Flaschen`
--

DROP TABLE IF EXISTS `Flaschen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Flaschen` (
  `idFlaschen` int(11) NOT NULL AUTO_INCREMENT,
  `idZutat` int(11) DEFAULT NULL,
  `Bezeichnung` varchar(100) DEFAULT NULL,
  `idHersteller` int(11) DEFAULT NULL,
  `Volumen` float DEFAULT NULL,
  `idEinheit` int(11) DEFAULT NULL,
  `Volumen_in_ml` float DEFAULT NULL,
  `alc_vol_prozent` float DEFAULT NULL,
  `kJ` float DEFAULT NULL,
  `Fett_g_100ml` float DEFAULT NULL,
  `gesaettigt_g_100ml` float DEFAULT NULL,
  `Kohlenhydrate_g_100ml` float DEFAULT NULL,
  `Zucker_g_100ml` float DEFAULT NULL,
  `Eiweiss_g_100ml` float DEFAULT NULL,
  `Salz_g_100ml` float DEFAULT NULL,
  `Bezeichnung_Hersteller` varchar(100) DEFAULT NULL,
  `EAN` text,
  `Preis_Euro` float DEFAULT NULL,
  `Preis_ml` float DEFAULT NULL,
  UNIQUE KEY `Flaschen_idFlaschen_IDX` (`idFlaschen`) USING BTREE,
  KEY `Flaschen_Zutaten_FK` (`idZutat`),
  KEY `Flaschen_Hersteller_FK` (`idHersteller`),
  KEY `Flaschen_Einheiten_FK` (`idEinheit`),
  CONSTRAINT `Flaschen_Einheiten_FK` FOREIGN KEY (`idEinheit`) REFERENCES `Einheiten` (`idEinheiten`),
  CONSTRAINT `Flaschen_Hersteller_FK` FOREIGN KEY (`idHersteller`) REFERENCES `Hersteller` (`idHersteller`),
  CONSTRAINT `Flaschen_Zutaten_FK` FOREIGN KEY (`idZutat`) REFERENCES `Zutaten` (`IdZutaten`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Flaschen`
--

LOCK TABLES `Flaschen` WRITE;
/*!40000 ALTER TABLE `Flaschen` DISABLE KEYS */;
INSERT INTO `Flaschen` VALUES (1,15,'Mandelsirup',1,25,1,250,NULL,1321,0,0,78.9,78.9,0,0.03,'Monin','4008077744007',3.95,0.0158),(2,15,'Mandelsirup',1,75,1,750,NULL,1321,0,0,78.9,78.9,0,0.03,'Monin',NULL,6.95,0.00926667);
/*!40000 ALTER TABLE `Flaschen` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`remote`@`localhost`*/ /*!50003 TRIGGER Flaschen_BU
BEFORE UPDATE
ON Flaschen FOR EACH ROW

BEGIN
	set NEW.Volumen_in_ml = (NEW.Volumen *(
			select Einheiten_Menge_in_ml from Einheiten
			where Einheiten.idEinheiten = NEW.idEinheit));
	
	set NEW.Bezeichnung_Hersteller = (
			select Name from Hersteller
			where Hersteller.idHersteller = NEW.idHersteller);
		
	set new.Preis_ml = new.Preis_Euro / new.Volumen_in_ml;
	
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `Hersteller`
--

DROP TABLE IF EXISTS `Hersteller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Hersteller` (
  `idHersteller` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  UNIQUE KEY `Hersteller_idHersteller_IDX` (`idHersteller`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Hersteller`
--

LOCK TABLES `Hersteller` WRITE;
/*!40000 ALTER TABLE `Hersteller` DISABLE KEYS */;
INSERT INTO `Hersteller` VALUES (1,'Monin');
/*!40000 ALTER TABLE `Hersteller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pumpe`
--

DROP TABLE IF EXISTS `Pumpe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Pumpe` (
  `idPumpe` int(11) NOT NULL,
  `GPIO_vor` int(11) DEFAULT NULL,
  `GPIO_zurück` int(11) DEFAULT NULL,
  `Schlauch_idZutat` int(11) DEFAULT NULL,
  `Schlauch_Volumen_ml` float DEFAULT NULL,
  `Schlauch_gefuellt_ml` float DEFAULT NULL,
  `idFlasche` int(11) DEFAULT NULL,
  `ml_pro_sekunde` float DEFAULT NULL,
  UNIQUE KEY `Pumpe_idPumpe_IDX` (`idPumpe`) USING BTREE,
  KEY `Pumpe_Zutaten_FK` (`Schlauch_idZutat`),
  KEY `Pumpe_Flasche_FK` (`idFlasche`),
  CONSTRAINT `Pumpe_Flasche_FK` FOREIGN KEY (`idFlasche`) REFERENCES `Flasche` (`idFlasche`),
  CONSTRAINT `Pumpe_Zutaten_FK` FOREIGN KEY (`Schlauch_idZutat`) REFERENCES `Zutaten` (`IdZutaten`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pumpe`
--

LOCK TABLES `Pumpe` WRITE;
/*!40000 ALTER TABLE `Pumpe` DISABLE KEYS */;
INSERT INTO `Pumpe` VALUES (0,4,5,NULL,NULL,NULL,NULL,NULL),(1,11,12,NULL,NULL,NULL,NULL,NULL),(2,17,18,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Pumpe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Rezept`
--

DROP TABLE IF EXISTS `Rezept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rezept` (
  `idRezept` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `Rezept_ml` float DEFAULT NULL,
  `Anzahl_Zutaten` int(11) DEFAULT NULL,
  `alc_vol_prozent` float DEFAULT NULL,
  `vorhanden` int(11) DEFAULT NULL,
  `Preis_ml` float DEFAULT NULL,
  `vorhanden_alle` tinyint(1) DEFAULT NULL,
  `angeschlossen` int(11) DEFAULT NULL,
  `angeschlossen_alle` tinyint(1) DEFAULT NULL COMMENT 'True wenn vorhanden == angeschlossen',
  PRIMARY KEY (`idRezept`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rezept`
--

LOCK TABLES `Rezept` WRITE;
/*!40000 ALTER TABLE `Rezept` DISABLE KEYS */;
INSERT INTO `Rezept` VALUES (1,'Speedy Gonzales',200,4,NULL,1,0.0052,0,NULL,NULL),(2,'Swimming Pool',200,4,NULL,3,0.0044,0,NULL,NULL),(3,'Sundowner',200,5,NULL,4,0.0052,0,NULL,NULL),(4,'Blue Cherie',180,4,NULL,3,0.00466667,0,NULL,NULL),(5,'Yellow Submarine',200,4,NULL,4,0.0036,1,NULL,NULL),(6,'Paulchen',210,5,NULL,2,0.00314286,0,NULL,NULL),(7,'Princess',220,5,NULL,2,0.00854545,0,NULL,NULL),(8,'Smooth Secret',210,4,NULL,2,0.00390476,0,NULL,NULL),(9,'Magic Juice',220,5,NULL,4,0.00418182,0,NULL,NULL),(10,'Hot Love',180,5,NULL,3,0.00466667,0,NULL,NULL),(11,'Summer Kiss',200,5,NULL,1,0.0036,0,NULL,NULL),(12,'Secret Love',190,5,NULL,3,0.00410526,0,NULL,NULL),(13,'Felicitas',210,5,NULL,5,0.00619048,1,NULL,NULL),(14,'Cocoloco',220,5,NULL,3,0.00345455,0,NULL,NULL),(15,'Candy Girl',200,5,NULL,3,0.0052,0,NULL,NULL),(16,'Sport Flip',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'African Fever',200,5,NULL,3,0.0076,0,NULL,NULL),(18,'Fresh Fruits',200,5,NULL,2,0.0028,0,NULL,NULL),(19,'Mix it Baby',202.7,5,NULL,4,0.00407992,0,NULL,NULL),(20,'Amarena Bacio',170,5,NULL,3,0.00529412,0,NULL,NULL),(21,'Free Drive',200,5,NULL,2,0.0044,0,NULL,NULL),(22,'Fantastic',170,5,NULL,4,0.00435294,0,NULL,NULL),(23,'Pussy Foot',200,4,NULL,2,0.0028,0,NULL,NULL),(24,'Exotic-Fruit-Punch',200,6,NULL,3,0.0036,0,NULL,NULL),(25,'Strawberry Fruit Cup',220,5,NULL,2,0.00345455,0,NULL,NULL),(26,'Summer Queen',220,5,NULL,4,0.00418182,0,NULL,NULL),(27,'Exotic Blossom',220,5,NULL,3,0.00418182,0,NULL,NULL),(28,'Sweet Apple',200,4,NULL,3,0.01,0,NULL,NULL),(29,'Tropical Blossom',230,5,NULL,2,0.00443478,0,NULL,NULL),(30,'Tropic Sun',210,5,NULL,3,0.00390476,0,NULL,NULL),(31,'Passion Kiss',190,5,NULL,2,0.00410526,0,NULL,NULL),(32,'Kolibri',200,5,NULL,1,0.0052,0,NULL,NULL),(33,'Louisa',230,5,NULL,3,0.00443478,0,NULL,NULL),(34,'Top Fruits',200,5,NULL,2,0.0068,0,NULL,NULL),(35,'Red Heat',210,5,NULL,3,0.00390476,0,NULL,NULL),(36,'Alice',200,4,NULL,2,0.0036,0,NULL,NULL),(37,'Cinderella',210,5,NULL,3,0.00390476,0,NULL,NULL),(38,'Blue Spirit',210,5,NULL,3,0.00619048,0,NULL,NULL),(39,'Frozen Strawberry Daiquiri',100,4,NULL,2,0.008,0,NULL,NULL),(40,'Strawberry Dream',220,5,NULL,3,0.00363636,0,NULL,NULL),(41,'Cherry Colada',200,5,NULL,5,0.0036,1,NULL,NULL),(42,'Moonlight Dream',160,4,NULL,2,0.01,0,NULL,NULL),(43,'Caramelito',220,6,NULL,4,0.00854545,0,NULL,NULL),(44,'Swinging Cat',230,5,NULL,3,0.00373913,0,NULL,NULL),(45,'Love Parade',200,5,NULL,2,0.0036,0,NULL,NULL),(46,'Tropical Sunshine',220,5,NULL,3,0.00418182,0,NULL,NULL),(47,'Why Not',220,5,NULL,2,0.00418182,0,NULL,NULL),(48,'Sunny Cup',130,4,NULL,1,0.01,0,NULL,NULL),(49,'Sweet and Fine',200,4,NULL,1,0.01,0,NULL,NULL),(50,'Red Virgin',210,5,NULL,2,0.00390476,0,NULL,NULL),(51,'Red Piggy',210,5,NULL,3,0.00542857,0,NULL,NULL),(52,'Finest of Mint',210,5,NULL,4,0.00466667,0,NULL,NULL),(53,'London Mint',200,4,NULL,3,0.01,0,NULL,NULL),(54,'Baby Colada',200,4,NULL,2,0.0036,0,NULL,NULL),(55,'Planter\'s Punch',220,6,NULL,3,0.00418182,0,NULL,NULL),(56,'Bora Bora',220,5,NULL,1,0.00636364,0,NULL,NULL),(57,'Sweet Juniper',180,6,NULL,5,0.00466667,0,NULL,NULL),(58,'Habanero',200,5,NULL,1,0.0044,0,NULL,NULL),(59,'Cubna',200,5,NULL,2,0.0052,0,NULL,NULL),(60,'Cross Over',190,5,NULL,2,0.00578947,0,NULL,NULL),(61,'Exotica',190,5,NULL,2,0.00326316,0,NULL,NULL),(62,'Lucky Driver',220,4,NULL,1,0.00490909,0,NULL,NULL),(63,'Mango Lady',200,5,NULL,2,0.0044,0,NULL,NULL),(64,'Mango Trip',220,5,NULL,2,0.00418182,0,NULL,NULL),(65,'Bird of Paradise',160,4,NULL,2,0.004,0,NULL,NULL);
/*!40000 ALTER TABLE `Rezept` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`remote`@`localhost`*/ /*!50003 TRIGGER Rezept_BU
BEFORE UPDATE
ON Rezept FOR EACH ROW
	BEGIN
		set NEW.vorhanden_alle = (NEW.vorhanden >= NEW.Anzahl_Zutaten);
		set NEW.angeschlossen_alle = (NEW.angeschlossen >= NEW.Anzahl_Zutaten);
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `Rezept_Rezept_Zutat`
--

DROP TABLE IF EXISTS `Rezept_Rezept_Zutat`;
/*!50001 DROP VIEW IF EXISTS `Rezept_Rezept_Zutat`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Rezept_Rezept_Zutat` (
  `Name` tinyint NOT NULL,
  `idRezept_Zutat` tinyint NOT NULL,
  `idRezept` tinyint NOT NULL,
  `idZutaten` tinyint NOT NULL,
  `Menge` tinyint NOT NULL,
  `idEinheit` tinyint NOT NULL,
  `Reihenfolge` tinyint NOT NULL,
  `Menge_in_ml` tinyint NOT NULL,
  `vorhanden` tinyint NOT NULL,
  `Rezept_Gesamt_ml` tinyint NOT NULL,
  `vorhanden_alle` tinyint NOT NULL,
  `angeschlossen_alle` tinyint NOT NULL,
  `Anzahl_Zutaten` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Rezept_Zutat`
--

DROP TABLE IF EXISTS `Rezept_Zutat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Rezept_Zutat` (
  `idRezept_Zutat` int(11) NOT NULL AUTO_INCREMENT,
  `idRezept` int(11) NOT NULL,
  `idZutaten` int(11) NOT NULL,
  `Menge` float NOT NULL,
  `idEinheit` int(11) NOT NULL,
  `Reihenfolge` int(11) DEFAULT NULL,
  `Menge_in_ml` float DEFAULT NULL,
  `alc_in_ml` float DEFAULT NULL,
  `vorhanden` tinyint(1) DEFAULT NULL,
  `EK` float DEFAULT NULL,
  `angeschlossen` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idRezept_Zutat`),
  KEY `Rezept_Zutat_Rezept_FK` (`idRezept`),
  KEY `Rezept_Zutat_Zutaten_FK` (`idZutaten`),
  KEY `Rezept_Zutat_Einheiten_FK` (`idEinheit`),
  CONSTRAINT `Rezept_Zutat_Einheiten_FK` FOREIGN KEY (`idEinheit`) REFERENCES `Einheiten` (`idEinheiten`),
  CONSTRAINT `Rezept_Zutat_Rezept_FK` FOREIGN KEY (`idRezept`) REFERENCES `Rezept` (`idRezept`),
  CONSTRAINT `Rezept_Zutat_Zutaten_FK` FOREIGN KEY (`idZutaten`) REFERENCES `Zutaten` (`IdZutaten`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Rezept_Zutat`
--

LOCK TABLES `Rezept_Zutat` WRITE;
/*!40000 ALTER TABLE `Rezept_Zutat` DISABLE KEYS */;
INSERT INTO `Rezept_Zutat` VALUES (1,1,1,2,1,NULL,20,NULL,1,0.2,NULL),(2,1,2,6,1,NULL,60,NULL,0,0.12,NULL),(3,1,3,6,1,NULL,60,NULL,0,0.12,NULL),(4,1,4,6,1,NULL,60,NULL,0,0.6,NULL),(5,2,1,2,1,NULL,20,NULL,1,0.2,NULL),(6,2,5,2,1,NULL,20,NULL,1,0.2,NULL),(7,2,6,2,1,NULL,20,NULL,0,0.2,NULL),(8,2,7,14,1,NULL,140,NULL,1,0.28,NULL),(9,3,1,2,1,NULL,20,NULL,1,0.2,NULL),(10,3,5,3,1,NULL,30,NULL,1,0.3,NULL),(11,3,11,3,1,NULL,30,NULL,1,0.3,NULL),(12,3,12,4,1,NULL,40,NULL,1,0.08,NULL),(13,3,2,8,1,NULL,80,NULL,0,0.16,NULL),(14,4,1,2,1,NULL,20,NULL,1,0.2,NULL),(15,4,13,2,1,NULL,20,NULL,1,0.2,NULL),(16,4,6,2,1,NULL,20,NULL,0,0.2,NULL),(17,4,7,12,1,NULL,120,NULL,1,0.24,NULL),(18,5,1,2,1,2,20,NULL,1,0.2,NULL),(19,5,15,2,1,1,20,NULL,1,0.2,NULL),(20,5,7,8,1,1,80,NULL,1,0.16,NULL),(21,5,12,8,1,1,80,NULL,1,0.16,NULL),(22,6,20,2,1,NULL,20,NULL,1,0.2,NULL),(23,6,21,1,1,NULL,10,NULL,NULL,0.1,NULL),(24,6,3,4,1,NULL,40,NULL,0,0.08,NULL),(25,6,2,6,1,NULL,60,NULL,0,0.12,NULL),(26,6,12,8,1,NULL,80,NULL,1,0.16,NULL),(27,7,22,1,1,NULL,10,NULL,NULL,0.1,NULL),(28,7,20,1,1,NULL,10,NULL,1,0.1,NULL),(29,7,11,2,1,NULL,20,NULL,1,0.2,NULL),(30,7,4,14,1,NULL,140,NULL,0,1.4,NULL),(32,7,2,4,1,NULL,40,NULL,0,0.08,NULL),(33,8,20,2,1,NULL,20,NULL,1,0.2,NULL),(34,8,15,1,1,NULL,10,NULL,1,0.1,NULL),(35,8,6,2,1,NULL,20,NULL,0,0.2,NULL),(36,8,2,16,1,NULL,160,NULL,0,0.32,NULL),(37,9,20,2,1,NULL,20,NULL,1,0.2,NULL),(38,9,13,2,1,NULL,20,NULL,1,0.2,NULL),(40,9,11,2,1,NULL,20,NULL,1,0.2,NULL),(41,9,3,4,1,NULL,40,NULL,0,0.08,NULL),(42,9,7,12,1,NULL,120,NULL,1,0.24,NULL),(43,10,20,2,1,NULL,20,NULL,1,0.2,NULL),(44,10,13,2,1,NULL,20,NULL,1,0.2,NULL),(45,10,6,2,1,NULL,20,NULL,0,0.2,NULL),(46,10,12,6,1,NULL,60,NULL,1,0.12,NULL),(47,10,2,6,1,NULL,60,NULL,0,0.12,NULL),(48,11,24,2,1,NULL,20,NULL,NULL,0.2,NULL),(49,11,25,2,1,NULL,20,NULL,NULL,0.2,NULL),(50,11,26,4,1,NULL,40,NULL,NULL,0.08,NULL),(51,11,2,4,1,NULL,40,NULL,0,0.08,NULL),(52,11,12,8,1,NULL,80,NULL,1,0.16,NULL),(53,12,25,1,1,NULL,10,NULL,NULL,0.1,NULL),(54,12,27,2,1,NULL,20,NULL,1,0.2,NULL),(55,12,11,2,1,NULL,20,NULL,1,0.2,NULL),(56,12,2,6,1,NULL,60,NULL,0,0.12,NULL),(57,12,7,8,1,NULL,80,NULL,1,0.16,NULL),(58,13,20,2,1,NULL,20,NULL,1,0.2,NULL),(59,13,5,2,1,NULL,20,NULL,1,0.2,NULL),(60,13,11,2,1,NULL,20,NULL,1,0.2,NULL),(61,13,28,5,1,NULL,50,NULL,1,0.5,NULL),(62,13,12,10,1,NULL,100,NULL,1,0.2,NULL),(63,14,5,2,1,NULL,20,NULL,1,0.2,NULL),(64,14,6,2,1,NULL,20,NULL,0,0.2,NULL),(65,14,7,6,1,NULL,60,NULL,1,0.12,NULL),(66,14,12,6,1,NULL,60,NULL,1,0.12,NULL),(67,14,2,6,1,NULL,60,NULL,0,0.12,NULL),(68,15,5,2,1,1,20,NULL,1,0.2,NULL),(69,15,27,1,1,1,10,NULL,1,0.1,NULL),(70,15,6,3,1,1,30,NULL,0,0.3,NULL),(71,15,2,12,1,1,120,NULL,0,0.24,NULL),(72,15,29,2,1,2,20,NULL,1,0.2,NULL),(73,17,5,2,1,1,20,NULL,1,0.2,NULL),(74,17,20,2,1,1,20,NULL,1,0.2,NULL),(75,17,6,2,1,1,20,NULL,0,0.2,NULL),(76,17,7,6,1,1,60,NULL,1,0.12,NULL),(77,17,4,8,1,1,80,NULL,0,0.8,NULL),(79,18,2,2,1,NULL,20,NULL,0,0.04,NULL),(80,18,31,4,1,NULL,40,NULL,NULL,0.08,NULL),(81,18,12,6,1,NULL,60,NULL,1,0.12,NULL),(82,18,3,6,1,NULL,60,NULL,0,0.12,NULL),(83,18,30,2,1,NULL,20,NULL,1,0.2,NULL),(84,19,5,3,1,NULL,30,NULL,1,0.3,NULL),(85,19,32,2,1,NULL,20,NULL,1,0.2,NULL),(86,19,2,5,1,NULL,50,NULL,0,0.1,NULL),(87,19,12,10,1,NULL,100,NULL,1,0.2,NULL),(88,19,13,1,5,NULL,2.7,NULL,1,0.027,NULL),(89,20,29,2,1,NULL,20,NULL,1,0.2,NULL),(90,20,5,2,1,NULL,20,NULL,1,0.2,NULL),(91,20,6,2,1,NULL,20,NULL,0,0.2,NULL),(92,20,32,1,1,NULL,10,NULL,1,0.1,NULL),(93,20,2,10,1,NULL,100,NULL,0,0.2,NULL),(94,21,29,2,1,NULL,20,NULL,1,0.2,NULL),(95,21,5,1,1,NULL,10,NULL,1,0.1,NULL),(96,21,33,1,1,NULL,10,NULL,NULL,0.1,NULL),(97,21,6,2,1,NULL,20,NULL,0,0.2,NULL),(98,21,2,14,1,NULL,140,NULL,0,0.28,NULL),(99,22,15,2,1,NULL,20,NULL,1,0.2,NULL),(100,22,34,1,1,NULL,10,NULL,NULL,0.1,NULL),(101,22,32,2,1,NULL,20,NULL,1,0.2,NULL),(102,22,35,4,1,NULL,40,NULL,1,0.08,NULL),(103,22,12,8,1,NULL,80,NULL,1,0.16,NULL),(104,23,36,2,1,NULL,20,NULL,0,0.2,NULL),(105,23,7,6,1,NULL,60,NULL,1,0.12,NULL),(106,23,12,6,1,NULL,60,NULL,1,0.12,NULL),(107,23,3,6,1,NULL,60,NULL,0,0.12,NULL),(108,24,36,2,1,NULL,20,NULL,0,0.2,NULL),(109,24,11,2,1,NULL,20,NULL,1,0.2,NULL),(110,24,7,4,1,NULL,40,NULL,1,0.08,NULL),(111,24,12,4,1,NULL,40,NULL,1,0.08,NULL),(112,24,37,4,1,NULL,40,NULL,NULL,0.08,NULL),(113,24,2,4,1,NULL,40,NULL,0,0.08,NULL),(114,25,20,2,1,NULL,20,NULL,1,0.2,NULL),(115,25,6,2,1,NULL,20,NULL,0,0.2,NULL),(116,25,7,6,1,NULL,60,NULL,1,0.12,NULL),(117,25,2,6,1,NULL,60,NULL,0,0.12,NULL),(118,25,31,6,1,NULL,60,NULL,NULL,0.12,NULL),(119,26,20,2,1,NULL,20,NULL,1,0.2,NULL),(120,26,38,1,1,NULL,10,NULL,NULL,0.1,NULL),(121,26,11,3,1,NULL,30,NULL,1,0.3,NULL),(122,26,12,8,1,NULL,80,NULL,1,0.16,NULL),(123,26,7,8,1,NULL,80,NULL,1,0.16,NULL),(124,27,29,2,1,NULL,20,NULL,1,0.2,NULL),(125,27,22,2,1,NULL,20,NULL,NULL,0.2,NULL),(126,27,6,2,1,NULL,20,NULL,0,0.2,NULL),(127,27,12,8,1,NULL,80,NULL,1,0.16,NULL),(128,27,7,8,1,NULL,80,NULL,1,0.16,NULL),(129,28,27,2,1,NULL,20,NULL,1,0.2,NULL),(130,28,29,2,1,NULL,20,NULL,1,0.2,NULL),(131,28,6,4,1,NULL,40,NULL,0,0.4,NULL),(132,28,28,12,1,NULL,120,NULL,1,1.2,NULL),(133,29,39,2,1,NULL,20,NULL,NULL,0.2,NULL),(134,29,29,3,1,NULL,30,NULL,1,0.3,NULL),(135,29,32,2,1,NULL,20,NULL,1,0.2,NULL),(136,29,3,6,1,NULL,60,NULL,0,0.12,NULL),(137,29,31,10,1,NULL,100,NULL,NULL,0.2,NULL),(138,30,20,1,1,NULL,10,NULL,1,0.1,NULL),(139,30,27,2,1,NULL,20,NULL,1,0.2,NULL),(140,30,11,2,1,NULL,20,NULL,1,0.2,NULL),(141,30,2,8,1,NULL,80,NULL,0,0.16,NULL),(142,30,3,8,1,NULL,80,NULL,0,0.16,NULL),(144,31,20,1,1,NULL,10,NULL,1,0.1,NULL),(145,31,11,2,1,NULL,20,NULL,1,0.2,NULL),(146,31,38,2,1,NULL,20,NULL,NULL,0.2,NULL),(147,31,31,6,1,NULL,60,NULL,NULL,0.12,NULL),(148,31,2,8,1,NULL,80,NULL,0,0.16,NULL),(149,32,5,1,1,NULL,10,NULL,1,0.1,NULL),(150,32,25,3,1,NULL,30,NULL,NULL,0.3,NULL),(151,32,3,4,1,NULL,40,NULL,0,0.08,NULL),(152,32,4,4,1,NULL,40,NULL,0,0.4,NULL),(153,32,2,8,1,NULL,80,NULL,0,0.16,NULL),(154,33,20,2,1,NULL,20,NULL,1,0.2,NULL),(155,33,34,3,1,NULL,30,NULL,NULL,0.3,NULL),(156,33,11,2,1,NULL,20,NULL,1,0.2,NULL),(157,33,31,8,1,NULL,80,NULL,NULL,0.16,NULL),(158,33,7,8,1,NULL,80,NULL,1,0.16,NULL),(159,34,15,1,1,NULL,10,NULL,1,0.1,NULL),(160,34,25,2,1,NULL,20,NULL,NULL,0.2,NULL),(161,34,32,1,1,NULL,10,NULL,1,0.1,NULL),(162,34,2,8,1,NULL,80,NULL,0,0.16,NULL),(163,34,40,8,1,NULL,80,NULL,NULL,0.8,NULL),(164,35,20,2,1,NULL,20,NULL,1,0.2,NULL),(165,35,34,2,1,NULL,20,NULL,NULL,0.2,NULL),(166,35,11,1,1,NULL,10,NULL,1,0.1,NULL),(167,35,26,8,1,NULL,80,NULL,NULL,0.16,NULL),(168,35,12,8,1,NULL,80,NULL,1,0.16,NULL),(169,36,36,2,1,NULL,20,NULL,0,0.2,NULL),(170,36,6,2,1,NULL,20,NULL,0,0.2,NULL),(171,36,12,8,1,NULL,80,NULL,1,0.16,NULL),(172,36,7,8,1,NULL,80,NULL,1,0.16,NULL),(173,37,36,1,1,NULL,10,NULL,0,0.1,NULL),(174,37,5,2,1,NULL,20,NULL,1,0.2,NULL),(175,37,6,2,1,NULL,20,NULL,0,0.2,NULL),(176,37,12,8,1,NULL,80,NULL,1,0.16,NULL),(177,37,7,8,1,NULL,80,NULL,1,0.16,NULL),(178,38,1,1,1,NULL,10,NULL,1,0.1,NULL),(179,38,5,2,1,NULL,20,NULL,1,0.2,NULL),(180,38,6,2,1,NULL,20,NULL,0,0.2,NULL),(181,38,4,6,1,NULL,60,NULL,0,0.6,NULL),(182,38,12,10,1,NULL,100,NULL,1,0.2,NULL),(183,39,22,4,1,NULL,40,NULL,NULL,0.4,NULL),(184,39,20,1,1,NULL,10,NULL,1,0.1,NULL),(185,39,41,2,6,NULL,20,NULL,NULL,NULL,NULL),(186,40,20,1,1,NULL,10,NULL,1,0.1,NULL),(187,40,5,2,1,NULL,20,NULL,1,0.2,NULL),(188,40,6,2,1,NULL,20,NULL,0,0.2,NULL),(189,40,7,15,1,NULL,150,NULL,1,0.3,NULL),(190,40,41,2,6,NULL,20,NULL,NULL,NULL,NULL),(191,41,29,1,1,NULL,10,NULL,1,0.1,NULL),(192,41,5,2,1,NULL,20,NULL,1,0.2,NULL),(193,41,11,1,1,NULL,10,NULL,1,0.1,NULL),(194,41,35,8,1,NULL,80,NULL,1,0.16,NULL),(195,41,7,8,1,NULL,80,NULL,1,0.16,NULL),(196,42,20,2,1,NULL,20,NULL,1,0.2,NULL),(197,42,42,2,1,NULL,20,NULL,NULL,0.2,NULL),(198,42,11,2,1,NULL,20,NULL,1,0.2,NULL),(199,42,4,10,1,NULL,100,NULL,0,1,NULL),(200,43,27,2,1,NULL,20,NULL,1,0.2,NULL),(201,43,36,2,1,NULL,20,NULL,0,0.2,NULL),(202,43,32,2,1,NULL,20,NULL,1,0.2,NULL),(203,43,28,4,1,NULL,40,NULL,1,0.4,NULL),(204,43,35,4,1,NULL,40,NULL,1,0.08,NULL),(205,43,43,8,1,NULL,80,NULL,NULL,0.8,NULL),(206,44,21,2,1,NULL,20,NULL,NULL,0.2,NULL),(207,44,29,3,1,NULL,30,NULL,1,0.3,NULL),(208,44,7,5,1,NULL,50,NULL,1,0.1,NULL),(209,44,12,5,1,NULL,50,NULL,1,0.1,NULL),(210,44,2,8,1,NULL,80,NULL,0,0.16,NULL),(211,45,21,1,1,NULL,10,NULL,NULL,0.1,NULL),(212,45,20,1.5,1,NULL,15,NULL,1,0.15,NULL),(213,45,34,1.5,1,NULL,15,NULL,NULL,0.15,NULL),(214,45,12,8,1,NULL,80,NULL,1,0.16,NULL),(215,45,3,8,1,NULL,80,NULL,0,0.16,NULL),(216,39,11,3,1,NULL,30,NULL,1,0.3,NULL),(217,46,20,2,1,NULL,20,NULL,1,0.2,NULL),(218,46,13,2,1,NULL,20,NULL,1,0.2,NULL),(219,46,6,2,1,NULL,20,NULL,0,0.2,NULL),(220,46,31,6,1,NULL,60,NULL,NULL,0.12,NULL),(221,46,7,10,1,NULL,100,NULL,1,0.2,NULL),(222,47,25,2,1,NULL,20,NULL,NULL,0.2,NULL),(223,47,13,2,1,NULL,20,NULL,1,0.2,NULL),(224,47,6,2,1,NULL,20,NULL,0,0.2,NULL),(225,47,31,6,1,NULL,60,NULL,NULL,0.12,NULL),(226,47,7,10,1,NULL,100,NULL,1,0.2,NULL),(227,48,44,2,1,NULL,20,NULL,NULL,0.2,NULL),(228,48,39,2,1,NULL,20,NULL,NULL,0.2,NULL),(229,48,11,1,1,NULL,10,NULL,1,0.1,NULL),(230,48,40,8,1,NULL,80,NULL,NULL,0.8,NULL),(231,49,44,2,1,NULL,20,NULL,NULL,0.2,NULL),(232,49,22,2,1,NULL,20,NULL,NULL,0.2,NULL),(233,49,32,1,1,NULL,10,NULL,1,0.1,NULL),(234,49,40,15,1,NULL,150,NULL,NULL,1.5,NULL),(235,65,20,2,1,NULL,20,NULL,1,0.2,NULL),(236,65,6,2,1,NULL,20,NULL,0,0.2,NULL),(237,65,2,6,1,NULL,60,NULL,0,0.12,NULL),(238,65,45,6,1,NULL,60,NULL,1,0.12,NULL),(239,50,39,3,1,NULL,30,NULL,NULL,0.3,NULL),(240,50,11,2,1,NULL,20,NULL,1,0.2,NULL),(241,50,3,4,1,NULL,40,NULL,0,0.08,NULL),(242,50,12,6,1,NULL,60,NULL,1,0.12,NULL),(243,50,46,6,1,NULL,60,NULL,NULL,0.12,NULL),(244,51,5,2,1,NULL,20,NULL,1,0.2,NULL),(245,51,25,4,1,NULL,40,NULL,NULL,0.4,NULL),(246,51,11,3,1,NULL,30,NULL,1,0.3,NULL),(247,51,7,4,1,NULL,40,NULL,1,0.08,NULL),(248,51,2,8,1,NULL,80,NULL,0,0.16,NULL),(249,52,30,3,1,NULL,30,NULL,1,0.3,NULL),(250,52,15,2,1,NULL,20,NULL,1,0.2,NULL),(251,52,11,2,1,NULL,20,NULL,1,0.2,NULL),(252,52,7,6,1,NULL,60,NULL,1,0.12,NULL),(253,52,3,8,1,NULL,80,NULL,0,0.16,NULL),(254,53,30,2,1,NULL,20,NULL,1,0.2,NULL),(255,53,47,2,1,NULL,20,NULL,NULL,0.2,NULL),(256,53,32,2,1,NULL,20,NULL,1,0.2,NULL),(257,53,28,14,1,NULL,140,NULL,1,1.4,NULL),(258,54,22,2,1,NULL,20,NULL,NULL,0.2,NULL),(259,54,6,2,1,NULL,20,NULL,0,0.2,NULL),(260,54,7,8,1,NULL,80,NULL,1,0.16,NULL),(261,54,12,8,1,NULL,80,NULL,1,0.16,NULL),(262,55,36,1,1,NULL,10,NULL,0,0.1,NULL),(263,55,22,3,1,NULL,30,NULL,NULL,0.3,NULL),(264,55,11,2,1,NULL,20,NULL,1,0.2,NULL),(265,55,3,4,1,NULL,40,NULL,0,0.08,NULL),(266,55,7,6,1,NULL,60,NULL,1,0.12,NULL),(267,55,12,6,1,NULL,60,NULL,1,0.12,NULL),(268,56,36,1,1,NULL,10,NULL,0,0.1,NULL),(269,56,38,1,1,NULL,10,NULL,NULL,0.1,NULL),(270,56,33,2,1,NULL,20,NULL,NULL,0.2,NULL),(271,56,34,8,1,NULL,80,NULL,NULL,0.8,NULL),(272,56,12,10,1,NULL,100,NULL,1,0.2,NULL),(273,57,47,2,1,NULL,20,NULL,NULL,0.2,NULL),(274,57,29,1,1,NULL,10,NULL,1,0.1,NULL),(275,57,15,1,1,NULL,10,NULL,1,0.1,NULL),(276,57,32,2,1,NULL,20,NULL,1,0.2,NULL),(277,57,12,6,1,NULL,60,NULL,1,0.12,NULL),(278,57,45,6,1,NULL,60,NULL,1,0.12,NULL),(279,58,22,2,1,NULL,20,NULL,NULL,0.2,NULL),(280,58,29,2,1,NULL,20,NULL,1,0.2,NULL),(281,58,6,2,1,NULL,20,NULL,0,0.2,NULL),(282,58,37,4,1,NULL,40,NULL,NULL,0.08,NULL),(283,58,2,10,1,NULL,100,NULL,0,0.2,NULL),(284,59,22,2,1,NULL,20,NULL,NULL,0.2,NULL),(285,59,13,1,1,NULL,10,NULL,1,0.1,NULL),(286,59,20,1,1,NULL,10,NULL,1,0.1,NULL),(287,59,6,4,1,NULL,40,NULL,0,0.4,NULL),(288,59,2,12,1,NULL,120,NULL,0,0.24,NULL),(289,60,22,2,1,NULL,20,NULL,NULL,0.2,NULL),(290,60,13,2,1,NULL,20,NULL,1,0.2,NULL),(291,60,34,2,1,NULL,20,NULL,NULL,0.2,NULL),(292,60,32,3,1,NULL,30,NULL,1,0.3,NULL),(293,60,2,10,1,NULL,100,NULL,0,0.2,NULL),(294,61,36,1,1,NULL,10,NULL,0,0.1,NULL),(295,61,38,2,1,NULL,20,NULL,NULL,0.2,NULL),(296,61,12,4,1,NULL,40,NULL,1,0.08,NULL),(297,61,7,4,1,NULL,40,NULL,1,0.08,NULL),(298,61,2,8,1,NULL,80,NULL,0,0.16,NULL),(299,62,38,4,1,NULL,40,NULL,NULL,0.4,NULL),(300,62,36,2,1,NULL,20,NULL,0,0.2,NULL),(301,62,11,2,1,NULL,20,NULL,1,0.2,NULL),(302,62,3,14,1,NULL,140,NULL,0,0.28,NULL),(303,63,38,2,1,NULL,20,NULL,NULL,0.2,NULL),(304,63,21,1,1,NULL,10,NULL,NULL,0.1,NULL),(305,63,24,1,1,NULL,10,NULL,NULL,0.1,NULL),(306,63,11,2,1,NULL,20,NULL,1,0.2,NULL),(308,63,12,14,1,NULL,140,NULL,1,0.28,NULL),(309,64,38,2,1,NULL,20,NULL,NULL,0.2,NULL),(310,64,27,2,1,NULL,20,NULL,1,0.2,NULL),(311,64,11,2,1,NULL,20,NULL,1,0.2,NULL),(312,64,48,8,1,NULL,80,NULL,NULL,0.16,NULL),(313,64,2,8,1,NULL,80,NULL,0,0.16,NULL);
/*!40000 ALTER TABLE `Rezept_Zutat` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`remote`@`localhost`*/ /*!50003 TRIGGER Rezept_Zutat_BI
BEFORE INSERT
ON Rezept_Zutat FOR EACH ROW


	set NEW.Menge_in_ml = (NEW.`Menge` *(
	select Einheiten_Menge_in_ml from Einheiten
	where Einheiten.idEinheiten = NEW.idEinheit)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`remote`@`localhost`*/ /*!50003 TRIGGER Rezept_Zutat_AI
AFTER  INSERT 

ON Rezept_Zutat FOR EACH ROW

	
	
	UPDATE Rezept 
	SET Rezept_ml = ( SELECT SUM(Rezept_Zutat.Menge_in_ml)
		FROM Rezept_Zutat #GROUP BY Rezept_Zutat.idRezept
		WHERE Rezept_Zutat.idRezept = NEW.idRezept)
		
	WHERE Rezept.idRezept = NEW.idRezept */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`remote`@`localhost`*/ /*!50003 TRIGGER `Rezept_Zutat_BU` BEFORE UPDATE
ON Rezept_Zutat 
FOR EACH ROW
	BEGIN
			
		set NEW.Menge_in_ml = (NEW.`Menge` *(
			select Einheiten_Menge_in_ml from Einheiten
			where Einheiten.idEinheiten = NEW.idEinheit));
			
			
		set NEW.alc_in_ml = (NEW.`Menge_in_ml` / 100.0 *(
			select alc_vol_prozent from Zutaten
			where Zutaten.IdZutaten = NEW.idZutaten));
		
		set NEW.vorhanden =
			(select vorhanden from Zutaten
			where Zutaten.IdZutaten = NEW.idZutaten);
		
		set NEW.EK = (NEW.`Menge_in_ml` *(
			select preis_ml from Zutaten
			where Zutaten.IdZutaten = NEW.idZutaten));
		
			
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`remote`@`localhost`*/ /*!50003 TRIGGER Rezept_Zutat_AU
AFTER UPDATE
ON Rezept_Zutat FOR EACH ROW

BEGIN
	UPDATE Rezept 
	SET Rezept_ml = ( SELECT SUM(Rezept_Zutat.Menge_in_ml)
		FROM Rezept_Zutat #GROUP BY Rezept_Zutat.idRezept
		WHERE Rezept_Zutat.idRezept = OLD.idRezept)
	WHERE Rezept.idRezept = OLD.idRezept;

	UPDATE Rezept 
	SET Anzahl_Zutaten = (SELECT COUNT(Rezept_Zutat.Menge_in_ml)
		FROM Rezept_Zutat #GROUP BY Rezept_Zutat.idRezept
		WHERE Rezept_Zutat.idRezept = OLD.idRezept)
	WHERE Rezept.idRezept = OLD.idRezept;


	UPDATE Rezept 
	SET Rezept_ml = ( SELECT SUM(Rezept_Zutat.Menge_in_ml)
		FROM Rezept_Zutat #GROUP BY Rezept_Zutat.idRezept
		WHERE Rezept_Zutat.idRezept = NEW.idRezept)
	WHERE Rezept.idRezept = NEW.idRezept;

	UPDATE Rezept 
	SET Anzahl_Zutaten = (SELECT COUNT(Rezept_Zutat.Menge_in_ml)
		FROM Rezept_Zutat #GROUP BY Rezept_Zutat.idRezept
		WHERE Rezept_Zutat.idRezept = NEW.idRezept)
	WHERE Rezept.idRezept = NEW.idRezept;

	UPDATE Rezept 
	SET alc_vol_prozent = (SELECT SUM(Rezept_Zutat.alc_in_ml) / Rezept.Rezept_ml * 100.0
		FROM Rezept_Zutat #GROUP BY Rezept_Zutat.idRezept
		WHERE Rezept_Zutat.idRezept = NEW.idRezept)
	WHERE Rezept.idRezept = NEW.idRezept;

	UPDATE Rezept 
	SET vorhanden = ( SELECT SUM(Rezept_Zutat.vorhanden)
		FROM Rezept_Zutat #GROUP BY Rezept_Zutat.idRezept
		WHERE Rezept_Zutat.idRezept = NEW.idRezept)
	WHERE Rezept.idRezept = NEW.idRezept;

	UPDATE Rezept 
	SET angeschlossen = ( SELECT SUM(Rezept_Zutat.angeschlossen)
		FROM Rezept_Zutat #GROUP BY Rezept_Zutat.idRezept
		WHERE Rezept_Zutat.idRezept = NEW.idRezept)
	WHERE Rezept.idRezept = NEW.idRezept;


	UPDATE Rezept 
	SET Preis_ml = (SELECT SUM(Rezept_Zutat.EK) / Rezept.Rezept_ml
		FROM Rezept_Zutat #GROUP BY Rezept_Zutat.idRezept
		WHERE Rezept_Zutat.idRezept = NEW.idRezept)
	WHERE Rezept.idRezept = NEW.idRezept;



END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`remote`@`localhost`*/ /*!50003 TRIGGER Rezept_Zutat_AD
AFTER  DELETE 

ON Rezept_Zutat FOR EACH ROW
	
UPDATE Rezept 
SET Rezept_ml = ( SELECT SUM(Rezept_Zutat.Menge_in_ml)
	FROM Rezept_Zutat #GROUP BY Rezept_Zutat.idRezept
	WHERE Rezept_Zutat.idRezept = OLD.idRezept)
	
WHERE Rezept.idRezept = OLD.idRezept */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `Rezept_Zutat_Menge`
--

DROP TABLE IF EXISTS `Rezept_Zutat_Menge`;
/*!50001 DROP VIEW IF EXISTS `Rezept_Zutat_Menge`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Rezept_Zutat_Menge` (
  `idRezept_Zutat` tinyint NOT NULL,
  `Menge_in_ml` tinyint NOT NULL,
  `idZutaten` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Rezept_Zutat_Menge_Name`
--

DROP TABLE IF EXISTS `Rezept_Zutat_Menge_Name`;
/*!50001 DROP VIEW IF EXISTS `Rezept_Zutat_Menge_Name`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Rezept_Zutat_Menge_Name` (
  `idRezept` tinyint NOT NULL,
  `idRezept_Zutat` tinyint NOT NULL,
  `idZutaten` tinyint NOT NULL,
  `Menge` tinyint NOT NULL,
  `Rezept_Name` tinyint NOT NULL,
  `Reihenfolge` tinyint NOT NULL,
  `Rezept_Gesamt_ml` tinyint NOT NULL,
  `Menge_in_ml` tinyint NOT NULL,
  `idEinheit` tinyint NOT NULL,
  `vorhanden` tinyint NOT NULL,
  `angeschlossen` tinyint NOT NULL,
  `Zutat_Name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Rezept_ganz`
--

DROP TABLE IF EXISTS `Rezept_ganz`;
/*!50001 DROP VIEW IF EXISTS `Rezept_ganz`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Rezept_ganz` (
  `Rezept_Name` tinyint NOT NULL,
  `vorhanden_alle` tinyint NOT NULL,
  `angeschlossen_alle` tinyint NOT NULL,
  `Zutat_Name` tinyint NOT NULL,
  `vorhanden` tinyint NOT NULL,
  `Reihenfolge` tinyint NOT NULL,
  `Menge_in_ml` tinyint NOT NULL,
  `idRezept` tinyint NOT NULL,
  `IdZutaten` tinyint NOT NULL,
  `Rezept_Gesamt_ml` tinyint NOT NULL,
  `Anzahl_Zutaten` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Rezept_org`
--

DROP TABLE IF EXISTS `Rezept_org`;
/*!50001 DROP VIEW IF EXISTS `Rezept_org`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Rezept_org` (
  `Zutat_Name` tinyint NOT NULL,
  `Menge` tinyint NOT NULL,
  `Einheiten_Name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Rezepz_gesamt_Menge`
--

DROP TABLE IF EXISTS `Rezepz_gesamt_Menge`;
/*!50001 DROP VIEW IF EXISTS `Rezepz_gesamt_Menge`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Rezepz_gesamt_Menge` (
  `idRezept` tinyint NOT NULL,
  `Rezept_Name` tinyint NOT NULL,
  `Gesamt_Menge_in_ml` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `Verwendung_Zutaten`
--

DROP TABLE IF EXISTS `Verwendung_Zutaten`;
/*!50001 DROP VIEW IF EXISTS `Verwendung_Zutaten`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Verwendung_Zutaten` (
  `Zutat_Name` tinyint NOT NULL,
  `Anzahl` tinyint NOT NULL,
  `Menge_in_ml` tinyint NOT NULL,
  `IdZutaten` tinyint NOT NULL,
  `vorhanden` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Zutaten`
--

DROP TABLE IF EXISTS `Zutaten`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Zutaten` (
  `IdZutaten` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `vorhanden` tinyint(1) DEFAULT NULL,
  `alc_vol_prozent` float DEFAULT NULL,
  `preis_ml` float DEFAULT NULL,
  `angeschlossen` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`IdZutaten`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zutaten`
--

LOCK TABLES `Zutaten` WRITE;
/*!40000 ALTER TABLE `Zutaten` DISABLE KEYS */;
INSERT INTO `Zutaten` VALUES (1,'Blue-Curaçao-Sirup',1,NULL,0.01,NULL),(2,'Maracujanektar',0,NULL,0.002,NULL),(3,'Grapefruitsaft',0,NULL,0.002,NULL),(4,'Bananennektar',0,NULL,0.01,NULL),(5,'Kokossirup',1,NULL,0.01,NULL),(6,'Sahne',0,NULL,0.01,NULL),(7,'Ananassaft',1,NULL,0.002,NULL),(11,'Zitronensaft',1,NULL,0.01,NULL),(12,'Orangensaft',1,NULL,0.002,NULL),(13,'Vanillesirup',1,NULL,0.01,NULL),(15,'Mandelsirup',1,NULL,0.01,NULL),(20,'Erdbeersirup',1,NULL,0.01,NULL),(21,'Limettensirup',NULL,NULL,0.01,NULL),(22,'Havana-Sirup',NULL,NULL,0.01,NULL),(23,'Wasser mit CO2',NULL,NULL,0.001,NULL),(24,'Blutorangensirup',NULL,NULL,0.01,NULL),(25,'Cranberrysirup',NULL,NULL,0.01,NULL),(26,'Cranberrysaft',NULL,NULL,0.002,NULL),(27,'Karamelsirup',1,NULL,0.01,NULL),(28,'Apfelsaft',1,NULL,0.01,NULL),(29,'Amarena-Kirsch-Sirup',1,NULL,0.01,NULL),(30,'Pfefferminzsirup',1,NULL,0.01,NULL),(31,'Pfirsichnektar',NULL,NULL,0.002,NULL),(32,'Limettensaft',1,NULL,0.01,NULL),(33,'Italiano-Sirup',NULL,NULL,0.01,NULL),(34,'Maracujasirup',NULL,NULL,0.01,NULL),(35,'Kirschnektar',1,NULL,0.002,NULL),(36,'Grenadine',0,NULL,0.01,NULL),(37,'Mangonektar',NULL,NULL,0.002,NULL),(38,'Mangosirup',NULL,NULL,0.01,NULL),(39,'Cuavesirup',NULL,NULL,0.01,NULL),(40,'Sunny Breakfast Saft',NULL,NULL,0.01,NULL),(41,'Erdbeermus',NULL,NULL,0.01,NULL),(42,'Bananensirup',NULL,NULL,0.01,NULL),(43,'Birnennektar',NULL,NULL,0.01,NULL),(44,'Manderinensirup',NULL,NULL,0.01,NULL),(45,'Manderinensaft',1,NULL,0.002,NULL),(46,'Sauerkirschnektar',NULL,NULL,0.002,NULL),(47,'London-Dry-Sirup',NULL,NULL,0.01,NULL),(48,'Cuavennektar',NULL,NULL,0.002,NULL),(49,'Wasser Still',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `Zutaten` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`remote`@`localhost`*/ /*!50003 TRIGGER Zutaten_AU
AFTER UPDATE
ON Zutaten FOR EACH ROW
BEGIN
	update Rezept_Zutat
		set Menge_in_ml = 0
		where idZutaten = NEW.idZutaten;

	update Rezept_Zutat
		set Menge_in_ml = 0
		where idZutaten = OLD.idZutaten;



END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `Zutaten_Sortiert`
--

DROP TABLE IF EXISTS `Zutaten_Sortiert`;
/*!50001 DROP VIEW IF EXISTS `Zutaten_Sortiert`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `Zutaten_Sortiert` (
  `Name` tinyint NOT NULL,
  `IdZutaten` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `doppelte`
--

DROP TABLE IF EXISTS `doppelte`;
/*!50001 DROP VIEW IF EXISTS `doppelte`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `doppelte` (
  `idA` tinyint NOT NULL,
  `idB` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_Cocktail`
--

DROP TABLE IF EXISTS `view_Cocktail`;

