package com.javasm.crm.b2c.entity;

import java.util.ArrayList;
import java.util.List;

//收货人资料表
public class Consignee {
	
    private Integer id;
    
    private String consigneename;

    private int memberaccount;

    private String telphone;

    private String phone;

    private String zipcode;

    private String shipingaddress;
   
    private String distributionregion;
 
    private String distributionway;

    private Integer distributioncosts;

    private String modeofpayment;

    private String tothetime;

    private String emailaddress;

    private String remitter;
    
    private List<Order> orderlist = new ArrayList<>() ;



	public List<Order> getOrderlist() {
		return orderlist;
	}

	public void setOrderlist(List<Order> orderlist) {
		this.orderlist = orderlist;
	}

	public void setMemberaccount(int memberaccount) {
		this.memberaccount = memberaccount;
	}

	public Integer getid() {
		return id;
	}

	public void setid(Integer id) {
		this.id = id;
	}

	public String getConsigneename() {
		return consigneename;
	}

	public void setConsigneename(String consigneename) {
		this.consigneename = consigneename;
	}

	public Integer getMemberaccount() {
		return memberaccount;
	}

	public void setMemberaccount(Integer memberaccount) {
		this.memberaccount = memberaccount;
	}

	public String getTelphone() {
		return telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getShipingaddress() {
		return shipingaddress;
	}

	public void setShipingaddress(String shipingaddress) {
		this.shipingaddress = shipingaddress;
	}

	public String getDistributionregion() {
		return distributionregion;
	}

	public void setDistributionregion(String distributionregion) {
		this.distributionregion = distributionregion;
	}

	public String getDistributionway() {
		return distributionway;
	}

	public void setDistributionway(String distributionway) {
		this.distributionway = distributionway;
	}

	public Integer getDistributioncosts() {
		return distributioncosts;
	}

	public void setDistributioncosts(Integer distributioncosts) {
		this.distributioncosts = distributioncosts;
	}

	public String getModeofpayment() {
		return modeofpayment;
	}

	public void setModeofpayment(String modeofpayment) {
		this.modeofpayment = modeofpayment;
	}

	public String getTothetime() {
		return tothetime;
	}

	public void setTothetime(String tothetime) {
		this.tothetime = tothetime;
	}

	public String getEmailaddress() {
		return emailaddress;
	}

	public void setEmailaddress(String emailaddress) {
		this.emailaddress = emailaddress;
	}

	public String getRemitter() {
		return remitter;
	}

	public void setRemitter(String remitter) {
		this.remitter = remitter;
	}

	@Override
	public String toString() {
		return "Consignee [id=" + id + ", consigneename=" + consigneename + ", memberaccount="
				+ memberaccount + ", telphone=" + telphone + ", phone=" + phone + ", zipcode=" + zipcode
				+ ", shipingaddress=" + shipingaddress + ", distributionregion=" + distributionregion
				+ ", distributionway=" + distributionway + ", distributioncosts=" + distributioncosts
				+ ", modeofpayment=" + modeofpayment + ", tothetime=" + tothetime + ", emailaddress=" + emailaddress
				+ ", remitter=" + remitter + "]";
	}

	public Consignee(Integer id, String consigneename, Integer memberaccount, String telphone, String phone,
			String zipcode, String shipingaddress, String distributionregion, String distributionway,
			Integer distributioncosts, String modeofpayment, String tothetime, String emailaddress, String remitter) {
		super();
		this.id = id;
		this.consigneename = consigneename;
		this.memberaccount = memberaccount;
		this.telphone = telphone;
		this.phone = phone;
		this.zipcode = zipcode;
		this.shipingaddress = shipingaddress;
		this.distributionregion = distributionregion;
		this.distributionway = distributionway;
		this.distributioncosts = distributioncosts;
		this.modeofpayment = modeofpayment;
		this.tothetime = tothetime;
		this.emailaddress = emailaddress;
		this.remitter = remitter;
	}

	public Consignee() {
		super();
	}

    
    
    
}