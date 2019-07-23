<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="my.html"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>返厂入库单审核</title>
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
        $('#inlist').bootstrapTable({
            url: '/CRM/returngoods/allinlist',         //请求后台的URL（*）
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
                field: 'indepotid',
                title: '返厂入库单号'
            }, {
                field: 'indepotmark',
                title: '返厂入库标志'
            }, {
                field: 'maketableperson',
                title: '制表人'
            }, {
                field: 'maketabledate',
                title: '制表时间'
            }, {
                field: 'approver',
                title: '审批人'
            }, {
                field: 'approvaltime',
                title: '审批时间'
            } , {
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
            indepotid:$("#gindepotid").val(),
            indepotmark:$("#gindepotmark").val(),
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
		var htm ="<button id='btn_follow' type='button' class='btn btn-default' style='float: right;background-color: #66CCFF;' onclick='follow("+index+")'>"
		    +"<span aria-hidden='true'></span>审核跟踪</button>";
	}
	else if(row.approvalstatus=="未审批"||row.approvalstatus=="审批不通过"){
		var htm ="<button id='btn_update' type='button' class='btn btn-default' style='background-color: #66CCFF;' onclick='alter("+index+")'>"
		    +"<span class='glyphicon glyphicon-pencil' aria-hidden='true'></span>审批</button>"
		    +"<button id='btn_follow' type='button' class='btn btn-default' style='background-color: #66CCFF;' onclick='follow("+index+")'>"
		    +"<span aria-hidden='true'></span>审核跟踪</button>";
	}
		    return htm;
}



function find() {
	$('#inlist').bootstrapTable("refresh");

}


function follow(i){
	$("#inapp1").modal("show")
	var a =$('#inlist').bootstrapTable("getData")[i];
	$("#in1").html(a.indepotid);
	$("#in2").html(a.maketabledate);
	$("#in3").html(a.maketableperson);
	$("#in4").html(a.retutnrepairgoodsimei);
	$("#in5").html(a.returnrepirgoodsbrand);
	$("#in6").html(a.returnrepirgoodsname);
	$("#in7").html(a.returnrepirgoodsmodel);
	$("#in8").html(a.returnrepirgoodscolor);
	$("#in9").html(a.returnrepirgoodsfactory);
	$("#in10").html(a.returnrepirgoodsmessage);
	$("#in11").html(a.returnrepirgoodsstatus);
	$("#in12").html(a.returnrepirgoodsbeforeimei);
	$("#in13").html(a.location);
	$("#in15").html(a.area); 
	$("#in16").html(a.approver); 
	$("#in17").html(a.approvaltime); 
	$("#in18").html(a.approvalstatus); 
	$("#in19").html(a.approvalmessage); 
}


function alter(i){
	$("#inapp2").modal("show")
	var a =$('#inlist').bootstrapTable("getData")[i];
	console.log(a)
	$("#inappp1").html(a.indepotid);
	$("#inappp2").html(a.maketabledate);
	$("#inappp3").html(a.maketableperson);
	$("#inappp4").html(a.retutnrepairgoodsimei);
	$("#inappp5").html(a.returnrepirgoodsbrand);
	$("#inappp6").html(a.returnrepirgoodsname);
	$("#inappp7").html(a.returnrepirgoodsmodel);
	$("#inappp8").html(a.returnrepirgoodscolor);
	$("#inappp9").html(a.returnrepirgoodsfactory);
	$("#inappp10").html(a.returnrepirgoodsmessage);
	$("#inappp11").html(a.returnrepirgoodsstatus);
	$("#inappp12").html(a.returnrepirgoodsbeforeimei);
	$("#inappp13").html(a.location);
	$("#inappp15").html(a.area); 
}


function ano(){
	$.get("test4",{"approvalstatus":"审批不通过","indepotid":$("#inappp1").html(),"approvalmessage":$("#inappp14").val()},function(data){},"text")
	$('#inlist').bootstrapTable("refresh");
	$("#inapp2").modal("hide");
	
}

function ayes(){
	$.get("test4",{"approvalstatus":"已审批","indepotid":$("#inappp1").html(),"indepotmark":"已入库"},function(data){},"text")
	$('#inlist').bootstrapTable("refresh");
	$("#inapp2").modal("hide");
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






<div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;返厂入库管理&nbsp;&nbsp;</span></div>
		<div style="border: 1px solid black;"> &nbsp; &nbsp; &nbsp;
			<span style="color: red;">返厂出入库管理-->返厂出入库管理-->返厂入库单列表</span>
			<hr />
		<span>返厂入库单号:</span><input type="text" id="gindepotid"/>
		<span>返厂入库标志:</span>
		<select id="gindepotmark">
			<option value="">全部</option>
			<option value="未出库">未入库</option>
			<option value="已出库">已入库</option>
		</select>
		<span>审核状态:</span>
		<select id="gapprovalstatus">
			<option value="">全部</option>
			<option value="未审批">未审批</option>
			<option value="审批不通过">审批不通过</option>
			<option value="已审批">已审批</option>
		</select>
		<span>制单人:</span><input type="text" id="gmaketableperson"/>	<br />
		
		
		<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="find()">搜索</button>
		<hr>
		<table id="inlist"></table>
		</div>
		
		
		
		
		













</div>

				<div class="layui-footer">
					<!-- 底部固定区域 -->
					© layui.com - 底部固定区域
				</div>
			</div></div>



<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="inapp2">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      
      
      
      
      <div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;返厂出库管理&nbsp;&nbsp;</span></div>
		<div> &nbsp; &nbsp; &nbsp;
			<span style="color: red;">返厂出入库管理-->返厂出入库管理-->返厂入库单审核跟踪信息</span>&nbsp; &nbsp; &nbsp;
			<br>
			&nbsp; &nbsp; &nbsp;返厂入库单号:<span id="inappp1"></span>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;制单时间:<span id="inappp2"></span>
			&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;制单人:<span id="inappp3"></span>



					<table  border="1">
			<tr>
				<th>商品串码</th>
				<th>商品品牌</th>
				<th>商品名称</th>
				<th>商品型号</th>
				<th>商品颜色</th>
				<th>商品供应商</th>
				<th>商品跟踪信息</th>
				<th>返厂类型</th>
				<th>更换前商品串码</th>
			</tr>
			<tr>
				<td id="inappp4"></td>
				<td id="inappp5"></td>
				<td id="inappp6"></td>
				<td id="inappp7"></td>
				<td id="inappp8"></td>
				<td id="inappp9"></td>
				<td id="inappp10"></td>
				<td id="inappp11"></td>
				<td id="inappp12"></td>
				
			</tr>
		</table>
					<br> 
					<span>返厂地点:</span><span id="inappp13"></span>
					<br> 
					<span>备注:</span><span id="inappp15"></span><br>
					<hr>
					<br>
					<h3>审核入库单审核</h3>
					<br>
					<hr>
					<span>审批意见:</span><span><input type="text" id="inappp14"></span>
					
					<br><hr>
					
					<div align="center">
					<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;"  onclick="ano()">审批不通过</button>
					<button type="button" class="btn btn-default btn-sm"  style="background-color:#66CCFF ;" onclick="ayes()">审批通过</button>
					<button type="button" class="btn btn-default btn-sm"  style="background-color:#66CCFF ;" data-dismiss="modal" >返回</button>
					</div></div>
      
      
      
      
      
      
    </div>
  </div>
</div>




<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="inapp1">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
       <div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;返厂出库管理&nbsp;&nbsp;</span></div>
		<div style="border: 1px solid black;"> &nbsp; &nbsp; &nbsp;
			<span style="color: red;">返厂出入库管理-->返厂出入库管理-->返厂入库单审核跟踪信息</span>&nbsp; &nbsp; &nbsp;
			<br>
			&nbsp; &nbsp; &nbsp;返厂入库单号:<span id="in1"></span>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;制单时间:<span id="in2"></span>
			&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;制单人:<span id="in3"></span>



					<table id="bao" border="1">
			<tr>
				<th>商品串码</th>
				<th>商品品牌</th>
				<th>商品名称</th>
				<th>商品型号</th>
				<th>商品颜色</th>
				<th>商品供应商</th>
				<th>商品跟踪信息</th>
				<th>返厂类型</th>
				<th>更换前商品串码</th>
			</tr>
			<tr>
				<td id="in4"></td>
				<td id="in5"></td>
				<td id="in6"></td>
				<td id="in7"></td>
				<td id="in8"></td>
				<td id="in9"></td>
				<td id="in10"></td>
				<td id="in11"></td>
				<td id="in12"></td>
				
			</tr>
		</table>
					<br> 
					<span>返厂地点:</span><span id="in13"></span>
					<br> 
					<span>备注:</span><span id="in15"></span><br>
					<hr>
					<br>
					<h3>审核记录</h3>
					
					
					&nbsp; &nbsp; &nbsp;审批人:<span id="in16"></span>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;审批时间:<span id="in17"></span>
			&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;审核状态:<span id="in18"></span><br><hr>
			审核意见:<span id="in19"></span><br><hr><div align="center">
			<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="background-color:#66CCFF ;" >返回</button>
			</div></div>
    </div>
  </div>
</div>
</body>
</html>