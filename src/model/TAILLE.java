package model;

public class TAILLE {
	private String id;
	private String taille;
	private float coefficientPrix;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTaille() {
		return taille;
	}
	public void setTaille(String taille) {
		this.taille = taille;
	}
	public float getCoefficientPrix() {
		return coefficientPrix;
	}
	public void setCoefficientPrix(float coefficientPrix) {
		this.coefficientPrix = coefficientPrix;
	}
	public TAILLE(String id, String taille, float coefficientPrix) {
		super();
		this.id = id;
		this.taille = taille;
		this.coefficientPrix = coefficientPrix;
	}
}
