package com.javasm.crm.b2c.service;

import com.javasm.crm.b2c.entity.OrderConsignee;
import com.javasm.crm.b2c.mapper.OrderConsigneeMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderConsigneeService {

    @Resource
    private OrderConsigneeMapper orderConsigneeMapper;

    public int deleteByPrimaryKey(Integer id) {
        return orderConsigneeMapper.deleteByPrimaryKey(id);
    }

    public int insert(OrderConsignee record) {
        return orderConsigneeMapper.insert(record);
    }

    public int insertSelective(OrderConsignee record) {
        return orderConsigneeMapper.insertSelective(record);
    }

    public OrderConsignee selectByPrimaryKey(Integer id) {
        return orderConsigneeMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(OrderConsignee record) {
        return orderConsigneeMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(OrderConsignee record) {
        return orderConsigneeMapper.updateByPrimaryKey(record);
    }

    public int updateBatch(List<OrderConsignee> list) {
        return orderConsigneeMapper.updateBatch(list);
    }

    public int batchInsert(List<OrderConsignee> list) {
        return orderConsigneeMapper.batchInsert(list);
    }

}




