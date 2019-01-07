package com.niit.entity;

public class order {
	String id;
	String baseName;
	String zone;
	String money;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBaseName() {
		return baseName;
	}
	public void setBaseName(String baseName) {
		this.baseName = baseName;
	}
	public String getZone() {
		return zone;
	}
	public void setZone(String zone) {
		this.zone = zone;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public order(String id, String baseName, String zone, String money) {
		super();
		this.id = id;
		this.baseName = baseName;
		this.zone = zone;
		this.money = money;
	}

}
