<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/jquery/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/bootstrap.css">
<style>
			*{
				padding: 0px;
				margin: 0px;
			}
			
			#TY{
				position:absolute;
				left: 28px;
				top: 23px;
			}
			#t1{
				position:absolute;
				left: 100px;
				top: 20px;
				font-size: 20px;
				font-weight: bold;
			}
			#t2{
				position:absolute;
				left: 100px;
				top: 39px;
				font-size:5px;
			}
			ul{
				list-style:none;
				display:inline-block;
				float:left;
			}
			li{
				width:120px;
				height:25px;
				background-color:white;
				border: 1px solid black;
				
			}
			#menu{
				position:absolute;
				left: 100px;
				top: 59px;
			}
</style>
</head>
<body>
   <div class="main" >
			<div class="top"><input type="image" src="${pageContext.request.contextPath}/image/u0.png">
			<input id="TY" type="image" src="${pageContext.request.contextPath}//image/u360.GIF">
			<a id="t1" >电子商务进销系统</a>
			<a id="t2" >Electronic business invoicing system</a>
				<div id="menu">
					<ul>
						
				        <li  onmouseover="show(this)" onmouseout="hide(this)"><a herf="#">商品与赠品管理</a>
				        	<ul>
				        		<li><a herf="#">商品管理</a></li>
				        		<li><a herf="#">赠品管理</a></li>	
				        		<li><a herf="#">活动商品管理</a></li>
				        		
				        		
				        	
				        	</ul>
				        </li>
				        
					</ul>
					<ul>
						<li  onmouseover="show(this)" onmouseout="hide(this)"><a herf="#">B2C销售管理</a>
				        	<ul>
				        		<li ><a herf="#">B2C销售订单管理</a></li>
				        		<li ><a herf="#">对账管理</a></li>	
				        		<li ><a herf="#">卡号套餐管理 </a></li>
				        		
				        		
				        	
				        	</ul>
				        </li>
					</ul>
					<ul>
						<li  onmouseover="show(this)" onmouseout="hide(this)"><a herf="#">库存管理</a>
				        	<ul>
				        		<li ><a herf="#">入库管理</a></li>
				        		<li ><a herf="#">出库管理</a></li>	
				        		<li ><a herf="#">移库管理 </a></li>
				        		<li ><a herf="#">库存订单 </a></li>
				        		<li ><a herf="#">入出库单审核 </a></li>
				        		
				        	
				        	</ul>
				        </li>
					</ul>
					
					<ul>
						<li  onmouseover="show(this)" onmouseout="hide(this)"><a herf="#">售后管理</a>
				        	<ul>
				        		<li ><a herf="#">返厂出入库管理</a></li>
				        		<li ><a herf="#">退换货申请管理</a></li>	
				        		<li ><a herf="#">申请管理 </a></li>
				        	</ul>
				        </li>
					</ul>
					<ul>
						<li  onmouseover="show(this)" onmouseout="hide(this)"><a herf="#">系统管理</a>
				        	<ul>
				        		<li ><a herf="#">用户管理</a></li>
				        		<li ><a herf="#">角色管理</a></li>	
				        		<li ><a herf="#">权限管理</a></li>
				        		<li ><a herf="#">日志管理</a></li>
				        	</ul>
				        </li>
					</ul>
				</div>
			</div>
			
		</div>
		<script>
			function show(li){
				var ul=li.getElementsByTagName("ul")[0];
				ul.style.display="block";
			}
			function hide(li){
				var ul=li.getElementsByTagName("ul")[0];
				ul.style.display="none";
			}
		</script>
</body>
</html>