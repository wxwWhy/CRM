package com.javasm.crm.goodsAndGifts.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasm.crm.goodsAndGifts.entity.Gifts;
import com.javasm.crm.goodsAndGifts.entity.GiftsAudit;
import com.javasm.crm.goodsAndGifts.entity.GoodsAudit;
import com.javasm.crm.goodsAndGifts.mapper.GiftsToGoodsAuditDao;
import com.javasm.crm.goodsAndGifts.mapper.GoodsToGiftsAuditDao;
import com.javasm.crm.goodsAndGifts.service.GiftsToGoodsAuditService;

@Service
public class GiftsToGoodsAuditServiceImpl implements GiftsToGoodsAuditService{
	
	@Autowired
	private GiftsToGoodsAuditDao gd;

	@Override
	public List<GiftsAudit> QueryAudit() {
		
		return gd.QueryAudit();
	}

	@Override
	public int Audit(int id, String reviewer, String time, String status) {
		
		return gd.Audit(id,reviewer,time,status);
	}

	@Override
	public GiftsAudit Querybtn(int id) {
		
		return gd.Querybtn(id);
	}

	@Override
	public List<GiftsAudit> getNums() {
		
		return gd.getNums();
	}

	@Override
	public int UpdateGood(int code, int addgifts, int newprice) {
		
		return gd.UpdateGood(code,addgifts,newprice);
	}

	@Override
	public int UpdateGift(int code, int addgifts, int newprice) {
		
		return gd.UpdateGift(code,addgifts,newprice);
	}

	@Override
	public int DeleteAudit(int id) {
		
		return gd.DeleteAudit(id);
	}

	@Override
	public List<GiftsAudit> GetStatus(String status) {
		
		return gd.GetStatus(status);
	}

}
