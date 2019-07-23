package com.javasm.crm.user.controller;

import com.github.pagehelper.PageInfo;
import com.javasm.crm.common.utils.Msg;
import com.javasm.crm.user.entity.Role;
import com.javasm.crm.user.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleHandler {
    @Resource
    private RoleService roleService;

    @RequestMapping(value = "/selectOneRole",method = RequestMethod.GET)
    @ResponseBody
    public List<Role> selectOneRole(Role role) {
        List<Role> roles = roleService.selectAllRole(role);
        return roles;
    }


    /**
     * 查出全部角色
     * @return
     */
    @RequestMapping(value = "/all",method = RequestMethod.GET)
    @ResponseBody
    public List<Role> getAll(Role role) {
        List<Role> roles = roleService.selectAllRole(role);
        return roles;
    }

    /**
     * 进入用户管理界面分页查询全部用户
     *
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Msg getRole(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "10") int pageSize, Role role) {
        PageInfo<Role> rolePageInfo = roleService.selectAllRolewithPage(page, pageSize,role);
        return Msg.success().add("pageInfo", rolePageInfo);
    }

    /**
     * 角色添加
     * @param role
     * @return
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Msg addRole(Role role) {
        int i = roleService.insertSelective(role);
        if (i == 0) {
            return Msg.fail();
        }
        return Msg.success();
    }

    /**
     * 修改用户数据
     *
     * @param role
     * @return
     */
    @RequestMapping(value = "/update/{roleId}", method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateRole(Role role) {
        int i = roleService.updateByPrimaryKeySelective(role);
        if (i == 0) {
            return Msg.success();
        }
        return Msg.success();
    }

    /**
     * 单个\多选批量删除二合一
     *
     * @param roleId
     * @return
     */
    @RequestMapping(value = "/delete/{roleId}", method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteRole(@PathVariable("roleId") String roleId) {
        List<Integer> listRoleId = new ArrayList<>();
        int i = 0;
        if (roleId.contains("-")) {
            String[] uids = roleId.split("-");
            for (String s : uids) {
                listRoleId.add(Integer.parseInt(s));
            }
            i = roleService.batchDeleteRoles(listRoleId);
        } else {
            i = roleService.deleteByPrimaryKey(Integer.parseInt(roleId));
        }
        if (i == 0) {
            return Msg.fail();
        }
        return Msg.success();
    }
}
