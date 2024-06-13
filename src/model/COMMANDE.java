package model;

import java.util.Date;

public class COMMANDE {
	private int num;
	private Date date;
	private String statut;
	private String adresse;
	private Date temps;
	private LIVREUR livreur;
	private CLIENT client;
	private PIZZA pizza;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Date getTemps() {
		return temps;
	}
	public void setTemps(Date temps) {
		this.temps = temps;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getStatut() {
		return statut;
	}
	public void setStatut(String statut) {
		this.statut = statut;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	public LIVREUR getLivreur() {
		return livreur;
	}
	public void setLivreur(LIVREUR livreur) {
		this.livreur = livreur;
	}
	public CLIENT getClient() {
		return client;
	}
	public void setClient(CLIENT client) {
		this.client = client;
	}
	public PIZZA getPizza() {
		return pizza;
	}
	public void setPizza(PIZZA pizza) {
		this.pizza = pizza;
	}
	public COMMANDE(int num, Date date, String statut, String adresse, Date temps, LIVREUR livreur, CLIENT client,
			PIZZA pizza) {
		super();
		this.num = num;
		this.date = date;
		this.statut = statut;
		this.adresse = adresse;
		this.temps = temps;
		this.livreur = livreur;
		this.client = client;
		this.pizza = pizza;
	}
	public COMMANDE(int num, Date date, String statut, String adresse, LIVREUR livreur, CLIENT client,
			PIZZA pizza) {
		super();
		this.num = num;
		this.date = date;
		this.statut = statut;
		this.adresse = adresse;
		this.livreur = livreur;
		this.client = client;
	}
}
