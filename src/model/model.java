package model;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.awt.Frame;
import java.sql.Connection;


public class model {
	private Connection con;
	private ArrayList <CLIENT> listeclient;
	private ArrayList <LIVREUR> listelivreur;
	private ArrayList <VEHICULE> listevehicule;
	private ArrayList <PIZZA> listepizza;
	private ArrayList <INGREDIENTS> listeingredients;
	private ArrayList <String> listecommandeEncours;
	private ArrayList <String> listecommandeClient;
	private ArrayList <String> listecommandeLivreur;
	private ArrayList<String> menuItems;
	private ArrayList <CLIENT> listeclientBis; 
	
	public model() {
		listeclient = new ArrayList<CLIENT> ();
		listeclientBis = new ArrayList<CLIENT> ();
		listelivreur = new ArrayList<LIVREUR> ();
		listevehicule = new ArrayList<VEHICULE> ();
		listepizza = new ArrayList<PIZZA> ();
		listeingredients = new ArrayList<INGREDIENTS> ();
		listecommandeEncours = new ArrayList<String> ();
		listecommandeClient = new ArrayList<String> ();
		listecommandeLivreur = new ArrayList<String> ();
		menuItems = new ArrayList<>();
		
		String BDD = "pizza";
		String url = "jdbc:mysql://localhost:3306/"+BDD;
		//String url = "jdbc:mysql://localhost:3306/rapizz?characterEncoding=UTF-8";
		String user = "root";
		String passwd = "";
		//String passwd = "manardehmani2003";

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Connection conn;
		try {
			conn = DriverManager.getConnection(url, user, passwd);
			this.con = conn;
			System.out.println("Connection OK");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<CLIENT> getListeclient() {
		return listeclient;
	}
	public void setListeclient(ArrayList<CLIENT> listeclient) {
		this.listeclient = listeclient;
	}
	public ArrayList<CLIENT> getListeclientBis() {
		return listeclientBis;
	}
	public void setListeclientBis(ArrayList<CLIENT> listeclientBis) {
		this.listeclientBis = listeclientBis;
	}
	public ArrayList<LIVREUR> getListelivreur() {
		return listelivreur;
	}
	public void setListelivreur(ArrayList<LIVREUR> listelivreur) {
		this.listelivreur = listelivreur;
	}
	public ArrayList<VEHICULE> getListevehicule() {
		return listevehicule;
	}
	public void setListevehicule(ArrayList<VEHICULE> listevehicule) {
		this.listevehicule = listevehicule;
	}
	public ArrayList<PIZZA> getListepizza() {
		return listepizza;
	}
	public void setListepizza(ArrayList<PIZZA> listepizza) {
		this.listepizza = listepizza;
	}
	public ArrayList<INGREDIENTS> getListeingredients() {
		return listeingredients;
	}
	public void setListeingredients(ArrayList<INGREDIENTS> listeingredients) {
		this.listeingredients = listeingredients;
	}
	public ArrayList<String> getListecommandeEncours() {
		return listecommandeEncours;
	}
	public void setListecommandeEncours(ArrayList<String> listecommandeEncours) {
		this.listecommandeEncours = listecommandeEncours;
	}
	public ArrayList<String> getListecommandeClient() {
		return listecommandeClient;
	}
	public void setListecommandeClient(ArrayList<String> listecommandeClient) {
		this.listecommandeClient = listecommandeClient;
	}
	public ArrayList<String> getListecommandeLivreur() {
		return listecommandeLivreur;
	}
	public void setListecommandeLivreur(ArrayList<String> listecommandeLivreur) {
		this.listecommandeLivreur = listecommandeLivreur;
	}
	
	public Connection getCon() {
		return con;
	}
	public void setCon(Connection con) {
		this.con = con;
	}
	public ArrayList<String> getMenuItems() {
		return menuItems;
	}
	public void setMenuItems(ArrayList<String> menuItems) {
		this.menuItems = menuItems;
	}

	//	To init the model
	public void getAll() throws SQLException {
		listeclient.clear();
		listelivreur.clear();
		listecommandeEncours.clear();
		listecommandeClient.clear();
		listeclientBis.clear();
		listecommandeLivreur.clear();
		menuItems.clear();
		
		listeclient = new ArrayList<CLIENT>	();
		listeclientBis = new ArrayList<CLIENT>	();
		listecommandeEncours = new ArrayList<String> ();
		listecommandeClient = new ArrayList<String> ();
		listecommandeLivreur = new ArrayList<String> ();
		menuItems = new ArrayList<>();
		
		Statement command = con.createStatement();
		ResultSet resultats;
		String requete;
		
		requete = "select commande.numCommande, commande.dateCommande, commande.statutCommande, commande.adresseLivraison, typepizza.nomPizza, livreur.nomLivreur, client.nomClient FROM commande, pizza , livreur, client , typepizza WHERE client.idClient=commande.idClient AND commande.idPizza=pizza.idPizza AND commande.idLivreur=livreur.idLivreur AND typepizza.idTypePizza=pizza.idTypePizza AND commande.statutCommande='En cours';";
		resultats = command.executeQuery(requete);
		while(resultats.next()) {
			String data = resultats.getInt(1)+ " - " +resultats.getDate(2)+ " - " +resultats.getString(3)+ " - " +resultats.getString(4)+ " - " +resultats.getString(5)+ " - " +resultats.getString(6)+ resultats.getString(7);
			listecommandeEncours.add(data);
		}

		requete = "SELECT * FROM `livreur`";
		resultats = command.executeQuery(requete);
		while(resultats.next()) {
			listelivreur.add(new LIVREUR(resultats.getString(1),resultats.getString(2), resultats.getString(3), resultats.getString(4), resultats.getInt(5)));
		}
		
		requete = "SELECT * FROM `client`";
		resultats = command.executeQuery(requete);
		while(resultats.next()) {
			listeclient.add(new CLIENT(resultats.getInt(1),resultats.getString(2), resultats.getString(3), resultats.getString(4), resultats.getString(5), resultats.getString(6), resultats.getFloat(7)));
		}
		requete = "SELECT c.* FROM client c JOIN commande cmd ON c.idClient = cmd.idClient JOIN pizza p ON cmd.idPizza = p.idPizza GROUP BY c.idClient HAVING (SUM(p.PrixPizza) / (SELECT COUNT(Co.numCommande) AS nombre_commandes FROM Client Cl LEFT JOIN Commande Co ON Cl.idClient = Co.idClient WHERE Cl.idClient = c.idClient GROUP BY Cl.idClient, Cl.nomClient, Cl.prenomClient)) >= (SELECT AVG(P.PrixPizza) AS moyenne_prix_commandes FROM Commande Co JOIN Pizza P ON Co.idPizza = P.idPizza WHERE Co.statutCommande = 'Livrée');";
		resultats = command.executeQuery(requete);
		while(resultats.next()) {
			listeclientBis.add(new CLIENT(resultats.getInt(1),resultats.getString(2), resultats.getString(3), resultats.getString(4), resultats.getString(5), resultats.getString(6), resultats.getFloat(7)));
		}
		menu();
	}
	
	// 
    public double chiffreAffaires() {
        double result = 0.0;
        String requete = "CALL chiffreAffaires()";
        try (Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery(requete);
            if (rs.next()) {
                result = rs.getDouble("chiffre_affaires");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    //
    public CLIENT meilleurClient() {
        CLIENT client = null;
        String requete = "CALL meilleurClient()";
        try (Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery(requete);
            if (rs.next()) {
                client = new CLIENT(rs.getInt("idClient"), rs.getString("nomClient"), 
                		rs.getString("prenomClient"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return client;
    }
    //
    public PIZZA pizzaPlusDemandee() {
        PIZZA pizza = null;
        String requete = "CALL PizzaPlusdemandee()";
        try (Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery(requete);
            if (rs.next()) {
                pizza = new PIZZA(
                    rs.getString("idPizza"),
                    rs.getString("nomPizza"),
                    rs.getFloat("PrixPizza"),
                    rs.getString("taille")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pizza;
    }

    
    //
    public INGREDIENTS ingredientFavori() {
        INGREDIENTS ingredient = null;
        String requete = "CALL ingredientFavori()";
        try (Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery(requete);
            if (rs.next()) {
                ingredient = new INGREDIENTS(rs.getString("nomIngredient"), rs.getInt("nombreUtilisations"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return ingredient;
    }
    
    //
    
    public ArrayList<VEHICULE> vehiculeNonUtilise() {
    	ArrayList<VEHICULE>  vehicules = getListevehicule();
        String requete = "CALL vehiculeNonUtilise()";
        try (Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                VEHICULE vehicule = new VEHICULE(rs.getString("numImmVehicule"), rs.getString("typeVehicule"));
                vehicules.add(vehicule);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return vehicules;
    }
    
    //
    public LIVREUR plusMauvaisLivreur() {
        LIVREUR livreur = null;
        String requete = "CALL PlusMauvaisLivreur()";
        try (Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery(requete);
            if (rs.next()) {
                livreur = new LIVREUR(
                    rs.getString("idLivreur"),
                    rs.getString("nomLivreur"),
                    rs.getString("prenomLivreur"),
                    rs.getString("numeroTelephoneLivreur"),
                    rs.getInt("nbRetard")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return livreur;
    }
    
    public ArrayList<String> menu() {
        menuItems.clear();
        String requete = "CALL menu()";
        try (Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                String menuItem = rs.getString("idPizza")+" - "+ rs.getString("nomPizza") + " - " +rs.getString("taille")+" - "+rs.getDouble("PrixPizza") + "€ - Ingrédients: " + rs.getString("ingredients");
                menuItems.add(menuItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menuItems;
    }

    
	public CLIENT findclient(int id)
	{
		for(int i=0;i<listeclient.size();i++)
		{
			if(listeclient.get(i).getId() == id)
			{
				return listeclient.get(i);
			}
		}
		return null;
	}
	public LIVREUR findlivreur(String id)
	{
		for(int i=0;i<listelivreur.size();i++)
		{
			if(listelivreur.get(i).getId().equals(id))
			{
				return listelivreur.get(i);
			}
		}
		return null;
	}
	public VEHICULE findvehicule(String num)
	{
		for(int i=0;i<listevehicule.size();i++)
		{
			if(listevehicule.get(i).getNum().equals(num))
			{
				return listevehicule.get(i);
			}
		}
		return null;
	}
	public PIZZA findpizza(String id)
	{
		for(int i=0;i<listepizza.size();i++)
		{
			if(listepizza.get(i).getId().equals(id))
			{
				return listepizza.get(i);
			}
		}
		return null;
	}
	
	public INGREDIENTS findingredient(String id)
	{
		for(int i=0;i<listeingredients.size();i++)
		{
			if(listeingredients.get(i).getId().equals(id))
			{
				return listeingredients.get(i);
			}
		}
		return null;
	}
	
	public String insertCommande(int idclient, String pizza, float prix) throws SQLException {
		Statement command = con.createStatement();
		ResultSet resultats;
		String requete;
		try{
			requete = "SELECT client.SoldeCompte FROM `client` WHERE client.idClient= '"+ idclient +"'";
			Statement stmt = con.createStatement();
			resultats = stmt.executeQuery(requete);
			if(resultats.next()) {
				if(prix<=resultats.getFloat(1)) {
					command.execute("INSERT INTO `commande` (`dateCommande`, `statutCommande`, `adresseLivraison`,`idPizza`, `idLivreur`, `idClient`) VALUES ( NOW(), 'En cours', (SELECT `adresseClient` FROM `client` WHERE `idClient` = '1'), '"+ pizza +"', (SELECT `idLivreur` FROM `livreur` WHERE `idLivreur` NOT IN ( SELECT DISTINCT c.`idLivreur` FROM `commande` as c WHERE c.`statutCommande` = 'En cours') LIMIT 1),"+idclient+ ");");
					float nouveau_solde =  resultats.getFloat(1)-prix;
					command.execute("UPDATE `client` SET `SoldeCompte` = '"+nouveau_solde+"' WHERE `client`.`idClient` = "+ idclient +";");
					return "<html>Votre pizza est commandee !</html>";
				}
				else {
					return "Votre solde est insuffisant";
				}
			}
			else {
				System.out.println("Echec a la verification du solde");
			}
			
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println("Insert bug");
			System.out.println(e.toString());
		}
		return "";
	}
	
	public void getCommandeLivreur(String idlivreur) throws SQLException {
		Statement command = con.createStatement();
		ResultSet resultats;
		String requete;
		
		try {
			listecommandeLivreur.clear();
			requete = "select commande.numCommande, commande.dateCommande, commande.statutCommande, commande.adresseLivraison, typepizza.nomPizza, livreur.nomLivreur, client.nomClient FROM commande, pizza , livreur, client , typepizza WHERE client.idClient=commande.idClient AND commande.idPizza=pizza.idPizza AND commande.idLivreur=livreur.idLivreur AND typepizza.idTypePizza=pizza.idTypePizza AND commande.idLivreur='"+ idlivreur +"'";
			resultats = command.executeQuery(requete);
			while(resultats.next()) {
				String data = resultats.getInt(1)+" - "+resultats.getDate(2)+" - "+resultats.getString(3)+" - "+resultats.getString(4)+" - "+resultats.getString(5)+" - "+resultats.getString(6)+" - "+resultats.getString(7);
				listecommandeLivreur.add(data);
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public float getMoyenCommande() throws SQLException {
		Statement command = con.createStatement();
		ResultSet resultats;
		String requete;
		
		requete = "CALL moyenneCommande();";
		try {
			resultats = command.executeQuery(requete);
			if(resultats.next()) {
				return resultats.getFloat(1);
			}
			else {
				return 0;
			}
		}catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
	}
	
	public int getNbCommandes(int idclient) throws SQLException {
		Statement command = con.createStatement();
		ResultSet resultats;
		String requete;
		
		requete = "CALL nbCommandeParClient("+idclient+");";
		try {
			resultats = command.executeQuery(requete);
			if(resultats.next()) {
				return resultats.getInt(1);
			}
			else {
				return 0;
			}
		}catch (Exception e) {
			// TODO: handle exception
			return 0;
		}
	}
	
	public void getCommandeClient(int idclient) throws SQLException {
		Statement command = con.createStatement();
		ResultSet resultats;
		String requete;
		
		requete = "select commande.numCommande, commande.dateCommande, commande.statutCommande, commande.adresseLivraison, typepizza.nomPizza, livreur.nomLivreur, client.nomClient FROM commande, pizza , livreur, client , typepizza WHERE client.idClient=commande.idClient AND commande.idPizza=pizza.idPizza AND commande.idLivreur=livreur.idLivreur AND typepizza.idTypePizza=pizza.idTypePizza AND commande.idClient="+ idclient +";";
		try {
			listecommandeClient.clear();
			resultats = command.executeQuery(requete);
			while(resultats.next()) {
				String data = resultats.getInt(1)+" - "+resultats.getDate(2)+" - "+resultats.getString(3)+" - "+resultats.getString(4)+" - "+resultats.getString(5)+" - "+resultats.getString(6)+" - "+resultats.getString(7);
				listecommandeClient.add(data);
			}
		}catch (Exception e) {
			// TODO: handle exception
			listecommandeClient.clear();
		}
	}
	
	public void getCommandeClientBis(int idclient) throws SQLException {
		Statement command = con.createStatement();
		ResultSet resultats;
		String requete;
		
		requete = "select commande.numCommande, commande.dateCommande, commande.statutCommande, commande.adresseLivraison, typepizza.nomPizza, livreur.nomLivreur, client.nomClient FROM commande, pizza , livreur, client , typepizza WHERE client.idClient=commande.idClient AND commande.idPizza=pizza.idPizza AND commande.idLivreur=livreur.idLivreur AND typepizza.idTypePizza=pizza.idTypePizza AND commande.idClient="+ idclient +";";
		try {
			listecommandeClient.clear();
			resultats = command.executeQuery(requete);
			while(resultats.next()) {
				String data = resultats.getInt(1)+" - "+resultats.getDate(2)+" - "+resultats.getString(3)+" - "+resultats.getString(4)+" - "+resultats.getString(5)+" - "+resultats.getString(6)+" - "+resultats.getString(7);
				listecommandeClient.add(data);
			}
		}catch (Exception e) {
			// TODO: handle exception
			listecommandeClient.clear();
		}
	}
	
	
}
