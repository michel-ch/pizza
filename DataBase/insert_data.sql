-- Inserting specific pizza records directly into the Pizza table
INSERT INTO Pizza (idPizza, PrixPizza, idTaille, idTypePizza)
VALUES 
    ('Margherita Naine', 6.65, 'T1', 'Type1'), 
    ('Margherita Humaine', 9.50, 'T2', 'Type1'), 
    ('Margherita Ogresse', 12.35, 'T3', 'Type1'), 
    ('Pepperoni Naine', 7.53, 'T1', 'Type2'), 
    ('Pepperoni Humaine', 10.75, 'T2', 'Type2'), 
    ('Pepperoni Ogresse', 13.98, 'T3', 'Type2'), 
    ('Cannibale Naine', 8.65, 'T1', 'Type3'), 
    ('Cannibale Humaine', 12.35, 'T2', 'Type3'), 
    ('Cannibale Ogresse', 16.06, 'T3', 'Type3'), 
    ('Végétarienne Naine', 9.66, 'T1', 'Type4'), 
    ('Végétarienne Humaine', 13.80, 'T2', 'Type4'), 
    ('Végétarienne Ogresse', 17.94, 'T3', 'Type4'), 
    ('Indienne Naine', 7.69, 'T1', 'Type5'), 
    ('Indienne Humaine', 10.99, 'T2', 'Type5'), 
    ('Indienne Ogresse', 14.29, 'T3', 'Type5'), 
    ('Spéciale Champis Naine', 7.69, 'T1', 'Type6'), 
    ('Spéciale Champis Humaine', 10.99, 'T2', 'Type6'), 
    ('Spéciale Champis Ogresse', 14.29, 'T3', 'Type6');


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
    ('V5', 'Livreur6'); 
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
-- Insertion dans la table TypePizza
CALL insertTypePizza('Type1', 'Margherita', 9.50) ;
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
-- Insertion dans la table Pizza
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




        
        


        


        


