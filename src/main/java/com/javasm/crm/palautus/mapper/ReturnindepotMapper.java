package com.javasm.crm.palautus.mapper;

import java.util.List;

import com.javasm.crm.palautus.entity.Returnindepot;

public interface ReturnindepotMapper {
    int deleteByPrimaryKey(Integer indepotid);

    int insert(Returnindepot record);

    int insertSelective(Returnindepot record);

    Returnindepot selectByPrimaryKey(Integer indepotid);

    int updateByPrimaryKeySelective(Returnindepot record);

    int updateByPrimaryKey(Returnindepot record);
    
    List<Returnindepot> all(Returnindepot record);
}