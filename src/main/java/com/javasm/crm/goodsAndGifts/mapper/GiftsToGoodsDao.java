package com.javasm.crm.goodsAndGifts.mapper;

import java.util.List;

import com.javasm.crm.goodsAndGifts.entity.Gifts;
import com.javasm.crm.goodsAndGifts.entity.GiftsAudit;
import com.javasm.crm.goodsAndGifts.entity.GoodsAudit;
import com.javasm.crm.goodsAndGifts.entity.Goodsquery;
import com.javasm.crm.goodsAndGifts.entity.SecondGoods;

public interface GiftsToGoodsDao {
	public List<GiftsAudit> getAll();
	public List<Gifts> getAllGoods();
	public Gifts getNewGoodsById(int id);
	public int AddAudit(int id,String gname,String type,int number,int price,int cost,String color,int addgifts,int newprice,int code);
	public GiftsAudit getGoodsByCode(int code);
	public int Update(int id,int addgifts,int newprice);
	public int Delete(int id);
	public GiftsAudit SHGZbtn(int id);
	public List<GiftsAudit> SSGoods(String gname,String type,String status);
	
}
