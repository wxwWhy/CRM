package com.javasm.crm.palautus.service;

import java.util.List;

import com.javasm.crm.palautus.entity.Returnrepirgoods;

public interface IReturnRepirGoodsService {

	
	 int insert(Returnrepirgoods record);

	    int insertSelective(Returnrepirgoods record);
	    
	    List<Returnrepirgoods> all(Returnrepirgoods record);
	    
	    int update(Returnrepirgoods record);
}
