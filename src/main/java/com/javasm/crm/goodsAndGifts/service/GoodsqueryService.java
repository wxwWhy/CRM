package com.javasm.crm.goodsAndGifts.service;

import com.javasm.crm.goodsAndGifts.entity.Goodsquery;
import com.javasm.crm.goodsAndGifts.mapper.GoodsqueryMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class GoodsqueryService {

    @Resource
    private GoodsqueryMapper goodsqueryMapper;


    public int deleteByPrimaryKey(Integer id) {
        return goodsqueryMapper.deleteByPrimaryKey(id);
    }

    public int insert(Goodsquery record) {
        return goodsqueryMapper.insert(record);
    }

    public int insertSelective(Goodsquery record) {
        return goodsqueryMapper.insertSelective(record);
    }


    public Goodsquery selectByPrimaryKey(Integer id) {
        return goodsqueryMapper.selectByPrimaryKey(id);
    }


    public int updateByPrimaryKeySelective(Goodsquery record) {
        return goodsqueryMapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(Goodsquery record) {
        return goodsqueryMapper.updateByPrimaryKey(record);
    }

    public int updateBatch(List<Goodsquery> list) {
        return goodsqueryMapper.updateBatch(list);
    }

    public int batchInsert(List<Goodsquery> list) {
        return goodsqueryMapper.batchInsert(list);
    }
    
    public List<Goodsquery> getallGoods(Goodsquery goodsquery){
    	return goodsqueryMapper.getallGoods(goodsquery);
    }
    
    public List<String> getDistinctColor(){
    	return goodsqueryMapper.getDistinctColor();
    }
    
    public List<String> getDistinctBrand(){
    	return goodsqueryMapper.getDistinctBrand();
    };
	
	public List<String> getDistinctType(){
		return goodsqueryMapper.getDistinctType();
	}
	

}

