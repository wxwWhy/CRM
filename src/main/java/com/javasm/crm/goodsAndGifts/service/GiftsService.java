package com.javasm.crm.goodsAndGifts.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javasm.crm.goodsAndGifts.entity.Gifts;


public interface GiftsService {
	public List<Gifts> getAll();
	public void insertGifts();
	public Gifts getGiftByID(int id);
	public int update(Gifts g);
	public int delGifts(int id);
	public int add(Gifts g);
	public List<Gifts> QueryGift(String name,String type);
}
