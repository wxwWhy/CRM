package com.javasm.crm.permission.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javasm.crm.permission.entity.Operation;
import com.javasm.crm.permission.mapper.OperationMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OperationService {

    @Resource
    private OperationMapper operationMapper;

    public int deleteByPrimaryKey(Integer id) {
        return operationMapper.deleteByPrimaryKey(id);
    }

    public int insert(Operation record) {
        return operationMapper.insert(record);
    }

    public int insertSelective(Operation record) {
        return operationMapper.insertSelective(record);
    }

    public Operation selectByPrimaryKey(Integer id) {
        return operationMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(Operation record) {
        return operationMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Operation record) {
        return operationMapper.updateByPrimaryKey(record);
    }

    public int updateBatch(List<Operation> list) {
        return operationMapper.updateBatch(list);
    }

    public int batchInsert(List<Operation> list) {
        return operationMapper.batchInsert(list);
    }

    public List<Operation> selectAllPermission() {
        return operationMapper.selectAllPermission();
    }

    public PageInfo<Operation> selectAllPermissionwithPage(int page, int pageSize) {
        PageHelper.startPage(page, pageSize);
        return new PageInfo<>(operationMapper.selectAllPermission());
    }

    public int batchDeleteOperation(List<Integer> ids) {
        return operationMapper.batchDeleteOperation(ids);
    }

    public int deleteByPrimaryKey(Integer operationId, String operationName) {
        return operationMapper.deleteByPrimaryKey(operationId, operationName);
    }
}








