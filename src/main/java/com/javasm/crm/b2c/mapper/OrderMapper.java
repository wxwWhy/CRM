package com.javasm.crm.b2c.mapper;

import com.javasm.crm.b2c.entity.Order;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderMapper {

	 //查询所有以及条件查询
    List<Order> selectAll(Order order);
    
    //批量插入数据
    int insertOrder(List<Order> list);
    
    //查询订单类型
    List<String> selectOrderType(); 
    
    //查询支付方式
    List<String> selectPayMode();
    
    //查询业务类型
    List<String> selectBusinessType();
    
    //查询动作订单         
    List<String> selectOrderAction();
    
    //查询动作订单 orderState        
    List<String> selectOrderState();
    
    //查询所有数据并倒出到外部的Excel表格中
    List<Order> Derive();
    
    //根据订单id查 并查询用户信息
    Order selectOrderAndUserByOid(Order order);
   
}