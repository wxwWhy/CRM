<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>角色管理</title>
    <link rel="stylesheet" href="${APP_PATH}/layui/css/layui.css" media="all">
    <script src="${APP_PATH}/layui/layui.js" type="text/javascript"></script>
    <script src="${APP_PATH}/jquery/jquery.min.js" type="text/javascript"></script>
    <link rel="stylesheet" href="${APP_PATH}/layui/layui_ext/dtree/dtree.css">
    <link rel="stylesheet" href="${APP_PATH}/layui/layui_ext/dtree/font/dtreefont.css">
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
        <div class="layui-logo">角色管理</div>
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

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <%@include file="../common/menu.jsp"%>
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
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
                                <a href="">角色管理</a>
                                <a><cite>角色详情</cite></a>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>


                            <%--数据表格--%>
        <div style="padding: 20px; background-color: #F2F2F2;">
            <div class="layui-row layui-col-space15">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">角色详情</div>
                        <div class="layui-card-body">

                            <div>
                                <div class="demoTable">
                                    <form class="layui-form" id="search_cnod">
                                        <div class="layui-form-item">
                                            <div class="layui-input-inline">
                                                <select name="deptId" id="search_deptName">
                                                    <option value="">所有部门</option>
                                                </select>
                                            </div>
                                            <div class="layui-input-inline">
                                                <select name="userStatus" id="search_roleStatus">
                                                    <option value="">所有角色状态</option>
                                                    <option value="1">有效</option>
                                                    <option value="2">无效</option>
                                                </select>
                                            </div>
                                            <div class="layui-inline">
                                                <input class="layui-input" name="roleName" id="search_roleName" autocomplete="off" placeholder="角色名">
                                            </div>
                                            <div class="layui-inline">
                                                <input class="layui-input" name="roleDescription" id="search_roleDescription" autocomplete="off" placeholder="角色描述">
                                            </div>
                                            <div class="layui-inline">
                                                <div class="layui-btn" lay-submit="" lay-filter="search">搜索</div>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <table class="layui-hide" id="table_role" lay-data="{id: 'id'}" lay-filter="role"></table>
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
<script type="text/html" id="topBar">
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
    layui.use(['table','laypage','element','form','layer','util','laytpl'], function(){
        var table = layui.table;
        var laypage = layui.laypage;
        var element = layui.element;
        var layer = layui.layer;
        var eleTree=layui.eleTree;
        //方法级渲染
        table.render({
            elem: '#table_role'
            ,url: '${APP_PATH}/role/list'
            ,toolbar:'#topBar'
            , defaultToolbar: []
            ,id:'reload'
            ,cols: [[
                {type:'numbers',title:'序号'}
                ,{checkbox: true,title:'选择角色'}
                ,{field:'roleEncoding', title: '角色编码'}
                ,{field:'roleName', title: '角色名称'}
                ,{field:'roleDescription', title: '角色描述'}
                ,{field:'roleStatus', title: '角色状态', templet: function (d) {
                        return d.roleStatus === 1 ? '有效' : '无效';}}
                ,{field:'deptName', title: '角色部门',templet: function (d) {
                        return deptName = d.department.deptName;}}
                ,{field:'permissionName', title: '权限设定',templet:function (d) {return permissionName=d.permission.permissionName  }}
                ,{fixed: 'right', title: '操作', width: 200, align: 'center', toolbar: '#barDemo'}

            ]]
            ,page: {layout:['limit', 'count', 'prev', 'page', 'next', 'skip'], curr:1,groups:1}
            ,request:{
                limitName:'pageSize'
            }
            ,response:{
                // statusName: 'code' //规定数据状态的字段名称，默认：code
                statusCode: 100 //规定成功的状态码，默认：0
                // ,msgName: 'msg' //规定状态信息的字段名称，默认：msg
                // ,countName: 'total' //规定数据总数的字段名称，默认：count
                // ,dataName: 'list' //规定数据列表的字段名称，默认：data
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
        table.on('toolbar(role)', function (obj) {
            console.log(obj);
            switch (obj.event) {
                case 'add':
                    //重置表单
                    reset_form("#role_add");
                    //添加部门信息到下拉列表
                    getDepts("#add_deptId_select");
                    //添加权限设定
                    getPermission("#add_permission_select");
                    //打开弹窗
                    layer.open({
                        type:1,
                        title:'角色新增',
                        shadeClose:false,
                        shade:0.8,
                        skin: 'layui-layer-molv',//样式类名
                        area: ['40%', '70%'],
                        btn: ['确定', '取消'],
                        content: $("#role_add_form"),//DOM对象ID
                        yes: function (index) {
                            $.ajax({
                                url: '${APP_PATH}/role/add',
                                type:'POST',
                                data: $("#role_add").serialize(),
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
                        var roleIds = "";
                        var roleNames = "";
                        $.each(data, function (i, d) {
                            roleIds += d.roleId + '-';
                            roleNames += d.roleName + ',';
                        });
                        roleNames = roleNames.substring(0, roleNames.length - 1);
                        roleIds = roleIds.substring(0, roleIds.length - 1);

                        //询问框
                        layer.confirm('真的删除' + roleNames + '么？', {
                            icon: 3,
                            btn: ['确定', '取消'] //按钮
                        }, function () {
                            layui.jquery.ajax({
                                url: '${APP_PATH}/role/delete/' + roleIds,
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
        table.on('tool(role)', function (obj) {
            var data = obj.data;
            var layEvent=obj.event;
            var tr = obj.tr;
            console.log(data);
            if (layEvent === 'delete') {
                layer.confirm('真的删除' + data.roleName + '么?', function (index) {
                    obj.del();
                    layer.close(index);

                    $.ajax({
                        url: '${APP_PATH}/role/delete/' + data.roleId,
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
                reset_form("#role_edit");
                getDepts("#edit_deptId_select");
                getPermission("#edit_permission_select");
                $.ajax({
                    url: '${APP_PATH}/role/selectOneRole',
                    data:{roleId:data.roleId},
                    type:'GET',
                    success:function (result) {
                        $("#edit_roleName").val(result[0].roleName);
                        $("#edit_roleStatus_select").val([result[0].roleStatus]);
                        $("#edit_roleDescription").val(result[0].roleDescription);
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
                    content: $("#role_edit_form"),//DOM对象ID
                    yes: function (index) {
                        $.ajax({
                            url:'${APP_PATH}/role/update/'+data.roleId,
                            type:'PUT',
                            data:$("#role_edit").serialize(),
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

        //头部搜索监听
        layui.form.on('submit(search)', function (data) {
            <%--$.ajax({--%>
            <%--url:'${APP_PATH}/role/list',--%>
            <%--data:$("#search_cnod").serialize(),--%>
            <%--type:"GET",--%>
            <%--success: function (result) {--%>
                <%--if (result.code === 100) {--%>
                    <%--table.reload('reload', {page: {}});--%>
                <%--}--%>
            <%--}--%>
            console.log(data);

                // alert(key)
                //执行重载
                table.reload('reload', {
                    where: { //设定异步数据接口的额外参数，任意设
                        deptId:$("#search_deptName").val(),
                        roleStatus: $("#search_roleStatus").val()
                        , roleName: $("#search_roleName").val()
                        , roleDescription: $("#search_roleDescription").val()
                    }
                    , page: {
                        curr: 1 //重新从第 1 页开始
                    }
                });

                return false;

        });
        getDepts("#search_deptName");




    });
</script>

<script>
    //表单重置
    function reset_form(ele) {
        $(ele)[0].reset();
    }

    function getDepts(ele) {
        $(ele).html();
        $(ele).html("<option value=''>选择部门</option>");
        //添加部门
        $.ajax({
            url: "${APP_PATH}/dept/all",
            type: "GET",
            success: function (data) {
                $.each(data, function (i, d) {
                    $(ele).append($("<option value='" + d.deptId + "'>" + d.deptName + "</option>"));
                });
                layui.form.render('select');
            }
        });
    }


    function getPosition(ele) {
        $(ele).html();
        $(ele).html("<option value=''>选择职务</option>");
        $.ajax({
            url:"${APP_PATH}/position/all",
            type:"get",
            success:function (data) {
                $.each(data, function (i, d) {
                    $(ele).append($("<option value='" + d.positionId + "'>" + d.positionName + "</option>"));
                });
                layui.form.render('select');
            }
        });
    }

    function getPermission(ele) {
        $(ele).html();
        $(ele).html("<option value=''>选择权限设定</option>");
        $.ajax({
            url: '${APP_PATH}/permission/all',
            type: 'GET',
            success: function (result) {
                console.log(result);
                $.each(result, function (i, item) {
                    $(ele).append($("<option value='" + item.permissionId + "'>" + item.permissionName + "</option>"));
                });
                layui.form.render();
            }
        });
    }
</script>


<%--新增角色--%>
            <div style="padding-top:25px;display: none;" id="role_add_form">
                <form class="layui-form" layui-filter="role_add_form" id="role_add">
                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">角色名称</label>
                            <div class="layui-input-inline">
                                <input type="text" name="roleName" lay-verify="required" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label">角色编码</label>
                            <div class="layui-input-inline">
                                <input type="text" name="roleEncoding" lay-verify="required" class="layui-input">
                            </div>
                        </div>


                    </div>

                    <div class="layui-form-item">
                        <div class="layui-inline">
                            <label class="layui-form-label">角色状态</label>
                            <div class="layui-input-inline">
                                <select name="roleStatus" lay-verify="required" id="add_roleStatus_select">
                                    <option value="0">无效</option>
                                    <option value="1">有效</option>
                                </select>
                            </div>
                        </div>

                        <div class="layui-inline">
                            <label class="layui-form-label">角色描述</label>
                            <div class="layui-input-inline">
                                <input type="text" name="roleDescription" lay-verify="required" autocomplete="off" class="layui-input">
                            </div>
                        </div>

                        <div class="layui-form-item">
                            <div class="layui-inline">
                                <label class="layui-form-label">角色部门</label>
                                <div class="layui-input-inline">
                                    <select name="deptId" lay-verify="required" id="add_deptId_select"></select>
                                </div>
                            </div>
                            <div class="layui-inline">
                                <label class="layui-form-label">权限设定</label>
                                <div class="layui-input-inline">
                                    <select name="permissionId" lay-verify="required" id="add_permission_select"></select>

                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>


<%--修改角色--%>
<div style="padding-top:25px;display: none;" id="role_edit_form">
    <form class="layui-form" layui-filter="role_add_form" id="role_edit">
        <div class="layui-form-item">
            <label class="layui-form-label">角色名称</label>
            <div class="layui-input-block" style="width: 75%">
                <input type="text" name="roleName" lay-verify="required" class="layui-input" id="edit_roleName">
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">角色状态</label>
                <div class="layui-input-inline">
                    <select name="roleStatus" lay-verify="required" id="edit_roleStatus_select">
                        <option value="0">无效</option>
                        <option value="1">有效</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">角色描述</label>
                <div class="layui-input-inline">
                    <input type="text" name="roleDescription" lay-verify="required" autocomplete="off" class="layui-input" id="edit_roleDescription">
                </div>
            </div>

            <div class="layui-form-item">
                <div class="layui-inline">
                    <label class="layui-form-label">角色部门</label>
                    <div class="layui-input-inline">
                        <select name="deptId" lay-verify="required" id="edit_deptId_select"></select>
                    </div>
                </div>
                <div class="layui-inline">
                    <label class="layui-form-label">权限设定</label>
                    <div class="layui-input-inline">
                        <select name="permissionId" lay-verify="required" id="edit_permission_select"></select>
                    </div>
                </div>
            </div>

        </div>
    </form>
</div>

</body>
</html>
