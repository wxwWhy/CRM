package com.javasm.crm.b2c.entity;

//订单信息表
public class Orderinformation {
    private Integer id;

    /**
     * 商品编号
     */
    private Integer productid;

    
    
    
    /**
     * 商品名称
     */
    private String productname;

    /**
     * 单价
     */
    private Double price;

    /**
     * 数量
     */
    private Integer number;

    /**
     * 总金额
     */
    private Double totalmoney;

    /**
     * 创建人
     */
    private String creator;

    /**
     * 创建时间
     */
    private String createtime;

    /**
     * 拒收原因
     */
    private String rejection;

    /**
     * 拒收时间
     */
    private String rejectiontime;
    
    

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Double getTotalmoney() {
		return totalmoney;
	}

	public void setTotalmoney(Double totalmoney) {
		this.totalmoney = totalmoney;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getRejection() {
		return rejection;
	}

	public void setRejection(String rejection) {
		this.rejection = rejection;
	}

	public String getRejectiontime() {
		return rejectiontime;
	}

	public void setRejectiontime(String rejectiontime) {
		this.rejectiontime = rejectiontime;
	}

	@Override
	public String toString() {
		return " [id=" + id + ", productid=" + productid + ", productname=" + productname + ", price="
				+ price + ", number=" + number + ", totalmoney=" + totalmoney + ", creator=" + creator + ", createtime="
				+ createtime + ", rejection=" + rejection + ", rejectiontime=" + rejectiontime + "]";
	}

	public Orderinformation(Integer id, Integer productid, String productname, Double price, Integer number,
			Double totalmoney, String creator, String createtime, String rejection, String rejectiontime) {
		super();
		this.id = id;
		this.productid = productid;
		this.productname = productname;
		this.price = price;
		this.number = number;
		this.totalmoney = totalmoney;
		this.creator = creator;
		this.createtime = createtime;
		this.rejection = rejection;
		this.rejectiontime = rejectiontime;
	}

	public Orderinformation() {
		super();
	}

  
}