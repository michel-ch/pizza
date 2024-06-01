package model;

import java.util.ArrayList;

public class  CLIENT{
	private int id;
	private String nom;
	private String prenom;
	private String adresse;
	private String email;
	private String numeroTelephone;
	private float SoldeCompte;
	private ArrayList <COMMANDE> listecommandes;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNumeroTelephone() {
		return numeroTelephone;
	}
	public void setNumeroTelephone(String numeroTelephone) {
		this.numeroTelephone = numeroTelephone;
	}
	public float getSoldeCompte() {
		return SoldeCompte;
	}
	public void setSoldeCompte(float soldeCompte) {
		SoldeCompte = soldeCompte;
	}
	public ArrayList<COMMANDE> getListecommandes() {
		return listecommandes;
	}
	public void setListecommandes(ArrayList<COMMANDE> listecommandes) {
		this.listecommandes = listecommandes;
	}
	
	public CLIENT(int id, String nom, String prenom, String adresse, String email, String numeroTelephone,
			float soldeCompte) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.adresse = adresse;
		this.email = email;
		this.numeroTelephone = numeroTelephone;
		SoldeCompte = soldeCompte;
		listecommandes = new ArrayList<COMMANDE>();
	}
	
	
	public CLIENT(int id, String nom, String prenom, String adresse, String email,
			String numeroTelephone) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.adresse = adresse;
		this.email = email;
		this.numeroTelephone = numeroTelephone;
	}
	
	public void ajouterCommande(COMMANDE commande) {
		listecommandes.add(commande);
	}
	public void enleverCommande(COMMANDE commande) {
		listecommandes.remove(commande);
	}
	
}
