package model;

public class TYPEPIZZA {
	private String id;
	private String nom;
	private float prix;
	
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
	public TYPEPIZZA(String id, String nom, float prix) {
		super();
		this.id = id;
		this.nom = nom;
		this.prix = prix;
	}
}
