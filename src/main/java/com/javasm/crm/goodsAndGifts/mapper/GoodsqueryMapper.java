package com.javasm.crm.goodsAndGifts.mapper;

import com.javasm.crm.goodsAndGifts.entity.Goodsquery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by Mybatis Generator 2019/02/24
 *
 */
public interface GoodsqueryMapper {

	List<Goodsquery> getallGoods(Goodsquery goodsquery);
	
	List<String> getDistinctColor();
	
	List<String> getDistinctBrand();
	
	List<String> getDistinctType();

    int deleteByPrimaryKey(Integer id);

    int insert(Goodsquery record);

    int insertSelective(Goodsquery record);

    Goodsquery selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Goodsquery record);

    int updateByPrimaryKey(Goodsquery record);

    int updateBatch(List<Goodsquery> list);

    int batchInsert(@Param("list") List<Goodsquery> list);
}