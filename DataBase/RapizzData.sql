CREATE DATABASE  IF NOT EXISTS `rapizz` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rapizz`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: rapizz
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `idClient` int NOT NULL,
  `nomClient` varchar(15) DEFAULT NULL,
  `prenomClient` varchar(15) DEFAULT NULL,
  `adresseClient` varchar(50) DEFAULT NULL,
  `emailClient` varchar(30) DEFAULT NULL,
  `numeroTelephoneClient` varchar(15) DEFAULT NULL,
  `soldeCompte` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Derrez','Jonathan','35 Rue Maurice Bécanne','jonathan.derrez@gmail.com','0654321890','200.99'),(2,'Gregorie','Paul','4 Avue du Régiment','paul.gregorie@gmail.com','0612345698','24.56'),(3,'DEHMANI','Manar','4 Avenue de Buisson','manar.dehmani@gamil.com','0678912345','127.45'),(4,'Moreau','David','2 Boulevard de la Mer','david.moreau@gamil.com','0634567890','60.78'),(6,'CHEBLI','Wiem','10 Place de la Liberté','wiem.chebli@gmail.com','0687654321','5.20'),(7,'Roux','Elise','8 Place de la République','elise.roux@gmail.com','0701658921','70.32'),(8,'Poiteaux','Justine','2 Rue de la mairie','justine.poiteaux@gmail.com','0647214300','0.00'),(9,'Robert','Martine','35 Avenue Artiside Briand','martine.robert@gmail.com','0725543210','43.15');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commande` (
  `numCommande` int NOT NULL,
  `dateCommande` datetime DEFAULT NULL,
  `statutCommande` varchar(10) DEFAULT NULL,
  `adresseLivraison` varchar(50) DEFAULT NULL,
  `tempsDeLivraison` time DEFAULT NULL,
  `idPizza` varchar(15) NOT NULL,
  `idLivreur` varchar(15) NOT NULL,
  `idClient` int NOT NULL,
  PRIMARY KEY (`numCommande`),
  KEY `idPizza` (`idPizza`),
  KEY `idLivreur` (`idLivreur`),
  KEY `idClient` (`idClient`),
  CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`idPizza`) REFERENCES `pizza` (`idPizza`),
  CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`idLivreur`) REFERENCES `livreur` (`idLivreur`),
  CONSTRAINT `commande_ibfk_3` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,'2024-06-13 12:30:00','Livrée','35 Rue Maurice Bécanne','00:30:00','Type1T2','Livreur1',1),(2,'2024-06-13 13:00:00','Livrée','35 Rue Maurice Bécanne','00:20:00','Type2T2','Livreur2',1),(3,'2024-06-13 13:15:00','offerte','35 Rue Maurice Bécanne','00:40:00','Type3T3','Livreur3',1),(4,'2024-06-13 14:00:00','Livrée','35 Rue Maurice Bécanne','00:25:00','Type4T2','Livreur4',1),(5,'2024-06-13 14:30:00','Livrée','35 Rue Maurice Bécanne','00:25:00','Type5T1','Livreur5',1),(6,'2024-06-13 15:00:00','Livrée','4 Avue du Régiment','00:30:00','Type6T3','Livreur6',2),(7,'2024-06-13 15:30:00','Annulée','2 Rue de la mairie','00:00:00','Type1T1','Livreur7',8),(8,'2024-06-13 16:00:00','Offerte','35 Avenue Artiside Briand','00:50:00','Type2T2','Livreur1',9),(9,'2024-06-13 16:30:00','Livrée','35 Avenue Artiside Briand','00:30:00','Type3T3','Livreur2',9),(10,'2024-06-13 17:00:00','En cours','35 Avenue Artiside Briand','00:45:00','Type4T2','Livreur3',9),(11,'2024-06-13 17:30:00','En cours','4 Avenue de Buisson','00:10:00','Type5T1','Livreur4',3),(12,'2024-06-13 18:00:00','Offerte','4 Avenue de Buisson','00:55:00','Type6T3','Livreur5',3);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_insert_commande` BEFORE INSERT ON `commande` FOR EACH ROW BEGIN
    DECLARE livreur_occupe INT;

    -- On Vérifie si le livreur est déjà assigné à une commande en cours
    SELECT COUNT(*) INTO livreur_occupe 
    FROM Commande 
    WHERE idLivreur = NEW.idLivreur 
    AND statutCommande = 'En cours';

    IF livreur_occupe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Le livreur n\'est pas disponible.';
    END IF;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_commande_statut` BEFORE UPDATE ON `commande` FOR EACH ROW BEGIN
    IF OLD.statutCommande IN ('Livrée', 'Annulée', 'Offerte') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Vous ne pouvez pas modifier une commande qui est déjà Livrée, Annulée ou Offerte.';
    END IF;
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
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_update_statut_commande` AFTER UPDATE ON `commande` FOR EACH ROW BEGIN
    DECLARE dureeLivraison INT;
    DECLARE pizzas_livrees INT;
    DECLARE pizza_gratuite BOOLEAN DEFAULT FALSE;
    DECLARE prixPizza DECIMAL(5,2);

    -- On Calcule la durée de livraison en minutes si la commande est livrée
    IF NEW.statutCommande = 'Livrée' AND OLD.statutCommande != 'Livrée' THEN
        SET dureeLivraison = TIMESTAMPDIFF(MINUTE, NEW.dateCommande, NOW());
        UPDATE Commande
        SET tempsDeLivraison = SEC_TO_TIME(dureeLivraison * 60)
        WHERE numCommande = NEW.numCommande;

        -- On vérifie si la durée de livraison dépasse 30 minutes
        IF dureeLivraison > 30 THEN
            SET pizza_gratuite = TRUE;
            UPDATE Livreur
            SET nbRetard = nbRetard + 1
            WHERE idLivreur = NEW.idLivreur;
        END IF;

        -- On Vérifie si le client a droit à une pizza gratuite pour fidélité
        SELECT COUNT(*) INTO pizzas_livrees 
        FROM Commande 
        WHERE idClient = NEW.idClient AND statutCommande = 'Livrée';

        IF pizzas_livrees % 10 = 0 THEN
            SET pizza_gratuite = TRUE;
        END IF;

        -- Si la pizza est gratuite, ne pas facturer le client
        IF pizza_gratuite THEN
            -- Pas de débit du solde
            UPDATE Commande
            SET statutCommande = 'Offerte'
            WHERE numCommande = NEW.numCommande;
        ELSE
            -- Sinon On récupére le prix de la pizza commandée
            SELECT PrixPizza INTO prixPizza 
            FROM Pizza 
            WHERE idPizza = NEW.idPizza;

            -- On Débite le compte du client
            UPDATE Client
            SET SoldeCompte = SoldeCompte - prixPizza
            WHERE idClient = NEW.idClient;
        END IF;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `idIngredient` varchar(15) NOT NULL,
  `nomIngredient` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idIngredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES ('I1','Tomate'),('I10','Basilic'),('I12','Sauce Barbecue'),('I13','Sauce Blanche'),('I14','Sauce Tomate'),('I2','Fromage'),('I3','Pepperoni'),('I4','Viande Hachée'),('I5','Saucisses'),('I6','Poulet'),('I7','Oignons'),('I8','Poivrons'),('I9','Champignons');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livreur` (
  `idLivreur` varchar(15) NOT NULL,
  `nomLivreur` varchar(20) DEFAULT NULL,
  `prenomLivreur` varchar(20) DEFAULT NULL,
  `numeroTelephoneLivreur` varchar(15) DEFAULT NULL,
  `nbRetard` int DEFAULT NULL,
  PRIMARY KEY (`idLivreur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livreur`
--

LOCK TABLES `livreur` WRITE;
/*!40000 ALTER TABLE `livreur` DISABLE KEYS */;
INSERT INTO `livreur` VALUES ('Livreur1','Dupont','Jean','0612345678',2),('Livreur2','Martin','Luc','0698765432',5),('Livreur3','Lopez','Marie','0654321987',0),('Livreur4','Barbara','kevin','0654321987',10),('Livreur5','Chen','Michel','0654321987',0),('Livreur6','Gregori','Luca','0654321987',7),('Livreur7','Dubois','Margaux','0654321987',3);
/*!40000 ALTER TABLE `livreur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza` (
  `idPizza` varchar(15) NOT NULL,
  `PrixPizza` decimal(5,2) DEFAULT NULL,
  `idTaille` varchar(15) NOT NULL,
  `idTypePizza` varchar(15) NOT NULL,
  PRIMARY KEY (`idPizza`),
  KEY `idTaille` (`idTaille`),
  KEY `idTypePizza` (`idTypePizza`),
  CONSTRAINT `pizza_ibfk_1` FOREIGN KEY (`idTaille`) REFERENCES `taille` (`idTaille`),
  CONSTRAINT `pizza_ibfk_2` FOREIGN KEY (`idTypePizza`) REFERENCES `typepizza` (`idTypePizza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES ('Type1T1',6.65,'T1','Type1'),('Type1T2',9.50,'T2','Type1'),('Type1T3',12.35,'T3','Type1'),('Type2T1',7.53,'T1','Type2'),('Type2T2',10.75,'T2','Type2'),('Type2T3',13.98,'T3','Type2'),('Type3T1',8.65,'T1','Type3'),('Type3T2',12.35,'T2','Type3'),('Type3T3',16.06,'T3','Type3'),('Type4T1',9.66,'T1','Type4'),('Type4T2',13.80,'T2','Type4'),('Type4T3',17.94,'T3','Type4'),('Type5T1',7.69,'T1','Type5'),('Type5T2',10.99,'T2','Type5'),('Type5T3',14.29,'T3','Type5'),('Type6T1',7.69,'T1','Type6'),('Type6T2',10.99,'T2','Type6'),('Type6T3',14.29,'T3','Type6');
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secompose`
--

DROP TABLE IF EXISTS `secompose`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secompose` (
  `idTypePizza` varchar(15) NOT NULL,
  `idIngredient` varchar(15) NOT NULL,
  PRIMARY KEY (`idTypePizza`,`idIngredient`),
  KEY `idIngredient` (`idIngredient`),
  CONSTRAINT `secompose_ibfk_1` FOREIGN KEY (`idTypePizza`) REFERENCES `typepizza` (`idTypePizza`),
  CONSTRAINT `secompose_ibfk_2` FOREIGN KEY (`idIngredient`) REFERENCES `ingredients` (`idIngredient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secompose`
--

LOCK TABLES `secompose` WRITE;
/*!40000 ALTER TABLE `secompose` DISABLE KEYS */;
INSERT INTO `secompose` VALUES ('Type4','I1'),('Type3','I12'),('Type4','I13'),('Type5','I13'),('Type6','I13'),('Type1','I14'),('Type2','I14'),('Type1','I2'),('Type2','I2'),('Type3','I2'),('Type5','I2'),('Type6','I2'),('Type2','I3'),('Type3','I4'),('Type3','I5'),('Type3','I6'),('Type5','I6'),('Type4','I7'),('Type5','I7'),('Type6','I7'),('Type4','I8'),('Type6','I8'),('Type5','I9'),('Type6','I9');
/*!40000 ALTER TABLE `secompose` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taille`
--

DROP TABLE IF EXISTS `taille`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taille` (
  `idTaille` varchar(15) NOT NULL,
  `taille` varchar(15) DEFAULT NULL,
  `coefficientPrix` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`idTaille`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taille`
--

LOCK TABLES `taille` WRITE;
/*!40000 ALTER TABLE `taille` DISABLE KEYS */;
INSERT INTO `taille` VALUES ('T1','Naine',0.70),('T2','Humaine',1.00),('T3','Ogresse',1.30);
/*!40000 ALTER TABLE `taille` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `typepizza`
--

DROP TABLE IF EXISTS `typepizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `typepizza` (
  `idTypePizza` varchar(15) NOT NULL,
  `nomPizza` varchar(20) NOT NULL,
  `prixBase` decimal(5,2) NOT NULL,
  PRIMARY KEY (`idTypePizza`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `typepizza`
--

LOCK TABLES `typepizza` WRITE;
/*!40000 ALTER TABLE `typepizza` DISABLE KEYS */;
INSERT INTO `typepizza` VALUES ('Type1','Margherita',9.50),('Type2','Pepperoni',10.75),('Type3','Cannibale',12.35),('Type4','Végétarienne',13.80),('Type5','Indienne',10.99),('Type6','Spéciale Champis',10.99);
/*!40000 ALTER TABLE `typepizza` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilise`
--

DROP TABLE IF EXISTS `utilise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utilise` (
  `numImmVehicule` varchar(10) NOT NULL,
  `idLivreur` varchar(15) NOT NULL,
  PRIMARY KEY (`numImmVehicule`,`idLivreur`),
  KEY `idLivreur` (`idLivreur`),
  CONSTRAINT `utilise_ibfk_1` FOREIGN KEY (`numImmVehicule`) REFERENCES `vehicule` (`numImmVehicule`),
  CONSTRAINT `utilise_ibfk_2` FOREIGN KEY (`idLivreur`) REFERENCES `livreur` (`idLivreur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilise`
--

LOCK TABLES `utilise` WRITE;
/*!40000 ALTER TABLE `utilise` DISABLE KEYS */;
INSERT INTO `utilise` VALUES ('V1','Livreur1'),('V2','Livreur1'),('V3','Livreur2'),('V4','Livreur3'),('V5','Livreur3'),('V6','Livreur3'),('V7','Livreur4'),('V2','Livreur5'),('V8','Livreur5'),('V5','Livreur6'),('V4','Livreur7');
/*!40000 ALTER TABLE `utilise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicule`
--

DROP TABLE IF EXISTS `vehicule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicule` (
  `numImmVehicule` varchar(10) NOT NULL,
  `typeVehicule` varchar(10) NOT NULL,
  PRIMARY KEY (`numImmVehicule`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicule`
--

LOCK TABLES `vehicule` WRITE;
/*!40000 ALTER TABLE `vehicule` DISABLE KEYS */;
INSERT INTO `vehicule` VALUES ('V1','voiture'),('V10','moto'),('V2','moto'),('V3','voiture'),('V4','voiture'),('V5','voiture'),('V6','moto'),('V7','moto'),('V8','voiture'),('V9','voiture');
/*!40000 ALTER TABLE `vehicule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'rapizz'
--
/*!50003 DROP PROCEDURE IF EXISTS `chiffreAffaires` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `chiffreAffaires`()
BEGIN
    SELECT SUM(PrixPizza) AS chiffre_affaires
    FROM Commande
    JOIN Pizza ON Commande.idPizza = Pizza.idPizza
    WHERE statutCommande = 'Livrée';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ficheLivraison` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ficheLivraison`()
BEGIN
	 SELECT L.nomLivreur, L.prenomLivreur, V.typeVehicule, Cl.nomClient, Cl.prenomClient, Co.dateCommande, 
		   CASE WHEN Co.tempsDeLivraison > 30 THEN 'Oui' ELSE 'Non' END AS retard, 
		   TP.nomPizza, TP.prixBase
	FROM Commande Co
	JOIN Livreur L ON Co.idLivreur = L.idLivreur
	JOIN Utilise U ON L.idLivreur = U.idLivreur
	JOIN Vehicule V ON U.numImmVehicule = V.numImmVehicule
	JOIN Client Cl ON Co.idClient = Cl.idClient
	JOIN Pizza P ON Co.idPizza = P.idPizza
	JOIN TypePizza TP ON P.idTypePizza = TP.idTypePizza
	WHERE Co.statutCommande IN ('En cours', 'livrée', 'offerte');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ingredientFavori` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ingredientFavori`()
BEGIN
	SELECT I.nomIngredient, COUNT(S.idIngredient) AS nombreUtilisations
	FROM SeCompose S
	JOIN Ingredients I ON S.idIngredient = I.idIngredient
	GROUP BY I.nomIngredient
	ORDER BY nombreUtilisations DESC
	LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertTypePizza` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertTypePizza`(
    IN p_idTypePizza VARCHAR(15),
    IN p_nomPizza VARCHAR(20),
    IN p_prixBase DECIMAL(5,2)
)
BEGIN
    DECLARE basePrix DECIMAL(5,2);
    DECLARE coefficient DECIMAL(5,2);
    DECLARE prixFinal DECIMAL(5,2);
    DECLARE tailleID VARCHAR(15);

    DECLARE done INT DEFAULT 0;
    -- Déclaration du curseur pour sélectionner les tailles et les coefficients
    DECLARE taille_cursor CURSOR FOR SELECT idTaille, coefficientPrix FROM Taille;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- Inséretion du type de pizza dans la table TypePizza
    INSERT INTO TypePizza (idTypePizza, nomPizza, prixBase)
    VALUES (p_idTypePizza, p_nomPizza, p_prixBase);

    SET basePrix = p_prixBase;

    -- Open the cursor
    OPEN taille_cursor;

    read_loop: LOOP
        FETCH taille_cursor INTO tailleID, coefficient;

        IF done THEN
            LEAVE read_loop;
        END IF;

        SET prixFinal = basePrix * coefficient;

        -- On Génére un nouvel identifiant unique pour idPizza
        SET @newIdPizza = CONCAT(p_idTypePizza, tailleID);

        -- Instruction de débogage
        SELECT @newIdPizza, prixFinal, tailleID, p_idTypePizza;

        INSERT INTO Pizza (idPizza, PrixPizza, idTaille, idTypePizza)
        VALUES (@newIdPizza, prixFinal, tailleID, p_idTypePizza);
    END LOOP;

    -- Close the cursor
    CLOSE taille_cursor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `meilleurClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `meilleurClient`()
BEGIN
    SELECT 
        Client.idClient, 
        Client.nomClient, 
        Client.prenomClient, 
        SUM(Pizza.PrixPizza) AS montant_total_depense
    FROM Client
    JOIN Commande ON Client.idClient = Commande.idClient
    JOIN Pizza ON Commande.idPizza = Pizza.idPizza
    WHERE Commande.statutCommande = 'Livrée'
    GROUP BY Client.idClient, Client.nomClient, Client.prenomClient
    ORDER BY montant_total_depense DESC
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `menu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `menu`()
BEGIN
    SELECT TP.nomPizza, T.taille, P.PrixPizza, GROUP_CONCAT(I.nomIngredient SEPARATOR ', ') AS ingredients
    FROM Pizza P 
    JOIN Taille T ON P.idTaille = T.idTaille
    JOIN TypePizza TP ON P.idTypePizza = TP.idTypePizza
    JOIN SeCompose S ON TP.idTypePizza = S.idTypePizza
    JOIN Ingredients I ON S.idIngredient = I.idIngredient
    GROUP BY TP.nomPizza, T.taille, P.PrixPizza;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `moyenneCommande` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `moyenneCommande`()
BEGIN
	SELECT AVG(P.PrixPizza) AS moyenne_prix_commandes
	FROM Commande Co
	JOIN Pizza P ON Co.idPizza = P.idPizza
	WHERE Co.statutCommande = 'Livrée';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nbCommandeParClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nbCommandeParClient`()
BEGIN
	SELECT Cl.idClient, Cl.nomClient, Cl.prenomClient, COUNT(Co.numCommande) AS nombre_commandes
	FROM Client Cl
	LEFT JOIN Commande Co ON Cl.idClient = Co.idClient
	GROUP BY Cl.idClient, Cl.nomClient, Cl.prenomClient;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PizzaMoinsDemandee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PizzaMoinsDemandee`()
BEGIN
    SELECT 
        Pizza.idPizza, 
        TypePizza.nomPizza, 
        Taille.taille,
        COUNT(Commande.numCommande) AS nombre_commandes
    FROM Commande
    JOIN Pizza ON Commande.idPizza = Pizza.idPizza
    JOIN TypePizza ON Pizza.idTypePizza = TypePizza.idTypePizza
    JOIN Taille ON Pizza.idTaille = Taille.idTaille
    GROUP BY Pizza.idPizza, TypePizza.nomPizza, Taille.taille
    ORDER BY nombre_commandes ASC
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PizzaPlusdemandee` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PizzaPlusdemandee`()
BEGIN
    SELECT 
        Pizza.idPizza, 
        TypePizza.nomPizza, 
        Taille.taille,
        Pizza.PrixPizza,
        COUNT(Commande.numCommande) AS nombre_commandes
    FROM Commande
    JOIN Pizza ON Commande.idPizza = Pizza.idPizza
    JOIN TypePizza ON Pizza.idTypePizza = TypePizza.idTypePizza
    JOIN Taille ON Pizza.idTaille = Taille.idTaille
    GROUP BY Pizza.idPizza, TypePizza.nomPizza, Taille.taille
    ORDER BY nombre_commandes DESC
    LIMIT 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PlusMauvaisLivreur` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PlusMauvaisLivreur`()
BEGIN
    SELECT *
    FROM Livreur L
    ORDER BY L.nbRetard DESC
    Limit 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `vehiculeNonUtilise` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `vehiculeNonUtilise`()
BEGIN
    SELECT V.numImmVehicule, V.typeVehicule
    FROM Vehicule V
    LEFT JOIN Utilise U ON V.numImmVehicule = U.numImmVehicule
    WHERE U.numImmVehicule IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-14 10:52:24
