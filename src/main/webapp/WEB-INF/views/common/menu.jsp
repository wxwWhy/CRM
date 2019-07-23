<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    ol li a {
        background-color: rgba(0, 0, 0, 1) !important;
    }

    .three_this {
        background-color: #ebba92 !important;
    }
</style>
<script>
    //JavaScript代码区域
    layui.use(['element', 'jquery'], function () {
        var element = layui.element, $ = layui.jquery;
        $("#menu_three").on("click", function () {
            $(this).next().toggle();
        });
        $("ol").on("click", "li a", function () {
            $.each($(this).parent().siblings(), function (i, e) {
                $(e).find("a").removeClass('three_this')
            });
            $(this).addClass('three_this');                            // 添加当前元素的样式
        });
    });
</script>

<!-- 左侧导航区域（可配合layui已有的垂直导航11） -->
<ul class="layui-nav layui-nav-tree"  lay-filter="test">
    <c:forEach items="${rootMenulist.children}" var="menuList">
        <c:if test="${empty menuList.children}">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;">${menuList.menuName}</a>
            </li>
        </c:if>
        <c:if test="${not empty rootMenulist.children}">
            <li class="layui-nav-item layui-nav-itemed">
                <a class="" href="javascript:;" id="menu_three">${menuList.menuName}</a>
                <dl class="layui-nav-child">
                    <c:forEach items="${menuList.children}" var="child">
                        <c:if test="${empty child.children}">
                            <dd><a href="${APP_PATH}${child.menuUrl}">${child.menuName}</a></dd>
                        </c:if>
                        <c:if test="${not empty child.children}">
                            <dd><a href="javascript:;" >${child.menuName}</a>
                                <ol class="layui-nav-child" style="display: none;" >
                                    <c:forEach items="${child.children}" var="ch">
                                        <li><a href="${APP_PATH}${ch.url}">${ch.menuName}</a></li>
                                    </c:forEach>
                                </ol>
                            </dd>
                        </c:if>
                    </c:forEach>
                </dl>
            </li>
        </c:if>
    </c:forEach>
</ul>