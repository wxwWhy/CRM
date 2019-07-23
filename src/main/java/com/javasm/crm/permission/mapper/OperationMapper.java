package com.javasm.crm.permission.mapper;

import com.javasm.crm.permission.entity.Operation;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OperationMapper {
    int deleteByPrimaryKey(Integer operationId);

    int insert(Operation record);

    int insertSelective(Operation record);

    Operation selectByPrimaryKey(Integer operationId);

    int updateByPrimaryKeySelective(Operation record);

    int updateByPrimaryKey(Operation record);

    int updateBatch(List<Operation> list);

    int batchInsert(@Param("list") List<Operation> list);

    int deleteByPrimaryKey(@Param("operationId") Integer operationId, @Param("operationName") String operationName);

    @Select("SELECT * FROM operation")
    List<Operation> selectAllPermission();

    int batchDeleteOperation(List<Integer> ids);
}