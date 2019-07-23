package com.javasm.crm.goodsAndGifts.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasm.crm.goodsAndGifts.entity.SelectSupplierGoods;
import com.javasm.crm.goodsAndGifts.mapper.SelectSupplierGoodsDao;
import com.javasm.crm.goodsAndGifts.service.SelectSupplierGoodsService;

/**
 * 选用供应商品服务层  实现类
 * @author JAVASM
 *
 */

@Service
public class SelectSupplierGoodsServiceImpl implements SelectSupplierGoodsService{
	
	@Autowired
	private SelectSupplierGoodsDao ssgd;
		
	@Override
	public List<SelectSupplierGoods> getAllSelectSupplierGoods(Integer s_id) {
		return ssgd.getAllSelectSupplierGoods(s_id);
	}

	@Override
	public Integer addSupplierGood(SelectSupplierGoods ssg) {
		return ssgd.addSupplierGood(ssg);
	}

	@Override
	public Integer delSupplierGood(Integer z_id) {
		return ssgd.delSupplierGood(z_id);
	}

}
