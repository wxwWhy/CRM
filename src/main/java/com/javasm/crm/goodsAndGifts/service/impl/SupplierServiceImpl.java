package com.javasm.crm.goodsAndGifts.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasm.crm.goodsAndGifts.entity.Supplier;
import com.javasm.crm.goodsAndGifts.mapper.SupplierDao;
import com.javasm.crm.goodsAndGifts.service.SupplierService;

/**
 * 供应商服务层实现类
 * @author JAVASM
 *
 */


@Service
public class SupplierServiceImpl implements SupplierService{
	
	@Autowired
	private SupplierDao sd;
	
	//获取所有供应商
	@Override
	public List<Supplier> getAllSupplier(Supplier supplier) {
		return sd.getAllSupplier(supplier);
		
	}
	
	//根据id查询供应商
	@Override
	public Supplier getSupplierById(Integer s_id) {
		return sd.getSupplierById(s_id);
	}
	
	//修改供应商
	@Override
	public Integer updateSupplier(Supplier supplier) {
		return sd.updateSupplier(supplier);
	}
	
	//新增供应商
	@Override
	public Integer addSupplier(Supplier supplier) {
		return sd.addSupplier(supplier);
	}

	//删除供应商
	@Override
	public Integer deleteSupplierById(Integer s_id) {
		return sd.deleteSupplierById(s_id);
	}

	@Override
	public List<String> getAllSupplierAddress() {
		return sd.getAllSupplierAddress();
	}

	
	
}
