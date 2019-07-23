package com.javasm.crm.user.mapper;

import com.javasm.crm.user.entity.Department;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DepartmentMapper {
    int deleteByPrimaryKey(Integer deptId);

    int insert(Department record);

    int insertSelective(Department record);

    Department selectByPrimaryKey(Integer deptId);

    int updateByPrimaryKeySelective(Department record);

    int updateByPrimaryKey(Department record);

    int updateBatch(List<Department> list);

    int batchInsert(@Param("list") List<Department> list);

    List<Department> selectAll();
}