package com.javasm.crm.user.mapper;

import com.javasm.crm.user.entity.Menulist;
import com.javasm.crm.user.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MenulistMapper {
    int deleteByPrimaryKey(Integer menuId);

    int insert(Menulist record);

    int insertSelective(Menulist record);

    Menulist selectByPrimaryKey(Integer menuId);

    int updateByPrimaryKeySelective(Menulist record);

    int updateByPrimaryKey(Menulist record);

    int updateBatch(List<Menulist> list);

    int batchInsert(@Param("list") List<Menulist> list);

    List<Menulist> queryMainListByUser(User user);

    List<Menulist> selectAll();
}