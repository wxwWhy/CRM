package com.javasm.crm.goodsAndGifts.entity;

public class Gifts {
   private int id;
   private String gname;
   private String type;
   private int number;
   private int price;
   private int cost;
   private String state;
   private String color;
   private int code;

public int getCode() {
	return code;
}
public void setCode(int code) {
	this.code = code;
}
public String getColor() {
	return color;
}
public void setColor(String color) {
	this.color = color;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}





public Gifts() {
	super();
	// TODO Auto-generated constructor stub
}

@Override
public String toString() {
	return "Gifts [id=" + id + ", gname=" + gname + ", type=" + type + ", number=" + number + ", price=" + price
			+ ", cost=" + cost + ", state=" + state + ", color=" + color + ", code=" + code + "]";
}
public Gifts(int id, String gname, String type, int number, int price, int cost, String state, String color, int code) {
	super();
	this.id = id;
	this.gname = gname;
	this.type = type;
	this.number = number;
	this.price = price;
	this.cost = cost;
	this.state = state;
	this.color = color;
	this.code = code;
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
public int getNumber() {
	return number;
}
public void setNumber(int number) {
	this.number = number;
}
public int getPrice() {
	return price;
}
public void setPrice(int price) {
	this.price = price;
}
public int getCost() {
	return cost;
}
public void setCost(int cost) {
	this.cost = cost;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
}
