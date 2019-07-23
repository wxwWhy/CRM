package com.javasm.crm.goodsAndGifts.entity;

/**
 * 选用供应商品表实体类
 * @author JAVASM
 *
 */
public class SelectSupplierGoods {
	private Integer z_id;
	private Integer z_s_id;
	private Integer z_f_id;
	private String z_s_name;
	private String z_f_name;
	private Double z_purchase_price;
	private Double z_market_price;
	public Integer getZ_id() {
		return z_id;
	}
	public void setZ_id(Integer z_id) {
		this.z_id = z_id;
	}
	public Integer getZ_s_id() {
		return z_s_id;
	}
	public void setZ_s_id(Integer z_s_id) {
		this.z_s_id = z_s_id;
	}
	public Integer getZ_f_id() {
		return z_f_id;
	}
	public void setZ_f_id(Integer z_f_id) {
		this.z_f_id = z_f_id;
	}
	public String getZ_s_name() {
		return z_s_name;
	}
	public void setZ_s_name(String z_s_name) {
		this.z_s_name = z_s_name;
	}
	public String getZ_f_name() {
		return z_f_name;
	}
	public void setZ_f_name(String z_f_name) {
		this.z_f_name = z_f_name;
	}
	public Double getZ_purchase_price() {
		return z_purchase_price;
	}
	public void setZ_purchase_price(Double z_purchase_price) {
		this.z_purchase_price = z_purchase_price;
	}
	public Double getZ_market_price() {
		return z_market_price;
	}
	public void setZ_market_price(Double z_market_price) {
		this.z_market_price = z_market_price;
	}
	@Override
	public String toString() {
		return "SelectSupplierGoods [z_id=" + z_id + ", z_s_id=" + z_s_id + ", z_f_id=" + z_f_id + ", z_s_name="
				+ z_s_name + ", z_f_name=" + z_f_name + ", z_purchase_price=" + z_purchase_price + ", z_market_price="
				+ z_market_price + "]";
	}
	public SelectSupplierGoods(Integer z_id, Integer z_s_id, Integer z_f_id, String z_s_name, String z_f_name,
			Double z_purchase_price, Double z_market_price) {
		super();
		this.z_id = z_id;
		this.z_s_id = z_s_id;
		this.z_f_id = z_f_id;
		this.z_s_name = z_s_name;
		this.z_f_name = z_f_name;
		this.z_purchase_price = z_purchase_price;
		this.z_market_price = z_market_price;
	}
	public SelectSupplierGoods() {
		super();
	}
	
	
}
