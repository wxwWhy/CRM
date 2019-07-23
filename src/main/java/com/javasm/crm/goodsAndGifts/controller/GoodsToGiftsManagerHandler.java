package com.javasm.crm.goodsAndGifts.controller;

import java.util.ArrayList;
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
import com.javasm.crm.goodsAndGifts.entity.GoodsAudit;
import com.javasm.crm.goodsAndGifts.entity.Goodsquery;
import com.javasm.crm.goodsAndGifts.entity.SecondGoods;
import com.javasm.crm.goodsAndGifts.service.GoodsToGiftsService;
import com.javasm.crm.goodsAndGifts.utils.PageUtil;

@Controller
@RequestMapping("/gtogmanager")
public class GoodsToGiftsManagerHandler {
	@Autowired
	private GoodsToGiftsService gtogss;
	
	@RequestMapping("/go")
	public String aaa() {
		return "goods/GoodsToGiftsManager";
	}
	
	@RequestMapping(value = "/all2")
	@ResponseBody
	public PageInfo<GoodsAudit> all(@RequestParam(defaultValue="1")int pageNum,Model model){
		PageHelper.startPage(pageNum, 10);
		List<GoodsAudit> all = gtogss.getAll();
		PageInfo<GoodsAudit> pi = new PageInfo<>(all);

		return pi;
	}
	
	@RequestMapping("/querygoods")

	public String QueryGift() {
		return "goods/QueryGoods";
	}
	
	@RequestMapping(value = "/allgoods")
	@ResponseBody
	public PageInfo<SecondGoods> getAllGoods(@RequestParam(defaultValue="1")int pageNum,Model model){
		PageHelper.startPage(pageNum, 10);
		List<SecondGoods> ul = gtogss.getAllGoods();
		PageInfo<SecondGoods> pi = new PageInfo<>(ul);
		
		return pi;
	}
	
	@RequestMapping(value = "/newGoods")
	@ResponseBody
	public SecondGoods getNewGoodsById(int sid) {
		
		SecondGoods goodsById = gtogss.getNewGoodsById(sid);
		return goodsById;	
	}

	@RequestMapping(value = "/add")
	@ResponseBody
	public void add(int sid,String sname,String stype,String sminrepertory,String sshoppingprice,String code,String addGoods,String newprice) {
		int code1 = Integer.parseInt(code);
		
		int sminrepertory1 = Integer.parseInt(sminrepertory);
		int sshoppingprice1 = Integer.parseInt(sshoppingprice);
		
		int addGoods1 = Integer.parseInt(addGoods);
		int newprice1 = Integer.parseInt(newprice);
		gtogss.AddAudit(sid,sname,stype,sminrepertory1,sshoppingprice1,code1,addGoods1,newprice1);
	    
	}
	
	@RequestMapping(value = "/Querybtn")
	@ResponseBody
	public GoodsAudit Querybtn(String code) {
		int code2 = Integer.parseInt(code);
		GoodsAudit goods = gtogss.getGoodsByCode(code2);
		return goods;
		
	}
	
	@RequestMapping(value = "/update")
	@ResponseBody
	public void Update(int id,String addgifts,String newprice) {
		
		int addgifts1 = Integer.parseInt(addgifts);
		int newprice1 = Integer.parseInt(newprice);
		gtogss.Update(id,addgifts1,newprice1);	
	}
	
	@RequestMapping(value = "/delete")
	@ResponseBody
	public void Delete(int id) {
		gtogss.Delete(id);	
	}
	
	@RequestMapping(value = "/SHGZbtn")
	@ResponseBody
	public GoodsAudit SHGZbtn(int id) {
		GoodsAudit shgZbtn = gtogss.SHGZbtn(id);
		
		return shgZbtn;
	}
	
	@RequestMapping(value = "/ssgoods")
	@ResponseBody
	public PageInfo<GoodsAudit> SSGoods(@RequestParam(defaultValue="1")int pageNum,String gname,String type,String status) {
		PageHelper.startPage(pageNum, 10);
		List<GoodsAudit> ssGoods = gtogss.SSGoods(gname,type,status);
		PageInfo<GoodsAudit> pi = new PageInfo<>(ssGoods);
		return pi;
	}
	

	
}
