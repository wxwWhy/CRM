package com.javasm.crm.b2c.entity;
//销售订单表

import java.util.ArrayList;
import java.util.List;

public class Order {
   
	
	private Integer id;
    private Integer orderid;
    private String ordertype;
    private String orderaction;
    private String businesstype;
    private String paymode;
    private String orderdate;
    private String orderstate;
    private String distributionway;
    private Integer memberaccount;
    private Integer productid;
    private String commoditylist;
    private Consignee oconsignee = new Consignee();
    private List<Orderinformation> orderinfo = new ArrayList<>();
    
    
	

	//预留字段，在数据库中并没有对应的字段
    private String startTime;
    private String endTime;
    
    
	@Override
	public String toString() {
		return "Order [id=" + id + ", orderid=" + orderid + ", ordertype=" + ordertype + ", orderaction=" + orderaction
				+ ", businesstype=" + businesstype + ", paymode=" + paymode + ", orderdate=" + orderdate
				+ ", orderstate=" + orderstate + ", distributionway=" + distributionway + ", memberaccount="
				+ memberaccount + ", productid=" + productid + ", commoditylist=" + commoditylist + ", oconsignee="
				+ oconsignee + ", orderinfo=" + orderinfo + ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}
	public Order(Integer id, Integer orderid, String ordertype, String orderaction, String businesstype, String paymode,
			String orderdate, String orderstate, String distributionway, Integer memberaccount, Integer productid,
			String commoditylist, Consignee oconsignee, List<Orderinformation> orderinfo, String startTime,
			String endTime) {
		super();
		this.id = id;
		this.orderid = orderid;
		this.ordertype = ordertype;
		this.orderaction = orderaction;
		this.businesstype = businesstype;
		this.paymode = paymode;
		this.orderdate = orderdate;
		this.orderstate = orderstate;
		this.distributionway = distributionway;
		this.memberaccount = memberaccount;
		this.productid = productid;
		this.commoditylist = commoditylist;
		this.oconsignee = oconsignee;
		this.orderinfo = orderinfo;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	public List<Orderinformation> getOrderinfo() {
		return orderinfo;
	}
	public void setOrderinfo(List<Orderinformation> orderinfo) {
		this.orderinfo = orderinfo;
	}
	public Consignee getOconsignee() {
		return oconsignee;
	}
	public void setOconsignee(Consignee oconsignee) {
		this.oconsignee = oconsignee;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOrderid() {
		return orderid;
	}
	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}
	public String getOrdertype() {
		return ordertype;
	}
	public void setOrdertype(String ordertype) {
		this.ordertype = ordertype;
	}
	public String getOrderaction() {
		return orderaction;
	}
	public void setOrderaction(String orderaction) {
		this.orderaction = orderaction;
	}
	public String getBusinesstype() {
		return businesstype;
	}
	public void setBusinesstype(String businesstype) {
		this.businesstype = businesstype;
	}
	public String getPaymode() {
		return paymode;
	}
	public void setPaymode(String paymode) {
		this.paymode = paymode;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getOrderstate() {
		return orderstate;
	}
	public void setOrderstate(String orderstate) {
		this.orderstate = orderstate;
	}
	public String getDistributionway() {
		return distributionway;
	}
	public void setDistributionway(String distributionway) {
		this.distributionway = distributionway;
	}
	public Integer getMemberaccount() {
		return memberaccount;
	}
	public void setMemberaccount(Integer memberaccount) {
		this.memberaccount = memberaccount;
	}
	public Integer getProductid() {
		return productid;
	}
	public void setProductid(Integer productid) {
		this.productid = productid;
	}
	public String getCommoditylist() {
		return commoditylist;
	}
	public void setCommoditylist(String commoditylist) {
		this.commoditylist = commoditylist;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}




	//	public Order(Integer id, Integer orderid, String ordertype, String orderaction, String businesstype, String paymode,
//			String orderdate, String orderstate, String distributionway, Integer memberaccount, Integer productid,
//			String commoditylist, String startTime, String endTime) {
//		super();
//		this.id = id;
//		this.orderid = orderid;
//		this.ordertype = ordertype;
//		this.orderaction = orderaction;
//		this.businesstype = businesstype;
//		this.paymode = paymode;
//		this.orderdate = orderdate;
//		this.orderstate = orderstate;
//		this.distributionway = distributionway;
//		this.memberaccount = memberaccount;
//		this.productid = productid;
//		this.commoditylist = commoditylist;
//		this.startTime = startTime;
//		this.endTime = endTime;
//	}
	public Order() {
		super();
	}
    
 
    
	
	

   
}