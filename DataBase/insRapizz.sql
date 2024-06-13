-- Insertion des données dans la table véhicule
INSERT INTO Vehicule (numImmVehicule, typeVehicule)
 VALUES ('V1', 'voiture'),
		('V2', 'moto'),
		('V3', 'voiture'),
		('V4', 'voiture'),
		('V5', 'voiture'),
		('V6', 'moto'),
		('V7', 'moto'),
		('V8', 'voiture'),
		('V9', 'voiture'),
		('V10', 'moto');
-- Insertion dans la table livreur
INSERT INTO Livreur (idLivreur, nomLivreur, prenomLivreur, numeroTelephoneLivreur, nbRetard) 
VALUES  ('Livreur1', 'Dupont', 'Jean', '0612345678', 2),
		('Livreur2', 'Martin', 'Luc', '0698765432', 5),
		('Livreur3', 'Lopez', 'Marie', '0654321987', 0),
		('Livreur4', 'Barbara', 'kevin', '0654321987', 10),
		('Livreur5', 'Chen', 'Michel', '0654321987', 0),
		('Livreur6', 'Gregori', 'Luca', '0654321987', 7),
        ('Livreur7', 'Dubois', 'Margaux', '0654321987', 3);
-- Insertion dans la table utilise
INSERT INTO Utilise (numImmVehicule, idLivreur)
VALUES 
    ('V1', 'Livreur1'),
    ('V2', 'Livreur1'),
    ('V3', 'Livreur2'),
    ('V4', 'Livreur3'),
    ('V5', 'Livreur3'),
    ('V6', 'Livreur3'),
    ('V7', 'Livreur4'),
    ('V8', 'Livreur5'),
    ('V2', 'Livreur5'),
    ('V5', 'Livreur6'),
    ('V4', 'Livreur7'); 
-- Insertion dans la table ingrésient
INSERT INTO Ingredients (idIngredient, nomIngredient) 
VALUES  ('I1', 'Tomate'),
		('I2', 'Fromage'),
		('I3', 'Pepperoni'),
		('I4', 'Viande Hachée'),
		('I5', 'Saucisses'),
		('I6', 'Poulet'),
		('I7', 'Oignons'),
		('I8', 'Poivrons'),
		('I9', 'Champignons'),
		('I10', 'Basilic'),
        ('I12','Sauce Barbecue'),
        ('I13','Sauce Blanche'),
        ('I14','Sauce Tomate');
-- Insertion dans table TypePizza
CALL insertTypePizza('Type1', 'Margherita', 9.50);
CALL insertTypePizza('Type2', 'Pepperoni', 10.75);
CALL insertTypePizza('Type3', 'Cannibale', 12.35);
CALL insertTypePizza('Type4', 'Végétarienne', 13.80);
CALL insertTypePizza('Type5', 'Indienne', 10.99);
CALL insertTypePizza('Type6', 'Spéciale Champis', 10.99);
-- Insertion dans la table se_compose
INSERT INTO  SeCompose (idTypePizza, idIngredient) VALUES 
('Type1', 'I14'), ('Type1','I2'),
('Type2', 'I14'), ('Type2', 'I2'), ('Type2', 'I3'),
('Type3', 'I12'), ('Type3', 'I2'), ('Type3', 'I4'),('Type3', 'I5'), ('Type3', 'I6'),
('Type4', 'I13'), ('Type4', 'I1'), ('Type4', 'I7'), ('Type4', 'I8'),
('Type5', 'I13'), ('Type5', 'I2'),('Type5', 'I9'),  ('Type5', 'I7'), ('Type5', 'I6'),
('Type6', 'I13'), ('Type6', 'I2'), ('Type6', 'I9'), ('Type6', 'I7'), ('Type6', 'I8');
-- Insertion dans la table taillePizza
INSERT INTO Taille (idTaille, taille, coefficientPrix)  
VALUES  ('T1', 'Naine', 0.70),
		('T2', 'Humaine', 1.00),
		('T3', 'Ogresse', 1.30);
-- Insertion dans la table Client
INSERT INTO Client (idClient, nomClient, prenomClient, adresseClient, emailClient, numeroTelephoneClient, SoldeCompte) VALUES 
(1, 'Derrez', 'Jonathan', '35 Rue Maurice Bécanne', 'jonathan.derrez@gmail.com', '0654321890', 200.99),
(2, 'Gregorie', 'Paul', '4 Avue du Régiment', 'paul.gregorie@gmail.com', '0612345698', 24.56),
(3, 'DEHMANI', 'Manar', '4 Avenue de Buisson', 'manar.dehmani@gamil.com', '0678912345', 127.45),
(4, 'Moreau', 'David', '2 Boulevard de la Mer', 'david.moreau@gamil.com', '0634567890', 60.78),
(6, 'CHEBLI', 'Wiem', '10 Place de la Liberté', 'wiem.chebli@gmail.com', '0687654321', 5.20),
(7, 'Roux', 'Elise', '8 Place de la République', 'elise.roux@gmail.com', '0701658921', 70.32),
(8, 'Poiteaux', 'Justine', '2 Rue de la mairie', 'justine.poiteaux@gmail.com', '0647214300', 0.00),
(9, 'Robert', 'Martine', '35 Avenue Artiside Briand', 'martine.robert@gmail.com', '0725543210', 43.15);

-- Insertion dans la table Pizza
INSERT INTO Pizza (idPizza, PrixPizza, idTypePizza, idTaille)
VALUES
('Type1T1', 9.50, 'Type1', 'T1'),
('Type1T2', 6.65, 'Type1', 'T2'),
('Type2T2', 7.53, 'Type2', 'T2'),
('Type3T3', 16.06, 'Type3', 'T3'),
('Type4T2', 17.94, 'Type4', 'T2'),
('Type5T1', 10.99, 'Type5', 'T1'),
('Type6T3', 14.29, 'Type6', 'T3');

-- Insertion des commandes dans la table Commande
-- Insérer les commandes en vérifiant les règles des triggers
INSERT INTO Commande (numCommande, dateCommande, statutCommande, adresseLivraison, tempsDeLivraison, idPizza, idLivreur, idClient) 
VALUES
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
