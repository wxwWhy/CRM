<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>权限管理</title>
    <link rel="stylesheet" href="${APP_PATH}/layui/css/layui.css" media="all">
    <script src="${APP_PATH}/layui/layui.js" type="text/javascript"></script>
    <script src="${APP_PATH}/jquery/jquery.min.js" type="text/javascript"></script>
    <style>
        /*分页条居中*/
        .layui-table-page {
            text-align: center
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">layui 后台布局</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="">控制台</a></li>
            <li class="layui-nav-item"><a href="">商品管理</a></li>
            <li class="layui-nav-item"><a href="">用户</a></li>
            <li class="layui-nav-item">
                <a href="javascript:;">其它系统</a>
                <dl class="layui-nav-child">
                    <dd><a href="">邮件管理</a></dd>
                    <dd><a href="">消息管理</a></dd>
                    <dd><a href="">授权管理</a></dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href=""><img src="//t.cn/RCzsdCq" class="layui-nav-img">${loginUser.uname}</a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>
            <%--左侧导航栏--%>
    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <%@include file="../common/menu.jsp"%>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <%--面包屑导航条--%>
        <div style="padding: 20px; background-color: #F2F2F2;">
            <div class="layui-row">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            <span class="layui-breadcrumb">
                                <a href="">首页</a>
                                <a href="">系统管理</a>
                                <a href="">权限管理</a>
                                <a><cite>权限详情</cite></a>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="padding: 20px; background-color: #F2F2F2;">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">权限详情</div>
                        <div class="layui-card-body">
                            <div style="padding: 15px;">
                                <table class="layui-hide" id="table_permission" lay-filter="permission"></table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © layui.com - 底部固定区域
    </div>
</div>
<<script type="text/html" id="topBar">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn" lay-event="add"><i class="layui-icon layui-icon-add-1"></i>添加</button>
        <button class="layui-btn layui-btn-danger layui-btn" lay-event="deleteAll"><i class="layui-icon layui-icon-delete"></i>批量删除</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <div class="layui-btn-container">
        <button class="layui-btn layui-btn-danger layui-btn-sm" lay-event="delete"><i
                class="layui-icon layui-icon-delete"></i>删除
        </button>
        <button class="layui-btn layui-btn-warm layui-btn-sm" lay-event="update"><i
                class="layui-icon layui-icon-edit"></i>修改
        </button>
    </div>
</script>
<script>
    layui.use(['table','element','layer','laypage','form'], function(){
        var table = layui.table;
        var element = layui.element;
        table.render({
            elem: '#table_permission'
            ,url:'${APP_PATH}/permission/list'
            ,toolbar:'#topBar'
            , defaultToolbar: []
            ,cols: [[
                {type:'numbers',title:'序号'}
                ,{checkbox:true,align: 'center'}
                ,{field:'permissionName', title:'权限名称',align: 'center' }
                ,{field:'roleName', title:'角色名称',align: 'center' ,templet:function (d) {return roleName=d.role.roleName}}
                ,{field:'permissionDescription', title:'权限描述',align: 'center' }
                ,{field:'permissionStatus',title:'权限状态', align: 'center' ,templet: function (d) {
                        return d.roleStatus === 1 ? '有效' : '无效';}}
                ,{fixed: 'right', title: '操作', width: 200, align: 'center', toolbar: '#barDemo'}
            ]]
            ,page: true
            ,id:'reload'
            ,request:{
                limitName:'pageSize'
            }
            ,response:{
                statusCode: 100 //规定成功的状态码，默认：0
            }
            ,parseData: function(res){ //将原始数据解析成 table 组件所规定的数据
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "count": res.extend.pageInfo.total, //解析数据长度
                    "data": res.extend.pageInfo.list //解析数据列表
                };
            }
        });

        //头部增加 批量删除事件监听
        table.on('toolbar(permission)', function (obj) {
            console.log(obj);
            switch (obj.event) {
                case 'add':
                    //重置表单
                    reset_form("#permission_add");
                    //添加权限设定
                    // getPermission("#add_permission_select");
                    //打开弹窗
                    layer.open({
                        type:1,
                        title:'权限新增',
                        shadeClose:false,
                        shade:0.8,
                        skin: 'layui-layer-molv',//样式类名
                        area: ['40%', '70%'],
                        btn: ['确定', '取消'],
                        content: $("#permission_add_form"),//DOM对象ID
                        yes: function (index) {
                            $.ajax({
                                url: '${APP_PATH}/permission/add',
                                type:'POST',
                                data: $("#permission_add").serialize(),
                                success: function (result) {
                                    if (result.code === 100) {
                                        layer.close(index);
                                        layer.msg('添加成功!', {
                                            icon: 1,
                                            time: 1000
                                        }, function () {
                                            //更新表格数据
                                            table.reload('reload', {page: {curr: obj.config.page.pages + 1}});

                                        });
                                    } else {
                                        layer.close(index);
                                        layer.msg('删除失败!', {
                                            icon:2,
                                            time:1000
                                        }, function () {

                                        });
                                    }

                                }
                            });
                        }
                    });
                    break;
                case 'deleteAll':
                    var data = table.checkStatus(obj.config.id).data;
                    if (data.length === 0) {
                        layer.msg('没有选择删除对象!', {
                            icon: 5,
                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                        }, function () {
                            //do something......

                        });
                    } else {
                        var permissionIds = "";
                        var permissionNames = "";
                        $.each(data, function (i, d) {
                            permissionIds += d.permissionId + '-';
                            permissionNames += d.permissionName + ',';
                        });
                        permissionNames = permissionNames.substring(0, permissionNames.length - 1);
                        permissionIds = permissionIds.substring(0, permissionIds.length - 1);

                        //询问框
                        layer.confirm('真的删除' + permissionNames + '么？', {
                            icon: 3,
                            btn: ['确定', '取消'] //按钮
                        }, function () {
                            layui.jquery.ajax({
                                url: '${APP_PATH}/permission/delete/' + permissionIds,
                                type: 'DELETE',
                                success: function (data) {
                                    if (data.code === 100) {
                                        layer.msg('删除成功!', {
                                            icon: 1,
                                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                        }, function () {
                                            //更新表格数据
                                            table.reload('reload', {page: {curr: obj.config.page.curr}});

                                        });
                                    } else if (data.code === 200) {
                                        layer.msg('删除失败!', {
                                            icon: 2,
                                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
                                        }, function () {
                                            //do something......
                                        });
                                    }
                                }
                            });

                        });
                    }
                    break;
            }
        });

        //监听行内工具栏
        table.on('tool(permission)', function (obj) {
            var data = obj.data;
            var layEvent=obj.event;
            var tr = obj.tr;
            console.log(data);
            if (layEvent === 'delete') {
                layer.confirm('真的删除' + data.permissionName + '么?', function (index) {
                    obj.del();
                    layer.close(index);

                    $.ajax({
                        url: '${APP_PATH}/permission/delete/' + data.permissionId,
                        type:'DELETE',
                        success: function (result) {
                            if (result.code === 100) {
                                layer.msg('删除成功!', {
                                    icon: 6,
                                    time: 1000
                                }, function () {
                                    table.reload('reload', {page: {curr: obj.curr}});
                                });
                            } else {
                                layer.msg('删除失败!', {
                                    icon: 5,
                                    time: 1000
                                }, function () {


                                });
                            }
                        }
                    });
                });
            }
            if (layEvent === 'update') {
                reset_form("#permission_edit");
                // getDepts("#edit_deptId_select");
                // getPermission("#edit_permission_select");
                $.ajax({
                    url: '${APP_PATH}/permission/selectOnePermission',
                    data:{permissionId:data.permissionId},
                    type:'GET',
                    success:function (result) {
                        $("#edit_permisionName").val(result[0].permissionName);
                        $("#edit_permissionStatus_select").val([result[0].permissionStatus]);
                        $("#edit_permissionDescription").val(result[0].permissionDescription);
                        $("#edit_deptId_select").val([result[0].department.deptId]);
                        $("#edit_permission_select").val([result[0].permission.permissionId]);
                        layui.form.render();
                    }
                });
                layer.open({
                    type: 1,
                    title: '角色信息-修改',
                    shadeClose: false,
                    shade: 0.8,
                    skin: 'layui-layer-warm',//样式类名
                    area: ['40%', '70%'],
                    btn: ['更新', '取消'],
                    content: $("#permission_edit_form"),//DOM对象ID
                    yes: function (index) {
                        $.ajax({
                            url:'${APP_PATH}/permission/update/'+data.permissionId,
                            type:'PUT',
                            data:$("#permission_edit").serialize(),
                            success:function (result) {
                                if (result.code === 100) {
                                    //关闭弹出层
                                    layer.close(index);
                                    //提示消息
                                    layer.msg('更新成功!', {icon: 1, time: 1000}, function () {
                                        //更新表格数据
                                        table.reload('reload', {page: {curr: obj.curr}});
                                    });
                                } else {
                                    //关闭弹出层
                                    layer.close(index);
                                    //提示消息
                                    layer.msg('更新失败!', {icon: 2, time: 1000}, function () {
                                        //更新表格数据
                                        table.reload('reload', {page: {curr: obj.curr}});
                                    });
                                }
                            }
                        })

                    }
                });

            }
        });







        //监听行单击事件（单击事件为：rowDouble）
        table.on('row(test)', function(obj){
            var data = obj.data;

            layer.alert(JSON.stringify(data), {
                title: '当前行数据：'
            });

            //标注选中样式
            obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
        });

    });
</script>
<script>
    //表单重置
    function reset_form(ele) {
        $(ele)[0].reset();
    }

</script>
<%--新增--%>
<div style="padding-top:25px;display: none;" id="permission_add_form">
    <form class="layui-form" layui-filter="permission_add_form" id="permission_add">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">权限名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="permissionName" lay-verify="required" class="layui-input">
                </div>
            </div>
            <%--<div class="layui-inline">--%>
                <%--<label class="layui-form-label">角色编码</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<input type="text" name="roleEncoding" lay-verify="required" class="layui-input">--%>
                <%--</div>--%>
            <%--</div>--%>

        </div>

        <div class="layui-form-item">

            <div class="layui-inline">
                <label class="layui-form-label">权限描述</label>
                <div class="layui-input-inline">
                    <input type="text" name="permissionDescription" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">可执行操作</label>
                <div class="layui-input-inline">
                    <select name="permissionStatus" lay-verify="required" id="add_permissionStatus_select"></select>
                </div>
            </div>

        </div>
    </form>
</div>


<div style="padding-top:25px;display: none;" id="permission_edit_form">
    <form class="layui-form" layui-filter="permission_add_form" id="permission_edit">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">权限名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="roleName" lay-verify="required" class="layui-input" id="edit_permissionName">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">角色名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="roleName" lay-verify="required" class="layui-input" id="edit_roleName">
                </div>
            </div>

        </div>

        <div class="layui-form-item">

                    <div class="layui-inline">
                        <label class="layui-form-label">权限描述</label>
                        <div class="layui-input-inline">
                    <input type="text" name="permissionDescription" lay-verify="required" autocomplete="off" class="layui-input" id="edit_permissionDescription">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">可执行操作</label>
                <div class="layui-input-inline">
                    <select name="" lay-verify="required" id="edit_Status_select">
                    </select>
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">权限状态</label>
                <div class="layui-input-inline">
                    <select name="permissionStatus" lay-verify="required" id="edit_permissionStatus_select">
                        <option value="0">无效</option>
                        <option value="1">有效</option>
                    </select>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>
