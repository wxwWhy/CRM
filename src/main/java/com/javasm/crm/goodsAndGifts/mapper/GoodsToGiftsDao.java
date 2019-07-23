package com.javasm.crm.goodsAndGifts.mapper;

import java.util.List;


import com.javasm.crm.goodsAndGifts.entity.GoodsAudit;
import com.javasm.crm.goodsAndGifts.entity.SecondGoods;


public interface GoodsToGiftsDao {
    
	public List<GoodsAudit> getAll();
	public List<SecondGoods> getAllGoods();
	public SecondGoods getNewGoodsById(int id);
	public int AddAudit(int id,String gname,String type,int number,int price,int code,int newprice,int addgifts);
	public GoodsAudit getGoodsByCode(int code);
	public int Update(int id,int addgifts,int newprice);
	public int Delete(int id);
	public GoodsAudit SHGZbtn(int id);
	public List<GoodsAudit> SSGoods(String gname,String type,String status);
	
}
