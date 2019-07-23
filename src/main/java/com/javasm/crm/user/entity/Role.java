package com.javasm.crm.user.entity;

import com.javasm.crm.permission.entity.Permission;

public class Role {
    /**
     * 角色编码
     */
    private Integer roleId;

    /**
     * 角色名称
     */
    private String roleName;

    /**
     * 角色描述
     */
    private String roleDescription;

    /**
     * 角色状态 1有效0无效
     */
    private Integer roleStatus;

    /**
     * 角色编码
     */
    private String roleEncoding;

    /**
     * 角色权限设定
     */
    private String rolePermissionDescription;

    /**
     * 角色部门id
     */
    private Integer deptId;

    /**
     * 部门
     */
    private Department department=new Department();

    /**
     * 权限
     */
    private Permission permission=new Permission();

    public Permission getPermission() {
        return permission;
    }

    public void setPermission(Permission permission) {
        this.permission = permission;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Integer getRoleId() {
        return roleId;
    }

    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDescription() {
        return roleDescription;
    }

    public void setRoleDescription(String roleDescription) {
        this.roleDescription = roleDescription;
    }

    public Integer getRoleStatus() {
        return roleStatus;
    }

    public void setRoleStatus(Integer roleStatus) {
        this.roleStatus = roleStatus;
    }

    public String getRoleEncoding() {
        return roleEncoding;
    }

    public void setRoleEncoding(String roleEncoding) {
        this.roleEncoding = roleEncoding;
    }

    public String getRolePermissionDescription() {
        return rolePermissionDescription;
    }

    public void setRolePermissionDescription(String rolePermissionDescription) {
        this.rolePermissionDescription = rolePermissionDescription;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }
}