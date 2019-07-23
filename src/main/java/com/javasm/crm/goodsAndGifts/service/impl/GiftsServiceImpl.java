package com.javasm.crm.goodsAndGifts.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.javasm.crm.goodsAndGifts.entity.Gifts;
import com.javasm.crm.goodsAndGifts.mapper.GiftsDao;
import com.javasm.crm.goodsAndGifts.service.GiftsService;


@Service
public class GiftsServiceImpl implements GiftsService{
	@Autowired
	private GiftsDao gd;//鎯虫敞鍏ワ紝鍓嶆彁鏄痵pring瀹瑰櫒涓湁SysuserDao鐨勪唬鐞嗗璞°��

	@Override
	public List<Gifts> getAll() {
		List<Gifts> gifts = gd.getGifts();
		return gifts;
	}

	@Override
	public void insertGifts() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Gifts getGiftByID(int id) {
		
		return gd.getGiftByID(id);
	}
	
	public int update(Gifts g) {
		return gd.update(g);
	}
	
    public int delGifts(int id) {
    	return gd.delGifts(id);
    }

    public int add(Gifts g) {
    	return gd.add(g);
    }
    public List<Gifts> QueryGift(String gname,String type){
    	return gd.QueryGift(gname,type);
    }
}
