<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="my.html"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加返厂入库单</title>
<script type="text/javascript">

var tem="";



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
        $('#repairgoods').bootstrapTable({
            url: '/CRM/returngoods/allrepair',         //请求后台的URL（*）
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
            singleSelect: true, 
            pageSize: 5,                       //每页的记录行数（*）
            pageList: [5,10,15,20],        			//可供选择的每页的行数（*）
            columns: [{
                checkbox: true
            },{
                field: 'retutnrepairgoodsimei',
                title: '商品串号'
            }, {
                field: 'returnrepirgoodsbrand',
                title: '商品品牌'
            }, {
                field: 'returnrepirgoodsname',
                title: '商品名称'
            }, {
                field: 'returnrepirgoodsmodel',
                title: '商品型号'
            }, {
                field: 'returnrepirgoodscolor',
                title: '商品颜色'
            }, {
                field: 'returnrepirgoodsfactory',
                title: '商品供应商'
            },{
                field: 'returnrepirgoodsmessage',
                title: '商品跟踪信息'
            }]
        });
    };

    //得到查询的参数
    oTableInit.queryParams = function (params) {
    	
        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            limit: params.limit,   //页面大小
            offset: params.offset, //页码
            retutnrepairgoodsimei:$("#rrimei").val(),
            returnrepirgoodsname:$("#rrname").val(),
            returnrepirgoodsmodel:$("#rrmodel").val(),
            returnrepirgoodscolor:$("#rrcolor").val(),
            returnrepirgoodsfactory:$("#rrfactory").val(),
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





function chan() {
	$("#choo").modal("show")
}

function save() {
	var row = $.map($('#repairgoods').bootstrapTable('getSelections'),function (row) {
 		return row;
    });
	console.log(row)
	$.each(row,function(i,d){
		$("#s1").html(d.retutnrepairgoodsimei)
		$("#s2").html(d.returnrepirgoodsbrand)
		$("#s3").html(d.returnrepirgoodsname)
		$("#s4").html(d.returnrepirgoodsmodel)
		$("#s5").html(d.returnrepirgoodscolor)
		$("#s6").html(d.returnrepirgoodsfactory)
		$("#s7").html(d.returnrepirgoodsmessage)
	})
	$("#choo").modal("hide")
}

function ad() {
	$("#s9").empty()
	if($("#s8").val()=='更换'){
		$("#s9").append("<input type='text' id='s10'>")
	}
	
	
}


function find() {
	$('#repairgoods').bootstrapTable("refresh");
}

function save2() {
	
	if($("#s8").val()=='更换'){
		tem=$("#s10").val()
	}
	$.get("test2",{
		"retutnrepairgoodsimei":$("#s1").html(),
		"returnrepirgoodsbrand":$("#s2").html(),
		"returnrepirgoodsname":$("#s3").html(),
		"returnrepirgoodsmodel":$("#s4").html(),
		"returnrepirgoodscolor":$("#s5").html(),
		"returnrepirgoodsfactory":$("#s6").html(),
		"returnrepirgoodsmessage":$("#s7").html(),
		"returnrepirgoodsstatus":$("#s8").val(),
		"returnrepirgoodsbeforeimei":tem,
		"location":$("#s11").val(),
		"area":$("#s12").val()
	},function(data){},"text")
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
		<div><span style="background-color:#66CCFF ;">&nbsp;&nbsp;返厂入库管理&nbsp;&nbsp;</span></div>
		<div > &nbsp; &nbsp; &nbsp;
			<span style="color: red;">返厂出入库管理-->返厂入库管理-->添加返厂入库单</span>
			<br />
			<br />
			<button style="background-color: #66CCFF ;" type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg" onclick="chan()">选择商品</button>
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
				<th>更换后商品串码</th>
			</tr>
			<tr>
				<td id="s1"></td>
				<td id="s2"></td>
				<td id="s3"></td>
				<td id="s4"></td>
				<td id="s5"></td>
				<td id="s6"></td>
				<td id="s7"></td>
				<td ><select onchange="ad()" id="s8">
					<option value="维修">维修</option>
					<option value="更换">更换</option>
				</select> </td>
				<td id="s9">
				</td>
				
			</tr>
		</table>
		
			<br />
			<table style="border: 1px solid #66CCFF;">
				<tr>
					<td>返厂地点:</td>
					<td><input type="text" id="s11"/> </td>
				</tr>
				<tr>
					<td>备注:</td>
					<td><textarea id="s12"></textarea></td>
				</tr>
			</table>
			<button type="button" class="btn btn-primary btn-sm" style="background-color:#66CCFF ;" onclick="save2()">保存添加</button>
		</div>
		
		
		
		
		
		






</div>

				<div class="layui-footer">
					<!-- 底部固定区域 -->
					© layui.com - 底部固定区域
				</div>
			</div></div>



<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="choo">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
    
    
    
    <br>
		商品串号:<input type="text" id="rrimei">
		商品名称:<input type="text" id="rrname">
		商品型号:<input type="text" id="rrmodel">
		商品颜色:<select id="rrcolor">
			<option value="">请选择</option>
			<option value="黑色">黑色</option>
			<option value="白色">白色</option>
		</select>
		商品供应商:<select id="rrfactory">
			<option value="">请选择</option>
			<option value="三星">三星</option>
			<option value="LG">LG</option>
			<option value="philips">philips</option>
		</select>
	 	<button id="find" type="button" class="btn btn-default" onclick="find()">
                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>搜索
        </button>
    
    
    
      <table id="repairgoods"></table>
      <button type="button" class="btn btn-primary btn-sm" onclick="save()">保存</button>
  		<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
    </div>
  </div>
</div>

</body>
</html>