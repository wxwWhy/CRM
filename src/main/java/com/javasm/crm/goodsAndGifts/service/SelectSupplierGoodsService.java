package com.javasm.crm.goodsAndGifts.service;

import java.util.List;

import com.javasm.crm.goodsAndGifts.entity.SelectSupplierGoods;

/**
 * 选用供应商品 服务层
 * @author JAVASM
 *
 */
public interface SelectSupplierGoodsService {
	/**
	 * 根据供应商的id查询其关联的所有供应商品
	 * @param s_id
	 * @return
	 */
	List<SelectSupplierGoods> getAllSelectSupplierGoods(Integer s_id);
	
	/**
	 * 添加供应的商品数据进中间表
	 * @param ssg
	 * @return
	 */
	Integer addSupplierGood(SelectSupplierGoods ssg);
	
	/**
	 * 根据z_id删除所供应的商品
	 * @param z_id
	 * @return
	 */
	Integer delSupplierGood(Integer z_id);
}
