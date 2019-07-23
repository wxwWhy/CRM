<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<link href="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<link href="https://cdn.bootcss.com/bootstrap-table/1.13.4/bootstrap-table.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/bootstrap-table/1.13.4/bootstrap-table.min.js"></script>
 <!--汉化文件，放在 bootstrap-table.js 后面-->
<script src="https://cdn.bootcss.com/bootstrap-table/1.12.2/locale/bootstrap-table-zh-CN.min.js"></script>

</head>
<script type="text/javascript">


	$(function(){
		//var  ${orderUser.ordertype};
		
		$("#orderId").html("${orderUser.orderid}");
		$("#orderType").html("${orderUser.ordertype}");
		$("#orderDate").html("${orderUser.orderdate}");
		$("#orderAction").html("${orderUser.orderaction}");
		$("#businessType").html("${orderUser.businesstype}");
		$("#orderState").html("${orderUser.orderstate}"); 
		
		$("#consigneeName").html("${orderUser.oconsignee.consigneename}"); 
		$("#memberAccount").html("${orderUser.oconsignee.memberaccount}"); 
		$("#telPhone").html("${orderUser.oconsignee.telphone}"); 
		$("#phone").html("${orderUser.oconsignee.phone}"); 
		$("#zipCode").html("${orderUser.oconsignee.zipcode}"); 
		$("#shipingAddress").html("${orderUser.oconsignee.shipingaddress}"); 
		$("#distributionRegion").html("${orderUser.oconsignee.distributionregion}"); 
		$("#distributionWay").html("${orderUser.oconsignee.distributionway}"); 
		$("#distributionCosts").html("${orderUser.oconsignee.distributioncosts}"); 
		$("#modeOfPayment").html("${orderUser.oconsignee.modeofpayment}"); 
		$("#toTheTime").html("${orderUser.oconsignee.tothetime}"); 
		$("#emailAddress").html("${orderUser.oconsignee.emailaddress}"); 
		$("#remitter").html("${orderUser.oconsignee.remitter}"); 
		
		var test = "${orderUser.orderinfo}";
		 <c:forEach  var="item" items="${orderUser.orderinfo}">
		// 	console.log(${item});
		 	$(".tbodyclass").append('<tr><td>'+"${item.productid}"+'</td>	<td>'+"${item.productname}"+'</td>	<td>'+"${item.price}"+'</td>	<td>'+"${item.number}"+'</td>	<td>'+"${item.totalmoney}"+'</td></tr>');
     	 </c:forEach>
     	 
     	 //返回 点击事件
     	 $(".returngo").on("click",function(){
     		 location.href="/CRM/order/go" ;
     	 })
     	 
     	 //下载点击事件
     	 $(".downwordbt").on("click",function(){
     		/* $.post("/CRM/order/dlword",{},function(data){console.log(data)},"json"); */
     		location.href="/CRM/order/dlword"
     		 
     	 })
		
	});
	
</script>
<body>
	
	<div class="container-fluid">
		 <div class="row ">
					    <div class="col alert alert-primary m-auto" role="alert" style="text-align: center;">B2C销售订单管理</div>
					    <div class="col-10"></div>
		 </div>
		 <div style="border: 1px solid black;"><!--加外边框-->
		 	<p class="text-danger">B2C销售管理--&gt;B2C订单管理--&gt;B2C销售订单详情</p>
		  	   <hr style=" height:5px;border:none;border-top:1px dotted #987cb9;"><!-- 分割线 -->
		 <div class="row">
		 	
		 	
		 </div>
	<table class="table table-bordered">
		  <tbody class="tbodyclass">
		  	<tr>
		      <th>订单基本资料</th>
		    </tr>
		    <tr>
		      <td >订单编号:</td>
		      <td><span id="orderId"></span></td>
		      <td>下单日期:</td>
		      <td><span id="orderDate"></span></td>
		    </tr>
		    <tr>
		      <td>订单类型:</td>
		      <td><span id="orderType"></span></td>
		      <td>订单动作:</td>
		      <td><span id="orderAction"></span></td>
		    </tr>
		    <tr>
		      <td>业务类型:</td>
		      <td><span id="businessType"></span></td>
		      <td>订单状态:</td>
		      <td><span id="orderState"></span></td>
		    </tr>
		 <!---->
		    <tr>
		      <th>收货人资料</th>
		    </tr>
		    <tr>
		      <td>收货人姓名:</td>
		      <td><span id="consigneeName"></span></td>
		      <td>会员帐号：</td>
		      <td><span id="memberAccount"></span></td>
		    </tr>
		    <tr>
		      <td>联系电话:</td>
		      <td><span id="telPhone"></span></td>
		      <td>联系手机:</td>
		      <td><span id="phone"></span></td>
		    </tr>
		    <tr>
		      <td>邮政编码:</td>
		      <td><span id="zipCode"></span></td>
		      <td>收货地址:</td>
		      <td><span id="shipingAddress"></span></td>
		    </tr>
		     <tr>
		      <td >配送地区:</td>
		      <td><span id="distributionRegion"></span></td>
		      <td>配送方式：</td>
		      <td><span id="distributionWay"></span></td>
		    </tr>
		    <tr>
		      <td >配送费用:</td>
		      <td><span id="distributionCosts"></span></td>
		      <td>支付方式:</td>
		      <td><span id="modeOfPayment"></span></td>
		    </tr>
		    <tr>
		      <td >自提时间:</td>
		      <td><span id="toTheTime"></span></td>
		      <td>电子邮箱:</td>
		      <td><span id="emailAddress"></span></td>
		    </tr>
		    <tr>
		      <td >汇款人:</td>
		      <td><span id="remitter"></span></td>
		    </tr>
		    <tr>
		      <td >备注:</td>
		      <td><span></span></td>
		    </tr>
		    <!---->
		    <tr>
		    	<th>订单商品信息</th>
		    </tr>
		    <tr>
				<td>商品编号</td>	<td>商品名称</td>	<td>单价</td>	<td>数量</td>	<td>总金额</td>		    	
		    </tr>
		  </tbody>
		</table>
	
	
		</div>
		<br/>
	 	<div class="row">
	 	 	<div class="col-10"> </div>
		    <div class="col-1">
		      <button type="button" class="btn btn-primary returngo">返回</button>
		    </div>
		    <div class="col-1">
		      <button type="button" class="btn btn-info downwordbt">下载</button>
		    </div>
		   
	    </div>
	
	 
	 
	 
	 
	</div>
</body>
</html>