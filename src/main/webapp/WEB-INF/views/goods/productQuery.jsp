<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<%@include file="brandCSS.html"%>
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

				$("#btnUpload").on("click", function() {
					$.ajaxFileUpload({
						url: "/CRM/goods/importqy",
						fileElementId: "uploadfile1",
						secureuri: false,
						dataType: "text",
						success: function(data) {
							console.log(data);
						}
					});
				})

			}) //第一个function到底结束

			//此方法获取搜索框中的值
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

			//此方法刷新页面
			function query() {
				$('#goodslisttable').bootstrapTable("refresh"); //,{silent: true}
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

								<form action="/CRM/goods/importqy" method="post" enctype="multipart/form-data">
									<input type="file" name="meFile" />
									<p>
										<input type="submit" value="导入" />
										<p>
								</form>

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