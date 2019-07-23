package com.javasm.crm.web.interceptor;

import com.javasm.crm.user.entity.Menulist;
import com.javasm.crm.user.service.MenulistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashSet;
import java.util.List;
import java.util.Objects;
import java.util.Set;

public class PermissionInterceptor extends HandlerInterceptorAdapter {
    @Autowired
    private MenulistService menulistService;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取用户请求地址
        String uri = request.getRequestURI();
        String path = request.getSession().getServletContext().getContextPath();
        //判断当前路径是否需要权限验证
        //查询所有需要验证路径的集合
        List<Menulist> menulists = menulistService.selectAll();
        Set<String> uriSet = new HashSet<>();
        for (Menulist menulist : menulists) {
            if (menulist != null && Objects.equals("", menulist.getMenuUrl())) {
                uriSet.add(path + menulist.getMenuUrl());
            }
        }
        //权限验证
        //判断当前用户的权限
        if (uriSet.contains(uri)) {
            Set<String> authUriSet =(Set<String>) request.getSession().getAttribute("authUriSet");
            if (authUriSet.contains(uri)) {
                return true;
            } else {
                response.sendRedirect(path + "/error");
                return true;
            }
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
}
