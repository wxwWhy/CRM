package com.javasm.crm.goodsAndGifts.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasm.crm.goodsAndGifts.entity.GoodsAudit;
import com.javasm.crm.goodsAndGifts.mapper.GoodsToGiftsAuditDao;
import com.javasm.crm.goodsAndGifts.service.GoodsToGiftsAuditService;
@Service
public class GoodsToGiftsAuditServiceImpl implements GoodsToGiftsAuditService{
	@Autowired
	private GoodsToGiftsAuditDao gd;

	@Override
	public List<GoodsAudit> QueryAudit() {
		
		return gd.QueryAudit();
	}

	@Override
	public int Audit(int id, String reviewer, String time, String status) {
		
		return gd.Audit(id,reviewer,time,status);
	}

	@Override
	public GoodsAudit Querybtn(int id) {
		
		return gd.Querybtn(id);
	}

	@Override
	public List<GoodsAudit> getNums() {
		
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
	public List<GoodsAudit> GetStatus(String status) {
		
		return gd.GetStatus(status);
	}

}
