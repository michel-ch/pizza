package model;

public class INGREDIENTS {
	private String id;
	private String nom;
    private int nombreUtilisations;

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
	public int getNombreUtilisations() {
        return nombreUtilisations;
    }

    public void setNombreUtilisations(int nombreUtilisations) {
        this.nombreUtilisations = nombreUtilisations;
    }
	public INGREDIENTS(String id, String nom) {
		super();
		this.id = id;
		this.nom = nom;
	}
	
	public INGREDIENTS(String nom, int nombreUtilisations) {
		super();
        this.nom = nom;
        this.nombreUtilisations = nombreUtilisations;
    }
	
}
