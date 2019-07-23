<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>登陆</title>
    <script src="${APP_PATH}/jquery/jquery.min.js"></script>
    <script src="${APP_PATH}/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="${APP_PATH}/layer/layer.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/bootstrap/bootstrap.css">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="${APP_PATH}/css/login.css">
    <style>
        /*web background*/
        .container {
            display: table;
            height: 100%;
        }

        .row {
            display: table-cell;
            vertical-align: middle;
        }

        /* centered columns styles */
        .row-centered {
            text-align: center;
        }

        .col-centered {
            display: inline-block;
            float: none;
            text-align: left;
            margin-right: -4px;
        }
    </style>
</head>
<body>
<nav class="navbar fixed-top navbar-light bg-dark text-white">
    <a class="navbar-brand">CRM电子商务进销存</a>
</nav>
<div class="container">

    <div class="row row-centered">
        <div class="well col-md-6 col-centered">
            <form id="loginForm" class="form-signin" role="form">
                <h2 class="form-signin-heading">用户登录</h2>
                <div class="input-group form-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-user-o" aria-hidden="true"></i></span>
                    </div>
                    <input type="text" class="form-control" id="loginName" name="loginName" placeholder="请输入登录账号"
                           autofocus>
                </div>
                <div class="input-group form-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-key" aria-hidden="true"></i></span>
                    </div>
                    <input type="text" class="form-control" id="password" name="password" placeholder="请输入账号密码">
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> 记住我
                    </label>
                    <br>
                    <label>
                        忘记密码
                    </label>
                    <label style="float:right">
                        <a href="reg">我要注册</a>
                    </label>
                </div>
                <input type="button" class="btn btn-lg btn-success btn-block" onclick="dologin()" name="btnsubmit" value="登录">
            </form>

        </div>
    </div>

</div>
<script>
    function dologin() {
        // 非空校验
        var loginName = $("#loginName").val();
        // 表单元素的value取值不会为null, 取值是空字符串
        if (loginName == "") {
            layer.msg("用户登录账号不能为空，请输入", {time: 2000, icon: 5, shift: 6}, function () {

            });
            return;
        }

        var password = $("#password").val();
        if (password == "") {
            layer.msg("用户登录密码不能为空，请输入", {time: 2000, icon: 5, shift: 6}, function () {

            });
            return;
        }

        // 提交表单
        // 使用AJAX提交数据
        var loadingIndex = null;
        $.ajax({
            type: "POST",
            url: "${APP_PATH}/login",
            data: $("#loginForm").serialize(),
            beforeSend: function () {
                loadingIndex = layer.msg('登录中', {icon: 16});
            },
            success: function (result) {
                console.log(result)
                layer.close(loadingIndex);
                if (result.code === 100) {
                    window.location.href = "main";
                } else {
                    layer.msg("用户登录账号或密码不正确，请重新输入", {time: 2000, icon: 5, shift: 6}, function () {

                    });
                }
            }
        });
    }
</script>
</body>
</html>