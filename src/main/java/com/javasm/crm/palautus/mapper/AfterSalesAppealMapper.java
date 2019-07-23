package com.javasm.crm.palautus.mapper;

import java.util.List;

import com.javasm.crm.palautus.entity.AfterSalesAppeal;

public interface AfterSalesAppealMapper {
    int insert(AfterSalesAppeal record);

    int insertSelective(AfterSalesAppeal record);
    
    
    public List<AfterSalesAppeal> all(AfterSalesAppeal a);
    
    public int dele(AfterSalesAppeal a);
    
    public int update (AfterSalesAppeal record);
}