package com.javasm.crm.palautus.service;

import java.util.List;

import com.javasm.crm.palautus.entity.AfterSalesAppeal;

public interface IAfterSalesAppealService {

	
	public int insertSelective(AfterSalesAppeal record);
	
	public List<AfterSalesAppeal> all(AfterSalesAppeal a);
	
	public int update (AfterSalesAppeal record);
	
	
	public int dele(AfterSalesAppeal a);
}
