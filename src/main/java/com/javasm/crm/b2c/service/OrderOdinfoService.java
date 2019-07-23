package com.javasm.crm.b2c.service;

import com.javasm.crm.b2c.entity.OrderOdinfo;
import com.javasm.crm.b2c.mapper.OrderOdinfoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderOdinfoService {

    @Resource
    private OrderOdinfoMapper orderOdinfoMapper;

    public int deleteByPrimaryKey(Integer id) {
        return orderOdinfoMapper.deleteByPrimaryKey(id);
    }

    public int insert(OrderOdinfo record) {
        return orderOdinfoMapper.insert(record);
    }

    public int insertSelective(OrderOdinfo record) {
        return orderOdinfoMapper.insertSelective(record);
    }

    public OrderOdinfo selectByPrimaryKey(Integer id) {
        return orderOdinfoMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(OrderOdinfo record) {
        return orderOdinfoMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(OrderOdinfo record) {
        return orderOdinfoMapper.updateByPrimaryKey(record);
    }

    public int updateBatch(List<OrderOdinfo> list) {
        return orderOdinfoMapper.updateBatch(list);
    }

    public int batchInsert(List<OrderOdinfo> list) {
        return orderOdinfoMapper.batchInsert(list);
    }

}




