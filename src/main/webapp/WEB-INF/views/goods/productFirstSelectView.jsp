<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<%@ include file="brandCSS.html"%>

		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/css/bootstrap-select.min.css">
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/js/bootstrap-select.min.js"></script>

		<script type="text/javascript">
			$(function() {

				$('#goodslisttable').bootstrapTable({
					url: '/CRM/goods/all',
					queryParamsType: '',
					pagination: true,
					sidePagination: 'server',
					queryParams: 'querygoods',
					pageNumber: 1,
					pageSize: 5,
					pageList: [5, 8, 12, 16],
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
							field: 'id',
							title: '序号',
							align: 'center',
							valign: 'middle',
							visible: false,
						}, {
							field: 'filenumber',
							title: '存货档案编码',
							align: 'center',
							valign: 'middle',

						},
						{
							field: 'type',
							title: '基础库-分类',
							align: 'center',
							valign: 'middle',

						}, {
							field: 'brand',
							title: '基础库-品牌',
							align: 'center',
							valign: 'middle',

						}, {
							field: 'model',
							title: '基础库-型号',
							align: 'center',
							valign: 'middle',

						}, {
							field: 'color',
							title: '基础库-颜色',
							align: 'center',
							valign: 'middle',

						}, {
							field: 'goperate',
							title: '操作',
							formatter: operateFormatter,
							events: operateEvents,
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

				$("#searchbt").on("click", function() {
					query();
				});

				/*页面刚加载时 初始化下拉框列表*/
				$.post("/CRM/goods/coloroption", {},
					function(data) {
						for(var i = 0; i < data.colorList.length; i++) {
							$("#selectColor").append("<option>" + data.colorList[i] + "</option>");　　
						}
						for(var i = 0; i < data.brandList.length; i++) {
							$("#selectBrand").append("<option>" + data.brandList[i] + "</option>");　　
						}
						for(var i = 0; i < data.typeList.length; i++) {
							$("#selectType").append("<option>" + data.typeList[i] + "</option>");　　
						}
					}, "json")

				//确认添加后的点击事件
				$("#saveeditAdd").on("click", function() {
					$("#exampleModalfirst").modal("hide"); /*保存之后 该模态窗隐藏*/
					$.post("/CRM/goods/addfir",
						$("#addformid").serialize(),
						function(data) {
							/*页面跳转到gmanage*/
							location.href = "/CRM/goods/gmanage";
						}, "text")
				});

				//// To style only selects with the selectpicker class
				$('.selectpicker').selectpicker();
				$('.selectpicker2').selectpicker();

				//
			})

			function operateFormatter(value, row, index) {
				return [
					'<a class="btn btn-primary like" role="button" data-toggle="modal" data-target="#exampleModalfirst" href="javascript:void(0)">选择',
					'<i class="fa fa-plus" aria-hidden="true"></i>',
					'</a>  ',
				].join('')
			}

			window.operateEvents = {
				'click .like': function(e, value, row, index) {
					/* alert('You click like action, row: ' + JSON.stringify(row.gid)); */
					$("#input-text-filenumber").val(row.filenumber);
					$("#input-text-type").val(row.type);
					$("#input-text-brand").val(row.brand);
					$("#input-text-color").val(row.color);
					$("#input-text-model").val(row.model);

				},
			}

			function getArgs() {
				var params = {};
				var temp2 = '';
				$(".queryParam").each(function() {
					if(temp2 != $("#filenumid").val()) {
						params.filenumber = $("#filenumid").val();
					}
					if(temp2 != $("#modelid").val()) {
						params.model = $("#modelid").val();
					}
					/* 在下拉框选中的的值 */
					var temp = '全部';
					if(temp != $("#selectBrand option:selected").text()) {
						params.brand = $("#selectBrand option:selected").text();
					}
					if(temp != $("#selectType option:selected").text()) {
						params.type = $("#selectType option:selected").text();
					}
					if(temp != $("#selectColor option:selected").text()) {
						params.color = $("#selectColor option:selected").text();
					}
				});
				return params;
			}

			function query() {
				$('#goodslisttable').bootstrapTable("refresh"); //,{silent: true}
			}
		</script>

	</head>

	<body class="layui-layout-body">
		<!--添加一类商品  Modal -->
		<div class="modal fade" id="exampleModalfirst" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">添加一类商品</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
					</div>
					<div class="modal-body">

						<form method="post" id="addformid" name="firstGoods">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gid">存货档案编码：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-filenumber" name="ffilenumber" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-type">基础库-分类：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-type" name="fbasetype" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gnum">基础库品牌：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-brand" name="fbasebrand" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gnum">基础库-型号：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-model" name="fbasemodel" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gcolor">基础库-业务模式：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbusinesspattern" name="fbusinesspattern" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gcolor">基础库-颜色：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-color" name="fbasecolor" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">基础库-采购模式：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbasepurchasepattern" name="fbasepurchasepattern" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">基础库-铺货：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fmedic" name="fmedic" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">基础库-备机：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbasestandby" name="fbasestandby" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">商品名称：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fname" name="fname">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">商品类别：</span>
								</div>
								<!--  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-ftype" name="ftype"> -->
								<select class="selectpicker" name="ftype">
									<option>Mustard</option>
									<option>Ketchup</option>
									<option>Barbecue</option>
								</select>

							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">采购价：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fpurchaseprice" name="fpurchaseprice">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">市场价：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fmarketprice" name="fmarketprice">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">商场价：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fshoppingmallprice" name="fshoppingmallprice">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">最低库存量：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fminrepertory" name="fminrepertory">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">是否可采购：</span>

								</div>
								<!--  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fifpurchase" name="fifpurchase"> -->
								<select class="selectpicker2" name="fifpurchase">
									<option>可采购</option>
									<option>不可采购</option>
								</select>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="saveeditAdd">确认添加</button>
					</div>
				</div>
			</div>
		</div>

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
				<div class="container-fluit">

					<div class="row ">
						<div class="col alert alert-primary m-auto" role="alert" style="text-align: center;">产品查询</div>
						<div class="col-10"></div>
					</div>

					<div style="border: 1px solid black;">
						<!--加外边框-->

						<p class="text-danger">商品与赠品管理-->商品管理-->产品查询列表</p>
						<hr style=" height:5px;border:none;border-top:1px dotted #987cb9;" />
						<!-- 分割线 -->

						<div class="row">
							<div class="col">
								<p class="card-text">存货档案编码:<input type="text" id="filenumid" class="queryParam" /></p>
							</div>
							<div class="col">
								<p class="card-text">产品型号:<input type="text" id="modelid" class="queryParam" /></p>
							</div>
						</div>
						<br/>
						<div class="row">

							<div style="display: inline-block;">
								<div class="col" id="colordivid">
									<p class="card-text">
										基础库-颜色:
										<select id="selectColor" class="queryParam">

											<option>全部</option>
											<c:forEach items="${coloroption}" var="e">

												<option>
													<c:out value="${e}" />
												</option>
											</c:forEach>
										</select>
									</p>
								</div>
							</div>
							<div class="col"></div>
							<div style="display: inline-block;">
								<div class="col">
									<p class="card-text">
										产品品牌:
										<select id="selectBrand" class="queryParam">

											<option>全部</option>
										</select>
									</p>
								</div>
							</div>
							<div class="col"></div>
							<div style="display: inline-block;">
								<div class="col">
									<p class="card-text">
										产品分类:
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