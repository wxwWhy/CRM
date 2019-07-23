package com.javasm.crm.goodsAndGifts.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasm.crm.goodsAndGifts.entity.Gifts;
import com.javasm.crm.goodsAndGifts.entity.GiftsAudit;
import com.javasm.crm.goodsAndGifts.entity.GoodsAudit;
import com.javasm.crm.goodsAndGifts.entity.Goodsquery;
import com.javasm.crm.goodsAndGifts.entity.SecondGoods;
import com.javasm.crm.goodsAndGifts.mapper.GiftsToGoodsDao;
import com.javasm.crm.goodsAndGifts.mapper.GoodsToGiftsDao;
import com.javasm.crm.goodsAndGifts.service.GiftsToGoodsService;


@Service
public class GiftsToGoodsServiceImpl implements GiftsToGoodsService{
	 @Autowired
		private GiftsToGoodsDao gd;
	    
		@Override
		public List<GiftsAudit> getAll() {
			
			return gd.getAll();
		}

		@Override
		public List<Gifts> getAllGoods() {
			
			return gd.getAllGoods();
		}

		@Override
		public Gifts getNewGoodsById(int id) {
			
			return gd.getNewGoodsById(id);
		}

		@Override
		public int AddAudit(int id,String gname,String type,int number,int price,int cost,String color,int addgifts,int newprice,int code) {
			
			return gd.AddAudit(id,gname,type,number,price,cost,color,addgifts,newprice,code);
		}

		@Override
		public GiftsAudit getGoodsByCode(int code) {
			
			return gd.getGoodsByCode(code);
		}

		@Override
		public int Update(int id, int addgifts,int newprice) {
			
			return gd.Update(id,addgifts,newprice);
		}

		@Override
		public int Delete(int id) {
			
			return gd.Delete(id);
		}

		@Override
		public GiftsAudit SHGZbtn(int id) {
			
			return gd.SHGZbtn(id);
		}

		@Override
		public List<GiftsAudit> SSGoods(String gname, String type, String status) {
			
			return gd.SSGoods(gname,type,status);
		}

		
}
