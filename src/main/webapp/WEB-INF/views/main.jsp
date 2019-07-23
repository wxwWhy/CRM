<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <%--<jsp:forward page="user/userManager.jsp"/>--%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>主页</title>
    <link rel="stylesheet" href="${APP_PATH}/layui/css/layui.css" media="all">
    <script src="${APP_PATH}/layui/layui.js"></script>

</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <%@include file="common/topUi.jsp" %>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll" id="admin-navbar-side">
            <%@include file="common/menu.jsp" %>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <h1>电子商务进销存</h1>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
</body>
</html>

