package com.javasm.crm.permission.controller;

import com.github.pagehelper.PageInfo;
import com.javasm.crm.common.utils.Msg;
import com.javasm.crm.permission.entity.Permission;
import com.javasm.crm.permission.service.PermissionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/permission")
@RestController
public class PermissionHandler {
    @Resource
    private PermissionService permissionService;

    @RequestMapping(value = "/selectOneRole",method = RequestMethod.GET)
    public List<Permission> selectOneRole(Permission permission) {
        return permissionService.selectAllPermission(permission);
    }



    @RequestMapping(value = "/all",method = RequestMethod.GET)
    public List<Permission> getAll(Permission permission) {
        return permissionService.selectAllPermission(permission);
    }



    /**
     * 更新权限数据
     * @param permission
     * @return
     */
    @RequestMapping(value = "/update/${permissionId}",method = RequestMethod.PUT)
    public Msg updatePermission(Permission permission) {
        int i = permissionService.updateByPrimaryKeySelective(permission);
        if (i == 0) {
            return Msg.fail();
        }
        return Msg.success();
    }

    /**
     * 删除权限
     * @param permissionId
     * @return
     */
    @RequestMapping(value = "/delete/${permissionId}",method = RequestMethod.DELETE)
    public Msg deletePermission(@PathVariable("permissionId")String permissionId) {
        List<Integer> listPermissionId = new ArrayList<>();
        int i = 0;
        if (permissionId.contains("-")) {
            String[] permissionIds = permissionId.split("-");
            for (String id : permissionIds) {
                listPermissionId.add(Integer.parseInt(id));
            }
            i=permissionService.batchDeletePermission(listPermissionId);
        } else {
            i=permissionService.deleteByPrimaryKey(Integer.parseInt(permissionId));
        }
        if (i == 0) {
            return Msg.fail();
        }
        return Msg.success();
    }
    /**
     * 添加权限
     * @param permission
     * @return
     */
    @RequestMapping(value = "/add",method = RequestMethod.POST)
    public Msg addPermission(Permission permission) {
        int i = permissionService.insertSelective(permission);
        if (i == 0) {
            return Msg.fail();
        }
        return Msg.success();
    }
    /**
     * 分页查询全部权限
     * @param page
     * @param pageSize
     * @return
     */
    @RequestMapping(value = "/list",method = RequestMethod.GET)
    public Msg getAllPermission(@RequestParam(defaultValue = "1", required = false) int page, @RequestParam(defaultValue = "2", required = false) int pageSize,Permission permission) {
        PageInfo<Permission> permissionPageInfo = permissionService.selectAllPermissionwithPage(page, pageSize,permission);
        return Msg.success().add("pageInfo", permissionPageInfo);
    }

}
