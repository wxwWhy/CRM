package com.javasm.crm.permission.mapper;

import com.javasm.crm.permission.entity.Permission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PermissionMapper {
    int deleteByPrimaryKey(Integer permissionId);

    int insert(Permission record);

    int insertSelective(Permission record);

    Permission selectByPrimaryKey(Integer permissionId);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);

    int updateBatch(List<Permission> list);

    int batchInsert(@Param("list") List<Permission> list);

    List<Permission> selectAllPermission(Permission permission);

    int batchDeletePermission(List<Integer> ids);
}