-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 13, 2024 at 11:37 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pizza`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `chiffreAffaires` ()   BEGIN
    SELECT SUM(PrixPizza) AS chiffre_affaires
    FROM Commande
    JOIN Pizza ON Commande.idPizza = Pizza.idPizza
    WHERE statutCommande = 'Livrée';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ficheLivraison` ()   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ingredientFavori` ()   BEGIN
	SELECT I.nomIngredient, COUNT(S.idIngredient) AS nombreUtilisations
	FROM SeCompose S
	JOIN Ingredients I ON S.idIngredient = I.idIngredient
	GROUP BY I.nomIngredient
	ORDER BY nombreUtilisations DESC
	LIMIT 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertTypePizza` (IN `p_idTypePizza` VARCHAR(15), IN `p_nomPizza` VARCHAR(20), IN `p_prixBase` DECIMAL(5,2))   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `meilleurClient` ()   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `menu` ()   BEGIN
	SELECT TP.nomPizza, P.PrixPizza, GROUP_CONCAT(I.nomIngredient SEPARATOR ', ') AS ingredients
	FROM Pizza P
	JOIN TypePizza TP ON P.idTypePizza = TP.idTypePizza
	JOIN SeCompose S ON TP.idTypePizza = S.idTypePizza
	JOIN Ingredients I ON S.idIngredient = I.idIngredient
	GROUP BY TP.nomPizza, P.PrixPizza;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `moyenneCommande` ()   BEGIN
	SELECT AVG(P.PrixPizza) AS moyenne_prix_commandes
	FROM Commande Co
	JOIN Pizza P ON Co.idPizza = P.idPizza
	WHERE Co.statutCommande = 'Livrée';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nbCommandeParClient` ()   BEGIN
	SELECT Cl.idClient, Cl.nomClient, Cl.prenomClient, COUNT(Co.numCommande) AS nombre_commandes
	FROM Client Cl
	LEFT JOIN Commande Co ON Cl.idClient = Co.idClient
	GROUP BY Cl.idClient, Cl.nomClient, Cl.prenomClient;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PizzaMoinsDemandee` ()   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PizzaPlusdemandee` ()   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PlusMauvaisLivreur` ()   BEGIN
    SELECT *
    FROM Livreur L
    ORDER BY L.nbRetard DESC
    Limit 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `PlusMauvaisLivreur_` ()   BEGIN
    SELECT L.idLivreur, L.nomLivreur, L.prenomLivreur, L.nbRetard, U.numImmVehicule
    FROM Livreur L
    JOIN Utilise U ON L.idLivreur = U.idLivreur
    ORDER BY L.nbRetard DESC
    LIMIT 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `vehiculeNonUtilise` ()   BEGIN
    SELECT V.numImmVehicule, V.typeVehicule
    FROM Vehicule V
    LEFT JOIN Utilise U ON V.numImmVehicule = U.numImmVehicule
    WHERE U.numImmVehicule IS NULL;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `nomClient` varchar(15) DEFAULT NULL,
  `prenomClient` varchar(15) DEFAULT NULL,
  `adresseClient` varchar(50) DEFAULT NULL,
  `emailClient` varchar(30) DEFAULT NULL,
  `numeroTelephoneClient` varchar(15) DEFAULT NULL,
  `SoldeCompte` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`idClient`, `nomClient`, `prenomClient`, `adresseClient`, `emailClient`, `numeroTelephoneClient`, `SoldeCompte`) VALUES
(1, 'Derrez', 'Jonathan', '35 Rue Maurice Bécanne', 'jonathan.derrez@gmail.com', '0654321890', '200.99'),
(2, 'Gregorie', 'Paul', '4 Avue du Régiment', 'paul.gregorie@gmail.com', '0612345698', '24.56'),
(3, 'DEHMANI', 'Manar', '4 Avenue de Buisson', 'manar.dehmani@gamil.com', '0678912345', '127.45'),
(4, 'Moreau', 'David', '2 Boulevard de la Mer', 'david.moreau@gamil.com', '0634567890', '60.78'),
(6, 'CHEBLI', 'Wiem', '10 Place de la Liberté', 'wiem.chebli@gmail.com', '0687654321', '5.20'),
(7, 'Roux', 'Elise', '8 Place de la République', 'elise.roux@gmail.com', '0701658921', '70.32'),
(8, 'Poiteaux', 'Justine', '2 Rue de la mairie', 'justine.poiteaux@gmail.com', '0647214300', '0.00'),
(9, 'Robert', 'Martine', '35 Avenue Artiside Briand', 'martine.robert@gmail.com', '0725543210', '43.15');

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `numCommande` int(11) NOT NULL,
  `dateCommande` datetime DEFAULT NULL,
  `statutCommande` varchar(10) DEFAULT NULL,
  `adresseLivraison` varchar(50) DEFAULT NULL,
  `tempsDeLivraison` time DEFAULT NULL,
  `idPizza` varchar(15) NOT NULL,
  `idLivreur` varchar(15) NOT NULL,
  `idClient` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`numCommande`, `dateCommande`, `statutCommande`, `adresseLivraison`, `tempsDeLivraison`, `idPizza`, `idLivreur`, `idClient`) VALUES
(1, '2024-06-13 12:30:00', 'Livrée', '35 Rue Maurice Bécanne', '00:30:00', 'Type1T2', 'Livreur1', 1),
(2, '2024-06-13 13:00:00', 'Livrée', '35 Rue Maurice Bécanne', '00:20:00', 'Type2T2', 'Livreur2', 1),
(3, '2024-06-13 13:15:00', 'offerte', '35 Rue Maurice Bécanne', '00:40:00', 'Type3T3', 'Livreur3', 1),
(4, '2024-06-13 14:00:00', 'Livrée', '35 Rue Maurice Bécanne', '00:25:00', 'Type4T2', 'Livreur4', 1),
(5, '2024-06-13 14:30:00', 'Livrée', '35 Rue Maurice Bécanne', '00:25:00', 'Type5T1', 'Livreur5', 1),
(6, '2024-06-13 15:00:00', 'Livrée', '4 Avue du Régiment', '00:30:00', 'Type6T3', 'Livreur6', 2),
(7, '2024-06-13 15:30:00', 'Annulée', '2 Rue de la mairie', '00:00:00', 'Type1T1', 'Livreur7', 8),
(8, '2024-06-13 16:00:00', 'Offerte', '35 Avenue Artiside Briand', '00:50:00', 'Type2T2', 'Livreur1', 9),
(9, '2024-06-13 16:30:00', 'Livrée', '35 Avenue Artiside Briand', '00:30:00', 'Type3T3', 'Livreur2', 9),
(10, '2024-06-13 17:00:00', 'En cours', '35 Avenue Artiside Briand', '00:45:00', 'Type4T2', 'Livreur3', 9),
(11, '2024-06-13 17:30:00', 'En cours', '4 Avenue de Buisson', '00:10:00', 'Type5T1', 'Livreur4', 3),
(12, '2024-06-13 18:00:00', 'Offerte', '4 Avenue de Buisson', '00:55:00', 'Type6T3', 'Livreur5', 3);

--
-- Triggers `commande`
--
DELIMITER $$
CREATE TRIGGER `after_update_statut_commande` AFTER UPDATE ON `commande` FOR EACH ROW BEGIN
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
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert_commande` BEFORE INSERT ON `commande` FOR EACH ROW BEGIN
    DECLARE livreur_occupe INT;

    -- On Vérifie si le livreur est déjà assigné à une commande en cours
    SELECT COUNT(*) INTO livreur_occupe 
    FROM Commande 
    WHERE idLivreur = NEW.idLivreur 
    AND statutCommande = 'En cours';

    IF livreur_occupe > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Le livreur n''est pas disponible.';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_insert_commande_solde` BEFORE INSERT ON `commande` FOR EACH ROW BEGIN
    DECLARE prixPizza DECIMAL(5,2);
    DECLARE soldeClient DECIMAL(7,2);

    -- Récupère le prix de la pizza commandée
    SELECT PrixPizza INTO prixPizza 
    FROM Pizza 
    WHERE idPizza = NEW.idPizza;

    -- Récupère le solde du client
    SELECT SoldeCompte INTO soldeClient
    FROM Client
    WHERE idClient = NEW.idClient;

    -- Vérifie si le client a suffisamment de solde pour payer la pizza
    IF soldeClient < prixPizza THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Le solde du compte client est insuffisant.';
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_commande_statut` BEFORE UPDATE ON `commande` FOR EACH ROW BEGIN
    IF OLD.statutCommande IN ('Livrée', 'Annulée', 'Offerte') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Vous ne pouvez pas modifier une commande qui est déjà Livrée, Annulée ou Offerte.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `idIngredient` varchar(15) NOT NULL,
  `nomIngredient` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`idIngredient`, `nomIngredient`) VALUES
('I1', 'Tomate'),
('I10', 'Basilic'),
('I12', 'Sauce Barbecue'),
('I13', 'Sauce Blanche'),
('I14', 'Sauce Tomate'),
('I2', 'Fromage'),
('I3', 'Pepperoni'),
('I4', 'Viande Hachée'),
('I5', 'Saucisses'),
('I6', 'Poulet'),
('I7', 'Oignons'),
('I8', 'Poivrons'),
('I9', 'Champignons');

-- --------------------------------------------------------

--
-- Table structure for table `livreur`
--

CREATE TABLE `livreur` (
  `idLivreur` varchar(15) NOT NULL,
  `nomLivreur` varchar(20) DEFAULT NULL,
  `prenomLivreur` varchar(20) DEFAULT NULL,
  `numeroTelephoneLivreur` varchar(15) DEFAULT NULL,
  `nbRetard` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `livreur`
--

INSERT INTO `livreur` (`idLivreur`, `nomLivreur`, `prenomLivreur`, `numeroTelephoneLivreur`, `nbRetard`) VALUES
('Livreur1', 'Dupont', 'Jean', '0612345678', 2),
('Livreur2', 'Martin', 'Luc', '0698765432', 5),
('Livreur3', 'Lopez', 'Marie', '0654321987', 0),
('Livreur4', 'Barbara', 'kevin', '0654321987', 10),
('Livreur5', 'Chen', 'Michel', '0654321987', 0),
('Livreur6', 'Gregori', 'Luca', '0654321987', 7),
('Livreur7', 'Dubois', 'Margaux', '0654321987', 3);

-- --------------------------------------------------------

--
-- Table structure for table `pizza`
--

CREATE TABLE `pizza` (
  `idPizza` varchar(15) NOT NULL,
  `PrixPizza` decimal(5,2) DEFAULT NULL,
  `idTaille` varchar(15) NOT NULL,
  `idTypePizza` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pizza`
--

INSERT INTO `pizza` (`idPizza`, `PrixPizza`, `idTaille`, `idTypePizza`) VALUES
('Type1T1', '9.50', 'T1', 'Type1'),
('Type1T2', '6.65', 'T2', 'Type1'),
('Type2T2', '7.53', 'T2', 'Type2'),
('Type3T3', '16.06', 'T3', 'Type3'),
('Type4T2', '17.94', 'T2', 'Type4'),
('Type5T1', '10.99', 'T1', 'Type5'),
('Type6T3', '14.29', 'T3', 'Type6');

-- --------------------------------------------------------

--
-- Table structure for table `secompose`
--

CREATE TABLE `secompose` (
  `idTypePizza` varchar(15) NOT NULL,
  `idIngredient` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `secompose`
--

INSERT INTO `secompose` (`idTypePizza`, `idIngredient`) VALUES
('Type1', 'I14'),
('Type1', 'I2'),
('Type2', 'I14'),
('Type2', 'I2'),
('Type2', 'I3'),
('Type3', 'I12'),
('Type3', 'I2'),
('Type3', 'I4'),
('Type3', 'I5'),
('Type3', 'I6'),
('Type4', 'I1'),
('Type4', 'I13'),
('Type4', 'I7'),
('Type4', 'I8'),
('Type5', 'I13'),
('Type5', 'I2'),
('Type5', 'I6'),
('Type5', 'I7'),
('Type5', 'I9'),
('Type6', 'I13'),
('Type6', 'I2'),
('Type6', 'I7'),
('Type6', 'I8'),
('Type6', 'I9');

-- --------------------------------------------------------

--
-- Table structure for table `taille`
--

CREATE TABLE `taille` (
  `idTaille` varchar(15) NOT NULL,
  `taille` varchar(15) DEFAULT NULL,
  `coefficientPrix` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `taille`
--

INSERT INTO `taille` (`idTaille`, `taille`, `coefficientPrix`) VALUES
('T1', 'Naine', '0.70'),
('T2', 'Humaine', '1.00'),
('T3', 'Ogresse', '1.30');

-- --------------------------------------------------------

--
-- Table structure for table `typepizza`
--

CREATE TABLE `typepizza` (
  `idTypePizza` varchar(15) NOT NULL,
  `nomPizza` varchar(20) NOT NULL,
  `prixBase` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `typepizza`
--

INSERT INTO `typepizza` (`idTypePizza`, `nomPizza`, `prixBase`) VALUES
('Type1', 'Margherita', '9.50'),
('Type2', 'Pepperoni', '10.75'),
('Type3', 'Cannibale', '12.35'),
('Type4', 'Végétarienne', '13.80'),
('Type5', 'Indienne', '10.99'),
('Type6', 'Spéciale Champis', '10.99');

-- --------------------------------------------------------

--
-- Table structure for table `utilise`
--

CREATE TABLE `utilise` (
  `numImmVehicule` varchar(10) NOT NULL,
  `idLivreur` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `utilise`
--

INSERT INTO `utilise` (`numImmVehicule`, `idLivreur`) VALUES
('V1', 'Livreur1'),
('V2', 'Livreur1'),
('V2', 'Livreur5'),
('V3', 'Livreur2'),
('V4', 'Livreur3'),
('V4', 'Livreur7'),
('V5', 'Livreur3'),
('V5', 'Livreur6'),
('V6', 'Livreur3'),
('V7', 'Livreur4'),
('V8', 'Livreur5');

-- --------------------------------------------------------

--
-- Table structure for table `vehicule`
--

CREATE TABLE `vehicule` (
  `numImmVehicule` varchar(10) NOT NULL,
  `typeVehicule` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicule`
--

INSERT INTO `vehicule` (`numImmVehicule`, `typeVehicule`) VALUES
('V1', 'voiture'),
('V10', 'moto'),
('V2', 'moto'),
('V3', 'voiture'),
('V4', 'voiture'),
('V5', 'voiture'),
('V6', 'moto'),
('V7', 'moto'),
('V8', 'voiture'),
('V9', 'voiture');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`numCommande`),
  ADD KEY `idPizza` (`idPizza`),
  ADD KEY `idLivreur` (`idLivreur`),
  ADD KEY `idClient` (`idClient`);

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`idIngredient`);

--
-- Indexes for table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`idLivreur`);

--
-- Indexes for table `pizza`
--
ALTER TABLE `pizza`
  ADD PRIMARY KEY (`idPizza`),
  ADD KEY `idTaille` (`idTaille`),
  ADD KEY `idTypePizza` (`idTypePizza`);

--
-- Indexes for table `secompose`
--
ALTER TABLE `secompose`
  ADD PRIMARY KEY (`idTypePizza`,`idIngredient`),
  ADD KEY `idIngredient` (`idIngredient`);

--
-- Indexes for table `taille`
--
ALTER TABLE `taille`
  ADD PRIMARY KEY (`idTaille`);

--
-- Indexes for table `typepizza`
--
ALTER TABLE `typepizza`
  ADD PRIMARY KEY (`idTypePizza`);

--
-- Indexes for table `utilise`
--
ALTER TABLE `utilise`
  ADD PRIMARY KEY (`numImmVehicule`,`idLivreur`),
  ADD KEY `idLivreur` (`idLivreur`);

--
-- Indexes for table `vehicule`
--
ALTER TABLE `vehicule`
  ADD PRIMARY KEY (`numImmVehicule`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`idPizza`) REFERENCES `pizza` (`idPizza`),
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`idLivreur`) REFERENCES `livreur` (`idLivreur`),
  ADD CONSTRAINT `commande_ibfk_3` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`);

--
-- Constraints for table `pizza`
--
ALTER TABLE `pizza`
  ADD CONSTRAINT `pizza_ibfk_1` FOREIGN KEY (`idTaille`) REFERENCES `taille` (`idTaille`),
  ADD CONSTRAINT `pizza_ibfk_2` FOREIGN KEY (`idTypePizza`) REFERENCES `typepizza` (`idTypePizza`);

--
-- Constraints for table `secompose`
--
ALTER TABLE `secompose`
  ADD CONSTRAINT `secompose_ibfk_1` FOREIGN KEY (`idTypePizza`) REFERENCES `typepizza` (`idTypePizza`),
  ADD CONSTRAINT `secompose_ibfk_2` FOREIGN KEY (`idIngredient`) REFERENCES `ingredients` (`idIngredient`);

--
-- Constraints for table `utilise`
--
ALTER TABLE `utilise`
  ADD CONSTRAINT `utilise_ibfk_1` FOREIGN KEY (`numImmVehicule`) REFERENCES `vehicule` (`numImmVehicule`),
  ADD CONSTRAINT `utilise_ibfk_2` FOREIGN KEY (`idLivreur`) REFERENCES `livreur` (`idLivreur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
