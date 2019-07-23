package com.javasm.crm.user.mapper;

import com.javasm.crm.user.entity.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    int batchInsert(@Param("list") List<Role> list);

    List<Role> selectAllRole(Role role);

    /**
     * 根据主键批量删除
     *
     * @param roleId
     * @return
     */
    int batchDeleteRoles(List<Integer> roleId);
}