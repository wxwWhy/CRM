<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--JSTL标签的使用-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="brandCSS.html"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>CRM</title>

		<style>
			#brandManageTop {
				background-color: deepskyblue;
			}
			
			#brandManage {
				border: solid lightslategrey 1px;
			}
			
			#brandlisttable thead {
				background: lightgray;
			}
			
			#h6 {
				color: red;
			}
			
			#update_h5 {
				color: red;
			}
			
			#insert_h5 {
				color: red;
			}
		</style>
		<!--服务器端自动分页，bootstrap-table根据服务器端返回的total，以及table设定的pageSize，自动生成分页的页面元素，
			每次点击下一页或者指定页码，bootstrap-table会自动给参数pageNumber赋值，服务器返回指定页的数据。-->
		<script type="text/javascript">
			$(function() {
				$('#brandlisttable').bootstrapTable({
					url: "${pageContext.request.contextPath}/goods/allBrands",
					queryParamsType: '',
					pagination: true,
					method: 'get',
					cache: true,
					sidePagination: 'server', // client or server
					pageNumber: 1,
					pageSize: 5,
					pageList: [2, 5, 10, 15, 20, 25, 50, 100],
					toolbar: "#queryForm",
					uniqueId: "brand_id",
					clickToSelect: true,
					columns: [{
						title: "序号",
						width: 10,
						align: "center",
						valign: 'middle',
						formatter: function(value, row, index) {
							//return index + 1;
							var pageSize = $('#brandlisttable').bootstrapTable('getOptions').pageSize; //通过表的#id 可以得到每页多少条
							var pageNumber = $('#brandlisttable').bootstrapTable('getOptions').pageNumber; //通过表的#id 可以得到当前第几页
							return pageSize * (pageNumber - 1) + index + 1; //返回每条的序号： 每页条数 * （当前页 - 1 ）+ 序号
						}
					}, {
						checkbox: true,
					}, {
						field: "brand_id",
						title: "品牌ID",
						//hidden:true, -----> 这种方法不管用
						visible: false, //false是隐藏这一列
						width: 150,
						align: "center",
						valign: 'middle'

					}, {
						field: "brand_name",
						title: "品牌名称",
						width: 150,
						align: "center",
						valign: 'middle'
					}, {
						field: "brand_url",
						title: "品牌网址",
						width: 150,
						align: 'center',
						valign: 'middle',
					}, {
						field: "brand_describe",
						title: "品牌描述",
						width: 150,
						align: 'center',
						valign: 'middle',
						/*formatter: function (value) {
                        	return value === 1 ? "男" : "女";
                    	}*/
					}, {
						field: "brand_id",
						title: "操作",
						width: 150,
						align: 'center',
						valign: 'middle',
						formatter: actionFormatter
					}],

					//查询参数，也就是往后端传递的查询条件   args   json格式，可以输出来查看一下
					queryParams: function(params) {
						var args = getArgs(); /* 得到paramName */
						args["pageNumber"] = params.pageNumber;
						args["pageSize"] = params.pageSize;
						return args;
					}
				})

				//异步文件上传
				$("#importBtn").on("click", function() {
					$.ajaxFileUpload({
						url: "${pageContext.request.contextPath}/goods/importBrands",
						fileElementId: "brandsExcelFile",
						secureuri: false,
						dataType: "text",
						success: function(data) {
							query();
							alert(data);
						}
					});
				})
				//为保存修改按钮绑定事件
				$("#save_update_btn").on("click", function() {
					$("#myModel").modal("hide");
					$.post("${pageContext.request.contextPath}/goods/updateBrandById",
						$("#brand_update_form").serialize(),
						function(data) {
							alert(data);
							query();
						}, "json");
				})
			})

			/*//性别字段格式化
			function sexFormatter(value) {
				if(value == "1") {
					value = "男"
					color = 'Red';
				} else if(value == "2") {
					value = "女"
					color = 'Green';
				} else {
					color = 'Black';
				}
				return '<div  style="color: ' + color + '">' + value + '</div>';
			};*/

			//操作栏格式化   //value：当前field的值，即id   //row：当前每一行的数据
			function actionFormatter(value, row, index) {
				var id = value;
				var result = "";
				result += "<button type='button' class='btn btn-success' data-toggle='modal' data-target='#myModel' onclick='editUser(" + id + ")'>修改</button>";
				result += "&nbsp;<button type='button' class='btn btn-success' onclick='deleteById(" + id + ")' >删除</button>";
				return result;

			}

			//搜索框值的获取，拼成json的格式
			function getArgs() {
				var params = {};
				$(".queryParam").each(function() {
					var v = $(this).val();
					var paramName = $(this).attr("name");
					params[paramName] = v;
				});
				return params;
			}

			//为保存新增按钮绑定事件-->增加功能
			function insertBrand() {
				$("#save_insert_btn").on("click", function() {
					$("#myMode_insert").modal("hide");
					$.post("${pageContext.request.contextPath}/goods/addBrand",
						$("#brand_insert_form").serialize(),
						function(data) {
							$("#brand_insert_form").serialize(),
								alert(data);
							query();
						}, "json");
				})
			}

			//实现删除功能
			function deleteById(id) {
				var msg = "您真的确定要删除这行数据吗？";
				if(confirm(msg)) {
					$.post(
						"${pageContext.request.contextPath}/goods/deleteBrandById", {
							"brand_id": id
						},
						function(data) { //这默认就是初始化页面的地址
							alert(data);
							$("#brandlisttable").bootstrapTable("refresh", {
								url: "${pageContext.request.contextPath}/goods/allBrands"
							})
						}, "json"
					);
				}
			}

			//批量删除
			function deleteUserList() {
				//获取所有被选中的记录
				var rows = $("#brandlisttable").bootstrapTable("getSelections");
				if(rows.lengh == 0) {
					alert("请选择要删除的数据！");
					return;
				}
				var ids = "";

			}

			//实现修改功能:把选中的行记录填充进模态框里
			function editUser(id) {
				$.post("${pageContext.request.contextPath}/goods/getBrandById", {
						"brand_id": id
					},
					function(data) { //取值的时候这也要注意点哦,可先输出来看看格式
						$("#brand_id_update").val(data.Brand.brand_id);
						$("#brand_name_update").val(data.Brand.brand_name);
						$("#brand_url_update").val(data.Brand.brand_url);
						$("#brand_describe_update").val(data.Brand.brand_describe);
					}, "json"
				);
			};

			//实现查询功能
			function query() {
				$('#brandlisttable').bootstrapTable("refresh"); //这里的refresh方法中已经有向url路径传送数据了，可修改//,{silent: true}
			}
		</script>
	</head>

	<body class="layui-layout-body">

		<%--品牌修改模态框--%>
		<div class="modal fade" id="myModel" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="update_h5">修改商品品牌信息</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                    <span aria-hidden="true">&times;</span>
						                </button>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" method="post" id="brand_update_form">
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">品牌ID</span>
								</div>
								<input type="text" name="brand_id" id="brand_id_update" class="form-control" readonly>
								<!---->
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">品牌名称</span>
								</div>
								<input type="text" name="brand_name" id="brand_name_update" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">品牌网址</span>
								</div>
								<input type="text" name="brand_url" id="brand_url_update" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">品牌描述</span>
								</div>
								<input type="text" name="brand_describe" id="brand_describe_update" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<!-- <div class="form-group row">
						                        <div class="col-sm-2">部门</div>
						                        <div class="col-sm-10">
						                            <select class="form-control" name="deptId" id="dept_update_select">
						                                <option selected>选择员工部门</option>
						                            </select>
						                        </div>
						                    </div>
						                    -->
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="save_update_btn">保存</button>
					</div>
				</div>
			</div>
		</div>
		<!--模态框到此结束-->

		<%--品牌新增模态框--%>
		<div class="modal fade" id="myMode_insert" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="insert_h5">添加商品品牌信息</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						                    <span aria-hidden="true">&times;</span>
						                </button>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" method="post" id="brand_insert_form">
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">品牌ID</span>
								</div>
								<input type="text" name="brand_id" id="brand_id_insert" class="form-control" readonly>
								<!---->
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">品牌名称</span>
								</div>
								<input type="text" name="brand_name" id="brand_name_insert" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">品牌网址</span>
								</div>
								<input type="text" name="brand_url" id="brand_url_insert" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">品牌描述</span>
								</div>
								<input type="text" name="brand_describe" id="brand_describe_insert" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="save_insert_btn">保存</button>
					</div>
				</div>
			</div>
		</div>
		<!--模态框到此结束-->
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
					<div>
						<h3 class="col-md-2" id="brandManageTop">商品品牌管理</h3>
					</div>

					<div id="brandManage">
						<h4 id="h6">商品与赠品管理-->商品品牌管理-->商品品牌列表</h4>
						<form id="queryForm">
							<input type="text" class="queryParam" name="brand_name" placeholder="请输入品牌名称" />
							<button type="button" class="btn btn-primary" onclick="query()">搜索</button>
							<button type="button" class="btn btn-primary" data-toggle='modal' data-target='#myMode_insert' onclick="insertBrand()">新增品牌</button>
						</form>

						<form action="${pageContext.request.contextPath}/goods/importBrands" method="post" enctype="multipart/form-data">
							<input id="brandsExcelFile" type="file" name="brandsExcelFile" /><input type="button" id="importBtn" value="导入" class="btn btn-primary" />
						</form>

						<table id="brandlisttable">

						</table>

					</div>
				</div>

				<div class="layui-footer">
					<!-- 底部固定区域 -->
					© layui.com - 底部固定区域
				</div>
			</div>

	</body>
</html>
