<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<%@ include file="brandCSS.html"%>
		<style type="text/css">
			* {
				padding: 0px;
				margin: 0px;
			}
			
			#t1 {
				position: absolute;
				left: 20px;
				top: 5px;
			}
			
			#box {
				border: 1px solid black;
			}
			
			#CZ {
				width: 350 px;
			}
			
			#ss {
				margin: 5px 5px 5px 500px;
			}
			
			#btnQuery {
				background-color: #A6FFFF;
				margin: 5px 5px 5px 5px;
			}
			
			#btnUpdate {
				background-color: #A6FFFF;
				margin: 5px 5px 5px 5px;
			}
			
			#btnDelete {
				background-color: #A6FFFF;
				margin: 5px 5px 5px 5px;
			}
			
			#btnSHGZ {
				background-color: #A6FFFF;
				margin: 5px 5px 5px 5px;
			}
			
			#opinion {
				height: 250px;
			}
			
			.test {
				color: red;
			}
		</style>
		<script type="text/javascript">
			var pageNum;
			var num = 1;
			var id;
			var gname;
			var type;
			var brand;
			var number;
			var price;
			var cost;
			var status;
			var addGoods;
			var newprice;
			var selectRow = [];

			$(function() {

				queryGoods(num);

				$("#btnprov").on("click", function() {
					num = num - 1;
					queryGoods(num);
				});
				//为下一页按钮绑定事件
				$("#btnnext").on("click", function() {
					num = num + 1;
					queryGoods(num);
				});
				$("#tb").on("click", ".Querybtn", function(event) {
					var code = event.currentTarget.value;
					var url1 = "${pageContext.request.contextPath}/gtog/Querybtn?code=" + code;
					$.get(url1, function(data) {
						var abc = eval(data);
						console.log(abc);
						$("#id").val(abc.code);
						$("#gname").val(abc.gname);
						$("#type").val(abc.type);
						$("#price").val(abc.price);
						$("#cost").val(abc.brand);
						$("#number").val(abc.number);

					})

				})
				$("#tb").on("click", ".Updatebtn", function(event) {
					var code = event.currentTarget.value;
					var url2 = "${pageContext.request.contextPath}/gtog/Querybtn?code=" + code;
					$.get(url2, function(data) {
						var abc = eval(data);
						$("#id1").val(abc.id);
						$("#gname1").val(abc.gname);
						$("#type1").val(abc.type);
						$("#price1").val(abc.price);
						$("#cost1").val(abc.brand);
						$("#number1").val(abc.number);
						$("#addGifts").val(abc.addgifts);
						$("#newprice").val(abc.newprice);
					})
				})
				$("#btnSaveEdit2").on("click", function() {
					$("#myModel2").modal("hide");
					id = $("#id1").val();
					gname = $("#gname1").val();
					type = $("#type1").val();
					price = $("#price1").val();
					brand = $("#cost1").val();
					number = $("#number1").val();
					addgifts = $("#addGifts").val();
					newprice = $("#newprice").val();
					UpdateGifts(id, addgifts, newprice);
				});
				$("#tb").on("click", ".Deletebtn", function(event) {
					var id = event.currentTarget.value;
					delGifts(id);
				})
				$("#addbtn").on("click", function() {
					location.href = "${pageContext.request.contextPath}/gtog/querygoods";
				})
				$("#tb").on("click", ".SHGZbtn", function(event) {
					var id = event.currentTarget.value;
					var url2 = "${pageContext.request.contextPath}/gtog/SHGZbtn?id=" + id;
					$.get(url2, function(data) {
						var abc = eval(data);

						$("#id2").val(id);
						$("#gname2").val(abc.gname);
						$("#type2").val(abc.type);
						$("#price2").val(abc.price);
						$("#cost2").val(abc.brand);
						$("#number2").val(abc.number);

						$("#reviewer").val(abc.reviewer);
						$("#time").val(abc.time);
						$("#status").val(abc.status);
					})
				})
				$("#ss").on("click", function(event) {
					gname = $("#ggname").val();
					type = $("#ggtype").val();
					status = $("#ggstatus").val();
					SsGoods(gname, type, status);
				})

			})

			function queryGoods(num) {
				$.post("${pageContext.request.contextPath}/gtog/all2?pageNum=" + num, "", function(data) {

					var listgifts = data.list;

					pageNum = data.pageNum;
					$("#tb").html("");
					console.log(listgifts);
					$.each(listgifts, function(i, d) {
						
						$("#tb").append("<tr><td>" + d.code + "</td><td><input type='checkbox'/></td><td>" + d.gname + "</td><td>" + d.type + "</td><td>" + d.brand + "</td><td>" + d.price + "</td><td>" + d.number + "</td><td class='status123'>" + d.status + "</td><td>" +
							"<button id='btnQuery' class='btn btn-fault Querybtn'  data-toggle='modal'  data-target='#myModel3'  value='" + d.code + "'>查看" +
							"<button id='btnUpdate' class='btn btn-fault Updatebtn'  data-toggle='modal' data-target='#myModel2' value='" + d.code + "'>修改" +
							"<button id='btnDelete'  class='btn btn-fault Deletebtn'  value='" + d.id + "'>删除" +
							"<button id='btnSHGZ' class='btn btn-fault SHGZbtn'  data-toggle='modal' data-target='#myModel1' value='" + d.id + "'>审核跟踪" +
							"</td></tr>")

					})
					if($(".status123").val() == "已审核") {

					} else {
						$(".status123").addClass("test");
					}

				}, "json");

			}

			function UpdateGifts(id, addgifts, newprice) {
				$.post("${pageContext.request.contextPath}/gtog/update?id=" + id + "&addgifts=" + addgifts + "&newprice=" + newprice, "", function(data) {
					queryGoods(num);
				}, "text");

			}

			function delGifts(id) {
				$.post("${pageContext.request.contextPath}/gtog/delete?id=" + id, "", function(data) {
					queryGoods(num);
				}, "text");
			}

			function SsGoods(gname, type, status) {
				$.post("${pageContext.request.contextPath}/gtog/ssgoods?gname=" + gname + "&type=" + type + "&status=" + status, "", function(data) {
					var listgifts = data.list;

					pageNum = data.pageNum;
					$("#tb").html("");
					console.log(listgifts);
					$.each(listgifts, function(i, d) {

						$("#tb").append("<tr><td>" + d.code + "</td><td><input type='checkbox'/></td><td>" + d.gname + "</td><td>" + d.type + "</td><td>" + d.brand + "</td><td>" + d.price + "</td><td>" + d.number + "</td><td class='status123'>" + d.status + "</td><td>" +
							"<button id='btnQuery' class='btn btn-fault Querybtn'  data-toggle='modal'  data-target='#myModel3'  value='" + d.code + "'>查看" +
							"<button id='btnUpdate' class='btn btn-fault Updatebtn'  data-toggle='modal' data-target='#myModel2' value='" + d.code + "'>修改" +
							"<button id='btnDelete'  class='btn btn-fault Deletebtn'  value='" + d.id + "'>删除" +
							"<button id='btnSHGZ' class='btn btn-fault SHGZbtn'  data-toggle='modal' data-target='#myModel1' value='" + d.id + "'>审核跟踪" +
							"</td></tr>")

					})
				}, "json");
			}
		</script>
	</head>

	<body class="layui-layout-body">
		<%--品牌修改模态框--%>
		<div class="modal fade" id="myModel3" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="update_h5">赠品信息</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" method="post" id="brand_update_form">

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品名称</span>
								</div>
								<input type="text" name="brand_name" id="gname" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品类型</span>
								</div>
								<input type="text" name="brand_url" id="type" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品单价</span>
								</div>
								<input type="text" name="brand_describe" id="price" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">商品编号</span>
								</div>
								<input type="text" name="brand_describe" id="cost" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品数量</span>
								</div>
								<input type="text" name="brand_describe" id="number" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="btnSaveEdit">保存</button>
					</div>
				</div>
			</div>
		</div>

		<%--品牌修改模态框--%>
		<div class="modal fade" id="myModel2" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="update_h5">修改赠品信息</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" method="post" id="brand_update_form">

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">序号</span>
								</div>
								<input type="text" name="brand_name" id="id1" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品名称</span>
								</div>
								<input type="text" name="brand_name" id="gname1" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品类型</span>
								</div>
								<input type="text" name="brand_url" id="type1" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品单价</span>
								</div>
								<input type="text" name="brand_describe" id="price1" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">商品编号</span>
								</div>
								<input type="text" name="brand_describe" id="cost1" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品数量</span>
								</div>
								<input type="text" name="brand_describe" id="number1" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">商品入库数</span>
								</div>
								<input type="text" name="brand_describe" id="addGifts" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">天翼价</span>
								</div>
								<input type="text" name="brand_describe" id="newprice" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="btnSaveEdit2">保存</button>
					</div>
				</div>
			</div>
		</div>

		<%--品牌修改模态框--%>
		<div class="modal fade" id="myModel1" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="update_h5">审核跟踪</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" method="post" id="brand_update_form">

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">序号</span>
								</div>
								<input type="text" name="brand_name" id="id2" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品名称</span>
								</div>
								<input type="text" name="brand_name" id="gname2" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品类型</span>
								</div>
								<input type="text" name="brand_url" id="type2" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品单价</span>
								</div>
								<input type="text" name="brand_describe" id="price2" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">采购成本</span>
								</div>
								<input type="text" name="brand_describe" id="cost2" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品数量</span>
								</div>
								<input type="text" name="brand_describe" id="number2" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">审核人</span>
								</div>
								<input type="text" name="brand_describe" id="reviewer" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">审核时间</span>
								</div>
								<input type="text" name="brand_describe" id="time" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">审核状态</span>
								</div>
								<input type="text" name="brand_describe" id="status" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">审核意见</span>
								</div>
								<input type="text" name="brand_describe" id="opinion" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="btnSaveEdit3">保存</button>
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
				<div class="container">
					<div class="row" style="background-color: white;">
						<div id="top" class="col-md-12">
							<input type="image" src="${pageContext.request.contextPath}/image/u431.png">
							<a id="t1">赠品转商品管理</a>
						</div>
						<div id="box">
							<a>赠品转商品管理-->赠品转商品管理-->商品信息列表</a>
							</br>
							<input type="image" src="${pageContext.request.contextPath }/image/u342.png">
							</br>
							<a>商品名称：</a><input type="text" id="ggname">&nbsp&nbsp
							<a>商品分类：</a><input type="text" id="ggtype"> &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
							<input id="addbtn" type="button" class="btn btn-fault" data-toggle="modal" data-target="#myModel1" style="background-color: #0080FF" value="新增赠品转商品">
							</br>

							&nbsp&nbsp &nbsp&nbsp
							<a>审核状态：</a>
							<select id="ggstatus">

								<option>已审核</option>
								<option>未审核</option>
								<option>审核不通过</option>
							</select>

							<input id="ss" type="button" class="btn btn-fault" style="background-color: #0080FF" value="搜索">
							</br>
							<input type="image" src="${pageContext.request.contextPath }/image/u343.png">
							</br>
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>序号</th>
										<th><input type="checkbox" /></th>
										<th>商品名称</th>
										<th>商品类型</th>
										<th>商品品牌</th>
										<th>商品价格</th>
										<th>商品数量</th>
										<th>审核状态</th>
										<th id="CZ">操作</th>
									</tr>
								</thead>
								<tbody id="tb">

								</tbody>

							</table>
							<input id="btnprov" type="button" class="btn btn-fault" value="上一页">
							<input id="btnnext" type="button" class="btn btn-fault" value="下一页">
						</div>
					</div>
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