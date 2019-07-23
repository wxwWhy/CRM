package com.javasm.crm.goodsAndGifts.entity;

/**
 * 供应商实体类
 * @author JAVASM
 *
 */
public class Supplier {
	private Integer s_id;
	private String s_name;
	private String s_contact;
	private String s_phone;
	private String s_email;
	private String s_address;
	private String s_bankName;
	private Integer s_accountNumber;
	public Integer getS_id() {
		return s_id;
	}
	public void setS_id(Integer s_id) {
		this.s_id = s_id;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public String getS_contact() {
		return s_contact;
	}
	public void setS_contact(String s_contact) {
		this.s_contact = s_contact;
	}
	public String getS_phone() {
		return s_phone;
	}
	public void setS_phone(String s_phone) {
		this.s_phone = s_phone;
	}
	public String getS_email() {
		return s_email;
	}
	public void setS_email(String s_email) {
		this.s_email = s_email;
	}
	public String getS_address() {
		return s_address;
	}
	public void setS_address(String s_address) {
		this.s_address = s_address;
	}
	public String getS_bankName() {
		return s_bankName;
	}
	public void setS_bankName(String s_bankName) {
		this.s_bankName = s_bankName;
	}
	public Integer getS_accountNumber() {
		return s_accountNumber;
	}
	public void setS_accountNumber(Integer s_accountNumber) {
		this.s_accountNumber = s_accountNumber;
	}
	@Override
	public String toString() {
		return "Supplier [s_id=" + s_id + ", s_name=" + s_name + ", s_contact=" + s_contact + ", s_phone=" + s_phone
				+ ", s_email=" + s_email + ", s_address=" + s_address + ", s_bankName=" + s_bankName
				+ ", s_accountNumber=" + s_accountNumber + "]";
	}
	public Supplier(Integer s_id, String s_name, String s_contact, String s_phone, String s_email, String s_address,
			String s_bankName, Integer s_accountNumber) {
		super();
		this.s_id = s_id;
		this.s_name = s_name;
		this.s_contact = s_contact;
		this.s_phone = s_phone;
		this.s_email = s_email;
		this.s_address = s_address;
		this.s_bankName = s_bankName;
		this.s_accountNumber = s_accountNumber;
	}
	
	
	public Supplier(String s_name, String s_contact, String s_phone, String s_email, String s_address,
			String s_bankName, Integer s_accountNumber) {
		super();
		this.s_name = s_name;
		this.s_contact = s_contact;
		this.s_phone = s_phone;
		this.s_email = s_email;
		this.s_address = s_address;
		this.s_bankName = s_bankName;
		this.s_accountNumber = s_accountNumber;
	}
	public Supplier() {
		super();
	}
	
	
	
}
