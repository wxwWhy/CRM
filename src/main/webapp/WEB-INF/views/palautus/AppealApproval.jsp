<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="my.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>特殊申诉审核</title>
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
        $('#aalist').bootstrapTable({
            url: '/CRM/AfterSalesAppeal/all',         //请求后台的URL（*）
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
                field: 'projectname',
                title: '方案名'
            }, {
                field: 'projectword',
                title: '方案关键字'
            }, {
                field: 'projectmakeperson',
                title: '方案制表人'
            }, {
                field: 'projectmaketime',
                title: '方案制表时间'
            }, {
                field: 'projectapproval',
                title: '审批人'
            }, {
                field: 'projectapprovaltime',
                title: '审批时间'
            } , {
                field: 'projectapprovalstatus',
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
            projectname:$("#aaname").val(),
            projectword:$("#aaword").val(),
            projectapprovalstatus:$("#aastatus").val(),
            projectmakeperson:$("#aamakeperson").val()
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
	if(row.projectapprovalstatus=="已审核"){
		var htm = "<button id='btn_follow' type='button' class='btn btn-default' style='float: right;background-color: #66CCFF;' onclick='follow("+index+")'>"
		    +"<span aria-hidden='true'></span>审核跟踪</button>";
	}
	else if(row.projectapprovalstatus=="未审核"||row.projectapprovalstatus=="审核不通过"){
		var htm = "<button id='btn_look' type='button' class='btn btn-default' style='background-color: #66CCFF;' onclick='approval("+index+")'>"
		    +"<span aria-hidden='true'></span>审核</button>"
		    +"<button id='btn_update' type='button' class='btn btn-default' style='background-color: #66CCFF;' onclick='follow("+index+")'>"
		    +"<span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>审核跟踪</button>";
	}
		    return htm;
}



function find() {
	$('#aalist').bootstrapTable("refresh");
}


function dele() {
	var rows = $.map($('#aalist').bootstrapTable('getSelections'),function (rows) {
 		return rows;
    });
	$.each(rows,function(i,d){
		$.get("dele",{"projectname":d.projectname,"projectword":d.projectword,"projectmaketime":d.projectmaketime},function(data){},"text")
	})
	$('#aalist').bootstrapTable("refresh");
}

function follow(i){
	$("#amodal1").modal("show")
	var a =$('#aalist').bootstrapTable("getData")[i];
	$("#aalook1").html(a.projectname)
	$("#aalook2").html(a.projectword)
	$("#aalook3").html(a.projectproblem)
	$("#aalook4").html(a.projectanswer)
	$("#aalook5").html(a.projectscene)
	$("#aalook6").html(a.projectremark)
	$("#aalook7").html(a.projectapproval)
	$("#aalook8").html(a.projectapprovaltime)
	$("#aalook9").html(a.projectapprovalstatus)
	$("#aalook10").html(a.projectapprovalmessage)
}


function approval(i){
	$("#amodal2").modal("show")
	var a =$('#aalist').bootstrapTable("getData")[i];
	console.log(a)
	$("#upmaketime").html(a.projectmaketime)
	$("#aaa1").val(a.projectname)
	$("#aaa2").val(a.projectword)
	$("#aaa3").val(a.projectproblem)
	$("#aaa4").val(a.projectanswer)
	$("#aaa5").val(a.projectscene)
	$("#aaa6").val(a.projectremark)
	$("#aaa7").val("")
}

function ano(){
	$.get("update2",{"projectapprovalstatus":"审核不通过","projectmaketime":$("#upmaketime").html(),"projectapprovalmessage":$("#aaa7").val()},function(data){},"text")
	$("#amodal2").modal("hide")
	$('#aalist').bootstrapTable("refresh");
}

function ayes() {
	$.get("update2",{"projectapprovalstatus":"已审核","projectmaketime":$("#upmaketime").html()},function(data){},"text")
	$("#amodal2").modal("hide")
	$('#aalist').bootstrapTable("refresh");
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


<div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;申诉管理&nbsp;&nbsp;</span></div>
		<div > &nbsp; &nbsp; &nbsp;
			<span style="color: red;">申诉管理-->特殊申诉管理-->特殊申诉审核列表</span>
			<hr />
		<span>方案名:</span><input type="text" id="aaname"/>
		<span>方案关键字:</span><input type="text" id="aaword"/>
		<span>审核状态:</span>
		<select id="aastatus">
			<option value="">全部</option>
			<option value="未审批">未审批</option>
			<option value="审批不通过">审批不通过</option>
			<option value="已审批">已审批</option>
		</select>
		<span>制单人:</span><input type="text" id="aamakeperson"/>	<br />
		<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="find()">搜索</button>
		<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="dele()">删除</button>
		<hr>
		<table id="aalist"></table>
		
		</div>

















</div>

				<div class="layui-footer">
					<!-- 底部固定区域 -->
					© layui.com - 底部固定区域
				</div>
			</div></div>
			
			
			
			
			<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="amodal1">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      
      
      
      <div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;申诉管理&nbsp;&nbsp;</span></div>
		<div style="border: 1px solid black;"> &nbsp; &nbsp; &nbsp;
			<span style="color: red;">申诉管理-->特殊申诉管理-->查看特殊申诉单审核状态</span>
			<hr /></div>
      
      
      	<div>
			制表时间:<span id="upmaketime"></span>
			</div>
      <table border="1">
      	<tr>
      		<td>方案名称:</td>
      		<td id="aalook1"></td>
      		<td>方案关键字:</td>
      		<td id="aalook2"></td>
      	</tr>
      	<tr>
      		<td>方案问题:</td>
      		<td id="aalook3"></td>
      		<td>方案解答:</td>
      		<td id="aalook4"></td>
      	</tr>
      	<tr>
      		<td>方案场景:</td>
      		<td id="aalook5"></td>
      		<td>方案备注:</td>
      		<td id="aalook6"></td>
      	</tr>
      </table><br><hr>
      <h3>审核记录</h3>
      <hr>
      <div>
      审批人:<span id="aalook7"></span>&nbsp; &nbsp; &nbsp;审批时间:<span id="aalook8"></span>&nbsp; &nbsp; &nbsp;审核状态:<span id="aalook9"></span>
      <br><hr>审核意见:<span id="aalook10"></span> 
			</div>
			<hr>
			<div align="center">
			 <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="background-color:#66CCFF ;" >返回</button>
			</div>
      
      
    </div>
  </div>
</div>



<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="amodal2">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">



		<table>
				<tr>
					<td> <span>方案名称:</span></td>
					<td><span><textarea id="aaa1" readonly="readonly"></textarea> </span></td>
					<td><span>方案关键字:</span></td>
					<td><span><textarea id="aaa2" readonly="readonly"></textarea> </span></td>
				</tr>
				<tr>
					<td><span>方案问题:</span></td>
					<td><span><textarea id="aaa3" readonly="readonly"></textarea></span></td>
					<td><span>方案解答:</span></td>
					<td><span><textarea id="aaa4" readonly="readonly"></textarea></span></td>
				</tr>
				<tr>
					<td><span>方案场景:</span></td>
					<td><span><textarea id="aaa5" readonly="readonly"></textarea></span></td>
					<td><span>方案备注:</span></td>
					<td><span><textarea id="aaa6" readonly="readonly"></textarea></span></td>
				</tr>
				<tr>
					<td><span>方案审批意见:</span></td>
					<td><span><textarea id="aaa7"></textarea></span></td>
				</tr>
			</table>
			<div align="center">
			<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="ano()">审核不通过</button>
			<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="ayes()">审核通过</button>
      		<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="background-color:#66CCFF ;" >返回</button>
			
			</div>

    </div>
  </div>
</div>
</body>
</html>