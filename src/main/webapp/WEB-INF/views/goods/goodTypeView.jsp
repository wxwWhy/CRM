<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="brandCSS.html"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="${APP_PATH}/css/zTreeStyle.css" />
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/css/bootstrap-select.min.css">
		<!-- Latest compiled and minified JavaScript -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.2/js/bootstrap-select.min.js"></script>
		
		<script src="${APP_PATH}/js/jquery.ztree.core.js"></script>
		
		
		
		<script>
			var setting = {
				data: {
					// 设置是否启用简单数据
					simpleData: {
						enable: true
					}
				},
				callback: {
					onClick: zTreeOnClick
				},
				view: {
					showIcon: true,
					fontCss: {
						color: "#CD661D",
						background: "#F0F0F0"
					},
					dblClickExpand: false //屏蔽掉双击事件
				}

			}; //

			$(function() {
				/* 加载左侧树 */
				$.post("/CRM/goods/tree", {}, function(data) {
					$.fn.zTree.init($("#treeDemo"), setting, data);
				}, "json")
				/* 加载右侧表格 */
				$('#goodslisttable').bootstrapTable({
					url: '/CRM/goods/alltypinfo',
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
							field: 'name',
							title: '商品类型名称',
							align: 'center',
							valign: 'middle',

						},
						{
							field: 'discrip',
							title: '品牌类型描述',
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

				$("#typesearchbt").on("click", function() { /* 类型名称搜索 点击事件 */
					tid = null;
					query();
				})

				//确认添加 点击事件
				$("#typeaddbt").on("click", function() {
					$("#exampleModalAdd").modal("hide");
					$.post("/CRM/goods/inserttype", $("#typeaddformid").serialize(), function(data) {
						$(".form-control").val("");
					}, "json");
				})

				//确认修改 点击事件
				$("#typeeditbt").on("click", function() {
					$("#exampleModalEdit").modal("hide");
					$.post("/CRM/goods/updatetypeinfo", $("#typeeditformid").serialize(), function(data) {}, "json");
					$('#goodslisttable').bootstrapTable("refresh");
					$('#goodslisttable').bootstrapTable("refresh"); //因为刷新时间太短，数据库还没更新过来，就查出来是原来的效果，所以再加一个时间长点就更新过来了。
				})

				$(".shutupbt").on("click", function() {
					$(".form-control").val("");
				})

				//确认删除 点击事件
				$("#typedeletebt").on("click", function() {
					$("#exampleModalDelete").modal("hide");
					$.post("/CRM/goods/deletetypeinfo", {
						"id": $("#hiddenid2").val()
					}, function(data) {}, "json");
					$('#goodslisttable').bootstrapTable("refresh");
				});

			}) //

			/* 点击树目录时 点击事件 */
			var tid = 0;

			function zTreeOnClick(event, treeId, treeNode) {
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.expandNode(treeNode);
				console.log(treeNode.tId + ", " + treeNode.name);
				$.post("/CRM/goods/getPidinfo", {
					"name": treeNode.name
				}, function(data) {
					tid = data.id;
					console.log("tid:" + tid);
					query();
				}, "json");

			};

			function getArgs() {
				var params = {};
				var temp2 = '';
				$(".queryParam").each(function() {
					if(temp2 != $("#paramtypename").val()) {
						params.name = $("#paramtypename").val();
					}
					if(tid != temp2 && tid >= 1) {
						params.pId = tid;
					}

				});
				return params;
			}

			function query() {
				$('#goodslisttable').bootstrapTable("refresh"); //,{silent: true}
			}

			function operateFormatter(value, row, index) {
				return [
					'<a class="btn btn-primary see" role="button" data-toggle="modal" data-target="#exampleModalSee" href="javascript:void(0)">选用品牌',
					'<i class="fa fa-eye"></i>',
					'</a>  ',
					'<a class="btn btn-primary like" role="button" data-toggle="modal" data-target="#exampleModalEdit" href="javascript:void(0)">修改',
					'<i class="fa fa-pencil fa-fw"></i>',
					'</a>  ',
					'<a class="btn btn-primary remove" role="button" data-toggle="modal" data-target="#exampleModalDelete"  href="javascript:void(0)">删除',
					'<i class="fa fa-trash"></i>',
					'</a>',
				].join('')
			}

			window.operateEvents = {
				'click .like': function(e, value, row, index) {
					/* alert('You click like action, row: ' + JSON.stringify(row.gid)); */
					//id 唯一，重复的话赋值不了
					$("#input-edit-name").val(row.name);
					$("#input-edit-descrip").val(row.discrip);
					$("#typehiddenid").val(row.id);
				},
				'click .remove': function(e, value, row, index) {
					$("#hiddenid2").val(row.id);
					/*$table.bootstrapTable('remove', {
					  field: 'gid',
					  values: [row.gid]
					})*/
					/* $("#deleteformid").val(row.fid);
	    	$("#hiddenfid2").val(row.fid); */
				},
				'click .see': function(e, value, row, index) {

				}
			}
		</script>

	</head>

	<body class="layui-layout-body">
	
	<!-- 添加 Modal -->
					<div class="modal fade" id="exampleModalAdd" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">添加商品类型</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
								</div>
								<div class="modal-body">
									<form id="typeaddformid" method="post">
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-gprice">商品类型名称：</span>
											</div>
											<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fpurchaseprice" name="name">
										</div>
										<div class="input-group mb-3">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text">商品类型描述：</span>
												</div>
												<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-descrip" name="discrip">
											</div>
											<input type="hidden" name="pId" value="46" />
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary shutupbt" data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary" id="typeaddbt">确认添加</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 修改 Modal -->
					<div class="modal fade" id="exampleModalEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">修改商品类型</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
								</div>
								<div class="modal-body">
									<form id="typeeditformid" method="post">
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text" id="inputGroup-sizing-gprice">商品类型名称：</span>
											</div>
											<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-edit-name" name="name">
										</div>
										<div class="input-group mb-3">
											<div class="input-group">
												<div class="input-group-prepend">
													<span class="input-group-text">商品类型描述：</span>
												</div>
												<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-edit-descrip" name="discrip">
											</div>
											<input type="hidden" name="id" id="typehiddenid" />
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary" id="typeeditbt">确认修改</button>
								</div>
							</div>
						</div>
					</div>

					<!-- 删除 Modal -->
					<div class="modal fade" id="exampleModalDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">提示</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
								</div>
								<div class="modal-body">
									<div class="alert alert-warning" role="alert">
										确定删除该商品类型？
										<input type="hidden" name="id" id="hiddenid2" />
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary" id="typedeletebt">确认修改</button>
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
				<div class="container-fluid">
					<div class="row ">
						<div class="col alert alert-primary m-auto" role="alert" style="text-align: center;">商品类型管理</div>
						<div class="col-10"></div>
					</div>
					<div style="border: 1px solid black;">
						<!--加外边框-->
						<p class="text-danger">商品与赠品管理--&gt;商品管理--&gt;商品信息列表</p>
						<hr style=" height:5px;border:none;border-top:1px dotted #987cb9;">
						<!-- 分割线 -->
						<div class="row">
							<div class="col-4"> </div>
							<div class="col-4">
								<p class="card-text">商品类型名称:<input type="text" id="paramtypename" class="queryParam"></p>
							</div>
							<div class="col-4">
								<button class="btn btn-primary" id="typesearchbt">搜索</button>
								<button type="button" class="btn btn-primary" id="createsecondid" data-toggle="modal" data-target="#exampleModalAdd">新增类型</button>
							</div>

						</div>
						<hr style="border:1 dashed #987cb9" color="#987cb9" size="1">

						<div class="row">
							<div class="col-sm-3">
								<!--treeview-->
								<ul id="treeDemo" class="ztree"></ul>
							</div>
							<div class="col-sm-9">
								<!--放表格-->
								<table id="goodslisttable"></table>
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