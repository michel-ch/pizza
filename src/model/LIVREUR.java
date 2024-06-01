package model;

import java.sql.Time;
import java.util.ArrayList;

public class LIVREUR {
	private int id;
	private String nom;
	private String prenom;
	private String numeroTelephone;
	private Time retardEffectue;
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
	public String getNumeroTelephone() {
		return numeroTelephone;
	}
	public void setNumeroTelephone(String numeroTelephone) {
		this.numeroTelephone = numeroTelephone;
	}
	public Time getRetardEffectue() {
		return retardEffectue;
	}
	public void setRetardEffectue(Time retardEffectue) {
		this.retardEffectue = retardEffectue;
	}
	
	public LIVREUR(int id, String nom, String prenom, String numeroTelephone, Time retardEffectue) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.numeroTelephone = numeroTelephone;
		this.retardEffectue = retardEffectue;
		listecommandes = new ArrayList<COMMANDE>();
	}
	public LIVREUR(int id, String nom, String prenom, String numeroTelephone) {
		super();
		this.id = id;
		this.nom = nom;
		this.prenom = prenom;
		this.numeroTelephone = numeroTelephone;
		listecommandes = new ArrayList<COMMANDE>();
	}
	
	public void ajouterCommande(COMMANDE commande) {
		listecommandes.add(commande);
	}
	public void enleverCommande(COMMANDE commande) {
		listecommandes.remove(commande);
	}
	
}
