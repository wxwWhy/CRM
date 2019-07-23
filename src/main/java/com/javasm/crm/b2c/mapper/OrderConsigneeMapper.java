package com.javasm.crm.b2c.mapper;

import com.javasm.crm.b2c.entity.OrderConsignee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderConsigneeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderConsignee record);

    int insertSelective(OrderConsignee record);

    OrderConsignee selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderConsignee record);

    int updateByPrimaryKey(OrderConsignee record);

    int updateBatch(List<OrderConsignee> list);

    int batchInsert(@Param("list") List<OrderConsignee> list);
}