create database if not exists pizza ;
use pizza ;

CREATE TABLE TypePizza(
   idTypePizza VARCHAR(15),
   nomPizza VARCHAR(20) NOT NULL,
   prixBase DECIMAL(5,2) NOT NULL,
   PRIMARY KEY(idTypePizza)
);

CREATE TABLE Vehicule(
   numImmVehicule VARCHAR(10),
   typeVehicule VARCHAR(10) NOT NULL,
   PRIMARY KEY(numImmVehicule)
);

CREATE TABLE Livreur(
   idLivreur VARCHAR(15),
   nomLivreur VARCHAR(20),
   prenomLivreur VARCHAR(20),
   numeroTelephoneLivreur VARCHAR(15),
   nbRetard INT,
   PRIMARY KEY(idLivreur)
);

CREATE TABLE Client(
   idClient INT,
   nomClient VARCHAR(15),
   prenomClient VARCHAR(15),
   adresseClient VARCHAR(50),
   emailClient VARCHAR(30),
   numeroTelephoneClient VARCHAR(15),
   SoldeCompte DECIMAL(7,2),
   PRIMARY KEY(idClient)
);

CREATE TABLE Ingredients(
   idIngredient VARCHAR(15),
   nomIngredient VARCHAR(15),
   PRIMARY KEY(idIngredient)
);

CREATE TABLE Taille(
   idTaille VARCHAR(15),
   taille VARCHAR(15),
   coefficientPrix DECIMAL(5,2),
   PRIMARY KEY(idTaille)
);

CREATE TABLE Pizza(
   idPizza VARCHAR(15),
   PrixPizza DECIMAL(5,2),
   idTaille VARCHAR(15) NOT NULL,
   idTypePizza VARCHAR(15) NOT NULL,
   PRIMARY KEY(idPizza),
   FOREIGN KEY(idTaille) REFERENCES Taille(idTaille),
   FOREIGN KEY(idTypePizza) REFERENCES TypePizza(idTypePizza)
);

CREATE TABLE Commande(
   numCommande INT,
   dateCommande DATETIME,
   statutCommande VARCHAR(10),
   adresseLivraison VARCHAR(50),
   tempsDeLivraison TIME,
   idPizza VARCHAR(15) NOT NULL,
   idLivreur VARCHAR(15) NOT NULL,
   idClient INT NOT NULL,
   PRIMARY KEY(numCommande),
   FOREIGN KEY(idPizza) REFERENCES Pizza(idPizza),
   FOREIGN KEY(idLivreur) REFERENCES Livreur(idLivreur),
   FOREIGN KEY(idClient) REFERENCES Client(idClient)
);

CREATE TABLE Utilise(
   numImmVehicule VARCHAR(10),
   idLivreur VARCHAR(15),
   PRIMARY KEY(numImmVehicule, idLivreur),
   FOREIGN KEY(numImmVehicule) REFERENCES Vehicule(numImmVehicule),
   FOREIGN KEY(idLivreur) REFERENCES Livreur(idLivreur)
);

CREATE TABLE SeCompose(
   idTypePizza VARCHAR(15),
   idIngredient VARCHAR(15),
   PRIMARY KEY(idTypePizza, idIngredient),
   FOREIGN KEY(idTypePizza) REFERENCES TypePizza(idTypePizza),
   FOREIGN KEY(idIngredient) REFERENCES Ingredients(idIngredient)
);
