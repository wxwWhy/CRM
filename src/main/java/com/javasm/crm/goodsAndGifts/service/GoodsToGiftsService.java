package com.javasm.crm.goodsAndGifts.service;

import java.util.List;

import com.javasm.crm.goodsAndGifts.entity.Gifts;
import com.javasm.crm.goodsAndGifts.entity.GoodsAudit;
import com.javasm.crm.goodsAndGifts.entity.SecondGoods;


public interface GoodsToGiftsService {
    public List<GoodsAudit> getAll();
    public List<SecondGoods> getAllGoods();
    public SecondGoods getNewGoodsById(int id);
    public int AddAudit(int sid,String sname,String stype,int sminrepertory,int sshoppingprice,int code,int addGoods,int newprice);
    public GoodsAudit getGoodsByCode(int code);
    public int Update(int id,int addgifts,int newprice);
    public int Delete(int id);
    public GoodsAudit SHGZbtn(int id);
    public List<GoodsAudit> SSGoods(String gname,String type,String status);
    
}
