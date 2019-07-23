package com.javasm.crm.permission.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javasm.crm.permission.entity.Permission;
import com.javasm.crm.permission.mapper.PermissionMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PermissionService {

    @Resource
    private PermissionMapper permissionMapper;

    public int deleteByPrimaryKey(Integer id) {
        return permissionMapper.deleteByPrimaryKey(id);
    }

    public int insert(Permission record) {
        return permissionMapper.insert(record);
    }

    public int insertSelective(Permission record) {
        return permissionMapper.insertSelective(record);
    }

    public Permission selectByPrimaryKey(Integer id) {
        return permissionMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(Permission record) {
        return permissionMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Permission record) {
        return permissionMapper.updateByPrimaryKey(record);
    }

    public int updateBatch(List<Permission> list) {
        return permissionMapper.updateBatch(list);
    }

    public int batchInsert(List<Permission> list) {
        return permissionMapper.batchInsert(list);
    }

    public PageInfo<Permission> selectAllPermissionwithPage(int page, int pageSize,Permission permission) {
        PageHelper.startPage(page, pageSize);
        return new PageInfo<>(permissionMapper.selectAllPermission(permission));
    }

    public List<Permission> selectAllPermission(Permission permission) {
        return permissionMapper.selectAllPermission(permission);
    }

    public int batchDeletePermission(List<Integer> ids) {
        return permissionMapper.batchDeletePermission(ids);
    }
}


