package com.javasm.crm.goodsAndGifts.mapper;

import java.util.List;

import com.javasm.crm.goodsAndGifts.entity.Gifts;
import com.javasm.crm.goodsAndGifts.entity.Goodsquery;



public interface GiftsDao {
	public List<Gifts> getGifts() ;
	public Gifts getGiftByID(int id);
	public int update(Gifts g);
	public int delGifts(int id);
	public int add(Gifts g);
	public List<Gifts> QueryGift(String gname,String type);
	
}
