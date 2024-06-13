package model;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Connection;


public class model {
	private Connection con;
	private ArrayList <CLIENT> listeclient;
	private ArrayList <LIVREUR> listelivreur;
	private ArrayList <VEHICULE> listevehicule;
	private ArrayList <PIZZA> listepizza;
	private ArrayList <INGREDIENTS> listeingredients;
	private ArrayList <COMMANDE> listecommande;
	
	public model() {
		listeclient = new ArrayList<CLIENT> ();
		listelivreur = new ArrayList<LIVREUR> ();
		listevehicule = new ArrayList<VEHICULE> ();
		listepizza = new ArrayList<PIZZA> ();
		listeingredients = new ArrayList<INGREDIENTS> ();
		listecommande = new ArrayList<COMMANDE> ();
		
		String BDD = "rapizz";
		String url = "jdbc:mysql://localhost:3306/rapizz?characterEncoding=UTF-8";
		String user = "root";
		String passwd = "manardehmani2003";

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
	public ArrayList<COMMANDE> getListecommande() {
		return listecommande;
	}
	public void setListecommande(ArrayList<COMMANDE> listecommande) {
		this.listecommande = listecommande;
	}
	public Connection getCon() {
		return con;
	}
	public void setCon(Connection con) {
		this.con = con;
	}
	
	//	To init the model
	public void getAll() throws SQLException {
		listeclient.clear();
		listelivreur.clear();
		listevehicule.clear();
		listepizza.clear();
		listeingredients.clear();
		listecommande.clear();
		
		listeclient = new ArrayList<CLIENT> ();
		listelivreur = new ArrayList<LIVREUR> ();
		listevehicule = new ArrayList<VEHICULE> ();
		listepizza = new ArrayList<PIZZA> ();
		listeingredients = new ArrayList<INGREDIENTS> ();
		listecommande = new ArrayList<COMMANDE> ();
		
		ResultSet resultats;
		String requete;
		
		
		
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
                		rs.getString("prenomClient"),rs.getString("adresseClient"),
                		rs.getString("emailClient"),rs.getString("numeroTelephoneClient"),
                		rs.getFloat("SoldeCompte"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return client;
    }
    //
    public PIZZA pizzaPlusDemandee() {
        PIZZA pizza = null;
        String requete = "CALL PizzaPlusDemandee()";
        try (Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery(requete);
            if (rs.next()) {
                pizza = new PIZZA(rs.getString("idPizza"), rs.getString("idTypePizza"),rs.getFloat("PrixPizza"), rs.getString("idTaille"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return pizza;
    }
    
    //
    public PIZZA pizzaMoinsDemandee() {
        PIZZA pizza = null;
        String requete = "CALL PizzaMoinsDemandee()";
        try (Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery(requete);
            if (rs.next()) {
                pizza = new PIZZA(rs.getString("idPizza"), rs.getString("idTypePizza"),rs.getFloat("PrixPizza"), rs.getString("idTaille"));
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
        ArrayList<String> menuItems = new ArrayList<>();
        String requete = "CALL menu()";
        try (Statement stmt = con.createStatement()) {
            ResultSet rs = stmt.executeQuery(requete);
            while (rs.next()) {
                String menuItem = rs.getString("nomPizza") + " - " + rs.getDouble("PrixPizza") + "€ - Ingrédients: " + rs.getString("ingredients");
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
	public COMMANDE findcommande(int id)
	{
		for(int i=0;i<listecommande.size();i++)
		{
			if(listecommande.get(i).getNum() == id)
			{
				return listecommande.get(i);
			}
		}
		return null;
	}
	
	
	
	
}
