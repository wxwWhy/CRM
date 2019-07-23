package com.javasm.crm.b2c.service;

import com.javasm.crm.b2c.entity.Orderinformation;
import com.javasm.crm.b2c.mapper.OrderinformationMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderinformationService {
   
	@Resource
	private  OrderinformationMapper om;
	
	public List<Orderinformation> selectOne(int orderId){
		return om.selectOne(orderId);
	}

}




