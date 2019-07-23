package com.javasm.crm.goodsAndGifts.entity;

import com.javasm.crm.permission.mapper.PermissionMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * 商品品牌实体类
 * @author JAVASM
 *
 */

public class Brand {
	private Integer brand_id;
	private String brand_name;
	private String brand_url;
	private String brand_describe;
    @Autowired
    private PermissionMapper permissionMapper;

    public Integer getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(Integer brand_id) {
		this.brand_id = brand_id;
	}
	public String getBrand_name() {
		return brand_name;
	}
	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	public String getBrand_url() {
		return brand_url;
	}
	public void setBrand_url(String brand_url) {
		this.brand_url = brand_url;
	}
	public String getBrand_describe() {
		return brand_describe;
	}
	public void setBrand_describe(String brand_describe) {
		this.brand_describe = brand_describe;
	}
	@Override
	public String toString() {
		return "Brand [brand_id=" + brand_id + ", brand_name=" + brand_name + ", brand_url=" + brand_url
				+ ", brand_describe=" + brand_describe + "]";
	}
	public Brand(Integer brand_id, String brand_name, String brand_url, String brand_describe) {
		super();
		this.brand_id = brand_id;
		this.brand_name = brand_name;
		this.brand_url = brand_url;
		this.brand_describe = brand_describe;
	}
	
	public Brand(String brand_name, String brand_url, String brand_describe) {
		super();
		this.brand_name = brand_name;
		this.brand_url = brand_url;
		this.brand_describe = brand_describe;
	}
	public Brand() {
		super();
	}

}
