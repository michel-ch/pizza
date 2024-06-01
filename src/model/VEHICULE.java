package model;

public class VEHICULE {
	private String num;
	private String type;
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	public VEHICULE(String num, String type) {
		super();
		this.num = num;
		this.type = type;
	}
	
}
