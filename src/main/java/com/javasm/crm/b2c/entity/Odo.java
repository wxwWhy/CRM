package com.javasm.crm.b2c.entity;

//销售出库单实体类

public class Odo {

	private Integer id;
    private Integer orderid;
    private String  ordertype;
    private String  orderaction;
    private String  businesstype;
    private String  paymode;
    private String  orderdate;
    private String  orderstate;
    private String  distributionway;
    private Integer memberaccount;
    private Integer productid;
    private String  commoditylist;
    private String  createTime;
    private String  createMan;
    private String startTime;
    private String endTime;
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
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCreateMan() {
		return createMan;
	}
	public void setCreateMan(String createMan) {
		this.createMan = createMan;
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
	@Override
	public String toString() {
		return "Odo [id=" + id + ", orderid=" + orderid + ", ordertype=" + ordertype + ", orderaction=" + orderaction
				+ ", businesstype=" + businesstype + ", paymode=" + paymode + ", orderdate=" + orderdate
				+ ", orderstate=" + orderstate + ", distributionway=" + distributionway + ", memberaccount="
				+ memberaccount + ", productid=" + productid + ", commoditylist=" + commoditylist + ", createTime="
				+ createTime + ", createMan=" + createMan + ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}
	public Odo(Integer id, Integer orderid, String ordertype, String orderaction, String businesstype, String paymode,
			String orderdate, String orderstate, String distributionway, Integer memberaccount, Integer productid,
			String commoditylist, String createTime, String createMan, String startTime, String endTime) {
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
		this.createTime = createTime;
		this.createMan = createMan;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	public Odo() {
		super();
	}
	
    
    
    
}
