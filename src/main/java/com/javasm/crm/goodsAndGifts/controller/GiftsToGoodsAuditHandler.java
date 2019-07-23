package com.javasm.crm.goodsAndGifts.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javasm.crm.goodsAndGifts.entity.Gifts;
import com.javasm.crm.goodsAndGifts.entity.GiftsAudit;
import com.javasm.crm.goodsAndGifts.entity.GoodsAudit;
import com.javasm.crm.goodsAndGifts.entity.SecondGoods;
import com.javasm.crm.goodsAndGifts.service.GiftsToGoodsAuditService;
import com.javasm.crm.goodsAndGifts.service.GoodsToGiftsAuditService;

@Controller
@RequestMapping("/audit")
public class GiftsToGoodsAuditHandler {
	
	
	@Autowired
	private GiftsToGoodsAuditService gs;
    
	@RequestMapping("/goaudit")
	public String goAudit() {
		return "goods/GiftsToGoodsAudit";
	}
	
	@RequestMapping(value = "/queryaudit")
	@ResponseBody
	public PageInfo<GiftsAudit> QueryAudit(@RequestParam(defaultValue="1")int pageNum,Model model){
		ChangeNum();
		PageHelper.startPage(pageNum, 10);
		
		List<GiftsAudit> ul = gs.QueryAudit();
		PageInfo<GiftsAudit> pi = new PageInfo<>(ul);
		System.out.println(pi);
		return pi;
	}
	
	@RequestMapping(value = "/Querybtn")
	@ResponseBody
	public GiftsAudit Querybtn(int id) {
		
		GiftsAudit giftByCode = gs.Querybtn(id);
		return giftByCode;
		
	}
	
	@RequestMapping(value = "/admin")
	@ResponseBody
	public void Audit(int id,String reviewer,String time,String status) {
		
		gs.Audit(id,reviewer,time,status);
	}
	
	@RequestMapping(value = "/getstatus")
	@ResponseBody
	public PageInfo<GiftsAudit> GetStatus(@RequestParam(defaultValue="1")int pageNum,String status) {
		PageHelper.startPage(pageNum, 10);
		List<GiftsAudit> ssGoods = gs.GetStatus(status);
		PageInfo<GiftsAudit> pi = new PageInfo<>(ssGoods);
		return pi;
	}
	
	public void ChangeNum() {
		List<GiftsAudit> nums = gs.getNums();
		for(GiftsAudit g:nums) {
			if((g.getStatus()).equals("己审核")) {
				int addgifts = g.getAddgifts();
				int newprice = g.getNewprice();
				int code = g.getCode();
				int id = g.getId();
				gs.UpdateGood(code,addgifts,newprice);
				gs.UpdateGift(code,addgifts,newprice);
				gs.DeleteAudit(id);
				
			}
		}

	}
}
