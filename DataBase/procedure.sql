/* Procédure stockée qui permet d'insérer les données dans la table TypePizza 
et en même temps elle calcule le prix de pizza selon sa taille et son type 
et stocke automatiquement toutes les combinaisons possibles dans la table pizza*/
DELIMITER //

CREATE PROCEDURE insertTypePizza (
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
END //

DELIMITER ;


/* Procédure stockée qui permet de retourner le meilleur client 
en se basant sur le montant depense et le nombre de commande passé */
DELIMITER //

CREATE PROCEDURE meilleurClient()
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
END //

DELIMITER ;


-- Procédure Stockée permet d'identifier la pizza la plus demandée
DELIMITER //
CREATE PROCEDURE PizzaPlusdemandee()
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
END //
DELIMITER ;

-- Procédure Stcokée permet d'identifer la pizza la moins demandée
DELIMITER //
CREATE PROCEDURE PizzaMoinsDemandee()
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
END //
DELIMITER ;

-- Procédure stockée permet de récupérer l'ingrédient Favori
DELIMITER //
CREATE PROCEDURE ingredientFavori()
BEGIN
	SELECT I.nomIngredient, COUNT(S.idIngredient) AS nombreUtilisations
	FROM SeCompose S
	JOIN Ingredients I ON S.idIngredient = I.idIngredient
	GROUP BY I.nomIngredient
	ORDER BY nombreUtilisations DESC
	LIMIT 1;
END //
DELIMITER ;

-- Procédure Stcokée permet d'identifier le plus mauvais livreur en se basant sur le nombre de retard
DELIMITER //
CREATE PROCEDURE PlusMauvaisLivreur_()
BEGIN
    SELECT L.idLivreur, L.nomLivreur, L.prenomLivreur, L.nbRetard, U.numImmVehicule
    FROM Livreur L
    JOIN Utilise U ON L.idLivreur = U.idLivreur
    ORDER BY L.nbRetard DESC
    LIMIT 1;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE PlusMauvaisLivreur()
BEGIN
    SELECT *
    FROM Livreur L
    ORDER BY L.nbRetard DESC
    Limit 1;
END //
DELIMITER ;

-- Procédure stockée permet d'identifier la ou les véhicules non utilisé
DELIMITER //
CREATE PROCEDURE vehiculeNonUtilise()
BEGIN
    SELECT V.numImmVehicule, V.typeVehicule
    FROM Vehicule V
    LEFT JOIN Utilise U ON V.numImmVehicule = U.numImmVehicule
    WHERE U.numImmVehicule IS NULL;
END //
DELIMITER ;

-- Procédure Stockée permet d'extraire des données pour imprimer le menu (nom de chaque pizza, son prix et les ingrédients)
DELIMITER //
CREATE PROCEDURE menu()
BEGIN
	SELECT TP.nomPizza, P.PrixPizza, GROUP_CONCAT(I.nomIngredient SEPARATOR ', ') AS ingredients
	FROM Pizza P
	JOIN TypePizza TP ON P.idTypePizza = TP.idTypePizza
	JOIN SeCompose S ON TP.idTypePizza = S.idTypePizza
	JOIN Ingredients I ON S.idIngredient = I.idIngredient
	GROUP BY TP.nomPizza, P.PrixPizza;
END //
DELIMITER ;

-- Procédure Stockée permet d'imprimer la fiche de la livraison d'une commande
DELIMITER //
CREATE PROCEDURE ficheLivraison()
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
END //
DELIMITER ;

-- Procédure Stcokée permet de calculer le nombre de commande par client 
DELIMITER //
CREATE PROCEDURE nbCommandeParClient()
BEGIN
	SELECT Cl.idClient, Cl.nomClient, Cl.prenomClient, COUNT(Co.numCommande) AS nombre_commandes
	FROM Client Cl
	LEFT JOIN Commande Co ON Cl.idClient = Co.idClient
	GROUP BY Cl.idClient, Cl.nomClient, Cl.prenomClient;
END //
DELIMITER ;

-- Procédure Stockée permet de calculer la moyenne du prix des commandes livrées
DELIMITER //
CREATE PROCEDURE moyenneCommande()
BEGIN
	SELECT AVG(P.PrixPizza) AS moyenne_prix_commandes
	FROM Commande Co
	JOIN Pizza P ON Co.idPizza = P.idPizza
	WHERE Co.statutCommande = 'Livrée';
END //
DELIMITER ;

-- Procédure Stockée qui permet d'extraire des clients ayant commandé plus que la moyenne du prix des commandes livrées
DELIMITER //

CREATE PROCEDURE clientPlusMoyenneCommande()
BEGIN
WITH moyenneCommande AS (
    SELECT AVG(P.PrixPizza) AS moyenne
    FROM Commande Co
    JOIN Pizza P ON Co.idPizza = P.idPizza
    WHERE Co.statutCommande = 'livrée'
)
SELECT Cl.idClient, Cl.nomClient, Cl.prenomClient, SUM(P.PrixPizza) AS total_prix_commandes
FROM Client Cl
JOIN Commande Co ON Cl.idClient = Co.idClient
JOIN Pizza P ON Co.idPizza = P.idPizza
WHERE Co.statutCommande = 'livrée'
GROUP BY Cl.idClient, Cl.nomClient, Cl.prenomClient
HAVING SUM(P.PrixPizza) > (SELECT moyenne FROM moyenne_prix_commandes);

DELIMITER ;

DELIMITER //
CREATE PROCEDURE chiffreAffaires()
BEGIN
    SELECT SUM(PrixPizza) AS chiffre_affaires
    FROM Commande
    JOIN Pizza ON Commande.idPizza = Pizza.idPizza
    WHERE statutCommande = 'Livrée';
END //
DELIMITER ;