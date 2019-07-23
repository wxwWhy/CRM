package com.javasm.crm.goodsAndGifts.service;

import java.util.List;

import com.javasm.crm.goodsAndGifts.entity.GoodsAudit;

public interface GoodsToGiftsAuditService {
	public List<GoodsAudit> QueryAudit();
	public GoodsAudit Querybtn(int id);
	public int Audit(int id,String reviewer,String time,String status);
	public List<GoodsAudit> getNums();
	public int UpdateGood(int code,int addgifts,int newprice);
	public int UpdateGift(int code,int addgifts,int newprice);
    public int DeleteAudit(int id);
    public List<GoodsAudit> GetStatus(String status);
}
