package com.javasm.crm.b2c.mapper;

import com.javasm.crm.b2c.entity.Orderinformation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderinformationMapper {
   
	//根据订单id来查询
	public List<Orderinformation> selectOne(int orderId);
	
	
	
}