package com.javasm.crm.goodsAndGifts.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasm.crm.goodsAndGifts.entity.FirstGoods;
import com.javasm.crm.goodsAndGifts.entity.SecondGoods;
import com.javasm.crm.goodsAndGifts.mapper.GoodsManageViewDao;

@Service
public class GoodsManageViewService {
	@Autowired
	private GoodsManageViewDao goodsManageViewDao;
	
	//插入一类商品
	public int insertFirstGoods(FirstGoods firstGoods) {
		return goodsManageViewDao.insertFirstGoods(firstGoods);
	}
	
	public List<String> selDistinctBrand(){
		return goodsManageViewDao.selDistinctBrand();
	}
	
	//插入二类商品
	public int insertSecondGoods(SecondGoods secondGoods) {
		return goodsManageViewDao.insertSecondGoods(secondGoods);
	}

	//所有颜色
	public List<String> selfDistinctColor(){
		List<String> tempList = new ArrayList<>();
		tempList.addAll(goodsManageViewDao.selfDistinctColor());
		tempList.addAll(goodsManageViewDao.selsDistinctColor());
		return tempList;
	}
	//所有品牌名
	public List<String> getAllBrandName(){
		return goodsManageViewDao.getAllBrandName();
	}
	
	//加条件 获得所有一类商品
	public List<FirstGoods> getallFirstGoods(FirstGoods firstGoods){
		return goodsManageViewDao.getallFirstGoods(firstGoods);
	}
		
	//更新一类商品
	public int updateFirstGoods(FirstGoods firstGoods) {
		return goodsManageViewDao.updateFirstGoods(firstGoods);
	}
	
	public int deleteFirstGoods(FirstGoods firstGoods) {
		return goodsManageViewDao.deleteFirstGoods(firstGoods);
	}
	
	
	/**
	 * 根据id查询商品
	 * @param fid
	 * @return
	 */
	public FirstGoods getGoodById(Integer fid) {
		return goodsManageViewDao.getGoodById(fid);
	}
	
	
}












