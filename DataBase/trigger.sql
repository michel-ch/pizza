-- Trigger qui vérifie si un livreur est disponible avant le rajout d'une commande
DELIMITER //
CREATE TRIGGER before_insert_commande
BEFORE INSERT ON Commande
FOR EACH ROW
BEGIN
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
END //
DELIMITER ;

-- Trigger qui vérifie le solde du client si la commande de la personne n'est pas gratuite 
DELIMITER //
CREATE TRIGGER before_insert_commande_solde
BEFORE INSERT ON Commande
FOR EACH ROW
BEGIN
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
END //
DELIMITER ;

-- Trigger qui permet de gérer la mise à jour de la commande et les conditions de gratuité à la livraison
DELIMITER //
CREATE TRIGGER after_update_statut_commande
AFTER UPDATE ON Commande
FOR EACH ROW
BEGIN
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
END //
DELIMITER ;

-- Trigger qui permet d'empêcher la modification du statut d'une commande terminée
DELIMITER //
CREATE TRIGGER before_update_commande_statut
BEFORE UPDATE ON Commande
FOR EACH ROW
BEGIN
    IF OLD.statutCommande IN ('Livrée', 'Annulée', 'Offerte') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Vous ne pouvez pas modifier une commande qui est déjà Livrée, Annulée ou Offerte.';
    END IF;
END //
DELIMITER ;

UPDATE Commande
SET statutCommande = 'En cours'
WHERE numCommande = 9;
