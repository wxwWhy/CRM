package com.javasm.crm.goodsAndGifts.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.javasm.crm.goodsAndGifts.entity.Brand;
import com.javasm.crm.goodsAndGifts.mapper.BrandDao;
import com.javasm.crm.goodsAndGifts.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService{
	@Resource
	private BrandDao bd;
	
	//获取所有品牌
	@Override
	public List<Brand> getAllBrands(Brand brand) {
		return bd.getAllBrands(brand);
	}
	
	//删除品牌
	@Override
	public Integer deleteBrandById(Integer brand_id) {
		return bd.deleteBrandById(brand_id);
	}

	//修改品牌
	@Override
	public Integer updateBrandById(Brand brand) {
		return bd.updateBrandById(brand);
	}
	
	//根据id获取单个品牌
	@Override
	public Brand getBrandById(Integer brand_id) {
		return bd.getBrandById(brand_id);
	}
	
	//新增品牌
	@Override
	public Integer addBrand(Brand brand) {
		return bd.addBrand(brand);
	}
	
	//批量插入
	@Override
	public Integer batchAddBrands(List<Brand> list) {
		return bd.batchAddBrands(list);
	}
	

}
