<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <title>用户管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${APP_PATH}/layui/css/layui.css" media="all">
    <script src="${APP_PATH}/layui/layui.js" type="text/javascript"></script>
    <script src="${APP_PATH}/jquery/jquery.min.js" type="text/javascript"></script>
    <style>
        /*分页条居中*/
        .layui-table-page {
            text-align: center
        }

        /*复选框位置微调*/
        .layui-table-cell .layui-form-checkbox[lay-skin="primary"] {
            top: 50%;
            transform: translateY(-50%);
        }
    </style>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">CRM</div>
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
                    <dd><a href="javascript:;">修改信息</a></dd>
                    <dd><a href="javascript:;">安全管理</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="">退了</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <%@include file="../common/menu.jsp" %>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->

        <div style="padding: 20px; background-color: #F2F2F2;">
            <div class="layui-row">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-header">
                            <span class="layui-breadcrumb">
                                <a href="">首页</a>
                                <a href="">系统管理</a>
                                <a href="">用户管理</a>
                                <a><cite>用户详情</cite></a>
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
                        <div class="layui-card-header"><strong>用户详情</strong></div>
                        <div class="layui-card-body">


                            <div class="demoTable">
                                <form class="layui-form">
                                    <div class="layui-form-item">
                                        <div class="layui-input-inline">
                                            <select name="deptId" id="search_deptName">
                                                <option value="">所有部门</option>
                                            </select>
                                        </div>
                                        <div class="layui-input-inline">
                                            <select name="userStatus" id="search_userStatus">
                                                <option value="">所有用户状态</option>
                                                <option value="1">有效</option>
                                                <option value="2">无效</option>
                                            </select>
                                        </div>
                                        <div class="layui-input-inline">
                                            <select name="positionId" id="search_positionName">
                                                <option value="">所有职务</option>
                                            </select>
                                        </div>
                                        <div class="layui-input-inline">
                                            <select name="roleId" id="search_roleName">
                                                <option value="">所有角色</option>
                                            </select>
                                        </div>
                                        <div class="layui-input-inline">
                                            <select name="roleName" id="search_gender">
                                                <option value="">所有性别</option>
                                                <option value="1">男</option>
                                                <option value="2">女</option>
                                                <option value="0">保密</option>
                                            </select>
                                        </div>

                                        <div class="layui-inline">
                                            <input class="layui-input" name="uname" id="search_uname" autocomplete="off" placeholder="用户名">
                                        </div>
                                        <div class="layui-inline">
                                            <input class="layui-input" name="loginName" id="search_loginName" autocomplete="off" placeholder="登录名">
                                        </div>
                                        <div class="layui-inline">
                                            <button class="layui-btn" lay-submit="" lay-filter="search">搜索</button>
                                        </div>
                                    </div>

                                </form>
                            </div>

                            <div>
                                <table class="layui-hide" lay-data="{id: 'id'}" id="table_user"
                                       lay-filter="user"></table>
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
<%--工具栏模板：--%>
<script type="text/html" id="topBar">
    <div class="layui-btn-container">
            <button class="layui-btn layui-btn" lay-event="add"><i class="layui-icon layui-icon-add-1"></i>添加</button>
            <button class="layui-btn layui-btn-danger layui-btn" lay-event="deleteAll"><i class="layui-icon layui-icon-delete"></i>批量删除</button>
    </div>
</script>
<%--右侧按钮--%>
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
<script type="text/javascript">
    layui.use(['table', 'element', 'laypage', 'layer', 'form'], function () {
        var table = layui.table;
        var laypage = layui.laypage;
        var element = layui.element;
        var form = layui.form;
        var tableIns = table.render({
            elem: '#table_user',
            toolbar: '#topBar',
            url: '${APP_PATH}/user/list',
            cols: [[
                {type: 'numbers', title: '序号'}
                , {type: 'checkbox'}
                , {field: 'loginName', title: '登录名', edit: 'text'}
                , {field: 'uname', title: '用户姓名', width: 120, edit: 'text'}
                , {
                    field: 'deptName', title: '归属部门', templet: function (d) {
                        return deptName = d.department.deptName;
                    }
                }
                , {
                    field: 'gender', title: '用户性别', templet: function (d) {
                        if (d.gender === 1) {
                            return '男';
                        } else if (d.gender === 2) {
                            return '女';
                        } else {
                            return '保密';
                        }
                    }, unresize: true
                }
                , {
                    field: 'userStatus', title: '用户状态', templet: function (d) {
                        return d.userStatus === 1 ? '有效' : '无效';
                    }
                }
                , {
                    field: 'positionName', title: '用户职务', templet: function (d) {
                        return positionName = d.position.positionName;
                    }
                }
                , {field: 'phone', title: '用户手机号'}
                , {field: 'email', title: '邮箱', width: 200}
                , {
                    field: 'roleName', title: '角色', templet: function (d) {
                        return roleName = d.role.roleName;
                    }
                }
                , {fixed: 'right', title: '操作', width: 200, align: 'center', toolbar: '#barDemo'}
            ]]
            , id: 'reload'
            , page: {layout: ['limit', 'count', 'prev', 'page', 'next', 'skip'], curr: 1, groups: 10}
            , request: {
                limitName: 'pageSize' //每页数据量的参数名，默认：limit
            }

            , limit: 12
            , defaultToolbar: []
            , response: {
                // statusName: 'code' //规定数据状态的字段名称，默认：code
                statusCode: 100 //规定成功的状态码，默认：0
                // ,msgName: 'msg' //规定状态信息的字段名称，默认：msg
                , countName: 'total' //规定数据总数的字段名称，默认：count
                , dataName: 'list' //规定数据列表的字段名称，默认：data
            }
            , parseData: function (res) { //将原始数据解析成 table 组件所规定的数据
                console.log(res);
                return {
                    "code": res.code, //解析接口状态
                    "msg": res.msg, //解析提示文本
                    "total": res.extend.pageInfo.total, //解析数据长度
                    "list": res.extend.pageInfo.list //解析数据列表
                };
            }

        });

        //监听工具条
        table.on('tool(user)', function (obj) { //注：tool是工具条事件名，test是table原始容器的属性lay-filter="对应的值"
            var data = obj.data; //获得当前行数据
            var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
            var tr = obj.tr; //获得当前行 tr 的DOM对象
            console.log(data);
            if (layEvent === 'delete') { //删除
                // alert(JSON.stringify(data.uid));
                layer.confirm('真的删除' + data.uname + '么?', function (index) {
                    obj.del(); //删除对应行（tr）的DOM结构，并更新缓存
                    layer.close(index);
                    //向服务端发送删除指令
                    layui.jquery.ajax({
                        url: '${APP_PATH}/user/delete/' + data.uid,
                        type: 'DELETE',
                        success: function (data) {
                            if (data.code === 100) {
                                layer.msg('删除成功!', {
                                    icon: 6,
                                    time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                }, function () {
                                    //更新表格数据
                                    table.reload('reload', {page: {curr: obj.curr}});

                                });
                            } else if (data.code === 200) {
                                layer.msg('删除失败!', {
                                    icon: 5,
                                    time: 2000 //2秒关闭（如果不配置，默认是3秒）
                                }, function () {
                                    //do something......
                                });
                            }
                        }
                    });
                });
            }
            if (layEvent === 'update') { //编辑

                //重置表单
                reset_form("#update_form");

                getDepts("#edit_dept_select");

                getPosition("#edit_position_select");

                getRoles("#edit_role_select");
                //查询修改用户数据填充到表单
                $.ajax({
                    url: "${APP_PATH}/user/selectOneUser/" + data.uid,
                    type: 'GET',
                    success: function (data) {
                        // 方法无效
                        // layui.form.val("user_update_Form", {
                        //     "loginName": data.loginName // "name": "value"
                        //     ,"uname":data.uname
                        //     ,"gender": data.gender
                        //     ,"deptId": data.deptId
                        //     ,"password": data.password
                        //     ,"phone": data.phone
                        //     ,"roleId":data.roleId
                        // });

                        //填充数据到表单
                        $("#edit_user_loginName").val(data.loginName);
                        $("#edit_user_uname").val(data.uname);
                        $("#edit_dept_select").val([data.deptId]);
                        $("#edit_user_password").val(data.password);
                        $("input[name='gender'][value='1']").attr("checked", data.gender === 1 ? true : false);
                        $("input[name='gender'][value='2']").attr("checked", data.gender === 2 ? true : false);
                        $("input[name='gender'][value='0']").attr("checked", data.gender === 0 ? true : false);
                        // $("#edit_user_userStatus").val([data.userStatus]);
                        $("#edit_userStatus_select").val([data.userStatus]);
                        $("#edit_user_phone").val(data.phone);
                        $("#edit_position_select").val([data.positionId]);
                        $('#edit_user_email').val(data.email);
                        $("#edit_role_select").val([data.roleId]);
                        form.render();
                    }
                });
                //打开修改数据弹窗
                layer.open({
                    type: 1,
                    title: '用户信息-修改',
                    shadeClose: false,
                    shade: 0.8,
                    skin: 'layui-layer-warm',//样式类名
                    area: ['40%', '70%'],
                    btn: ['更新', '取消'],
                    content: $("#user_update_Form"),//DOM对象ID
                    yes: function (index) {
                        //向服务器发修改请求
                        $.ajax({
                            url:'${APP_PATH}/user/update/'+data.uid,
                            data: $("#update_form").serialize(),
                            type: "PUT",
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
                        });
                    }
                });
            }
        });


        //头工具栏事件
        table.on('toolbar(user)', function (obj) {
            console.log(obj);
            switch (obj.event) {
                case 'add':
                    //每次打开重置表单
                    reset_form("#add_user");
                    //添加部门信息到下拉列表
                    getDepts("#add_dept_select");
                    //添加职位
                    getPosition("#add_position_select");
                    //添加角色
                    getRoles("#add_role_select");
                    //打开新增弹窗
                    layer.open({
                        type: 1,
                        title: '用户信息-新增',
                        shadeClose: false,
                        shade: 0.8,
                        skin: 'layui-layer-molv',//样式类名
                        area: ['40%', '70%'],
                        btn: ['确定', '取消'],
                        content: $("#user_add_Form"),//DOM对象ID
                        yes: function (index) {
                            $.ajax({
                                url: '${APP_PATH}/user/add',
                                data: $("#add_user").serialize(),
                                type: "POST",
                                success: function (data) {
                                    if (data.code === 100) {
                                        layer.close(index);
                                        layer.msg('添加成功!', {
                                            icon: 1,
                                            time: 1000 //2秒关闭（如果不配置，默认是3秒）
                                        }, function () {
                                            //更新表格数据
                                            table.reload('reload', {page: {curr: obj.config.page.pages+1}});
                                        });
                                    } else {
                                        layer.close(index);
                                        layer.msg('删除失败!', {
                                            icon: 2,
                                            time: 2000 //2秒关闭（如果不配置，默认是3秒）
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
                        var uids = "";
                        uname = "";
                        $.each(data, function (i, d) {
                            uids += d.uid + '-';
                            uname += d.uname + ',';
                        });
                        uname = uname.substring(0, uname.length - 1);
                        uids = uids.substring(0, uids.length - 1);

                        //询问框
                        layer.confirm('真的删除' + uname + '么？', {
                            icon: 3,
                            btn: ['确定', '取消'] //按钮
                        }, function () {
                            layui.jquery.ajax({
                                url: '${APP_PATH}/user/delete/' + uids,
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


        //监听单元格编辑
        table.on('edit(user)', function (obj) {
            var value = obj.value //得到修改后的值
                , data = obj.data //得到所在行所有键值
                , field = obj.field; //得到字段
            layer.msg('[ID: ' + data.id + '] ' + field + ' 字段更改为：' + value);
        });



        getDepts("#search_deptName");
        getRoles("#search_roleName");
        getPosition("#search_positionName");





        form.on('submit(search)', function(data) {
            //执行重载
            table.reload('reload', {
                where: { //设定异步数据接口的额外参数，任意设
                    deptId: $("#search_deptName").val()
                        ,userStatus:$("#search_userStatus").val()
                        ,positionId:$("#search_positionName").val()
                        ,roleId:$("#search_roleName").val()
                        ,uname:$("#search_uname").val()
                        ,loginName:$("#search_loginName").val()
                        ,gender:$("#search_gender").val()
                }
                ,page: {
                    curr: 1 //重新从第 1 页开始
                }
            });

            return false;
        });
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
                layui.form.render();
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
                layui.form.render();
            }
        });
    }

    function getRoles(ele) {
        $(ele).html();
        $(ele).html("<option value=''>选择角色</option>");
        $.ajax({
            url:"${APP_PATH}/role/all",
            type:"GET",
            success:function (data) {
                $.each(data, function (i, d) {
                    $(ele).append($("<option value='" + d.roleId + "'>" + d.roleName + "</option>"));
                });
                layui.form.render();
            }
        });
    }

</script>


<%--增加用户弹出表单------start-----------%>
<div style="padding-top:60px;display: none" id="user_add_Form">
    <form class="layui-form" layui-filter="user_add_Form" id="add_user">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户登录名</label>
                <div class="layui-input-inline">
                    <input type="text" name="loginName" lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="uname" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">归属部门</label>
                <div class="layui-input-inline">
                    <select name="deptId" lay-verify="required" lay-search="" id="add_dept_select">
                        <option value="">请选择部门</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="gender" value="1" title="男">
                    <input type="radio" name="gender" value="2" title="女">
                    <input type="radio" name="gender" value="0" title="保密">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户状态</label>
                <div class="layui-input-inline">
                    <select name="userStatus" lay-verify="required" id="add_userStatus_select">
                        <option value="0">无效</option>
                        <option value="1">有效</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-inline">
                    <input type="tel" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户职务</label>
                <div class="layui-input-inline">
                    <select name="positionId" lay-verify="required" id="add_position_select"></select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">验证邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input">
                </div>
            </div>
            <%--<div class="layui-inline">--%>
                <%--<label class="layui-form-label">备注</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<input type="" name="" autocomplete="off" class="layui-input">--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">所属角色</label>
            <div class="layui-input-block" style="width: 61%">
                <select name="roleId" lay-filter="role" id="add_role_select">
                    <option value="">选择角色</option>
                </select>
            </div>
        </div>

        <%--<div class="layui-form-item layui-form-text">--%>
            <%--<label class="layui-form-label">描述</label>--%>
            <%--<div class="layui-input-block">--%>
                <%--<textarea placeholder="请输入内容" class="layui-textarea"></textarea>--%>
            <%--</div>--%>
        <%--</div>--%>


        <%--<div class="layui-form-item">--%>
            <%--<div class="layui-input-block">--%>
                <%--<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>--%>
                <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
            <%--</div>--%>
        <%--</div>--%>
    </form>
</div>
<%--增加用户弹出表单-----end-------%>

<%--修改用户弹出表单-----start--%>

<div style="padding: 15px; display: none" id="user_update_Form">
    <form class="layui-form" layui-filter="user_update_Form" id="update_form">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户登录名</label>
                <div class="layui-input-inline">
                    <input type="text" name="loginName" lay-verify="required" class="layui-input" id="edit_user_loginName">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="uname" lay-verify="required" autocomplete="off" class="layui-input" id="edit_user_uname">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">归属部门</label>
                <div class="layui-input-inline">
                    <select name="deptId" lay-verify="required" id="edit_dept_select">
                        <option value="">请选择部门</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" lay-verify="required" autocomplete="off" class="layui-input" id="edit_user_password">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">用户性别</label>
                <div class="layui-input-block">
                    <input type="radio" name="gender" value="1" title="男">
                    <input type="radio" name="gender" value="2" title="女">
                    <input type="radio" name="gender" value="0" title="保密">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户状态</label>
                <div class="layui-input-block">
                    <select name="userStatus" lay-verify="required" id="edit_userStatus_select">
                        <option value="0">无效</option>
                        <option value="1">有效</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-inline">
                    <input type="tel" name="phone" lay-verify="required|phone" autocomplete="off" class="layui-input" id="edit_user_phone">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">用户职务</label>
                <div class="layui-input-inline">
                    <select name="positionId" lay-verify="required" id="edit_position_select"></select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">验证邮箱</label>
                <div class="layui-input-inline">
                    <input type="text" name="email" lay-verify="email" autocomplete="off" class="layui-input" id="edit_user_email">
                </div>
            </div>
            <%--<div class="layui-inline">--%>
                <%--<label class="layui-form-label">备注</label>--%>
                <%--<div class="layui-input-inline">--%>
                    <%--<input type="text" name="remark" autocomplete="off" class="layui-input">--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">所属角色</label>
            <div class="layui-input-block" style="width: 61%">
                <select name="roleId" lay-filter="role" id="edit_role_select">
                    <option value="">选择角色</option>
                </select>
            </div>
        </div>

        <%--<div class="layui-form-item layui-form-text">--%>
            <%--<label class="layui-form-label">描述</label>--%>
            <%--<div class="layui-input-block">--%>
                <%--<textarea placeholder="请输入内容" class="layui-textarea"></textarea>--%>
            <%--</div>--%>
        <%--</div>--%>


        <%--<div class="layui-form-item">--%>
        <%--<div class="layui-input-block">--%>
        <%--<button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>--%>
        <%--<button type="reset" class="layui-btn layui-btn-primary">重置</button>--%>
        <%--</div>--%>
        <%--</div>--%>
    </form>
</div>
<%--修改用户弹出表单----end------%>

</body>
</html>