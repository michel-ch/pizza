package model;

public class PIZZA {
	private String id;
	private String nom;
	private float prix;
	private String taille;
	
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
	public float getPrix() {
		return prix;
	}
	public void setPrix(float prix) {
		this.prix = prix;
	}
	public String getTaille() {
		return taille;
	}
	public void setTaille(String taille) {
		this.taille = taille;
	}
	
	public PIZZA(String id, String nom, float prix, String taille) {
		super();
		this.id = id;
		this.nom = nom;
		this.prix = prix;
		this.taille = taille;
	}
	
}
