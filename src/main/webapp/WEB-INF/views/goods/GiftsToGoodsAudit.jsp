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
				width: 350px;
			}
			
			#ss {
				margin: 5px 5px 5px 85px;
			}
			
			#btnQuery {
				background-color: #A6FFFF;
				margin: 5px 5px 5px 5px;
			}
			
			#opinion {
				height: 250px;
			}
		</style>
		<script type="text/javascript">
			var pageNum;
			var num = 1;
			var reviewer;
			var time;
			var status;
			$(function() {
				QueryAudit(num);

				$("#btnprov").on("click", function() {
					num = num - 1;
					QueryAudit(num);
				});

				$("#btnnext").on("click", function() {
					num = num + 1;
					QueryAudit(num);
				});

				$("#tb").on("click", ".Querybtn", function(event) {
					var id = event.currentTarget.value;
					var url1 = "${pageContext.request.contextPath}/audit/Querybtn?id=" + id;

					$.get(url1, function(data) {
						var abc = eval(data);
						console.log(abc);
						$("#id").val(id);
						$("#gname").val(abc.gname);
						$("#type").val(abc.type);
						$("#price").val(abc.price);
						$("#cost").val(abc.brand);
						$("#number").val(abc.number);
						$("#code").val(abc.code);

					})

				})

				$("#btnSaveEdit2").on("click", function() {
					$("#myModel1").modal("hide");
					id = $("#id").val();
					reviewer = $("#reviewer").val();
					time = $("#time").val();
					status = $("#status").val();
					Audit(id, reviewer, time, status);

				});

				$("#ss").on("click", function(event) {

					status = $("#ggstatus").val();
					GetStatus(status);
				})

			})

			function QueryAudit(num) {
				$.post("${pageContext.request.contextPath}/audit/queryaudit?pageNum=" + num, "", function(data) {

					var listgifts = data.list;

					pageNum = data.pageNum;
					$("#tb").html("");
					$.each(listgifts, function(i, d) {

						$("#tb").append("<tr><td>" + d.code + "</td><td>" + d.gname + "</td><td>" + d.reviewer + "</td><td>" + d.time + "</td><td>" + d.status + "</td><td>" +
							"<button id='btnQuery' class='btn btn-fault Querybtn'  data-toggle='modal'  data-target='#myModel1'  value='" + d.id + "'>审核" +
							"</td></tr>")
					})

				}, "json");

			}

			function Audit(id, reviewer, time, status) {
				$.post("${pageContext.request.contextPath}/audit/admin?id=" + id + "&reviewer=" + reviewer + "&time=" + time + "&status=" + status, "", function(data) {
					QueryAudit(num);
				})

			}

			function GetStatus(status) {
				$.post("${pageContext.request.contextPath}/audit/getstatus?status=" + status, "", function(data) {
					var listgifts = data.list;

					pageNum = data.pageNum;
					$("#tb").html("");
					$.each(listgifts, function(i, d) {

						$("#tb").append("<tr><td>" + d.code + "</td><td>" + d.gname + "</td><td>" + d.reviewer + "</td><td>" + d.time + "</td><td>" + d.status + "</td><td>" +
							"<button id='btnQuery' class='btn btn-fault Querybtn'  data-toggle='modal'  data-target='#myModel1'  value='" + d.id + "'>审核" +
							"</td></tr>")
					})
				}, "json")
			}
		</script>
	</head>

	<body class="layui-layout-body">
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
								<input type="text" name="brand_name" id="id" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品名称</span>
								</div>
								<input type="text" name="brand_name" id="gname" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品类型</span>
								</div>
								<input type="text" name="brand_url" id="type" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品单价</span>
								</div>
								<input type="text" name="brand_describe" id="price" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">采购成本</span>
								</div>
								<input type="text" name="brand_describe" id="cost" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品数量</span>
								</div>
								<input type="text" name="brand_describe" id="number" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">赠品颜色</span>
								</div>
								<input type="text" name="brand_describe" id="color" class="form-control" readonly>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">审核人</span>
								</div>
								<input type="text" name="brand_describe" id="reviewer" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">审核时间</span>
								</div>
								<input type="text" name="brand_describe" id="time" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">审核状态</span>
								</div>
								<input type="text" name="brand_describe" id="status" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">审核意见</span>
								</div>
								<input type="text" name="brand_describe" id="opinion" class="form-control" required>
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
							<input type="image" src="${pageContext.request.contextPath}/image/u431.png">
							<a id="t1">商品转赠品审核</a>
						</div>
						<div id="box">
							<a>商品与赠品管理-->商品转赠品审核-->审核信息列表</a>
							</br>
							<input type="image" src="${pageContext.request.contextPath }/image/u342.png">
							</br>

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
										<th>商品名称</th>
										<th>审核人</th>
										<th>审核时间</th>
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