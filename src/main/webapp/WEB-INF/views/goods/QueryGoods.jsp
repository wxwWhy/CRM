<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="brandCSS.html"%>
<style type="text/css">
           *{
				padding: 0px;
				margin: 0px;
			}
			#t1{
			   position:absolute;
			   left:20px;
			   top:5px;
			}
			#box{
			   border:1px solid black;
			   
			   
			}
			#CZ{
			   width:350px;
			   
			}
			#ss{
			  margin:5px 5px 5px 85px;
			}
			#btnQuery{
			  background-color:#A6FFFF;
			  margin:5px 5px 5px 5px;
			}
			#xh{
			  color:red;
			}
</style>
<script type="text/javascript">
var pageNum;
var num=1;
var id;
var type;
var number;
var price;
var cost;
var color;
var addGoods;
var newprice;
$(function(){
	queryGifts(num);
	  $("#btnprov").on("click",function(){
			num=num-1;
			queryGifts(num);
	  });
		//为下一页按钮绑定事件
	  $("#btnnext").on("click",function(){
			num=num+1;
			queryGifts(num);
	  });
		
	  $("#tb").on("click",".Querybtn",function(event){
			var sid=event.currentTarget.value;
			var url1="${pageContext.request.contextPath}/gtogmanager/newGoods?sid="+sid;
		    $.get(url1,function(data){
		    	var abc=eval(data);
		    	console.log(abc);
		    	$("#sid").val(sid);
		    	$("#sname").val(abc.sname);
		    	$("#stype").val(abc.stype);
		    	$("#sminrepertory").val(abc.sminrepertory);
		    	$("#sshoppingprice").val(abc.sshoppingprice);
		    	$("#smarketprice").val(abc.smarketprice);
		    	$("#code").val(abc.code);
		    	$("#addGoods").val();
		    	$("#newprice").val();
		    })
		 	
		})
		$("#btnSaveEdit2").on("click",function(){
			$("#myModel1").modal("hide");
			sid = $("#sid").val();
			sname = $("#sname").val();
			stype = $("#stype").val();
			sminrepertory = $("#sminrepertory").val();
			sshoppingprice = $("#sshoppingprice").val();
			smarketprice = $("#smarketprice").val();
			code = $("#code").val();
			addGoods = $("#addGoods").val();
			newprice = $("#newprice").val();
			
			AddGtoG(sid,sname,stype,sminrepertory,sshoppingprice,smarketprice,code,addGoods,newprice);
			
		});
	 
})

function queryGifts(num){
    $.post("${pageContext.request.contextPath}/gtogmanager/allgoods?pageNum="+num,"",function(data){
		
     var listgifts = data.list;
     
     pageNum =data.pageNum;
     $("#tb").html("");
       
		$.each(listgifts,function(i,d){
			
			
			$("#tb").append("<tr><td>"+d.sid+"</td><td>"+d.sname+"</td><td>"+d.stype+"</td><td>"+d.sminrepertory+"</td><td>"+d.sshoppingprice+"</td><td>"+d.smarketprice+"</td><td>"+d.code+"</td><td>"
					+"<button id='btnQuery' class='btn btn-fault Querybtn'  data-toggle='modal'  data-target='#myModel1'  value='"+d.sid+"'>选择"
			        +"</td></tr>")
		})	
		
	 },"json"); 
}

function AddGtoG(sid,sname,stype,sminrepertory,sshoppingprice,smarketprice,code,addGoods,newprice){
	$.post("${pageContext.request.contextPath}/gtogmanager/add?sid="+sid+"&sname="+sname+"&stype="+stype+"&sminrepertory="+sminrepertory+"&sshoppingprice="+sshoppingprice+"&code="+code+"&addGoods="+addGoods+"&newprice="+newprice,"",function(data){
		location.href = "${pageContext.request.contextPath}/gtogmanager/go";
	},"text");
	
}

</script>
</head>
<body class="layui-layout-body">
  
     <%--品牌修改模态框--%>
<div class="modal fade" id="myModel1" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="update_h5">修改商品信息</h5><a id="xh">(编号请与序号保持一致)</a>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
           
            <div class="modal-body">
                <form class="form-horizontal" method="post" id="brand_update_form">
                    <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">序号</span>
                        </div>
                        
                        <input type="text" name="brand_name" id="sid" class="form-control" readonly>
                        <div class="invalid-feedback"></div>
                    </div>
                    <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">编号</span>
                        </div>
                        
                        <input type="text" name="brand_name" id="code" class="form-control"  required>
                        <div class="invalid-feedback"></div>
                    </div>
                    
                    <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">赠品名称</span>
                        </div>
                        <input type="text" name="brand_name" id="sname" class="form-control" required>
                        <div class="invalid-feedback"></div>
                    </div>
                    
                    <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">赠品类型</span>
                        </div>
                        <input type="text" name="brand_url" id="stype" class="form-control" required>
                        <div class="invalid-feedback"></div>
                    </div>
                    
                    
                    <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">赠品单价</span>
                        </div>
                        <input type="text" name="brand_describe" id="sshoppingprice" class="form-control" required>
                        <div class="invalid-feedback"></div>
                    </div>
                    <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">采购成本</span>
                        </div>
                        <input type="text" name="brand_describe" id="smarketprice" class="form-control" required>
                        <div class="invalid-feedback"></div>
                    </div>
                      
                    <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">赠品数量</span>
                        </div>
                        <input type="text" name="brand_describe" id="sminrepertory" class="form-control" required>
                        <div class="invalid-feedback"></div>
                    </div>
                    
                    <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">商品入库数</span>
                        </div>
                        <input type="text" name="brand_describe" id="addGoods" class="form-control" required>
                        <div class="invalid-feedback"></div>
                    </div>
                     <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">天翼价</span>
                        </div>
                        <input type="text" name="brand_describe" id="newprice" class="form-control" required>
                        <div class="invalid-feedback"></div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="btnSaveEdit2">保存</button>
            </div>
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
       <div class="container">
			<div class="row" style="background-color: white;">
				<div id="top" class="col-md-12">
				<input type="image" src="${pageContext.request.contextPath}/image/u431.png">	
			    <a id="t1">商品转赠品管理</a>
			    </div>
			    <div id="box">
			    <a>商品与赠品管理-->赠品管理-->赠品管理列表</a></br>  
                <input type="image" src="${pageContext.request.contextPath }/image/u342.png">
                </br>
			    
				</br>
				<input type="image" src="${pageContext.request.contextPath }/image/u343.png">
				</br>
				 <table class="table table-striped table-bordered table-hover">
				      <thead>
				        <tr>
				          <th>序号</th>
				          
				          <th>赠品名称</th>
				          <th>赠品类型</th>
				          <th>赠品单价</th>
				          <th>赠品品牌</th>
				          <th>赠品数量</th>
				          <th>赠品编号</th>
				          <th id="CZ">操作</th>
				        </tr>
				      </thead>
				      <tbody id="tb">
				         
				      </tbody>
				      
				    </table>
				    <input id="btnprov" type="button" class="btn btn-fault"  value="上一页">
                    <input id="btnnext" type="button" class="btn btn-fault"  value="下一页">
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