package com.javasm.crm.goodsAndGifts.entity;

public class GoodsAudit {
    private int id;
    private String gname;
    private String type;
    private String brand;
    private int price;
    private int number;
    private String status;
    private String reviewer;
    private String time;
    private int code;
    private int addgifts;
    private int newprice;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getReviewer() {
		return reviewer;
	}
	public void setReviewer(String reviewer) {
		this.reviewer = reviewer;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getAddgifts() {
		return addgifts;
	}
	public void setAddgifts(int addgifts) {
		this.addgifts = addgifts;
	}
	public int getNewprice() {
		return newprice;
	}
	public void setNewprice(int newprice) {
		this.newprice = newprice;
	}
	public GoodsAudit() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GoodsAudit(int id, String gname, String type, String brand, int price, int number, String status,
			String reviewer, String time, int code, int addgifts, int newprice) {
		super();
		this.id = id;
		this.gname = gname;
		this.type = type;
		this.brand = brand;
		this.price = price;
		this.number = number;
		this.status = status;
		this.reviewer = reviewer;
		this.time = time;
		this.code = code;
		this.addgifts = addgifts;
		this.newprice = newprice;
	}
	@Override
	public String toString() {
		return "GoodsAudit [id=" + id + ", gname=" + gname + ", type=" + type + ", brand=" + brand + ", price=" + price
				+ ", number=" + number + ", status=" + status + ", reviewer=" + reviewer + ", time=" + time + ", code="
				+ code + ", addgifts=" + addgifts + ", newprice=" + newprice + "]";
	}
	
    
    
    
}
