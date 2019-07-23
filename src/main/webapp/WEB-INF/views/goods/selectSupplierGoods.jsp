<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSTL标签的使用-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>选用供应商品</title>
		<%@ include file="brandCSS.html"%>
		<style>
			#supplierGoodsTop {
				background-color: lightskyblue;
			}
			
			#supplierGoods {
				border: solid lightslategrey 1px;
			}
			
			#supplierGoodstable thead {
				background: lightgray;
			}
			
			#supplierGoodsH6 {
				color: red;
			}
			
			#supplierGoods_update_h5 {
				color: red;
			}
			
			#supplierGoods_insert_h5 {
				color: red;
			}
			
			#divTest1 {
				border: solid dodgerblue 1px;
			}
			
			#divTest2 {
				border-right: solid dodgerblue 1px;
				;
			}
		</style>
		<script>
			$(function() {
				$('#supplierGoodstable').bootstrapTable({
					url: "${pageContext.request.contextPath}/goods/showSelectSupplierGoods",
					queryParamsType: '',
					pagination: true,
					method: 'get',
					cache: true,
					sidePagination: 'server', // client or server
					pageNumber: 1,
					pageSize: 5,
					pageList: [2,5, 10, 15, 20, 25, 50, 100],
					toolbar: "#supplierGoodsForm",
					uniqueId: "z_id",
					clickToSelect: true,
					columns: [{
						title: "序号",
						width: 10,
						align: "center",
						valign: 'middle',
						formatter: function(value, row, index) {
							//return index + 1;
							var pageSize = $('#supplierGoodstable').bootstrapTable('getOptions').pageSize; //通过表的#id 可以得到每页多少条
							var pageNumber = $('#supplierGoodstable').bootstrapTable('getOptions').pageNumber; //通过表的#id 可以得到当前第几页
							return pageSize * (pageNumber - 1) + index + 1; //返回每条的序号： 每页条数 * （当前页 - 1 ）+ 序号
						}
					}, {
						field: "z_id",
						title: "中间表ID",
						//hidden:true, -----> 这种方法不管用
						visible: false, //false是隐藏这一列
						width: 150,
						align: "center",
						valign: 'middle'

					}, {
						field: "z_f_id",
						title: "商品ID",
						width: 150,
						align: "center",
						valign: 'middle'
					}, {
						field: "z_f_name",
						title: "商品名称",
						width: 150,
						align: 'center',
						valign: 'middle',
					}, {
						field: "z_purchase_price",
						title: "采购价",
						width: 150,
						align: 'center',
						valign: 'middle',
						/*formatter: function (value) {
                        	return value === 1 ? "男" : "女";
                    	}*/
					}, {
						field: "z_market_price",
						title: "市场价",
						width: 150,
						align: 'center',
						valign: 'middle',
					}, {
						field: "z_id",
						title: "操作",
						width: 150,
						align: 'center',
						valign: 'middle',
						formatter: actionFormatter
					}],

					//查询参数，也就是往后端传递的查询条件   args   json格式，可以输出来查看一下
					queryParams: function(params) {
						var args = {};
						args["pageNumber"] = params.pageNumber;
						args["pageSize"] = params.pageSize;
						return args;
					}
				})
				
				$("#return").on("click",function(){
					location.href="${pageContext.request.contextPath}/goods/goSupplier";
				})
				
				//为选择商品按钮绑定事件
				$("#selectGood").on("click",function(){
					window.location.href="${pageContext.request.contextPath}/goods/goSupplierSelectGood";
				})
				
			})

			//操作栏格式化   //value：当前field的值，即id   //row：当前每一行的数据
			function actionFormatter(value, row, index) {
				var id = value;
				var result = "";
				result += "&nbsp;<button type='button' class='btn btn-success' onclick='deleteById(" + id + ")' >删除</button>";
				return result;

			}
			
			//给删除按钮绑定事件
			function deleteById(id){
				var msg = "您真的确定要删除这条数据吗？";
				if(confirm(msg)){
					$.post("${pageContext.request.contextPath}/goods/toDelete",{"z_id":id},
							function(data){
								alert(data);
								$('#supplierGoodstable').bootstrapTable("refresh");
							},"json"
					);
				}
			}
			
		</script>

	</head>

	<body class="layui-layout-body">
		<div class="layui-layout layui-layout-admin">
			<div class="layui-header">
				<%@include file="../common/topUi.jsp" %>
			</div>

			<div class="layui-side layui-bg-black">
				<div class="layui-side-scroll" id="admin-navbar-side">
					<%@include file="../common/menu.jsp" %>
				</div>
			</div>

			<div class="layui-body">
				<div class="container-fluid">
					<h3 id="supplierGoodsTop" class="col-md-2">
						选用供应商品管理
					</h3>

					<h6 id="supplierGoodsH6">商品与赠品管理-->供应商管理-->选用供应商品</h6>
					<div id="supplierGoods">
						<div>
							<form id="supplierGoodsForm">
								<div id="divTest1">
									<span class="col-md-2" id="divTest2">供应商名称：</span><span class="col-md-10" id="sName">${supplier.s_name}</span>
								</div>
								<button type='button' class='btn btn-success' id="selectGood">选择商品</button>
							</form>

							<table id="supplierGoodstable">

							</table>

						</div>

					</div>
					<button type='button' class='btn btn-success' id="return">返回</button>

				</div>
			</div>

			<div class="layui-footer">
				<!-- 底部固定区域 -->
				© layui.com - 底部固定区域
			</div>
		</div>

	</body>

</html>