package com.javasm.crm.user.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javasm.crm.user.entity.Role;
import com.javasm.crm.user.mapper.RoleMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class RoleService {

    @Resource
    private RoleMapper roleMapper;

    public int deleteByPrimaryKey(Integer roleId) {
        return roleMapper.deleteByPrimaryKey(roleId);
    }

    public int insert(Role record) {
        return roleMapper.insert(record);
    }

    public int insertSelective(Role record) {
        return roleMapper.insertSelective(record);
    }

    public Role selectByPrimaryKey(Integer roleId) {
        return roleMapper.selectByPrimaryKey(roleId);
    }

    public int updateByPrimaryKeySelective(Role record) {
        return roleMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Role record) {
        return roleMapper.updateByPrimaryKey(record);
    }

    public int batchInsert(List<Role> list) {
        return roleMapper.batchInsert(list);
    }

    public List<Role> selectAllRole(Role role) {
        return roleMapper.selectAllRole(role);
    }

    public int batchDeleteRoles(List<Integer> roleId) {
        return roleMapper.batchDeleteRoles(roleId);
    }

    public PageInfo<Role> selectAllRolewithPage(int page, int pageSize, Role role) {
        PageHelper.startPage(page, pageSize);
        return new PageInfo<>(roleMapper.selectAllRole(role));
    }
}




