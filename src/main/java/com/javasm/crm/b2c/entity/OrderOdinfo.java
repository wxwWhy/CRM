package com.javasm.crm.b2c.entity;

public class OrderOdinfo {
    private Integer id;

    /**
     * 订单Id
     */
    private Integer orderid;

    /**
     * 商品编号
     */
    private Integer productid;

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

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }
}