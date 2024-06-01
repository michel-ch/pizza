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
		
		String BDD = "pizza";
		String url = "jdbc:mysql://localhost:3306/" + BDD;
		String user = "root";
		String passwd = "";

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
	public LIVREUR findlivreur(int id)
	{
		for(int i=0;i<listelivreur.size();i++)
		{
			if(listelivreur.get(i).getId() == id)
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
	
	public INGREDIENTS findingredient(int id)
	{
		for(int i=0;i<listeingredients.size();i++)
		{
			if(listeingredients.get(i).getId() == id)
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
