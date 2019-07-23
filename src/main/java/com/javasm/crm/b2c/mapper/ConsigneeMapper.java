package com.javasm.crm.b2c.mapper;

import java.util.List;

import com.javasm.crm.b2c.entity.Consignee;

public interface ConsigneeMapper {
    
	//根据会员账号查询会员信息
	List<Consignee> selectTwo(int id);
	
	/**
	 * 
	* @Title: selectConsigneeByid  
	* @Description: TODO(根据订单id 查用户 )  
	* @param @param id
	* @param @return    参数  
	* @return Consignee    返回类型  
	* @throws
	 */
	Consignee selectConsigneeByid(int oid);
}