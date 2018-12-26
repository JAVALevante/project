package com.etoak.bean;

public class House {
    private Integer id;

    private String hnum;

    private String hcategory;

    private Integer hprice;

    private String hequip;

    private Integer hstatus;

    private Integer starthprice;
    
    private Integer endhprice;
    public Integer getStarthprice() {
		return starthprice;
	}

	public void setStarthprice(Integer starthprice) {
		this.starthprice = starthprice;
	}

	public Integer getEndhprice() {
		return endhprice;
	}

	public void setEndhprice(Integer endhprice) {
		this.endhprice = endhprice;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHnum() {
        return hnum;
    }

    public void setHnum(String hnum) {
        this.hnum = hnum == null ? null : hnum.trim();
    }

    public String getHcategory() {
        return hcategory;
    }

    public void setHcategory(String hcategory) {
        this.hcategory = hcategory == null ? null : hcategory.trim();
    }

    public Integer getHprice() {
        return hprice;
    }

    public void setHprice(Integer hprice) {
        this.hprice = hprice;
    }

    public String getHequip() {
        return hequip;
    }

    public void setHequip(String hequip) {
        this.hequip = hequip == null ? null : hequip.trim();
    }

    public Integer getHstatus() {
        return hstatus;
    }

    public void setHstatus(Integer hstatus) {
        this.hstatus = hstatus;
    }

	@Override
	public String toString() {
		return "House [id=" + id + ", hnum=" + hnum + ", hcategory="
				+ hcategory + ", hprice=" + hprice + ", hequip=" + hequip
				+ ", hstatus=" + hstatus + ", starthprice=" + starthprice
				+ ", endhprice=" + endhprice + "]";
	}
    
}