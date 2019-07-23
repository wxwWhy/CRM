<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="my.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>返厂出库单审核列表</title>
<script type="text/javascript">


$(function () {

    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();

    //2.初始化Button的点击事件
    var oButtonInit = new ButtonInit();
    oButtonInit.Init();
    
    
    
});  






var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#approverlist').bootstrapTable({
            url: '/CRM/returngoods/listall',         //请求后台的URL（*）
            method: 'get',                      //请求方式（*）
            totalField: 'total',
            dataField: 'list',
            toolbar: '#toolbar',                //工具按钮用哪个容器
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //是否显示分页（*）
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
            pageSize: 5,                       //每页的记录行数（*）
            pageList: [5,10,15,20],        			//可供选择的每页的行数（*）
            columns: [{
                field: 'outdepotid',
                title: '返厂出库单号'
            }, {
                field: 'outdepotmark',
                title: '返厂出库标志'
            }, {
                field: 'maketableperson',
                title: '制单人'
            }, {
                field: 'maketabledate',
                title: '制单时间'
            }, {
                field: 'approver',
                title: '审批人'
            }, {
                field: 'approvaltime',
                title: '审批时间'
            },{
                field: 'approvalstatus',
                title: '审批状态'
            },{
            	title:'操作',
            	formatter: operation
            }]
        });
    };

    //得到查询的参数
    oTableInit.queryParams = function (params) {
    	
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset, //页码
            outdepotid:$("#goutdepotid").val(),
            outdepotmark:$("#goutdepotmark").val(),
            approvalstatus:$("#gapprovalstatus").val(),
            maketableperson:$("#gmaketableperson").val()
        };
        return temp;
    };
    return oTableInit;
};


var ButtonInit = function () {
    var oInit = new Object();
    var postdata = {};

    oInit.Init = function () {
        //初始化页面上面的按钮事件
    };

    return oInit;
};



function operation(value,row,index){
	if(row.approvalstatus=="已审批"){
		var htm ="<button id='btn_follow' type='button' class='btn btn-default' style='background-color: #66CCFF;' onclick='follow("+index+")'>"
		    +"<span aria-hidden='true'></span>审批跟踪</button>";
	}
	else if(row.approvalstatus=="未审批"||row.approvalstatus=="审批不通过"){
		var htm ="<button id='btn_update' type='button' class='btn btn-default' style='background-color: #66CCFF;' onclick='alter("+index+")'>"
		    +"<span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>审批</button>"
		    +"<button id='btn_follow' type='button' class='btn btn-default' style='background-color: #66CCFF;' onclick='follow("+index+")'>"
		    +"<span aria-hidden='true'></span>审批跟踪</button>";
	}
		    return htm;
}


function find() {
	$('#approverlist').bootstrapTable("refresh");
}

function alter(i) {
	var a =$('#approverlist').bootstrapTable("getData")[i];
	console.log(a)
	$("#ap").modal("show")
	$("#ames").val("");
	$("#ames").val(a.approvalmessage);
	$("#aoid").html(a.outdepotid);
	$("#amda").html(a.maketabledate);
	$("#ampe").html(a.maketableperson);
	
	$("#aimei").html(a.retutngoodsimei);
	$("#abrand").html(a.returngoodsbrand);
	$("#aname").html(a.returngoodsname);
	$("#amodel").html(a.returngoodsmodel);
	$("#acolor").html(a.returngoodscolor);
	$("#afactory").html(a.returngoodsfactory);
	$("#amessage").html(a.returngoodsmessage);
	$("#aarea").html(a.textarea);
	$("#alo").html(a.location);
	$("#aar").html(a.area);
	$("#are").html(a.remark);
	/* $.get("ch",{"approvalstatus":"已审批","outdepotid":a.outdepotid},function(data){},"text") */
}

function follow(i) {
	var a =$('#approverlist').bootstrapTable("getData")[i];
	console.log(a)
	$("#al").modal("show")
	$("#almes").val("");
	$("#almes").val(a.approvalmessage);
	$("#aloid").html(a.outdepotid);
	$("#almda").html(a.maketabledate);
	$("#almpe").html(a.maketableperson);
	$("#alimei").html(a.retutngoodsimei);
	$("#albrand").html(a.returngoodsbrand);
	$("#alname").html(a.returngoodsname);
	$("#almodel").html(a.returngoodsmodel);
	$("#alcolor").html(a.returngoodscolor);
	$("#alfactory").html(a.returngoodsfactory);
	$("#almessage").html(a.returngoodsmessage);
	$("#alarea").html(a.textarea);
	$("#allo").html(a.location);
	$("#alar").html(a.area);
	$("#alre").html(a.remark);
	$("#aperson").html(a.approver);
	$("#atime").html(a.approvaltime);
	$("#astatus").html(a.approvalstatus);
}

function ano() {
	$.get("ch2",{"approvalstatus":"审批不通过","outdepotid":$("#aoid").html(),"approvalmessage":$("#ames").val()},function(data){},"text")
	$("#ap").modal("hide")
	$('#approverlist').bootstrapTable("refresh");
}

function ayes(){
	$.get("ch2",{"approvalstatus":"已审批","outdepotid":$("#aoid").html(),"outdepotmark":"已出库"},function(data){},"text")
	$("#ap").modal("hide")
	$('#approverlist').bootstrapTable("refresh");
}
</script>
</head>
<body>

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


<div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;返厂出库单审核&nbsp;&nbsp;</span></div>
		<div > &nbsp; &nbsp; &nbsp;
			<span style="color: red;">返厂出入库管理-->返厂出入库管理-->返厂出库单审核列表</span>
			<hr />
		<span>返厂出库单号:</span><input type="text" id="goutdepotid"/>
		<span>返厂出库标志:</span>
		<select id="goutdepotmark">
			<option value="">全部</option>
			<option value="未出库">未出库</option>
			<option value="已出库">已出库</option>
		</select>
		<span>审核状态:</span>
		<select id="gapprovalstatus">
			<option value="">全部</option>
			<option value="未审批">未审批</option>
			<option value="审批不通过">审批不通过</option>
			<option value="已审批">已审批</option>
		</select>
		<span>制单人:</span><input type="text" id="gmaketableperson"/>	<br />
		<div align="center">
		<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="find()">搜索</button>
		</div>
		<hr>
		<table id="approverlist"></table>
		</div>





		
		
		
		
		




</div>

				<div class="layui-footer">
					<!-- 底部固定区域 -->
					© layui.com - 底部固定区域
				</div>
			</div></div>
			
			
			
			<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="ap">
  			<div class="modal-dialog modal-lg" role="document">
    		<div class="modal-content">
      		
      		
      		
      		<div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;返厂出库管理&nbsp;&nbsp;</span></div>
      		<div style="border: 1px solid black;"> &nbsp; &nbsp; &nbsp;
      		<span style="color: red;">返厂出入库管理-->返厂出入库管理-->返厂出库单审核跟踪信息</span>&nbsp; &nbsp; &nbsp;
			<br><hr>
			&nbsp; &nbsp; &nbsp;返厂出库单号:<span id="aoid"></span>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;制单时间:<span id="amda"></span>
			&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;制单人:<span id="ampe"></span>



					<table border="1">
						<tr>
							<th>商品串码</th>
							<th>商品品牌</th>
							<th>商品名称</th>
							<th>商品型号</th>
							<th>商品颜色</th>
							<th>商品供应商</th>
							<th>商品跟踪信息</th>
							<th>返厂配置</th>
						</tr>
						<tr>
							<td id="aimei"></td>
							<td id="abrand"></td>
							<td id="aname"></td>
							<td id="amodel"></td>
							<td id="acolor"></td>
							<td id="afactory"></td>
							<td id="amessage"></td>
							<td id="aarea"></td>
						</tr>
					</table>
					<br> 
					<span>返厂地点:</span><span id="alo"></span>
					<br> 
					<span>返厂原因:</span><span id="aar"></span>
					<br> 
					<span>备注:</span><span id="are"></span><br>
					<hr>
					<br>
					<h3>返厂出库单审核意见</h3><hr>
					<textarea id="ames"></textarea>
					<hr>
					<div align="center">
      		<button type="button" class="btn btn-default btn-sm"  style="background-color:#66CCFF ;" onclick="ano()">审批不通过</button>
      		<button type="button" class="btn btn-default btn-sm"  style="background-color:#66CCFF ;" onclick="ayes()">审批通过</button>
      		<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="background-color:#66CCFF ;" >返回</button>
      		
      		</div>
      		</div>
      		
    		</div>
  			</div>
		</div>
		
		
		
		
		
		
		<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="al">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      
      
      
      <div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;返厂出库管理&nbsp;&nbsp;</span></div>
      		<div style="border: 1px solid black;"> &nbsp; &nbsp; &nbsp;
      		<span style="color: red;">返厂出入库管理-->返厂出入库管理-->返厂出库单审核跟踪信息</span>&nbsp; &nbsp; &nbsp;
			<br><hr>
			&nbsp; &nbsp; &nbsp;返厂出库单号:<span id="aloid"></span>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;制单时间:<span id="almda"></span>
			&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;制单人:<span id="almpe"></span>



					<table border="1">
						<tr>
							<th>商品串码</th>
							<th>商品品牌</th>
							<th>商品名称</th>
							<th>商品型号</th>
							<th>商品颜色</th>
							<th>商品供应商</th>
							<th>商品跟踪信息</th>
							<th>返厂配置</th>
						</tr>
						<tr>
							<td id="alimei"></td>
							<td id="albrand"></td>
							<td id="alname"></td>
							<td id="almodel"></td>
							<td id="allcolor"></td>
							<td id="alfactory"></td>
							<td id="almessage"></td>
							<td id="alarea"></td>
						</tr>
					</table>
					<br> 
					<span>返厂地点:</span><span id="allo"></span>
					<br> 
					<span>返厂原因:</span><span id="alar"></span>
					<br> 
					<span>备注:</span><span id="alre"></span><br>
					<hr>
					<br>
					<h3>返厂出库单审核</h3><hr>
					<span>审批人:</span><span id="aperson"></span> &nbsp;&nbsp;&nbsp;&nbsp; <span>审批时间:</span><span id="atime"></span>&nbsp;&nbsp;&nbsp;&nbsp; <span>审批状态:</span><span id="astatus"></span>
					<br>
					<span>审批意见:</span><textarea id="almes" readonly="readonly"></textarea>
					<hr>
					<div align="center">
      		<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="background-color:#66CCFF ;" >返回</button>
      
      
      </div>
      
      
      </div>
    </div>
  </div>
</div>	
</body>
</html>