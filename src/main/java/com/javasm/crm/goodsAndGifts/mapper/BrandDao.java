package com.javasm.crm.goodsAndGifts.mapper;

import java.util.List;

import com.javasm.crm.goodsAndGifts.entity.Brand;

/**
 * 商品品牌持久层
 * @author JAVASM
 *
 */
public interface BrandDao {
	
	/**
	 * 获取所有品牌
	 * @param brand
	 * @return
	 */
	List<Brand> getAllBrands(Brand brand);
	
	/**
	 * 根据id获取单个品牌
	 * @param brand_id
	 * @return
	 */
	Brand getBrandById(Integer brand_id);
	
	/**
	 * 批量插入
	 * @param list
	 * @return
	 */
	Integer batchAddBrands(List<Brand> list);
	
	/**
	 * 新增品牌
	 * @param brand
	 * @return
	 */
	Integer addBrand(Brand brand);
	
	/**
	 * 删除品牌
	 * @param brand_id
	 * @return
	 */
	Integer deleteBrandById(Integer brand_id);
	
	/**
	 * 修改品牌
	 * @param brand_id
	 * @return
	 */
	Integer updateBrandById(Brand brand);
}
