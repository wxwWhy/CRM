package com.javasm.crm.common.controller;

import com.javasm.crm.common.utils.Msg;
import com.javasm.crm.user.entity.Menulist;
import com.javasm.crm.user.entity.User;
import com.javasm.crm.user.service.MenulistService;
import com.javasm.crm.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class DispatcherController {
    @Autowired
    private MenulistService menulistService;

    @Resource
    private UserService userService;

    /**
     * 跳转到用户添加页面
     * @return
     */
    // @RequestMapping("/addUser")
    // public String add() {
    //     return "user/add";
    // }

    /**
     * 跳转日志管理界面
     *
     * @return
     */
    @RequestMapping("log/logMgr")
    public String logMgr() {
        return "log/logMgr";
    }

    /**
     * 跳转部门管理界面
     *
     * @return
     */
    @RequestMapping("dept/deptMgr")
    public String deptMgr() {
        return "dept/deptMgr";
    }

    /**
     * 登出
     *
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "login";
    }

    /**
     * 跳转权限管理页面
     *
     * @return
     */
    @RequestMapping("permission/permissionMgr")
    public String permissionMgr() {
        return "permission/permissionMgr";
    }

    /**
     * 跳转角色管理页面
     *
     * @return
     */
    @RequestMapping("role/roleManager")
    public String roleManger() {
        return "role/roleManager";
    }

    /**
     * 跳转用户管理界面
     *
     * @return
     */
    @RequestMapping("user/userManager")
    public String userManger() {
        return "user/userManager";
    }

    /**
     * 登录后跳转主页面
     *
     * @return
     */
    @RequestMapping("/main")
    public String main() {
        return "main";
    }

    /**
     * 登陆用户查询
     *
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public Object login(User user, HttpSession session) {
        User dbUser = userService.selectUser(user);
        if (dbUser == null) {
            return Msg.fail();
        }
        //用户登录信息放入session
        session.setAttribute("loginUser", dbUser);
        //获取用户权限信息
        List<Menulist> menulists = menulistService.queryMainListByUser(dbUser);
        //存放权限信息
        Map<Integer, Menulist> map = new HashMap<>();
        Menulist root = null;
        Set<String> uriSet = new HashSet<>();
        for (Menulist menulist : menulists) {
            map.put(menulist.getMenuId(), menulist);
            if (menulist.getMenuUrl() != null && "".equals(menulist.getMenuUrl())) {
                uriSet.add(session.getServletContext().getContextPath() + menulist.getMenuUrl());
            }
            //当前用户可访问URI
            session.setAttribute("authUriSet", uriSet);
        }
        for (Menulist ms : menulists) {
            if (ms.getMenuPid() == 0) {
                root = ms;
            } else {
                int key = ms.getMenuPid();
                Menulist father = map.get(key);
                father.getChildren().add(ms);
            }
        }
        //当前用户菜单信息
        session.setAttribute("rootMenulist", root);
        return Msg.success();
    }
}
