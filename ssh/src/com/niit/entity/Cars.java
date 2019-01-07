package com.niit.entity;


public class Cars {
	private Integer h_id;
	private String h_name;
	private Integer s_id;
	private String h_city;
	private String h_distric;
	private String h_province;
	private double h_x;
	private double h_y;
	private double h_area;
	private String h_type;
	private String h_RB;
	private double h_money;
	private String h_date;
	private String h_design;
	private String h_info;
	private String h_houseType;
	private String h_url;
	
//	
//	@Override
//	public String toString() {
//		return "Cars [h_id=" + h_id + ", h_name=" + h_name + ", h_url=" + h_url + "]";
//	}
	public Integer getS_id() {
		return s_id;
	}
	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}
	public Integer getH_id() {
		return h_id;
	}
	public void setH_id(Integer h_id) {
		this.h_id = h_id;
	}
	public String getH_province() {
		return h_province;
	}
	public void setH_province(String h_province) {
		this.h_province = h_province;
	}
	public String getH_city() {
		return h_city;
	}
	public void setH_city(String h_city) {
		this.h_city = h_city;
	}
	public String getH_type() {
		return h_type;
	}
	public void setH_type(String h_type) {
		this.h_type = h_type;
	}
	public double getH_money() {
		return h_money;
	}
	public void setH_money(double h_money) {
		this.h_money = h_money;
	}
	public String getH_name() {
		return h_name;
	}
	public void setH_name(String h_name) {
		this.h_name = h_name;
	}
	public String getH_url() {
		return h_url;
	}
	public void setH_url(String h_url) {
		this.h_url = h_url;
	}
	
	public double getH_x() {
		return h_x;
	}
	public void setH_x(double h_x) {
		this.h_x = h_x;
	}
	public double getH_y() {
		return h_y;
	}
	public void setH_y(double h_y) {
		this.h_y = h_y;
	}
	public double getH_area() {
		return h_area;
	}
	public void setH_area(double h_area) {
		this.h_area = h_area;
	}
	public String getH_RB() {
		return h_RB;
	}
	public void setH_RB(String h_RB) {
		this.h_RB = h_RB;
	}
	public String getH_date() {
		return h_date;
	}
	public void setH_date(String h_date) {
		this.h_date = h_date;
	}
	public String getH_design() {
		return h_design;
	}
	public void setH_design(String h_design) {
		this.h_design = h_design;
	}
	public String getH_info() {
		return h_info;
	}
	public void setH_info(String h_info) {
		this.h_info = h_info;
	}
	public String getH_houseType() {
		return h_houseType;
	}
	public void setH_houseType(String h_houseType) {
		this.h_houseType = h_houseType;
	}
	public String getH_distric() {
		return h_distric;
	}
	public void setH_distric(String h_distric) {
		this.h_distric = h_distric;
	}
	
	@Override
	public boolean equals(Object obj) {
        if(h_id.equals(((Cars)obj).getH_id()))
            return true;
        else {
            return false;
        }
    }
}
