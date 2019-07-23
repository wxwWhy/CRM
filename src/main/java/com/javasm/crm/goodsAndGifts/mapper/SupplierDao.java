package com.javasm.crm.goodsAndGifts.mapper;

import java.util.List;

import com.javasm.crm.goodsAndGifts.entity.Supplier;

/**
 * 供应商持久化层
 * @author JAVASM
 *
 */
public interface SupplierDao {
	/**
	 * 获取所有供应商
	 * @param supplier
	 * @return
	 */
	List<Supplier> getAllSupplier(Supplier supplier);
	
	/**
	 * 获取表中所有供应商的联系地址
	 * @return
	 */
	List<String> getAllSupplierAddress();
	
	/**
	 * 根据id查询供应商
	 * @param s_id
	 * @return
	 */
	Supplier getSupplierById(Integer s_id);
	
	/**
	 * 新增供应商
	 * @param supplier
	 * @return
	 */
	Integer addSupplier(Supplier supplier);
	
	/**
	 * 删除供应商
	 * @param s_id
	 * @return
	 */
	Integer deleteSupplierById(Integer s_id);
	
	/**
	 * 修改供应商
	 * @param supplier
	 * @return
	 */
	Integer updateSupplier(Supplier supplier);
}
