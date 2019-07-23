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
</head>
<body>
	
		
	  <div class="container-fluit">
	  	
	  	<div class="row ">
	    <div class="col alert alert-primary m-auto" role="alert" style="text-align: center;">产品查询</div>
	    <div class="col-10"></div>
	  </div>
	  	 
  	  <div style="border: 1px solid black;"><!--加外边框-->
  	  
  	  <p class="text-danger">商品与赠品管理-->商品管理-->产品查询列表</p>
  	   <hr style=" height:5px;border:none;border-top:1px dotted #987cb9;" /><!-- 分割线 -->
  	  
	  <div class="row">
	    <div class="col">
	      		<p class="card-text">存货档案编码:<input type="text" /></p>
	    </div>
	    <div class="col">
	      <p class="card-text">产品型号:<input type="text" /></p>
	    </div>
	  </div>
	  <br/>
	  <div class="row" >
	    
	    <div style="display: inline-block;">
	    <div class="col" >
	      <p class="card-text"  >
			  基础库-颜色:
		　　<select id="selectSM" >
		　　　　<option>全部</option>
		　　</select>
		  </p>
		  </div>
	    </div>
	    <div class="col"></div>
	    <div style="display: inline-block;">
	    <div class="col" >
	      <p class="card-text"  >
			 产品品牌:
		　　<select id="selectSM" >
		　　　　<option>全部</option>
		　　</select>
		  </p>
		  </div>
	    </div>
	    <div class="col"></div>
	    <div style="display: inline-block;">
	    <div class="col" >
	      <p class="card-text"  >
			 产品分类:
		　　<select id="selectSM" >
		　　　　<option>全部</option>
		　　</select>
		  </p>
		  </div>
	    </div>
	    &nbsp;&nbsp;
	    <div class="col">
	      <button type="button" class="btn btn-primary">搜索</button>&nbsp;&nbsp;
	      <button type="button" class="btn btn-primary">导入</button>
	    </div>
	  </div>
	  <hr style="border:1 dashed #987cb9"  color="#987cb9" size=1> 
	  
	  <table id="goodslisttable" >
		
	   </table>
	  
	  </div>
	  
	</div>
	
</body>
</html>