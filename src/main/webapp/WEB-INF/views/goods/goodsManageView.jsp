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
							title: '购买价',
							align: 'center',
							valign: 'middle',
							visible: false,
						}, {
							field: 'fmarketprice',
							title: '市场价',
							align: 'center',
							valign: 'middle',
							visible: false,
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

				//初始化一个 下拉框
				$('.selectpicker').selectpicker();

				//确认修改 点击事件
				$("#saveeditEdit").on("click", function() {
					$("#exampleModalEdit").modal("hide"); /*保存之后 该模态窗隐藏*/
					$.post("/CRM/goods/updatefirst",
						$("#updateform").serialize(),
						function(data) {

						}, "text")
					query();
				});

				//确认删除
				$("#savaDeletebt").on("click", function() {
					$("#exampleModalDelete").modal("hide"); /*保存之后 该模态窗隐藏*/
					$.post("/CRM/goods/deletefirst", {
							"fid": $("#deleteformid").val()
						},
						function(data) {

						}, "text")
					query();
				});

				$("#searchbt").on("click", function() {
					query();
				});

				//
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

			function operateFormatter(value, row, index) {
				return [
					'<a class="btn btn-primary see" role="button" data-toggle="modal" data-target="#exampleModalSee" href="javascript:void(0)">查看',
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
					$("#input-text-ffilenumber2").val(row.ffilenumber);
					$("#input-text-fbasetype2").val(row.fbasetype);
					$("#input-text-fbasebrand2").val(row.fbasebrand);
					$("#input-text-fbasemodel2").val(row.fbasemodel);
					$("#input-text-fbusinesspattern2").val(" ");
					$("#input-text-fbasecolor2").val(row.fbasecolor);
					$("#input-text-fbasepurchasepattern2").val(row.fbasepurchasepattern);
					$("#input-text-fmedic2").val(row.fmedic);
					$("#input-text-fbasestandby2").val(row.fbasestandby);
					$("#input-text-fname2").val(row.fname);
					$("#input-text-ftype2").val(row.ftype);
					$("#input-text-fmarketprice2").val(row.fmarketprice);
					$("#input-text-fshoppingmallprice2").val(row.fshoppingmallprice);
					$("#input-text-fminrepertory2").val(row.fminrepertory);
					$("#hiddenfid").val(row.fid);
					// $("#input-text-fifpurchase").val(row.fifpurchase);

				},
				'click .remove': function(e, value, row, index) {
					/*$table.bootstrapTable('remove', {
					  field: 'gid',
					  values: [row.gid]
					})*/
					$("#deleteformid").val(row.fid);
					$("#hiddenfid2").val(row.fid);
				},
				'click .see': function(e, value, row, index) {
					$("#input-text-ffilenumber").val(row.ffilenumber);
					$("#input-text-fbasetype").val(row.fbasetype);
					$("#input-text-fbasebrand").val(row.fbasebrand);
					$("#input-text-fbasemodel").val(row.fbasemodel);
					$("#input-text-fbusinesspattern").val(" ");
					$("#input-text-fbasecolor").val(row.fbasecolor);
					$("#input-text-fbasepurchasepattern").val(row.fbasepurchasepattern);
					$("#input-text-fmedic").val(row.fmedic);
					$("#input-text-fbasestandby").val(row.fbasestandby);
					$("#input-text-fname").val(row.fname);
					$("#input-text-ftype").val(row.ftype);
					$("#input-text-fmarketprice").val(row.fmarketprice);
					$("#input-text-fshoppingmallprice").val(row.fshoppingmallprice);
					$("#input-text-fminrepertory").val(row.fminrepertory);
					$("#input-text-fifpurchase").val(row.fifpurchase);
				}
			}

			//
		</script>
	</head>

	<body class="layui-layout-body">
		<!--添加一类商品  Modal -->
		<div class="modal fade" id="exampleModalSecond" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">添加二类商品</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
					</div>
					<div class="modal-body">
						<form method="post" id="addSecondformId">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gid">商品品牌：</span>
								</div>
								<!--				  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-gid" name="gid"  >
-->
								<select class="sbrand" name="sbrand" id="sbrand">
								</select>

							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gname">商品型号：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-gname" name="smodel">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gnum">商品颜色：</span>
									<select class="scolor" name="scolor">
										<option>珍珠白</option>
										<option>炫酷黑</option>
										<option>绚丽紫</option>
										<option>白色</option>
										<option>黑色</option>
									</select>
								</div>
								<!-- <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-gnum" name="gnum"  >-->
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gcolor">商品名称：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-gcolor" name="sname">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gcolor">商品类别：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-gcolor" name="stype">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">市场价：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-gprice" name="smarketprice">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">商城价：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-gprice" name="sshoppingprice">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">最低库存量：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-gprice" name="sminrepertory">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">是否采购：</span>
								</div>
								<!--<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-gprice" name="gprice">-->
								<select class="sifpurchase" name="sifpurchase">
									<option>可采购</option>
									<option>不可采购</option>
								</select>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="saveSecondAdd">确认添加</button>
					</div>
				</div>
			</div>
		</div>

		<!--查看  Modal -->
		<div class="modal fade" id="exampleModalSee" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">查看</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
					</div>
					<div class="modal-body">
						<form method="post" id="seeform">
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gid">存货档案编码：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-ffilenumber" name="gid" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gname">基础库-分类</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbasetype" name="gname" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gnum">基础库-品牌</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbasebrand" name="gnum" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gcolor">基础库-型号</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbasemodel" name="gcolor" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">基础库-业务模式</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbusinesspattern" name="gprice" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">基础库-颜色</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbasecolor" name="gprice" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">基础库-采购模式</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbasepurchasepattern" name="gprice" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">基础库-铺货</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fmedic" name="gprice" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">基础库-备机</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbasestandby" name="gprice" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">商品名称</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fname" name="gprice" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">商品类型</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-ftype" name="gprice" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">市场价</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fmarketprice" name="gprice" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">商城价</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fshoppingmallprice" name="gprice" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">最低库存量</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fminrepertory" name="gprice" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">是否可采购</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fifpurchase" name="gprice" readonly>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						<!-- <button type="button" class="btn btn-primary" id="saveeditEdit">确认修改</button> -->
					</div>
				</div>
			</div>
		</div>

		<!--修改  Modal -->
		<div class="modal fade" id="exampleModalEdit" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">查看</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
					</div>
					<div class="modal-body">
						<form method="post" id="updateform">
							<input type="hidden" id="hiddenfid" name="fid" />
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gid">存货档案编码：</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-ffilenumber2" name="ffilenumber" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gname">基础库-分类</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbasetype2" name="fbasetype" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gnum">基础库-品牌</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbasebrand2" name="fbasebrand" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gcolor">基础库-型号</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbasemodel2" name="fbasemodel" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">基础库-业务模式</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbusinesspattern2" name="fbusinesspattern" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">基础库-颜色</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbasecolor2" name="fbasecolor" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">基础库-采购模式</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbasepurchasepattern2" name="fbasepurchasepattern" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">基础库-铺货</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fmedic2" name="fmedic" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">基础库-备机</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fbasestandby2" name="fbasestandby" readonly>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">商品名称</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fname2" name="fname">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">商品类型</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-ftype2" name=ftype>
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">市场价</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fmarketprice2" name="fmarketprice">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">商城价</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fshoppingmallprice2" name="fshoppingmallprice">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text" id="inputGroup-sizing-gprice">最低库存量</span>
								</div>
								<input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fminrepertory2" name="fminrepertory">
							</div>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<!-- 这里暂时没有根据已有数据选中默认选项  分类下拉框也是-->
									<span class="input-group-text" id="inputGroup-sizing-gprice">是否可采购</span>
								</div>
								<!-- <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" id="input-text-fifpurchase" name="gprice" > -->
								<select class="selectpicker" name="fifpurchase">
									<option>可采购</option>
									<option>不可采购</option>
								</select>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="saveeditEdit">确认修改</button>
					</div>
				</div>
			</div>
		</div>

		<!--删除 Modal -->
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
						<input type="hidden" name="fid" id="deleteformid"> 确认删除？
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="savaDeletebt">确定</button>
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
				<div class="container-fluit" style="border: 1px,lightslategrey,solid;">

					<div class="row ">
						<div class="col alert alert-primary m-auto" role="alert" style="text-align: center;">商品查询</div>
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
							<div class="col-2">
								<button type="button" class="btn btn-primary" id="createfirstid">创建一类商品</button>
							</div>
							<div class="col-2">
								<button type="button" class="btn btn-primary" id="createsecondid" data-toggle="modal" data-target="#exampleModalSecond">创建二类商品</button>
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