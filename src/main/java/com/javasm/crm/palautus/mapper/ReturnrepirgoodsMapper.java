package com.javasm.crm.palautus.mapper;

import java.util.List;

import com.javasm.crm.palautus.entity.Returnrepirgoods;

public interface ReturnrepirgoodsMapper {
    int insert(Returnrepirgoods record);

    int insertSelective(Returnrepirgoods record);
    
    List<Returnrepirgoods> all(Returnrepirgoods record);
    
    int update(Returnrepirgoods record);
}