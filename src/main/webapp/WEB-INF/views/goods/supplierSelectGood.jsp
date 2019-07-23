<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="brandCSS.html"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/css/bootstrap-select.min.css">
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/js/bootstrap-select.min.js"></script>
		<style>
			#topModal{
				color: red;
			}
		</style>
		<script>
			$(function() {

				//创建一类事件点击事件
				$("#createfirstid").on("click", function() {
					location.href = "/CRM/goods/selfirst";
				});

				/*页面刚加载时 初始化下拉框列表*/
				$.post("/CRM/goods/secondOption", {},
					function(data) {
						for(var i = 0; i < data.colorList.length; i++) {
							$("#selectColor").append("<option>" + data.colorList[i] + "</option>");　　
						}
						for(var i = 0; i < data.brandList.length; i++) {
							$(".sbrand").append("<option>" + data.brandList[i] + "</option>");　　
						}
						for(var i = 0; i < data.allBrandList.length; i++) {
							$(".selectBrand").append("<option>" + data.allBrandList[i] + "</option>");　　
						}

						//			for (var i = 0; i < data.typeList.length; i++) {
						//			   	$("#selectType").append("<option>"+data.typeList[i]+"</option>");
						//			　　}
						//To style all selects   需要ajax填充之后再初始化 不然上面填充的会露在外面
						$('select').selectpicker();
					}, "json")

				//确认添加二级商品
				$("#saveSecondAdd").on("click", function() {
					$("#exampleModalSecond").modal("hide"); /*保存之后 该模态窗隐藏*/
					//  console.log("test2 post");
					$.post("${pageContext.request.contextPath}/goods/insirtsecond",
						$("#addSecondformId").serialize(),
						function(data) {
							console.log(data);
						},
						"text");
					//清空输入框				 
					$(".form-control").val("");

				})

				//
				$('#goodslisttable').bootstrapTable({
					url: '/CRM/goods/allFSgoods',
					queryParamsType: '',
					pagination: true,
					sidePagination: 'server',
					queryParams: 'querygoods',
					pageNumber: 1,
					pageSize: 5,
					pageList: [5, 8, 12, 16],
					clickToSelect: true,
					columns: [{
							title: "序号",
							width: 10,
							align: "center",
							valign: 'middle',
							formatter: function(value, row, index) {
								//return index+1;
								var pageSize = $('#goodslisttable').bootstrapTable('getOptions').pageSize; //通过表的#id 可以得到每页多少条
								var pageNumber = $('#goodslisttable').bootstrapTable('getOptions').pageNumber; //通过表的#id 可以得到当前第几页
								return pageSize * (pageNumber - 1) + index + 1; //返回每条的序号： 每页条数 * （当前页 - 1 ）+ 序号
							}
						},
						{
							checkbox: true,
							field: 'case'
						},
						{
							field: 'fid',
							title: 'ID',
							align: 'center',
							valign: 'middle',
							visible: false,
						}, {
							field: 'ffilenumber',
							title: '存货档案编码',
							align: 'center',
							valign: 'middle',
							visible: false,
						},
						{
							field: 'fname',
							title: '商品名称',
							align: 'center',
							valign: 'middle',

						},
						{
							field: 'fbasetype',
							title: '商品类型',
							align: 'center',
							valign: 'middle',

						},
						{
							field: 'fbasebrand',
							title: '商品品牌',
							align: 'center',
							valign: 'middle',

						},
						{
							field: 'fbasemodel',
							title: '商品型号',
							align: 'center',
							valign: 'middle',

						},
						{
							field: 'fbasecolor',
							title: '基础库-颜色',
							align: 'center',
							valign: 'middle',

						},
						{
							field: 'fbusinesspattern',
							title: '基础库-业务模式',
							align: 'center',
							valign: 'middle',
							visible: false,
						}, {
							field: 'fmedic',
							title: '基础库-铺货',
							align: 'center',
							valign: 'middle',
							visible: false,
						}, {
							field: 'fbasepurchasepattern',
							title: '基础库-购买模式',
							align: 'center',
							valign: 'middle',
							visible: false,
						}, {
							field: 'fbasestandby',
							title: '基础库-备机',
							align: 'center',
							valign: 'middle',
							visible: false,
						},
						{
							field: 'ftype',
							title: '商品细分类',
							align: 'center',
							valign: 'middle',
							visible: false,
						}, {
							field: 'fpurchaseprice',
							title: '采购价',
							align: 'center',
							valign: 'middle',
							visible: true,
						}, {
							field: 'fmarketprice',
							title: '市场价',
							align: 'center',
							valign: 'middle',
							visible: true,
						}, {
							field: 'fshoppingmallprice',
							title: '商城价',
							align: 'center',
							valign: 'middle',
							visible: false,
						}, {
							field: 'fminrepertory',
							title: '最低库存量',
							align: 'center',
							valign: 'middle',
							visible: false,
						}, {
							field: 'fifpurchase',
							title: '是否可采购',
							align: 'center',
							valign: 'middle',
							visible: false,
						}, {
							field: 'fid',
							title: '操作',
							formatter: operateFormatter,
							align: 'center',
							valign: 'middle',

						}
					],
					toolbar: "#queryForm",
					queryParams: function(params) {
						var args = getArgs(); /* 得到paramName */
						args["pageNumber"] = params.pageNumber;
						args["pageSize"] = params.pageSize;
						return args;
					}
				})

				//初始化一个 下拉框
				$('.selectpicker').selectpicker();


				$("#searchbt").on("click", function() {
					query();
				});

				//给选择后模态框里的保存按钮绑定事件
				$("#save_addTo_btn").on("click",function(){
					$("#selectGoodModal").modal("hide");
					$.post("${pageContext.request.contextPath}/goods/toAdd",
						$("#selectGoodForm").serialize(),
						function(data){
							alert(data);
							location.href="${pageContext.request.contextPath}/goods/goSelectSupplierGoods"
						},"json"
				)
				});
				
			})

			function getArgs() {
				var params = {};
				var temp2 = '';
				$(".queryParam").each(function() {
					if(temp2 != $("#paramfname").val()) {
						params.fname = $("#paramfname").val();
					}
					if(temp2 != $("#paramfbasemodel").val()) {
						params.fbasemodel = $("#paramfbasemodel").val();
					}
					/* 在下拉框选中的的值 */
					var temp = '全部';
					if(temp != $("#selectBrand option:selected").text()) {
						params.fbasebrand = $("#selectBrand option:selected").text();
					}
					if(temp != $("#selectType option:selected").text()) {
						params.fbasetype = $("#selectType option:selected").text();
					}
					if(temp != $("#selectColor option:selected").text()) {
						params.fbasecolor = $("#selectColor option:selected").text();
					}
				});
				return params;
			}

			function query() {
				$('#goodslisttable').bootstrapTable("refresh"); //,{silent: true}
			}
			
			//操作栏格式化   //value：当前field的值，即id   //row：当前页每一行的数据
			function operateFormatter(value, row, index) {
				var id=value;											// data-toggle='modal' data-target='#supplierModel'
				var result="<button type='button' class='btn btn-success' data-toggle='modal' data-target='#selectGoodModal' onclick='selectById(" + id + ")' >选择</button>";
				return result;
			}
			
			//点击选择按钮后获取其基本信息
			function selectById(id){
				$.post("${pageContext.request.contextPath}/goods/selectGoodById",{"fid":id},
						function(data){
							console.log(data);
							$("#z_f_id").val(data.fid);
							$("#z_f_name").val(data.fname);
							$("#z_purchase_price").val(data.fpurchaseprice);
							$("#z_market_price").val(data.fmarketprice);
						},"json"
				);
			}

		</script>
	</head>

	<body class="layui-layout-body">

		<!--查看  Modal -->
		<div class="modal fade" id="selectGoodModal" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title" id="topModal">选择商品</h3>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
					</div>
					<div class="modal-body">
						<form method="post" id="selectGoodForm">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">商品ID</span>
								</div>
								<input type="text" class="form-control" id="z_f_id" name="z_f_id" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">商品名称</span>
								</div>
								<input type="text" class="form-control" id="z_f_name" name="z_f_name" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">采购价</span>
								</div>
								<input type="text" class="form-control" id="z_purchase_price" name="z_purchase_price" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">市场价</span>
								</div>
								<input type="text" class="form-control"  id="z_market_price" name="z_market_price" readonly>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="save_addTo_btn">保存</button>
					</div>
				</div>
			</div>
		</div>
		<!--模态框到此结束-->

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
				<div class="container-fluit" style="border: 1px,lightslategrey,solid;">

					<div class="row ">
						<div class="col alert alert-primary m-auto" role="alert" style="text-align: center;">商品管理</div>
						<div class="col-10"></div>
					</div>

					<div style="border: 1px solid black;">
						<!--加外边框-->

						<p class="text-danger">商品与赠品管理-->商品管理-->商品信息列表</p>
						<hr style=" height:5px;border:none;border-top:1px dotted #987cb9;" />
						<!-- 分割线 -->

						<div class="row">
							<div class="col-4">
								<p class="card-text">商品名称:<input type="text" id="paramfname" class="queryParam" /></p>
							</div>
							<div class="col-4">
								<p class="card-text">商品型号:<input type="text" id="paramfbasemodel" class="queryParam" /></p>
							</div>
						</div>
						<br/>
						<div class="row">

							<div style="display: inline-block;">
								<div class="col" id="colordivid">
									<p class="card-text">
										商品颜色:
										<select id="selectColor" class="queryParam">

											<option>全部</option>
										</select>
									</p>
								</div>
							</div>
							<div class="col"></div>
							<div style="display: inline-block;">
								<div class="col">
									<p class="card-text">
										商品品牌:
										<select id="selectBrand" class="queryParam selectBrand">

											<option>全部</option>
										</select>
									</p>
								</div>
							</div>
							<div class="col"></div>
							<div style="display: inline-block;">
								<div class="col">
									<p class="card-text">
										商品分类:
										<select id="selectType" class="queryParam">

											<option>全部</option>
										</select>
									</p>
								</div>
							</div>
							&nbsp;&nbsp;
							<div class="col">
								<button type="button" class="btn btn-primary" id="searchbt">搜索</button>&nbsp;&nbsp; <br />

							</div>
						</div>
						<hr style="border:1 dashed #987cb9" color="#987cb9" size=1>

						<table id="goodslisttable">

						</table>

					</div>

				</div>
			</div>

			<div class="layui-footer">
				<!-- 底部固定区域 -->
				© layui.com - 底部固定区域
			</div>
		</div>

	</body>

</html>