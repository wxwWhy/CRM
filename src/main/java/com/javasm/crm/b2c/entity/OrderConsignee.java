package com.javasm.crm.b2c.entity;

public class OrderConsignee {
    private Integer id;

    /**
     * 订单Id
     */
    private Integer orderid;

    /**
     * 会员账号
     */
    private Integer memberaccount;

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

    public Integer getMemberaccount() {
        return memberaccount;
    }

    public void setMemberaccount(Integer memberaccount) {
        this.memberaccount = memberaccount;
    }
}