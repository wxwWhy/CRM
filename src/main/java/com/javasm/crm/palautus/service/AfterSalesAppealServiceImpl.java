package com.javasm.crm.palautus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasm.crm.palautus.entity.AfterSalesAppeal;
import com.javasm.crm.palautus.mapper.AfterSalesAppealMapper;

@Service
public class AfterSalesAppealServiceImpl implements IAfterSalesAppealService {

	@Autowired
	private AfterSalesAppealMapper asam;
	
	public List<AfterSalesAppeal> all(AfterSalesAppeal a){
		List<AfterSalesAppeal> all = asam.all(a);
		return all;
	}

	@Override
	public int dele(AfterSalesAppeal a) {
		int i = asam.dele(a);
		return i;
	}

	@Override
	public int insertSelective(AfterSalesAppeal record) {
		int i = asam.insertSelective(record);
		return i;
	}

	@Override
	public int update(AfterSalesAppeal record) {
		int i = asam.update(record);
		return i;
	};
}
