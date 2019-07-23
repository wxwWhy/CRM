package com.javasm.crm.goodsAndGifts.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasm.crm.goodsAndGifts.entity.Gifts;
import com.javasm.crm.goodsAndGifts.entity.GoodsAudit;
import com.javasm.crm.goodsAndGifts.entity.SecondGoods;
import com.javasm.crm.goodsAndGifts.mapper.GoodsToGiftsDao;
import com.javasm.crm.goodsAndGifts.service.GoodsToGiftsService;

@Service
public class GoodsToGiftsServiceImpl implements GoodsToGiftsService{
    @Autowired
	private GoodsToGiftsDao gd;
    
	@Override
	public List<GoodsAudit> getAll() {
		
		return gd.getAll();
	}

	@Override
	public List<SecondGoods> getAllGoods() {
		
		return gd.getAllGoods();
	}

	@Override
	public SecondGoods getNewGoodsById(int id) {
		
		return gd.getNewGoodsById(id);
	}

	@Override
	public int AddAudit(int sid, String sname, String stype, int sminrepertory, int sshoppingprice, 
			int code, int addGoods, int newprice) {
		
		return gd.AddAudit(sid,sname,stype,sminrepertory,sshoppingprice,code,addGoods,newprice);
	}

	@Override
	public GoodsAudit getGoodsByCode(int code) {
		
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
	public GoodsAudit SHGZbtn(int id) {
		
		return gd.SHGZbtn(id);
	}

	@Override
	public List<GoodsAudit> SSGoods(String gname, String type, String status) {
		
		return gd.SSGoods(gname,type,status);
	}




}
