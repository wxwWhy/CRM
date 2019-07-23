<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="my.html"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>返厂入库管理</title>
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
	$('#inlist').bootstrapTable("refresh");

}



function look(i){
	var a =$('#inlist').bootstrapTable("getData")[i];
	console.log(a)
	$("#inmodal1").modal("show");
	$("#imei").html(a.retutnrepairgoodsimei);
	$("#beforeimei").html(a.returnrepirgoodsbeforeimei);
	$("#brand").html(a.returnrepirgoodsbrand);
	$("#name").html(a.returnrepirgoodsname);
	$("#model").html(a.returnrepirgoodsmodel);
	$("#color").html(a.returnrepirgoodscolor);
	$("#factory").html(a.returnrepirgoodsfactory);
	$("#message").html(a.returnrepirgoodsmessage);
	$("#area").html(a.returnrepirgoodsstatus);
	$("#lo").html(a.location);
	$("#re").html(a.area); 
}

function alter(i){
	var a =$('#inlist').bootstrapTable("getData")[i];
	$("#inmodal2").modal("show");
	$("#inid").html(a.indepotid)
	$("#i1").html(a.retutnrepairgoodsimei);
	$("#i2").html(a.returnrepirgoodsbrand);
	$("#i3").html(a.returnrepirgoodsname);
	$("#i4").html(a.returnrepirgoodsmodel);
	$("#i5").html(a.returnrepirgoodscolor);
	$("#i6").html(a.returnrepirgoodsfactory);
	$("#i7").html(a.returnrepirgoodsmessage);
	$("#i8").html(a.returnrepirgoodsstatus);
	$("#i9").html(a.returnrepirgoodsbeforeimei);
}

function save() {
	console.log($("#i11").val());
	console.log($("#i12").val());
	$.get("test3",{"location":$("#i11").val(),"area":$("#i12").val(),"indepotid":$("#inid").html()},function(data){},"text")
	$("#inmodal2").modal("hide");
	$('#inlist').bootstrapTable("refresh");
}

function follow(i) {
	$("#inmodal3").modal("show");
	var a =$('#inlist').bootstrapTable("getData")[i];
	console.log(a)
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

function dele(){
	var rows = $.map($('#inlist').bootstrapTable('getSelections'),function (rows) {
 		return rows;
    });
	$.each(rows,function(i,d){
		$.get("indele",{"indepotid":d.indepotid},function(data){},"text")
	})
	$('#inlist').bootstrapTable("refresh");
}



function writein(){
	var rows = $.map($('#inlist').bootstrapTable('getSelections'),function (rows) {
 		return rows;
    });
	$.each(rows,function(i,d){
		if(d.approvalstatus=='已审批'){
			$("#inwtest").modal("show")
		 $.get("writein",{"approvalmessage":d.approvalmessage,"approvalstatus":d.approvalstatus,
			"approvaltime":d.approvaltime,"approver":d.approver,"area":d.area,
			"indepotid":d.indepotid,"indepotmark":d.indepotmark,"location":d.location,"maketabledate":d.maketabledate,
			"maketableperson":d.maketableperson,"returnrepirgoodsbeforeimei":d.returnrepirgoodsbeforeimei,"returnrepirgoodsbrand":d.returnrepirgoodsbrand,
			"returnrepirgoodscolor":d.returnrepirgoodscolor,"returnrepirgoodsfactory":d.returnrepirgoodsfactory,
			"returnrepirgoodsmessage":d.returnrepirgoodsmessage,"returnrepirgoodsmodel":d.returnrepirgoodsmodel,
			"returnrepirgoodsname":d.returnrepirgoodsname,"returnrepirgoodsstatus":d.returnrepirgoodsstatus,"retutnrepairgoodsimei":d.retutnrepairgoodsimei
		},function(data){},"text") }
	}) 
	
	
	
	
}




function printf(){
	
	var rows = $.map($('#inlist').bootstrapTable('getSelections'),function (rows) {
 		return rows;
    });
	
	$.each(rows,function(i,d){
		if(d.approvalstatus=='已审批'){
			$("#writetest").attr('href',"/CRM/returngoods/downloadin?filename=i"+d.outdepotid+".docx")
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
					

					
				


<div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;返厂入库管理&nbsp;&nbsp;</span></div>
		<div > &nbsp; &nbsp; &nbsp;
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
		<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="writein()">导出</button>
		<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="find()">搜索</button>
		<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" onclick="dele()">删除</button>
		<hr>
		<table id="inlist"></table>
		
		
		
		
		
		
		</div>



























</div>

				<div class="layui-footer">
					<!-- 底部固定区域 -->
					© layui.com - 底部固定区域
				</div>
			</div></div>	
			
			
			
			<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="inmodal1">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      

<div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;返厂入库管理&nbsp;&nbsp;</span></div>
		<div style="border: 1px solid black;"> &nbsp; &nbsp; &nbsp;
			<span style="color: red;">返厂出入库管理-->返厂出入库管理-->返厂入库单详情</span>
			<table border="1">
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
					<td id="imei"></td>
					<td id="brand"></td>
					<td id="name"></td>
					<td id="model"></td>
					<td id="color"></td>
					<td id="factory"></td>
					<td id="message"></td>
					<td id="area"></td>
					<td id="beforeimei"></td>
				</tr>
			</table>
			<br>
			<span>返厂地点:</span><span id="lo"></span><br>
			<span>备注:</span><span id="re"></span><br>
			
			
			<hr />
			<div align="center">
			<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="background-color:#66CCFF ;" >返回</button>
			</div></div>





    </div>
  </div>
</div>




<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="inmodal2">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      
      
      
      
      <br>
		<div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;返厂入库管理&nbsp;&nbsp;</span></div>
		<div style="border: 1px solid black;"> &nbsp; &nbsp; &nbsp;
			<span style="color: red;">返厂出入库管理-->返厂入库管理-->修改返厂入库单</span>&nbsp; &nbsp; &nbsp;入库单号:<span id="inid"></span>
			<br />
			<br />
			<br />
			
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
				<td id="i1"></td>
				<td id="i2"></td>
				<td id="i3"></td>
				<td id="i4"></td>
				<td id="i5"></td>
				<td id="i6"></td>
				<td id="i7"></td>
				<td id="i8"></td>
				<td id="i9"></td>
				
			</tr>
		</table>
		
			<br />
			<table style="border: 1px solid #66CCFF;">
				<tr>
					<td>返厂地点:</td>
					<td><input type="text" id="i11"/> </td>
				</tr>
				<tr>
					<td>备注:</td>
					<td><textarea id="i12"></textarea></td>
				</tr>
			</table>
			<button type="button" class="btn btn-primary btn-sm" style="background-color:#66CCFF ;" onclick="save()">保存修改</button>
  		<button type="button" class="btn btn-default btn-sm" style="background-color:#66CCFF ;" data-dismiss="modal">返回</button>
		</div>
      
      
      
      
      
    </div>
  </div>
</div>



<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="inmodal3">
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
			审核意见:<span id="in19"></span> 
			<button type="button" class="btn btn-default btn-sm" data-dismiss="modal" style="background-color:#66CCFF ;" >返回</button>
			</div>
      
      
      
      
      
      
      
    </div>
  </div>
</div>



<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="inwtest">
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