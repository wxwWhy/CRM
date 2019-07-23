<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSTL标签的使用-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="my.html"%>
<!DOCTYPE html>
<html>

	<head>
	
		<meta charset="UTF-8">
		<title>CRM</title>
		<link rel="stylesheet" href="/CRM/layDate-v5.0.9/laydate/theme/default/laydate.css" />
		<script type="text/javascript" src="/CRM//layDate-v5.0.9/laydate/laydate.js" ></script>
		<style>
			#orderTable thead {
				background: lightyellow;
			}
			#h6{
				color:red;
			}
			#update_h5{
				color: red;
			}
			#insert_h5{
				color: red;
			}
		</style>
		<!--服务器端自动分页，bootstrap-table根据服务器端返回的total，以及table设定的pageSize，自动生成分页的页面元素，
			每次点击下一页或者指定页码，bootstrap-table会自动给参数pageNumber赋值，服务器返回指定页的数据。-->
		<script type="text/javascript">
			$(function() {
				$('#orderTable').bootstrapTable({
					url:"${pageContext.request.contextPath}/odo/selectAll",
					queryParamsType : '',
					pagination: true,
					sidePagination: 'server', // client or server
					pageNumber: 1,
					pageSize: 5,
					pageList: [2, 5, 10, 15, 20, 25, 50, 100],
					toolbar: "#queryForm",
					uniqueId: "brand_id",
					clickToSelect: true,
					columns: [{
						title:"序号",
						width: 10,
						align: "center",
						valign: 'middle',
						formatter:function(value,row,index){
							//return index+1;
							var pageSize=$('#orderTable').bootstrapTable('getOptions').pageSize;//通过表的#id 可以得到每页多少条
			                var pageNumber=$('#orderTable').bootstrapTable('getOptions').pageNumber;//通过表的#id 可以得到当前第几页
			                return pageSize * (pageNumber - 1) + index + 1;//返回每条的序号： 每页条数 * （当前页 - 1 ）+ 序号
						}
						},{
							field: "id",
							title: "订单ID",
							//hidden:true, -----> 这种方法不管用
							visible: false,//false是隐藏这一列
							width: 150,
							align: "center",
							valign: 'middle'
							
						},{
							field: "orderdate",
							title: "下单日期",
							//hidden:true, -----> 这种方法不管用
							visible: false,//false是隐藏这一列
							width: 150,
							align: "center",
							valign: 'middle'
							
						},{
							field: "orderid",
							title: "订单编号",
							width: 150,
							align: 'center',
							valign: 'middle',
						},{
							field: "ordertype",
							title: "订单类型",
							width: 150,
							align: "center",
							valign: 'middle'
						}, {
							field: "orderaction",
							title: "订单动作",
							width: 150,
							align: 'center',
							valign: 'middle',
						}, {
							field: "businesstype",
							title: "业务类型",
							width: 150,
							align: 'center',
							valign: 'middle',
						}, {
							field: "paymode",
							title: "支付方式",
							width: 150,
							align: 'center',
							valign: 'middle',
						}, {
							field: "createTime",
							title: "创建时间",
							width: 150,
							align: 'center',
							valign: 'middle',
						}, {
							field: "orderstate",
							title: "订单状态",
							width: 150,
							align: 'center',
							valign: 'middle',
						},{
							field: "id",
							title: "操作",
							width: 150,
							align: 'center',
							valign: 'middle',
							formatter: actionFormatter
						}],

						//查询参数，也就是往后端传递的查询条件   args   json格式，可以输出来查看一下
					queryParams: function(data) {
						//				console.log(data);
						var args = getArgs();
						args["pageNumber"] = data.pageNumber;
						args["pageSize"] = data.pageSize;
						//				console.log(args);
						return args;
					},
				})
				
				//点击搜索按钮的时候，刷新整个页面，把搜索框中的值传到后台查询数据
				$("#selectAll").on("click",function(){
					query();
				});
				
				$("#dao").on("click",function(){
					daochu();
				})
				
				
				//页面刚加载时候,发送ajax请求，查出的数据填在下拉框中
				$.post("/CRM/order/selectDow",
				{},
				function(data){
					//console.log(data);	
					 for (var i = 0; i < data.listOrderType.length; i++) {
					    $("#id1").append("<option>"+data.listOrderType[i]+"</option>");
					　　}
					for (var i = 0; i < data.listPayMode.length; i++) {
					    $("#id2").append("<option>"+data.listPayMode[i]+"</option>");
					　　}
					for (var i = 0; i < data.listBusinessType.length; i++) {
					   	$("#id3").append("<option>"+data.listBusinessType[i]+"</option>");
					　　} 
					for (var i = 0; i < data.listOrderAction.length; i++) {
					   	$("#id4").append("<option>"+data.listOrderAction[i]+"</option>");
					　　} 
					for (var i = 0; i < data.listOrderState.length; i++) {
					   	$("#id5").append("<option>"+data.listOrderState[i]+"</option>");
					　　} 
				},"json")
				
				
          
		
          
		//日期選擇框
				laydate.render({
					  elem: '#test1'
					  ,range: true
					});
				//第一个function到此结束	
			}) 
				
		
				

			

			//页面加载时,都会调用此方法，操作栏格式化   //value：当前field的值，即id   //row：当前每一行的数据
			function actionFormatter(value, row, index) {
				var id = value;
				var result = "<button type='button' class='btn btn-success'  id='hhhh' onclick='look()'>查看</button>";
				return result;

			}
			
			
			//搜索框值的获取，拼成json的格式
			function getArgs() {
				var params = {};
				var temp ='';
			//先判断是否为空，不为空的话就取值
				$(".selOrder").each(function() {
					if(temp!=$("#orderId").val()){
						params.orderid=$("#orderId").val();
					}
					
			//获取下拉框中的值
			     var temp1='全部'; //先判断是否等于全部，不等于的话取值传递到后台
			   if(temp1 !=$("#id1 option:selected").text()){
				   params.ordertype=$("#id1 option:selected").text();
			   }
			   if(temp1 !=$("#id2 option:selected").text()){
				   params.paymode=$("#id2 option:selected").text();
			   }
			   if(temp1 !=$("#id3 option:selected").text()){
				   params.businesstype=$("#id3 option:selected").text();
			   }
			   if(temp1 !=$("#id4 option:selected").text()){
				   params.orderaction=$("#id4 option:selected").text();
			   }
			   if(temp1 !=$("#id5 option:selected").text()){
				   params.orderstate=$("#id5 option:selected").text();
			   }
			   
			 //获取时间列表的值
			 if(temp!=$("#test1").val()){
			   params.orderdate =$("#test1").val();
			 }
				});
				//console.log(params);
				return params;
			}
			
			
			function query() {
				$('#orderTable').bootstrapTable("refresh");//,{silent: true}
			}
		
   //查看按钮发送请求
       /* function look(){
    	   $("#hhhh").on("click",function(){
    			location.href = "${pageContext.request.contextPath}/shop/go";
    		})
       }	 */
			
		</script>
	</head>

	<body>

		<div class="container">
			<h6 id="h6">B2C销售管理-->B2C销售订单管理-->B2C销售订单列表</h6>

          <form id="queryForm">
				订单编号：<input type="text" id="orderId"  class="selOrder" />
				
				订单类型：<select id="id1"   class="selOrder" >
				 <option>全部</option>
				 </select>
				
				 支付方式：<select id="id2"   class="selOrder" >
				 <option>全部</option>
				 </select>
				 
				 业务类型：<select id="id3"  class="selOrder" >
				 <option>全部</option>
				 </select></br>
				 
				 下单日期期间：<input type="text"  id="test1"    class="selOrder"/>
				 
					
      

				 订单动作：<select id="id4" id="orderaction" class="selOrder" >
				 <option>全部</option>
				 </select>
				 
				  订单状态：<select id="id5"  class="selOrder" >
				 <option>全部</option>
				 </select>
				 
				<button type="button"  id="selectAll" class="btn btn-primary"  onclick="query()">搜索</button>
				
				
				<input type="file"  id="dao" class="btn btn-primary" value="导出"></button>
			</form>
			<table id="orderTable"> 

			</table>
			
		</div>

	</body>
	
</html>