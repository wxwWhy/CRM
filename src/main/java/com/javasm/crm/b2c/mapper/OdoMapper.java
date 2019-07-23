package com.javasm.crm.b2c.mapper;

import java.util.List;

import com.javasm.crm.b2c.entity.Odo;

// 销售出库单
public interface OdoMapper {
  
	//生成销售出库单
	int insert(List<Odo> listOdo);
	
	//查询所有
	List<Odo> selectAll(Odo odo);
	
}
