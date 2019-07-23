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
			   width:350
			   px;
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
			var id=event.currentTarget.value;
			var url1="${pageContext.request.contextPath}/gtog/newGifts?id="+id;
		    $.get(url1,function(data){
		    	var abc=eval(data);
		    	console.log(abc);
		    	$("#id").val(id);
		    	$("#gname").val(abc.gname);
		    	$("#type").val(abc.type);
		    	$("#number").val(abc.number);
		    	$("#price").val(abc.price);
		    	$("#cost").val(abc.cost);
		    	$("#color").val(abc.color);
		    	$("#code").val(abc.code);
		    	$("#addGoods").val();
		    	$("#newprice").val();
		    })
		 	
		})
		$("#btnSaveEdit2").on("click",function(){
			$("#myModel1").modal("hide");
			id = $("#id").val();
			gname = $("#gname").val();
			type = $("#type").val();
			number = $("#number").val();
			price = $("#price").val();
			cost = $("#cost").val();
			
			addgifts = $("#addGoods").val();
			newprice = $("#newprice").val();
			code=$("#code").val();
			AddGtoG(id,gname,type,number,price,cost,color,addgifts,newprice,code);
			
		});
	
})

function queryGifts(num){
    $.post("${pageContext.request.contextPath}/gtog/allgifts?pageNum="+num,"",function(data){
		
     var listgifts = data.list;
     
     pageNum =data.pageNum;
     $("#tb").html("");
       
		$.each(listgifts,function(i,d){
			
			
			$("#tb").append("<tr><td>"+d.id+"</td><td>"+d.gname+"</td><td>"+d.type+"</td><td>"+d.number+"</td><td>"+d.price+"</td><td>"+d.cost+"</td><td>"+d.color+"</td><td>"
					+"<button id='btnQuery' class='btn btn-fault Querybtn'  data-toggle='modal'  data-target='#myModel1'  value='"+d.id+"'>选择"
			        +"</td></tr>")
		})	
		
	 },"json"); 
}

function AddGtoG(id,gname,type,number,price,cost,color,addgifts,newprice,code){
	$.post("${pageContext.request.contextPath}/gtog/add?id="+id+"&gname="+gname+"&type="+type+"&number="+number+"&price="+price+"&cost="+cost+"&color="+color+"&addgifts="+addgifts+"&newprice="+newprice+"&code="+code,"",function(data){
		location.href = "${pageContext.request.contextPath}/gtog/go";
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
                <h5 class="modal-title" id="update_h5">修改赠品信息</h5><a id="xh">(编号请与序号保持一致)</a>
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
                        <input type="text" name="brand_name" id="id" class="form-control" readonly>
                        <div class="invalid-feedback"></div>
                    </div>
                    <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">编号</span>
                        </div>
                        
                        <input type="text" name="brand_name" id="code" class="form-control"   required>
                        <div class="invalid-feedback"></div>
                    </div>
                    
                    <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">赠品名称</span>
                        </div>
                        <input type="text" name="brand_name" id="gname" class="form-control" required>
                        <div class="invalid-feedback"></div>
                    </div>
                    
                    <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">赠品类型</span>
                        </div>
                        <input type="text" name="brand_url" id="type" class="form-control" required>
                        <div class="invalid-feedback"></div>
                    </div>
                    
                    
                    <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">赠品单价</span>
                        </div>
                        <input type="text" name="brand_describe" id="price" class="form-control" required>
                        <div class="invalid-feedback"></div>
                    </div>
                    <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">采购成本</span>
                        </div>
                        <input type="text" name="brand_describe" id="cost" class="form-control" required>
                        <div class="invalid-feedback"></div>
                    </div>
                      
                    <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">赠品数量</span>
                        </div>
                        <input type="text" name="brand_describe" id="number" class="form-control" required>
                        <div class="invalid-feedback"></div>
                    </div>
                     <div class="input-group form-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">赠品颜色</span>
                        </div>
                        <input type="text" name="brand_describe" id="color" class="form-control" required>
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
			    <a id="t1">赠品转商品管理</a>
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
				          <th>赠品颜色</th>
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