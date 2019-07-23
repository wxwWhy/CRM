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
			#supplierTop {
				background-color: lightskyblue;
			}
			
			#supplierManage {
				border: solid lightslategrey 1px;
			}
			
			#supplierlisttable thead {
				background: lightgray;
			}
			
			#h6 {
				color: red;
			}
			
			#supplier_update_h5 {
				color: red;
			}
			
			#supplier_insert_h5 {
				color: red;
			}
		</style>
		<!--服务器端自动分页，bootstrap-table根据服务器端返回的total，以及table设定的pageSize，自动生成分页的页面元素，
			每次点击下一页或者指定页码，bootstrap-table会自动给参数pageNumber赋值，服务器返回指定页的数据。-->
		<script type="text/javascript">
			$(function() {
				$('#supplierlisttable').bootstrapTable({
					url: "${pageContext.request.contextPath}/goods/getAllSuppliers",
					queryParamsType: '',
					pagination: true,
					sidePagination: 'server', // client or server
					pageNumber: 1,
					pageSize: 5,
					pageList: [2, 5, 10, 15, 20, 25, 50, 100],
					toolbar: "#queryForm",
					uniqueId: "s_id",
					clickToSelect: true,
					columns: [{
						title: "序号",
						align: 'center',
						formatter: function(value, row, index) {
							//return index + 1;
							var pageSize = $('#supplierlisttable').bootstrapTable('getOptions').pageSize; //通过表的#id 可以得到每页多少条
							var pageNumber = $('#supplierlisttable').bootstrapTable('getOptions').pageNumber; //通过表的#id 可以得到当前第几页
							return pageSize * (pageNumber - 1) + index + 1; //返回每条的序号： 每页条数 * （当前页 - 1 ）+ 序号
						}
					}, {
						checkbox: true,
					}, {
						field: "s_id",
						title: "供应商ID",
						//hidden:true, -----> 这种方法不管用
						visible: false, //false是隐藏这一列
					}, {
						field: "s_name",
						title: "供应商名称",
						align: 'center',
					}, {
						field: "s_contact",
						title: "联系人",
						align: 'center',
					}, {
						field: "s_phone",
						title: "联系电话",
						align: 'center',
						/*formatter: function (value) {
                        	return value === 1 ? "男" : "女";
                    	}*/
					}, {
						field: "s_email",
						title: "邮箱",
						align: 'center',
						visible: false, //false是隐藏这一列
					}, {
						field: "s_address",
						title: "联系地址",
						align: 'center',
					}, {
						field: "s_bankName",
						title: "开户银行",
						align: 'center',
						visible: false, //false是隐藏这一列
					}, {
						field: "s_accountNumber",
						title: "开户账号",
						align: 'center',
					}, {
						field: "s_id",
						title: "操作",
						align: 'center',
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
				//为保存修改按钮绑定事件
				$("#save_updateSupplier_btn").on("click", function() {
					$("#supplierModel").modal("hide");
					$.post("${pageContext.request.contextPath}/goods/updateSupplier",
						$("#supplier_update_form").serialize(),
						function(data) {
							alert(data);
							query();
						}, "json");
				})

				//为保存新增按钮绑定事件-->增加功能
				$("#save_addSupplier_btn").on("click", function() {
					$("#myMode_insertSupplier").modal("hide");
					$.post("${pageContext.request.contextPath}/goods/addSupplier",
						$("#addSupplierForm").serialize(),
						function(data) {
							$("#addSupplierForm").serialize(),
								alert(data);
							query();
						}, "json");
				})
				
				//进页面立即加载初始化下拉框列表
				$.post("${pageContext.request.contextPath}/goods/getAllSupplierAddress",{},
					function(data){
						for(var i=0;i<data.addressList.length;i++){
							$("#selectAddress").append("<option>"+data.addressList[i]+"</option>");
						}
					},"json"
				);

			})

			//操作栏格式化   //value：当前field的值，即id   //row：当前每一行的数据
			function actionFormatter(value, row, index) {
				var id = value;
				var result = "";
				result += "<button type='button' class='btn btn-success' onclick='jump(" + id + ")'>选用供应商品</button>";
				result += "&nbsp;<button type='button' class='btn btn-success' data-toggle='modal' data-target='#supplierModel' onclick='updateSupplier(" + id + ")'>修改</button>";
				result += "&nbsp;<button type='button' class='btn btn-success' onclick='deleteSupplierById(" + id + ")' >删除</button>";
				return result;

			}

			//搜索框值的获取，拼成json的格式
			function getArgs() {
				var params = {};
				$(".queryParam").each(function() {
					var v = $(this).val();
					var paramName = $(this).attr("name");
					params[paramName] = v;
					
					//下拉框选中的值
					var temp="全部";
					if(temp !=$("#selectAddress option:selected").text()){
						params.s_address=$("#selectAddress option:selected").text();
					}
					
				});
				return params;
			}

			//实现删除功能
			function deleteSupplierById(id) {
				var msg = "您真的确定要删除这行数据吗？";
				if(confirm(msg)) {
					$.post(
						"${pageContext.request.contextPath}/goods/deleteSupplierById", {
							"s_id": id
						},
						function(data) { //这默认就是初始化页面的地址
							alert(data);
							$("#supplierlisttable").bootstrapTable("refresh", {
								url: "${pageContext.request.contextPath}/goods/getAllSuppliers"
							})
						}, "json"
					);
				}
			}

			//实现修改功能:把选中的行记录填充进模态框里
			function updateSupplier(id) {
				$.post("${pageContext.request.contextPath}/goods/getSupplierById", {
						"s_id": id
					},
					function(data) { //取值的时候这也要注意点哦,可先输出来看看格式
						$("#s_id_update").val(data.supplier.s_id);
						$("#s_name_update").val(data.supplier.s_name);
						$("#s_contact_update").val(data.supplier.s_contact);
						$("#s_phone_update").val(data.supplier.s_phone);
						$("#s_email_update").val(data.supplier.s_email);
						$("#s_address_update").val(data.supplier.s_address);
						$("#s_bankName_update").val(data.supplier.s_bankName);
						$("#s_accountNumber_update").val(data.supplier.s_accountNumber);
					}, "json"
				);
			};

			//实现查询功能
			function query() {
				$('#supplierlisttable').bootstrapTable("refresh"); //这里的refresh方法中已经有向url路径传送数据了，可修改//,{silent: true}
			}

			//跳转到选用供应商品页面
			function jump(id) {
				$.post("${pageContext.request.contextPath}/goods/goAllSupplierGoods", {
						"s_id": id
					},
					function(data) {
						//alert(data);
						location.href = "${pageContext.request.contextPath}/goods/goSelectSupplierGoods";
					}, "json"
				);
			}
		</script>
	</head>

	<body class="layui-layout-body">
		<%--供应商修改模态框--%>
		<div class="modal fade" id="supplierModel" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="supplier_update_h5">修改供应商信息</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" method="post" id="supplier_update_form">
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">供应商ID</span>
								</div>
								<input type="text" name="s_id" id="s_id_update" class="form-control" readonly>
								<!---->
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">供应商名称</span>
								</div>
								<input type="text" name="s_name" id="s_name_update" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">联系人</span>
								</div>
								<input type="text" name="s_contact" id="s_contact_update" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">联系电话</span>
								</div>
								<input type="text" name="s_phone" id="s_phone_update" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">联系邮箱</span>
								</div>
								<input type="text" name="s_email" id="s_email_update" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">联系地址</span>
								</div>
								<input type="text" name="s_address" id="s_address_update" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">开户银行</span>
								</div>
								<input type="text" name="s_bankName" id="s_bankName_update" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">开户账号</span>
								</div>
								<input type="text" name="s_accountNumber" id="s_accountNumber_update" class="form-control" required>
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
						<button type="button" class="btn btn-primary" id="save_updateSupplier_btn">保存</button>
					</div>
				</div>
			</div>
		</div>
		<!--模态框到此结束-->

		<%--供应商新增模态框--%>
		<div class="modal fade" id="myMode_insertSupplier" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="supplier_insert_h5">新增供应商信息</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                    <span aria-hidden="true">&times;</span>
				                </button>
					</div>
					<div class="modal-body">
						<form class="form-horizontal" method="post" id="addSupplierForm">
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">供应商ID</span>
								</div>
								<input type="text" name="s_id" class="form-control" readonly>
								<!---->
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">供应商名称</span>
								</div>
								<input type="text" name="s_name" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">联系人</span>
								</div>
								<input type="text" name="s_contact" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">联系电话</span>
								</div>
								<input type="text" name="s_phone" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>

							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">联系邮箱</span>
								</div>
								<input type="text" name="s_email" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">联系地址</span>
								</div>
								<input type="text" name="s_address" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">开户银行</span>
								</div>
								<input type="text" name="s_bankName" class="form-control" required>
								<div class="invalid-feedback"></div>
							</div>
							<div class="input-group form-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">开户账号</span>
								</div>
								<input type="text" name="s_accountNumber" class="form-control" required>
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
						<button type="button" class="btn btn-primary" id="save_addSupplier_btn">保存</button>
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
				<div class="container-fluid">
					<h3 id="supplierTop" class="col-md-2">
						供应商管理
					</h3>

					<div id="supplierManage">
						<h6 id="h6">商品与赠品管理-->供应商管理-->供应商列表</h6>
						<form id="queryForm">
							<span>
								供应商名称：<input type="text" class="queryParam" name="s_name" placeholder="请输入供应商名称" />&nbsp;
								联系人姓名：<input type="text" class="queryParam" name="s_contact" placeholder="请输入联系人姓名" />&nbsp;&nbsp;&nbsp;
								
								
								<span>联系地址:</span>
								<select id="selectAddress" class="queryParam selectAddress">
									<option>全部</option>
									
								</select>
								
								
								<button type="button" class="btn btn-primary" onclick="query()">搜索</button><br/>
								<button type="button" class="btn btn-primary" data-toggle='modal' data-target='#myMode_insertSupplier' onclick="addSupplier()">新增供应商</button>
							</span>
						</form>

						<table id="supplierlisttable">

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