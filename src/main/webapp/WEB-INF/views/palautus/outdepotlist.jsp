<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="my.html"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>返厂出库管理</title>
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
        $('#outlist').bootstrapTable({
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
                checkbox: true
            },{
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
		var htm = "<button id='btn_look' type='button' class='btn btn-default' style='background-color: #66CCFF;' onclick='look("+index+")'>"
		    +"<span aria-hidden='true'></span>查看</button>"
		    +"<button id='btn_follow' type='button' class='btn btn-default' style='float: right;background-color: #66CCFF;' onclick='follow("+index+")'>"
		    +"<span aria-hidden='true'></span>审核跟踪</button>";
	}
	else if(row.approvalstatus=="未审批"||row.approvalstatus=="审批不通过"){
		var htm = "<button id='btn_look' type='button' class='btn btn-default' style='background-color: #66CCFF;' onclick='look("+index+")'>"
		    +"<span aria-hidden='true'></span>查看</button>"
		    +"<button id='btn_update' type='button' class='btn btn-default' style='background-color: #66CCFF;' onclick='alter("+index+")'>"
		    +"<span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>修改</button>"
		    +"<button id='btn_follow' type='button' class='btn btn-default' style='background-color: #66CCFF;' onclick='follow("+index+")'>"
		    +"<span aria-hidden='true'></span>审核跟踪</button>";
	}
		    return htm;
}


function find() {
	$('#outlist').bootstrapTable("refresh");
}

function inp() {
	
}

function look(i){
	var a =$('#outlist').bootstrapTable("getData")[i];
	$("#mm").modal("show");
	$("#imei").html(a.retutngoodsimei);
	$("#brand").html(a.returngoodsbrand);
	$("#name").html(a.returngoodsname);
	$("#model").html(a.returngoodsmodel);
	$("#color").html(a.returngoodscolor);
	$("#factory").html(a.returngoodsfactory);
	$("#message").html(a.returngoodsmessage);
	$("#area").html(a.textarea);
	$("#lo").html(a.location);
	$("#ar").html(a.area);
	$("#re").html(a.remark);
}


function alter(i){
	var a =$('#outlist').bootstrapTable("getData")[i];
	$("#dd").modal("show");
	$("#te").html(a.outdepotid)
	$("#ima").html(a.retutngoodsimei);
	$("#bra").html(a.returngoodsbrand);
	$("#naa").html(a.returngoodsname);
	$("#moa").html(a.returngoodsmodel);
	$("#coa").html(a.returngoodscolor);
	$("#faa").html(a.returngoodsfactory);
	$("#mea").html(a.returngoodsmessage);
	$("#ara").val(a.textarea);
	$("#loa").val(a.location);
	$("#arb").val(a.area);
	$("#rea").val(a.remark);
}
function dele(){
	var rows = $.map($('#outlist').bootstrapTable('getSelections'),function (rows) {
 		return rows;
    });
	$.each(rows,function(i,d){
		console.log(d.outdepotid)
		$.get("dele",{"outdepotid":d.outdepotid},function(data){},"text")
	})
	$('#outlist').bootstrapTable("refresh");
}

function savechange() {
	var  te=$("#te").html()
	var ima=$("#ima").html()
	var bra=$("#bra").html()
	var naa=$("#naa").html()
	var moa=$("#moa").html()
	var coa=$("#coa").html()
	var faa=$("#faa").html()
	var mea=$("#mea").html()
	var ara=$("#ara").val()
	var loa=$("#loa").val()
	var arb=$("#arb").val()
	var rea=$("#rea").val()
	$.get("ch",{"outdepotid":te,"retutngoodsimei":ima,"returngoodsbrand":bra,"returngoodsname":naa,
		"returngoodsmodel":moa,"returngoodscolor":coa,"returngoodsfactory":faa,"returngoodsmessage":mea,
		"textarea":ara,"location":loa,"area":arb,"remark":rea
	},function(data){},"text")
	
	$("#dd").modal("hide");
	$('#outlist').bootstrapTable("refresh");
}


function follow(i) {
	var a =$('#outlist').bootstrapTable("getData")[i];
	console.log(a)
	$("#cc").modal("show");
	$("#foid").html(a.outdepotid);
	$("#fmda").html(a.maketabledate);
	$("#fmpe").html(a.maketableperson);
	
	$("#fimei").html(a.retutngoodsimei);
	$("#fbrand").html(a.returngoodsbrand);
	$("#fname").html(a.returngoodsname);
	$("#fmodel").html(a.returngoodsmodel);
	$("#fcolor").html(a.returngoodscolor);
	$("#ffactory").html(a.returngoodsfactory);
	$("#fmessage").html(a.returngoodsmessage);
	$("#farea").html(a.textarea);
	$("#flo").html(a.location);
	$("#far").html(a.area);
	$("#fre").html(a.remark);
	$("#fapp").html(a.approver);
	$("#fada").html(a.approvaltime);
	$("#faps").html(a.approvalstatus);
	$("#fama").html(a.approvalmessage);
}

function writeout(){
	var rows = $.map($('#outlist').bootstrapTable('getSelections'),function (rows) {
 		return rows;
    });
	$.each(rows,function(i,d){
		if(d.approvalstatus=='已审批'){
			$("#wtest").modal("show")
		
		$.get("writeout",{"outdepotid":d.outdepotid,"approvalmessage":d.approvalmessage,
			"approvalstatus":d.approvalstatus,"approvaltime":d.approvaltime,"approver":d.approver,
			"area":d.area,"location":d.location,"maketabledate":d.maketabledate,"maketableperson":d.maketableperson,
			"outdepotmark":d.outdepotmark,"remark":d.remark,"returngoodsbrand":d.returngoodsbrand,
			"returngoodscolor":d.returngoodscolor,"returngoodsfactory":d.returngoodsfactory,
			"returngoodsmessage":d.returngoodsmessage,"returngoodsmodel":d.returngoodsmodel,
			"returngoodsname":d.returngoodsname,"retutngoodsimei":d.retutngoodsimei,"textarea":d.textarea
		},function(data){},"text")}
	}) 
	
	
	
	
}




function printf(){
	
	 var rows = $.map($('#outlist').bootstrapTable('getSelections'),function (rows) {
 		return rows;
    });
	console.log(rows)
	
	$.each(rows,function(i,d){
		if(d.approvalstatus=='已审批'){
			$("#writetest").attr('href',"/CRM/returngoods/download?filename=o"+d.outdepotid+".docx")
		}
	})
	$("#wtest").modal("hide") 
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


<br>
		<div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;返厂出库管理&nbsp;&nbsp;</span></div>
		<div > &nbsp; &nbsp; &nbsp;
			<span style="color: red;">返厂出入库管理-->返厂出入库管理-->返厂出库单列表</span>
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
		<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="writeout()"> 导出</button>
		<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="find()">搜索</button>
		<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="dele()">删除</button>
		<hr>
		<table id="outlist"></table>
		
		
		
		
		
		
		
		
		
				
			
				



</div>

				<div class="layui-footer">
					<!-- 底部固定区域 -->
					© layui.com - 底部固定区域
				</div>
			</div></div>
			
			
			
			
			
			
			
			<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="mm">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    	<div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;返厂出库管理&nbsp;&nbsp;</span></div>
		<div style="border: 1px solid black;"> &nbsp; &nbsp; &nbsp;
			<span style="color: red;">返厂出入库管理-->返厂出入库管理-->返厂出库单详情</span>
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
					<td id="imei"></td>
					<td id="brand"></td>
					<td id="name"></td>
					<td id="model"></td>
					<td id="color"></td>
					<td id="factory"></td>
					<td id="message"></td>
					<td id="area"></td>
				</tr>
			</table>
			<br>
			<span>返厂地点:</span><span id="lo"></span><br>
			<span>返厂原因:</span><span id="ar"></span><br>
			<span>备注:</span><span id="re"></span><br>
			
			
			<hr />
			<div align="center">
			<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="background-color:#66CCFF ;" >返回</button>
			</div>
      	
    </div>
  </div>
</div>
		
		
		
		</div>
		</div>	
		
		
		
		
		
		<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="dd">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      
      
      
      
      <div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;返厂出库管理&nbsp;&nbsp;</span></div>
		<div style="border: 1px solid black;"> &nbsp; &nbsp; &nbsp;
			<span style="color: red;">返厂出入库管理-->返厂出入库管理-->修改返厂出库单</span>&nbsp; &nbsp; &nbsp;返厂出库单号<span id="te"></span>
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
					<td id="ima"></td>
					<td id="bra"></td>
					<td id="naa"></td>
					<td id="moa"></td>
					<td id="coa"></td>
					<td id="faa"></td>
					<td id="mea"></td>
					<td><input type="text" id="ara"></td>
				</tr>
			</table>
			<br>
			<span>返厂地点:</span><input type="text" id="loa"><br>
			<span>返厂原因:</span><textarea id="arb"></textarea><br>
			<span>备注:</span><textarea id="rea"></textarea><br>
			
			
			<hr />
			<div align="center">
			<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="savechange()">保存修改</button>
			<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="background-color:#66CCFF ;" >返回</button>
			</div>
      
      </div>



	</div>
				

  </div>
</div>		





<div class="modal fade bs-example-modal-lg" tabindex="-1"
					role="dialog" aria-labelledby="myLargeModalLabel" id="cc">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
						
						<div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;返厂出库管理&nbsp;&nbsp;</span></div>
		<div style="border: 1px solid black;"> &nbsp; &nbsp; &nbsp;
			<span style="color: red;">返厂出入库管理-->返厂出入库管理-->返厂出库单审核跟踪信息</span>&nbsp; &nbsp; &nbsp;
			<br>
			&nbsp; &nbsp; &nbsp;返厂出库单号:<span id="foid"></span>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;制单时间:<span id="fmda"></span>
			&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;制单人:<span id="fmpe"></span>



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
							<td id="fimei"></td>
							<td id="fbrand"></td>
							<td id="fname"></td>
							<td id="fmodel"></td>
							<td id="fcolor"></td>
							<td id="ffactory"></td>
							<td id="fmessage"></td>
							<td id="farea"></td>
						</tr>
					</table>
					<br> 
					<span>返厂地点:</span><span id="flo"></span>
					<br> 
					<span>返厂原因:</span><span id="far"></span>
					<br> 
					<span>备注:</span><span id="fre"></span><br>
					<hr>
					<br>
					<h3>审核记录</h3>
					
					
					&nbsp; &nbsp; &nbsp;审批人:<span id="fapp"></span>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;审批时间:<span id="fada"></span>
			&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;审核状态:<span id="faps"></span><br><hr>
			审核意见:<span id="fama"></span><br><hr>
			
<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="background-color:#66CCFF ;" >返回</button>


				</div>
						</div>
					</div>
				</div>	
				
				
				
				<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="wtest">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    
    		导出成功,是否打印
    		只有已审批的订单才能打印哦!
    		<a id="writetest"><button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="printf()" >打印</button></a>
    		<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="background-color:#66CCFF ;" >返回</button>
    </div>
  </div>
</div>	
</body>
</html>