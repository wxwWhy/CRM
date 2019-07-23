<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="my.html" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>特殊申诉管理</title>
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
        $('#projectlist').bootstrapTable({
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
            projectname:$("#proname").val(),
            projectword:$("#proword").val(),
            projectapprovalstatus:$("#proastatus").val(),
            projectmakeperson:$("#promakeperson").val()
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
		var htm = "<button id='btn_look' type='button' class='btn btn-default' style='background-color: #66CCFF;' onclick='look("+index+")'>"
		    +"<span aria-hidden='true'></span>查看</button>"
		    +"<button id='btn_follow' type='button' class='btn btn-default' style='float: right;background-color: #66CCFF;' onclick='follow("+index+")'>"
		    +"<span aria-hidden='true'></span>审核跟踪</button>";
	}
	else if(row.projectapprovalstatus=="未审核"||row.projectapprovalstatus=="审核不通过"){
		var htm = "<button id='btn_look' type='button' class='btn btn-default' style='background-color: #66CCFF;' onclick='look("+index+")'>"
		    +"<span aria-hidden='true'></span>查看</button>"
		    +"<button id='btn_update' type='button' class='btn btn-default' style='background-color: #66CCFF;' onclick='alter("+index+")'>"
		    +"<span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>修改</button>"
		    +"<button id='btn_follow' type='button' class='btn btn-default' style='background-color: #66CCFF;' onclick='dele2("+index+")'>"
		    +"<span aria-hidden='true'></span>删除</button>";
	}
		    return htm;
}


function find() {
	$('#projectlist').bootstrapTable("refresh");

}


function inp() {
	$("#pr1").val("")
	$("#pr2").val("")
	$("#pr3").val("")
	$("#pr4").val("")
	$("#pr5").val("")
	$("#pr6").val("")
	$("#addproject").modal("show")
}

function dele() {
	var rows = $.map($('#projectlist').bootstrapTable('getSelections'),function (rows) {
 		return rows;
    });
	$.each(rows,function(i,d){
		$.get("dele",{"projectname":d.projectname,"projectword":d.projectword,"projectmaketime":d.projectmaketime},function(data){},"text")
	})
	$('#projectlist').bootstrapTable("refresh");
}

function dele2(i){
	var a =$('#projectlist').bootstrapTable("getData")[i];
	$.get("dele",{"projectname":a.projectname,"projectword":a.projectword,"projectmaketime":a.projectmaketime},function(data){},"text")
	$('#projectlist').bootstrapTable("refresh");
}

function saveadd() {
	$.get("saveadd",{"projectname":$("#pr1").val(),"projectword":$("#pr2").val(),"projectproblem":$("#pr3").val(),"projectanswer":$("#pr4").val(),"projectscene":$("#pr5").val(),"projectremark":$("#pr6").val()},function(data){},"text")
	$("#addproject").modal("hide")
	$('#projectlist').bootstrapTable("refresh");
}

function look(i){
	$("#lookthis").modal("show")
	var a =$('#projectlist').bootstrapTable("getData")[i];
	$("#plook1").html(a.projectname)
	$("#plook2").html(a.projectword)
	$("#plook3").html(a.projectproblem)
	$("#plook4").html(a.projectanswer)
	$("#plook5").html(a.projectscene)
	$("#plook6").html(a.projectremark)
	$("#plook7").html(a.projectapproval)
	$("#plook8").html(a.projectapprovaltime)
	$("#plook9").html(a.projectapprovalstatus)
	$("#plook10").html(a.projectapprovalmessage)
}

function alter(i) {
	$("#updateproject").modal("show")
	var a =$('#projectlist').bootstrapTable("getData")[i];
	
	$("#ur1").val(a.projectname)
	$("#upmati").html(a.projectmaketime)
	$("#ur2").val(a.projectword)
	$("#ur3").val(a.projectproblem)
	$("#ur4").val(a.projectanswer)
	$("#ur5").val(a.projectscene)
	$("#ur6").val(a.projectremark)
}

function saveupdate() {
	console.log($("#upmati").html())
	console.log($("#ur1").val())
	console.log($("#ur2").val())
	console.log($("#ur3").val())
	console.log($("#ur4").val())
	console.log($("#ur5").val())
	console.log($("#ur6").val())
	$.get("update",{"projectmaketime":$("#upmati").html(),"projectname":$("#ur1").val()
		,"projectword":$("#ur2").val(),"projectproblem":$("#ur3").val(),"projectanswer":$("#ur4").val(),
		"projectscene":$("#ur5").val(),"projectremark":$("#ur6").val()
	},function(data){},"text")
	$("#updateproject").modal("hide")
	$('#projectlist').bootstrapTable("refresh");
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
			<span style="color: red;">申诉管理-->特殊申诉管理-->特殊申诉管理列表</span>
			<hr />
		<span>方案名:</span><input type="text" id="proname"/>
		<span>方案关键字:</span><input type="text" id="proword"/>
		<span>审核状态:</span>
		<select id="proastatus">
			<option value="">全部</option>
			<option value="未审批">未审批</option>
			<option value="审批不通过">审批不通过</option>
			<option value="已审批">已审批</option>
		</select>
		<span>制单人:</span><input type="text" id="promakeperson"/>	<br />
		<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="inp()">新增申诉单</button>
		<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="find()">搜索</button>
		<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="dele()">删除</button>
		<hr>
		<table id="projectlist"></table>
		
		</div>


		
		
		


















</div>

				<div class="layui-footer">
					<!-- 底部固定区域 -->
					© layui.com - 底部固定区域
				</div>
			</div></div>
			
			
			
			
			<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="addproject">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      
      <div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;申诉管理&nbsp;&nbsp;</span></div>
		<div style="border: 1px solid black;"> &nbsp; &nbsp; &nbsp;
			<span style="color: red;">申诉管理-->特殊申诉管理-->添加特殊申诉单</span>
			<hr /></div>
			
			
			<table>
				<tr>
					<td> <span>方案名称:</span></td>
					<td><span><textarea id="pr1"></textarea> </span></td>
					<td><span>方案关键字:</span></td>
					<td><span><textarea id="pr2"></textarea> </span></td>
				</tr>
				<tr>
					<td><span>方案问题:</span></td>
					<td><span><textarea id="pr3"></textarea></span></td>
					<td><span>方案解答:</span></td>
					<td><span><textarea id="pr4"></textarea></span></td>
				</tr>
				<tr>
					<td><span>方案场景:</span></td>
					<td><span><textarea id="pr5"></textarea></span></td>
					<td><span>方案备注:</span></td>
					<td><span><textarea id="pr6"></textarea></span></td>
				</tr>
			</table>
     
      <br>
      <hr>
      <div align="center">
      <button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="saveadd()">添加</button>
      <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="background-color:#66CCFF ;" >返回</button>
      </div>
    </div>
  </div>
</div>



<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="lookthis">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      
      
      
      <div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;申诉管理&nbsp;&nbsp;</span></div>
		<div style="border: 1px solid black;"> &nbsp; &nbsp; &nbsp;
			<span style="color: red;">申诉管理-->特殊申诉管理-->查看特殊申诉单</span>
			<hr /></div>
      
      
      <table border="1">
      	<tr>
      		<td>方案名称:</td>
      		<td id="plook1"></td>
      		<td>方案关键字:</td>
      		<td id="plook2"></td>
      	</tr>
      	<tr>
      		<td>方案问题:</td>
      		<td id="plook3"></td>
      		<td>方案解答:</td>
      		<td id="plook4"></td>
      	</tr>
      	<tr>
      		<td>方案场景:</td>
      		<td id="plook5"></td>
      		<td>方案备注:</td>
      		<td id="plook6"></td>
      	</tr>
      </table><br><hr>
      <h3>审核记录</h3>
      <hr>
      <div>
      审批人:<span id="plook7"></span>&nbsp; &nbsp; &nbsp;审批时间:<span id="plook8"></span>&nbsp; &nbsp; &nbsp;审核状态:<span id="plook9"></span>
      <br><hr>审核意见:<span id="plook10"></span> 
			</div>
			<hr>
			<div align="center">
			 <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="background-color:#66CCFF ;" >返回</button>
			</div>
    </div>
  </div>
</div>



<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="updateproject">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      
      <div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;申诉管理&nbsp;&nbsp;</span></div>
		<div style="border: 1px solid black;"> &nbsp; &nbsp; &nbsp;
			<span style="color: red;">申诉管理-->特殊申诉管理-->修改特殊申诉单</span>
			<hr /></div>
			<div>
			制表时间:<span id="upmati"></span>
			</div>
			<table>
				<tr>
					<td> <span>方案名称:</span></td>
					<td><span><textarea id="ur1"></textarea> </span></td>
					<td><span>方案关键字:</span></td>
					<td><span><textarea id="ur2"></textarea> </span></td>
				</tr>
				<tr>
					<td><span>方案问题:</span></td>
					<td><span><textarea id="ur3"></textarea></span></td>
					<td><span>方案解答:</span></td>
					<td><span><textarea id="ur4"></textarea></span></td>
				</tr>
				<tr>
					<td><span>方案场景:</span></td>
					<td><span><textarea id="ur5"></textarea></span></td>
					<td><span>方案备注:</span></td>
					<td><span><textarea id="ur6"></textarea></span></td>
				</tr>
			</table>
     
      <br>
      <hr>
      <div align="center">
      <button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="saveupdate()">修改</button>
      <button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="background-color:#66CCFF ;" >返回</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>