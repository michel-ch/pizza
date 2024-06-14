package model;

import java.sql.Time;
import java.util.ArrayList;

public class LIVREUR {
	private String id;
	private String nom;
	private String prenom;
	private String numeroTelephone;
	private int nombreRetard;
	private ArrayList <COMMANDE> listecommandes;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
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
	public String getNumeroTelephone() {
		return numeroTelephone;
	}
	public void setNumeroTelephone(String numeroTelephone) {
		this.numeroTelephone = numeroTelephone;
	}
	public int getNombreRetard() {
		return nombreRetard;
	}
	public void setNombreRetard(int nombreRetard) {
		this.nombreRetard = nombreRetard;
	}
	
	public LIVREUR(String id, String nom, String prenom, String numeroTelephone, int nombreRetard) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.numeroTelephone = numeroTelephone;
		this.nombreRetard = nombreRetard;
		listecommandes = new ArrayList<COMMANDE>();
	}
	public LIVREUR(String id, String nom, String prenom, String numeroTelephone) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.numeroTelephone = numeroTelephone;
		this.nombreRetard = 0;
		listecommandes = new ArrayList<COMMANDE>();
	}
	
	public void ajouterCommande(COMMANDE commande) {
		listecommandes.add(commande);
	}
	public void enleverCommande(COMMANDE commande) {
		listecommandes.remove(commande);
	}
	
}
