package com.javasm.crm.palautus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasm.crm.palautus.entity.Returnrepirgoods;
import com.javasm.crm.palautus.mapper.ReturnrepirgoodsMapper;

@Service
public class ReturnRepirGoodsServiceImpl implements IReturnRepirGoodsService {

	@Autowired
	private ReturnrepirgoodsMapper rrgm;
	
	@Override
	public int insert(Returnrepirgoods record) {
		int i = rrgm.insert(record);
		return i;
	}

	@Override
	public int insertSelective(Returnrepirgoods record) {
		int i = rrgm.insertSelective(record);
		return i;
	}

	@Override
	public List<Returnrepirgoods> all(Returnrepirgoods record) {
		List<Returnrepirgoods> all = rrgm.all(record);
		return all;
	}

	@Override
	public int update(Returnrepirgoods record) {
		int i = rrgm.update(record);
		return i;
	}

}
