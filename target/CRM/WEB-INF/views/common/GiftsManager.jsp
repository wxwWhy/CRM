<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="jquery/jquery.min.js"></script>
<script src="bootstrap/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="bootstrap/bootstrap.css">
		
		
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
			   height:850px;
			   
			}
			#CZ{
			   width:250px;
			}
</style>
<script type="text/javascript">
var pageNum;
var num=1;
var id;
var name;
var pwd;
var selectRow = [];
$.function({
	queryPerm(num);
})
function queryUser(num){
    $.post("${pageContext.request.contextPath}/user/all?pageNum="+num,"",function(data){
  		
        var listuser = data.list;
        pageNum =data.pageNum;
        $("#tb").html("");
		$.each(listuser,function(i,d){
			$("#tb").append("<tr><td>"+d.uid+"</td><td>"+d.uname+"</td><td>"+d.upwd+"</td></tr>")
		})
		$("#tb tr").on("click",function(i,d){
	       			$("#tb tr").removeClass("info");
	       			$(this).addClass("info");
	       	     selectRow = [];
	     	    $(this).find("td").each(function(i){
	     	       	   selectRow.push($(this).html());
	     	       				
	     	      })
		})
		 
		
	 },"json");
}
</script>
</head>
<body>
    <div class="GiftsManager">
			<div class="row" style="background-color: white;">
				<div id="top" class="col-md-12">
				<input type="image" src="${pageContext.request.contextPath}/image/u43.png">	
			    <a id="t1">赠品管理</a>
			    </div>
			    <div id="box">
			    <a>商品与赠品管理-->赠品管理-->赠品管理列表</a></br>  
                <input type="image" src="${pageContext.request.contextPath }/image/u342.png">
                </br>
			    <a>赠品型号：</a><input type="text">&nbsp&nbsp
			    <a>赠品品牌：</a>
			    <select>
					<option>360</option>
					<option>iPhone</option>
					<option>三星</option>
				</select>
				<a>赠品颜色：</a>
				<select>
					<option>金色</option>
					<option>黑色</option>
					<option>白色</option>
				</select>&nbsp&nbsp&nbsp&nbsp
				<input type="button" class="btn btn-fault" value="新增赠品">
				</br>
				<a>赠品名称：</a><input type="text">&nbsp&nbsp
				<a>赠品类型：</a>
				<select>
				    <option>全部</option>
					<option>iPhone</option>
					<option>360</option>
					<option>三星</option>
				</select>
				</br>
				<input type="image" src="${pageContext.request.contextPath }/image/u343.png">
				</br>
				 <table class="table table-striped table-bordered table-hover">
				      <thead>
				        <tr>
				          <th>序号</th>
				          <th><input type="checkbox"/></th>
				          <th>赠品名称</th>
				          <th>赠品类型</th>
				          <th>最低库存量</th>
				          <th>赠品单价</th>
				          <th>采购成本</th>
				          <th>赠品状态</th>
				          <th id="CZ">操作</th>
				        </tr>
				      </thead>
				      <tbody id="tb">
				      
				      </tbody>
				    </table>
			    </div>
			</div>
			
    </div>
</body>
</html>