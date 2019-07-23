package com.javasm.crm.palautus.service;

import java.util.List;

import com.javasm.crm.palautus.entity.Returnoutdepot;

public interface IReturnoutdepotService {

	
	
	int deleteByPrimaryKey(Integer outdepotid);

    int insert(Returnoutdepot record);

    int insertSelective(Returnoutdepot record);

    Returnoutdepot selectByPrimaryKey(Integer outdepotid);

    int updateByPrimaryKeySelective(Returnoutdepot record);

    int updateByPrimaryKey(Returnoutdepot record);
    
    List<Returnoutdepot> all(Returnoutdepot r);
}
