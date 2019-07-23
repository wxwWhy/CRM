package com.javasm.crm.user.mapper;

import com.javasm.crm.user.entity.Position;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PositionMapper {
    int deleteByPrimaryKey(Integer positionId);

    int insert(Position record);

    int insertSelective(Position record);

    Position selectByPrimaryKey(Integer positionId);

    int updateByPrimaryKeySelective(Position record);

    int updateByPrimaryKey(Position record);

    int updateBatch(List<Position> list);

    int batchInsert(@Param("list") List<Position> list);

    List<Position> selectAll();
}