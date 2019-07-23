package com.javasm.crm.b2c.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.javasm.crm.b2c.entity.Consignee;
import com.javasm.crm.b2c.mapper.ConsigneeMapper;

@Service
public class ConsigneeService {

	 @Resource
    private ConsigneeMapper cm;
	 
	 //根据会员账号查询会员信息
	 public List<Consignee> selectTwo(int id){
		 return cm.selectTwo(id);
	 }
}




