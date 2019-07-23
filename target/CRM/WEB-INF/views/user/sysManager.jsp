<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${APP_PATH}/jquery/jquery.min.js"></script>
    <%--<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.js"></script>--%>
    <script src="${APP_PATH}/bootstrap/bootstrap.bundle.min.js"></script>
    <script src="${APP_PATH}/bootstraptable/bootstrap-table.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="${APP_PATH}/bootstraptable/bootstrap-table.css">
    <script src="${APP_PATH}/layer/layer.js"></script>
    <%--<script src="${APP_PATH}/ztree/zTreeStyle.css"></script>--%>
    <script src="${APP_PATH}/ztree/jquery.ztree.all-3.5.min.js"></script>
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <script src="${APP_PATH}/bootstraptable/bootstrap-table-zh-CN.js"></script>

    <title>系统管理</title>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-2">
            <div class="card">
                <div class="card-header">
                    系统管理
                </div>
                <div class="card-body">
                    <%@include file="../common/menu.jsp"%>
                </div>
            </div>
        </div>
        <div class="col-md-10">
            <table id="table">

            </table>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
    var setting = {
        data:{
            simpleData: {
                enable: true,
                idKey: "permissionId",
                pIdKey: "pid",
                rootPId: 0
            },
            key: {
                name: "permissionName"

            }
        }
    }
    $(function () {
        $.get("${APP_PATH}/permission/all", "", function (data) {
            $.fn.zTree.init($("#permissionTree"), setting,data);
        }, "json");
    });
</script>
</body>
</html>
