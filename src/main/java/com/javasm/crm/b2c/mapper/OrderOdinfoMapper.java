package com.javasm.crm.b2c.mapper;

import com.javasm.crm.b2c.entity.Order;
import com.javasm.crm.b2c.entity.OrderOdinfo;
import com.javasm.crm.b2c.entity.Orderinformation;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderOdinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderOdinfo record);

    int insertSelective(OrderOdinfo record);

    OrderOdinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderOdinfo record);

    int updateByPrimaryKey(OrderOdinfo record);

    int updateBatch(List<OrderOdinfo> list);

    int batchInsert(@Param("list") List<OrderOdinfo> list);

    //查询所有
    List<Order> selectAll();
    
    public List<Orderinformation> selectOrderinfoByid2(int orderId);
}