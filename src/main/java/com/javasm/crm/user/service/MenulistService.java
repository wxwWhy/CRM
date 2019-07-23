package com.javasm.crm.user.service;

import com.javasm.crm.user.entity.Menulist;
import com.javasm.crm.user.entity.User;
import com.javasm.crm.user.mapper.MenulistMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MenulistService {

    @Resource
    private MenulistMapper menulistMapper;

    public int deleteByPrimaryKey(Integer id) {
        return menulistMapper.deleteByPrimaryKey(id);
    }

    public int insert(Menulist record) {
        return menulistMapper.insert(record);
    }

    public int insertSelective(Menulist record) {
        return menulistMapper.insertSelective(record);
    }

    public Menulist selectByPrimaryKey(Integer id) {
        return menulistMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(Menulist record) {
        return menulistMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Menulist record) {
        return menulistMapper.updateByPrimaryKey(record);
    }

    public int updateBatch(List<Menulist> list) {
        return menulistMapper.updateBatch(list);
    }

    public int batchInsert(List<Menulist> list) {
        return menulistMapper.batchInsert(list);
    }

    public List<Menulist> queryMainListByUser(User user) {
        return menulistMapper.queryMainListByUser(user);
    }

    public List<Menulist> selectAll() {
        return menulistMapper.selectAll();
    }
}




