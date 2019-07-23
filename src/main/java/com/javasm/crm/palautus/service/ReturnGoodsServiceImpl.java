package com.javasm.crm.palautus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasm.crm.palautus.entity.returngoods;
import com.javasm.crm.palautus.mapper.returngoodsMapper;

@Service
public class ReturnGoodsServiceImpl implements IReturnGoodsService {
	
	@Autowired
	private returngoodsMapper rgm;
	
	@Override
	public List<returngoods> all(returngoods r) {
		List<returngoods> all = rgm.all(r);
		return all;
	}

}
