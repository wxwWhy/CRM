package com.javasm.crm.goodsAndGifts.mapper;

import java.util.List;

import com.javasm.crm.goodsAndGifts.entity.FirstGoods;
import com.javasm.crm.goodsAndGifts.entity.Goodsquery;
import com.javasm.crm.goodsAndGifts.entity.SecondGoods;

public interface GoodsManageViewDao {
	
	int insertFirstGoods(FirstGoods firstGoods);
	
	List<String> selDistinctBrand();
	
	int insertSecondGoods(SecondGoods secondGoods);
	
	List<String> selfDistinctColor();
	
	List<String> selsDistinctColor();
	
	List<String> getAllBrandName();
	
	List<FirstGoods> getallFirstGoods(FirstGoods firstGoods);
	
	int updateFirstGoods(FirstGoods firstGoods);
	
	int deleteFirstGoods(FirstGoods firstGoods);
	
	
	/**
	 * 根据id查询商品
	 * @param fid
	 * @return
	 */
	FirstGoods getGoodById(Integer fid);
}
