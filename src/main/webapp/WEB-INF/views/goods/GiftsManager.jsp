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
				width: 250px;
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
			
			#ss {
				margin: 5px 5px 5px 5px;
			}
		</style>
		<script type="text/javascript">
			var pageNum;
			var num = 1;
			var id;
			var type;
			var number;
			var price;
			var cost;
			var state;
			var selectRow = [];

			$(function() {
				queryGifts(num);
				$("#btnprov").on("click", function() {
					num = num - 1;
					queryGifts(num);
				});
				//为下一页按钮绑定事件
				$("#btnnext").on("click", function() {
					num = num + 1;
					queryGifts(num);
				});
				$("#tb").on("click", ".Querybtn", function(event) {
					var gid = event.currentTarget.value;
					var url1 = "${pageContext.request.contextPath}/gifts/Querybtn?gid=" + gid;
					$.get(url1, function(data) {
						var abc = eval(data);
						console.log(abc);
						$("#id").val(abc.id);
						$("#gname").val(abc.gname);
						$("#type").val(abc.type);
						$("#number").val(abc.number);
						$("#price").val(abc.price);
						$("#cost").val(abc.cost);
						$("#state").val(abc.state);
					})

				})
				$("#tb").on("click", ".Updatebtn", function(event) {
					var gid = event.currentTarget.value;
					var url2 = "${pageContext.request.contextPath}/gifts/Querybtn?gid=" + gid;
					$.get(url2, function(data) {
						var abc = eval(data);
						$("#id1").val(abc.id);
						$("#gname1").val(abc.gname);
						$("#type1").val(abc.type);
						$("#number1").val(abc.number);
						$("#price1").val(abc.price);
						$("#cost1").val(abc.cost);
						$("#state1").val(abc.state);
					})
				})
				$("#btnSaveEdit1").on("click", function() {
					$("#myModal1").modal("hide");
					id = $("#id1").val();
					gname = $("#gname1").val();
					type = $("#type1").val();
					number = $("#number1").val();
					price = $("#price1").val();
					cost = $("#cost1").val();
					state = $("#state1").val();
					UpdateGifts(id, gname, type, number, price, cost, state);

				});
				$("#tb").on("click", ".Deletebtn", function(event) {
					var gid = event.currentTarget.value;
					delGifts(gid);
				})

				$("#btnSaveEdit2").on("click", function() {
					$("#myModal2").modal("hide");

					gname = $("#gname2").val();
					type = $("#type2").val();
					number = $("#number2").val();
					price = $("#price2").val();
					cost = $("#cost2").val();
					state = $("#state2").val();
					AddGifts(gname, type, number, price, cost, state);

				});
				$("#ss").on("click", function() {
					name = $("#ggname").val();
					type = $("#ggtype").val();
					QueryGiftsGJ(name, type);
				})
			})

			function queryGifts(num) {
				$.post("${pageContext.request.contextPath}/gifts/all1?pageNum=" + num, "", function(data) {

					var listgifts = data.list;

					pageNum = data.pageNum;
					$("#tb").html("");
					$.each(listgifts, function(i, d) {

						$("#tb").append("<tr><td>" + d.id + "</td><td><input type='checkbox'/></td><td>" + d.gname + "</td><td>" + d.type + "</td><td>" + d.number + "</td><td>" + d.price + "</td><td>" + d.cost + "</td><td>" + d.state + "</td><td>" +
							"<button id='btnQuery' class='btn btn-fault Querybtn'  data-toggle='modal'  data-target='#myModel3'  value='" + d.id + "'>查看" +
							"<button id='btnUpdate' class='btn btn-fault Updatebtn'  data-toggle='modal' data-target='#myModal1' value='" + d.id + "'>修改" +
							"<button id='btnDelete'  class='btn btn-fault Deletebtn'  value='" + d.id + "'>删除" +
							"</td></tr>")
					})

				}, "json");
			}

			function AddGifts(gname, type, number, price, cost, state) {
				$.post("${pageContext.request.contextPath}/gifts/add?gname=" + gname + "&type=" + type + "&number=" + number + "&price=" + price + "&cost=" + cost + "&state=" + state, "", function(data) {
					queryGifts(num);
				}, "text");
			}

			function UpdateGifts(id, gname, type, number, price, cost, state) {
				$.post("${pageContext.request.contextPath}/gifts/update?id=" + id + "&gname=" + gname + "&type=" + type + "&number=" + number + "&price=" + price + "&cost=" + cost + "&state=" + state, "", function(data) {
					queryGifts(num);
				}, "text");

			}

			function delGifts(id) {
				$.post("${pageContext.request.contextPath}/gifts/delete?id=" + id, "", function(data) {
					queryGifts(num);
				}, "text");
			}

			function QueryGiftsGJ(name, type) {
				$.post("${pageContext.request.contextPath}/gifts/Query?name=" + name + "&type=" + type, "", function(data) {
					var listgifts = data.list;

					$("#tb").html("");
					$.each(listgifts, function(i, d) {
						$("#tb").append("<tr><td>" + d.id + "</td><td><input type='checkbox'/></td><td>" + d.gname + "</td><td>" + d.type + "</td><td>" + d.number + "</td><td>" + d.price + "</td><td>" + d.cost + "</td><td>" + d.state + "</td><td>" +
							"<button id='btnQuery' class='btn btn-fault Querybtn'  data-toggle='modal'  data-target='#myModel3'  value='" + d.id + "'>查看" +
							"<button id='btnUpdate' class='btn btn-fault Updatebtn'  data-toggle='modal' data-target='#myModal1' value='" + d.id + "'>修改" +
							"<button id='btnDelete'  class='btn btn-fault Deletebtn'  value='" + d.id + "'>删除" +
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
								<input type="text" name="brand_id" id="id" class="form-control" readonly>
								<!---->
							</div>
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
									<span class="input-group-text">最低库存量</span>
								</div>
								<input type="text" name="brand_describe" id="number" class="form-control" required>
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
									<span class="input-group-text">采购成本</span>
								</div>
								<input type="text" name="brand_describe" id="cost" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品状态</span>
								</div>
								<input type="text" name="brand_describe" id="state" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="save_update_btn">保存</button>
					</div>
				</div>
			</div>
		</div>

		<%--品牌修改模态框--%>
		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
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
								<input type="text" name="brand_id" id="id1" class="form-control" readonly>
								<!---->
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品名称</span>
								</div>
								<input type="text" name="brand_name" id="gname1" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品类型</span>
								</div>
								<input type="text" name="brand_url" id="type1" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">最低库存量</span>
								</div>
								<input type="text" name="brand_describe" id="number1" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品单价</span>
								</div>
								<input type="text" name="brand_describe" id="price1" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">采购成本</span>
								</div>
								<input type="text" name="brand_describe" id="cost1" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品状态</span>
								</div>
								<input type="text" name="brand_describe" id="state1" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="btnSaveEdit1">保存</button>
					</div>
				</div>
			</div>
		</div>

		<%--品牌修改模态框--%>
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
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
								<input type="text" name="brand_id" id="id2" class="form-control" readonly>
								<!---->
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品名称</span>
								</div>
								<input type="text" name="brand_name" id="gname2" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品类型</span>
								</div>
								<input type="text" name="brand_url" id="type2" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">最低库存量</span>
								</div>
								<input type="text" name="brand_describe" id="number2" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品单价</span>
								</div>
								<input type="text" name="brand_describe" id="price2" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">采购成本</span>
								</div>
								<input type="text" name="brand_describe" id="cost2" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品状态</span>
								</div>
								<input type="text" name="brand_describe" id="state2" class="form-control" required>
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
							<input type="image" src="${pageContext.request.contextPath}/image/u43.png">
							<a id="t1">赠品管理</a>
						</div>
						<div id="box">
							<a>商品与赠品管理-->赠品管理-->赠品管理列表</a>
							</br>
							<input type="image" src="${pageContext.request.contextPath }/image/u342.png">
							</br>

							<a>赠品名称：</a><input id="ggname" type="text">&nbsp&nbsp
							<a>赠品类型：</a><input id="ggtype" type="text">

							<input id="ss" type="button" class="btn btn-fault" style="background-color: #0080FF" value="搜索">
							<input id="addbtn" type="button" class="btn btn-fault" data-toggle="modal" data-target='#myModal2' style="background-color: #0080FF" value="新增赠品">
							</br>
							<input type="image" src="${pageContext.request.contextPath }/image/u343.png">
							</br>
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>序号</th>
										<th><input type="checkbox" /></th>
										<th>赠品名称</th>
										<th>赠品类型</th>
										<th>最低库存量</th>
										<th>赠品单价</th>
										<th>采购成本</th>
										<th>赠品状态</th>
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