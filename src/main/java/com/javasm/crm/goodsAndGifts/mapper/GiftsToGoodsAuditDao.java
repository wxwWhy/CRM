package com.javasm.crm.goodsAndGifts.mapper;

import java.util.List;

import com.javasm.crm.goodsAndGifts.entity.Gifts;
import com.javasm.crm.goodsAndGifts.entity.GiftsAudit;
import com.javasm.crm.goodsAndGifts.entity.GoodsAudit;

public interface GiftsToGoodsAuditDao {
	public List<GiftsAudit> QueryAudit();
	public GiftsAudit Querybtn(int id);
	public int Audit(int id, String reviewer, String time, String status);
    public List<GiftsAudit> getNums();
    public int UpdateGood(int code,int addgifts,int newprice);
    public int UpdateGift(int code,int addgifts,int newprice);
    public int DeleteAudit(int id);
    public List<GiftsAudit> GetStatus(String status);
}
