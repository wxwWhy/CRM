package com.javasm.crm.goodsAndGifts.entity;

import java.util.ArrayList;
import java.util.List;

public class GoodsTypeNode {
	
	private Integer id;
	private Integer pId;
	private String name;
	private String discrip;
	@Override
	public String toString() {
		return "GoodsTypeNode [id=" + id + ", pId=" + pId + ", name=" + name + ", discrip=" + discrip + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getpId() {
		return pId;
	}
	public void setpId(Integer pId) {
		this.pId = pId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDiscrip() {
		return discrip;
	}
	public void setDiscrip(String discrip) {
		this.discrip = discrip;
	}
	public GoodsTypeNode(Integer id, Integer pId, String name, String discrip) {
		super();
		this.id = id;
		this.pId = pId;
		this.name = name;
		this.discrip = discrip;
	}
	public GoodsTypeNode() {
		super();
		// TODO Auto-generated constructor stub
	}
	
//	private Integer tlevel;
//	private List<GoodsTypeNode> chilidren = new ArrayList<>();//子节点集合
//	public Integer getId() {
//		return id;
//	}
//	public void setId(Integer id) {
//		this.id = id;
//	}
//	public String getName() {
//		return name;
//	}
//	public void setName(String name) {
//		this.name = name;
//	}
//	public Integer getpId() {
//		return pId;
//	}
//	public void setpId(Integer pId) {
//		this.pId = pId;
//	}
//	public GoodsTypeNode() {
//		super();
//		// TODO Auto-generated constructor stub
//	}
//	public GoodsTypeNode(Integer id, Integer pId, String name) {
//		super();
//		this.id = id;
//		this.name = name;
//		this.pId = pId;
//	}
	
	
	
	
}
