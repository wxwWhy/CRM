package com.javasm.crm.user.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javasm.crm.user.entity.Position;
import com.javasm.crm.user.mapper.PositionMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class PositionService {

    @Resource
    private PositionMapper positionMapper;

    public int deleteByPrimaryKey(Integer id) {
        return positionMapper.deleteByPrimaryKey(id);
    }

    public int insert(Position record) {
        return positionMapper.insert(record);
    }

    public int insertSelective(Position record) {
        return positionMapper.insertSelective(record);
    }

    public Position selectByPrimaryKey(Integer id) {
        return positionMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKeySelective(Position record) {
        return positionMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Position record) {
        return positionMapper.updateByPrimaryKey(record);
    }

    public int updateBatch(List<Position> list) {
        return positionMapper.updateBatch(list);
    }

    public int batchInsert(List<Position> list) {
        return positionMapper.batchInsert(list);
    }

    public List<Position> selectAll() {
        return positionMapper.selectAll();
    }

    public PageInfo<Position> selectAllwithPage(int page, int pageSize) {
        PageHelper.startPage(page, pageSize);
        return new PageInfo<>(positionMapper.selectAll());
    }
}


