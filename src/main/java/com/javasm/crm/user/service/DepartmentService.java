package com.javasm.crm.user.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javasm.crm.user.entity.Department;
import com.javasm.crm.user.mapper.DepartmentMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class DepartmentService {

    @Resource
    private DepartmentMapper departmentMapper;

    public int deleteByPrimaryKey(Integer deptId) {
        return departmentMapper.deleteByPrimaryKey(deptId);
    }

    public int insert(Department record) {
        return departmentMapper.insert(record);
    }

    public int insertSelective(Department record) {
        return departmentMapper.insertSelective(record);
    }

    public Department selectByPrimaryKey(Integer deptId) {
        return departmentMapper.selectByPrimaryKey(deptId);
    }

    public int updateByPrimaryKeySelective(Department record) {
        return departmentMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Department record) {
        return departmentMapper.updateByPrimaryKey(record);
    }

    public int updateBatch(List<Department> list) {
        return departmentMapper.updateBatch(list);
    }

    public int batchInsert(List<Department> list) {
        return departmentMapper.batchInsert(list);
    }

    public List<Department> selectAll() {
        return departmentMapper.selectAll();
    }

    public PageInfo<Department> selectAllwithPage(int page, int pageSize) {
        PageHelper.startPage(page, pageSize);
        return new PageInfo<>(departmentMapper.selectAll());
    }
}



