package com.javasm.crm.b2c.entity;


//客户退货单实体类
public class Returns {
	
                                            
	private Integer id;                      //订单Id
    private Integer orderId;                 //订单编号
    private String orderType;                //订单类型
    private String orderAction;              //订单动作 
    private String businessType;             //业务类型
    private String payMode;                  //支付方式
    private String orderDate;                //下单日期
    private String orderState;               //订单状态
    private Integer memberAccount;           //会员账号
    private String distributionWay;          // 配送方式
    private String commodityList;            //商品清单
    private String consigneeName;            //收货人姓名
    private String telPhone;                 //联系电话
    private String phone;                    //联系手机
    private String zipCode;                  //邮政编码
    private String shipingAddress;           //收货地址
    private String distributionRegion;       //配送地区
    private Integer distributionCosts;       //配送费用
    private String modeOfPayment;            //支付方式
    private String toTheTime;                // 自提时间
    private String emailAddress;             //电子邮箱
    private String remitter;                 // 汇款人
    private Integer productId;               //商品编号 
    private String productName;              //商品名称
    private Double price;                    //单价
    private Integer number;                  //数量
    private Double totalMoney;               //总金额
    private String creator;                  // 创建人
    private String createTime;               //创建时间
    private String rejection;                // 拒收原因
    private String rejectionTime;            //拒收时间
    
    //预留字段，在数据库中并没有对应的字段
    private String startTime;
    private String endTime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getOrderAction() {
		return orderAction;
	}
	public void setOrderAction(String orderAction) {
		this.orderAction = orderAction;
	}
	public String getBusinessType() {
		return businessType;
	}
	public void setBusinessType(String businessType) {
		this.businessType = businessType;
	}
	public String getPayMode() {
		return payMode;
	}
	public void setPayMode(String payMode) {
		this.payMode = payMode;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderState() {
		return orderState;
	}
	public void setOrderState(String orderState) {
		this.orderState = orderState;
	}
	public Integer getMemberAccount() {
		return memberAccount;
	}
	public void setMemberAccount(Integer memberAccount) {
		this.memberAccount = memberAccount;
	}
	public String getDistributionWay() {
		return distributionWay;
	}
	public void setDistributionWay(String distributionWay) {
		this.distributionWay = distributionWay;
	}
	public String getCommodityList() {
		return commodityList;
	}
	public void setCommodityList(String commodityList) {
		this.commodityList = commodityList;
	}
	public String getConsigneeName() {
		return consigneeName;
	}
	public void setConsigneeName(String consigneeName) {
		this.consigneeName = consigneeName;
	}
	public String getTelPhone() {
		return telPhone;
	}
	public void setTelPhone(String telPhone) {
		this.telPhone = telPhone;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getZipCode() {
		return zipCode;
	}
	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}
	public String getShipingAddress() {
		return shipingAddress;
	}
	public void setShipingAddress(String shipingAddress) {
		this.shipingAddress = shipingAddress;
	}
	public String getDistributionRegion() {
		return distributionRegion;
	}
	public void setDistributionRegion(String distributionRegion) {
		this.distributionRegion = distributionRegion;
	}
	public Integer getDistributionCosts() {
		return distributionCosts;
	}
	public void setDistributionCosts(Integer distributionCosts) {
		this.distributionCosts = distributionCosts;
	}
	public String getModeOfPayment() {
		return modeOfPayment;
	}
	public void setModeOfPayment(String modeOfPayment) {
		this.modeOfPayment = modeOfPayment;
	}
	public String getToTheTime() {
		return toTheTime;
	}
	public void setToTheTime(String toTheTime) {
		this.toTheTime = toTheTime;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getRemitter() {
		return remitter;
	}
	public void setRemitter(String remitter) {
		this.remitter = remitter;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
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
	public Double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getRejection() {
		return rejection;
	}
	public void setRejection(String rejection) {
		this.rejection = rejection;
	}
	public String getRejectionTime() {
		return rejectionTime;
	}
	public void setRejectionTime(String rejectionTime) {
		this.rejectionTime = rejectionTime;
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
		return "Returns [id=" + id + ", orderId=" + orderId + ", orderType=" + orderType + ", orderAction="
				+ orderAction + ", businessType=" + businessType + ", payMode=" + payMode + ", orderDate=" + orderDate
				+ ", orderState=" + orderState + ", memberAccount=" + memberAccount + ", distributionWay="
				+ distributionWay + ", commodityList=" + commodityList + ", consigneeName=" + consigneeName
				+ ", telPhone=" + telPhone + ", phone=" + phone + ", zipCode=" + zipCode + ", shipingAddress="
				+ shipingAddress + ", distributionRegion=" + distributionRegion + ", distributionCosts="
				+ distributionCosts + ", modeOfPayment=" + modeOfPayment + ", toTheTime=" + toTheTime
				+ ", emailAddress=" + emailAddress + ", remitter=" + remitter + ", productId=" + productId
				+ ", productName=" + productName + ", price=" + price + ", number=" + number + ", totalMoney="
				+ totalMoney + ", creator=" + creator + ", createTime=" + createTime + ", rejection=" + rejection
				+ ", rejectionTime=" + rejectionTime + ", startTime=" + startTime + ", endTime=" + endTime + "]";
	}
	public Returns(Integer id, Integer orderId, String orderType, String orderAction, String businessType,
			String payMode, String orderDate, String orderState, Integer memberAccount, String distributionWay,
			String commodityList, String consigneeName, String telPhone, String phone, String zipCode,
			String shipingAddress, String distributionRegion, Integer distributionCosts, String modeOfPayment,
			String toTheTime, String emailAddress, String remitter, Integer productId, String productName, Double price,
			Integer number, Double totalMoney, String creator, String createTime, String rejection,
			String rejectionTime, String startTime, String endTime) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.orderType = orderType;
		this.orderAction = orderAction;
		this.businessType = businessType;
		this.payMode = payMode;
		this.orderDate = orderDate;
		this.orderState = orderState;
		this.memberAccount = memberAccount;
		this.distributionWay = distributionWay;
		this.commodityList = commodityList;
		this.consigneeName = consigneeName;
		this.telPhone = telPhone;
		this.phone = phone;
		this.zipCode = zipCode;
		this.shipingAddress = shipingAddress;
		this.distributionRegion = distributionRegion;
		this.distributionCosts = distributionCosts;
		this.modeOfPayment = modeOfPayment;
		this.toTheTime = toTheTime;
		this.emailAddress = emailAddress;
		this.remitter = remitter;
		this.productId = productId;
		this.productName = productName;
		this.price = price;
		this.number = number;
		this.totalMoney = totalMoney;
		this.creator = creator;
		this.createTime = createTime;
		this.rejection = rejection;
		this.rejectionTime = rejectionTime;
		this.startTime = startTime;
		this.endTime = endTime;
	}
	public Returns() {
		super();
	}
    
    
    
    

}
