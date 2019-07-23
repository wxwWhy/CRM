package com.javasm.crm.palautus.mapper;

import java.util.List;

import com.javasm.crm.palautus.entity.returngoods;

public interface returngoodsMapper {
    int insert(returngoods record);

    int insertSelective(returngoods record);
    
    List<returngoods> all(returngoods r);
}