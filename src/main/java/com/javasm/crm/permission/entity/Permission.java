package com.javasm.crm.permission.entity;

import com.javasm.crm.user.entity.Role;

public class Permission {
    /**
     * 权限id
     */
    private Integer permissionId;

    /**
     * 权限名
     */
    private String permissionName;

    /**
     * 权限描述
     */
    private String permissionDescription;

    /**
     * 状态1有效2无效
     */
    private Integer permissionStatus;

    private Role role;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

    public Integer getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(Integer permissionId) {
        this.permissionId = permissionId;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public String getPermissionDescription() {
        return permissionDescription;
    }

    public void setPermissionDescription(String permissionDescription) {
        this.permissionDescription = permissionDescription;
    }

    public Integer getPermissionStatus() {
        return permissionStatus;
    }

    public void setPermissionStatus(Integer permissionStatus) {
        this.permissionStatus = permissionStatus;
    }
}