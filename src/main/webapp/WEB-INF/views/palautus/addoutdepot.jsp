<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ include file="my.html" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>添加返厂出库单</title>
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
		        $('#tb_departments').bootstrapTable({
		            url: '/CRM/returngoods/all',         //请求后台的URL（*）
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
		                field: 'retutngoodsimei',
		                title: '商品串号'
		            }, {
		                field: 'returngoodsbrand',
		                title: '商品品牌'
		            }, {
		                field: 'returngoodsname',
		                title: '商品名称'
		            }, {
		                field: 'returngoodsmodel',
		                title: '商品型号'
		            }, {
		                field: 'returngoodscolor',
		                title: '商品颜色'
		            }, {
		                field: 'returngoodsfactory',
		                title: '商品供应商'
		            },{
		                field: 'returngoodsmessage',
		                title: '商品跟踪信息'
		            }]
		        });
		    };

		    //得到查询的参数
		    oTableInit.queryParams = function (params) {
		    	
		        var temp = {   //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
		            limit: params.limit,   //页面大小
		            offset: params.offset, //页码
		            retutngoodsimei:$("#gimei").val(),
		            returngoodsname:$("#gname").val(),
		            returngoodsmodel:$("#gmodel").val(),
		            returngoodscolor:$("#gcolor").val(),
		            returngoodsfactory:$("#gfactory").val(),
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
		
		function del(m) {
			$("#"+m).remove();
		}
		
		function find() {
			$('#tb_departments').bootstrapTable("refresh");
		}
		
		function save1() {
			var row = $.map($('#tb_departments').bootstrapTable('getSelections'),function (row) {
		 		return row;
		    });
			
			$.each(row,function(i,d){
				$("#bao").append(
						"<tr id='"+i+"'><td><input type='text' id='"+d.retutngoodsimei+i+"' name='retutngoodsimei' value='"+d.retutngoodsimei+"' readonly='readonly'/>"+
						"</td><td><input type='text' id='"+d.returngoodsbrand+i+"' name='returngoodsbrand' value='"+d.returngoodsbrand+"' readonly='readonly'/>"
						+"</td><td><input type='text' id='"+d.returngoodsname+i+"' name='returngoodsname' value='"+d.returngoodsname+"' readonly='readonly'/>"+
						"</td><td><input type='text' id='"+d.returngoodsmodel+i+"' name='returngoodsmodel' value='"+d.returngoodsmodel+"' readonly='readonly'/>"+
						"</td><td><input type='text' id='"+d.returngoodscolor+i+"' name='returngoodscolor' value='"+d.returngoodscolor+"' readonly='readonly'/>"+
						"</td><td><input type='text' id='"+d.returngoodsfactory+i+"' name='returngoodsfactory' value='"+d.returngoodsfactory+"' readonly='readonly'/>"+
						"</td><td><input type='text' id='"+d.returngoodsmessage+i+"' name='returngoodsmessage' value='"+d.returngoodsmessage+"' readonly='readonly'/>"+
						"</td><td><textarea name='textarea'></textarea></td><td>"+"<button  onclick='del("+i+")'>删除</button>"+"</td></tr>"
				)
			})
			
			$('#mym').modal('hide')
		}
		
		
		function save2() {
			var msg = $("#af").serialize();
			var params = decodeURIComponent(msg,true);
			params = encodeURI(encodeURI(params));
			var json = "{";
			var msg2 = msg.split("&");   //先以“&”符号进行分割，得到一个key=value形式的数组
			var t = false;
			for(var i = 0; i<msg2.length; i++){
			  var msg3 = msg2[i].split("=");  //再以“=”进行分割，得到key，value形式的数组
			  for(var j = 0; j<msg3.length; j++){
			    json+="\""+msg3[j]+"\"";
			    if(j+1 != msg3.length){
			      json+=":";
			    }
			    if(t){
			      json+="}";
			      if(i+1 != msg2.length){  //表示是否到了当前行的最后一列
			        json+=",{";
			      }
			      t=false;
			    }
			    if(msg3[j] == "remark"){  //这里的“canshu5”是你的表格的最后一列的input标签的name值，表示是否到了当前行的最后一个input
			      t = true;
			    }
			  }
			  if(!msg2[i].match("remark")){  //同上
			    json+=",";
			  }
			           
			}
			
			$.post("test",{"test":json},function(data){
				},"text")
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
			<span style="color: red;">返厂出入库管理返厂出入库管理-->添加返厂出库单</span>
			<br />
			<br />
			<button style="background-color: #66CCFF ;" type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-lg">选择商品</button>
			<br />
			<form id="af">
			<table id="bao" border="1">
			<tr>
				<th>商品串码</th>
				<th>商品品牌</th>
				<th>商品名称</th>
				<th>商品型号</th>
				<th>商品颜色</th>
				<th>商品供应商</th>
				<th>商品跟踪信息</th>
				<th>返厂配置</th>
				<th>操作</th>
			</tr>
		</table>
		
			<br />
			<table style="border: 1px solid #66CCFF;">
				<tr>
					<td>返厂地点:</td>
					<td><input type="text" name="location"/> </td>
				</tr>
				<tr>
					<td>返厂原因:</td>
					<td><textarea name="area"></textarea> </td>
				</tr>
				<tr>
					<td>备注:</td>
					<td><textarea name="remark"></textarea></td>
				</tr>
			</table>
			</form>
			<button type="button" class="btn btn-primary btn-sm" style="background-color:#66CCFF ;" onclick="save2()">保存添加</button>
		</div>
		
		
		




</div>

				<div class="layui-footer">
					<!-- 底部固定区域 -->
					© layui.com - 底部固定区域
				</div>
			</div></div>

		
		
		<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" id="mym">
  <div class="modal-dialog modal-lg" role="document" style="width: 1000px">
    <div class="modal-content">
      
      
      
      <br>
		商品串号:<input type="text" id="gimei">
		商品名称:<input type="text" id="gname">
		商品型号:<input type="text" id="gmodel">
		商品颜色:<select id="gcolor">
			<option value="">请选择</option>
			<option value="黑色">黑色</option>
			<option value="白色">白色</option>
		</select>
		商品供应商:<select id="gfactory">
			<option value="">请选择</option>
			<option value="三星">三星</option>
			<option value="LG">LG</option>
			<option value="philips">philips</option>
		</select>
	 	<button id="find" type="button" class="btn btn-default" onclick="find()">
                <span class="glyphicon glyphicon-search" aria-hidden="true"></span>搜索
        </button>
        <table id="tb_departments"></table>
       
      
      
      
      
      <button type="button" class="btn btn-primary btn-sm" onclick="save1()">保存</button>
  		<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
    </div>
  </div>
</div>
	</body>
</html>