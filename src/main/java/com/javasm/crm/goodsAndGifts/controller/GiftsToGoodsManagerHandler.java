package com.javasm.crm.goodsAndGifts.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.javasm.crm.goodsAndGifts.entity.Goodsquery;
import com.javasm.crm.goodsAndGifts.entity.SecondGoods;
import com.javasm.crm.goodsAndGifts.service.GiftsToGoodsService;
import com.javasm.crm.goodsAndGifts.service.GoodsToGiftsService;

@Controller
@RequestMapping("/gtog")
public class GiftsToGoodsManagerHandler {
	@Autowired
	private GiftsToGoodsService gtogss;
	
	@RequestMapping("/go")
	public String aaa() {
		return "goods/GiftsToGoodsManager";
	}
	
	@RequestMapping(value = "/all2")
	@ResponseBody
	public PageInfo<GiftsAudit> all(@RequestParam(defaultValue="1")int pageNum,Model model){
		PageHelper.startPage(pageNum, 10);
		List<GiftsAudit> all = gtogss.getAll();
		PageInfo<GiftsAudit> pi = new PageInfo<>(all);

		return pi;
	}
	
	@RequestMapping("/querygoods")

	public String QueryGift() {
		return "goods/QueryGifts";
	}
	
	@RequestMapping(value = "/allgifts")
	@ResponseBody
	public PageInfo<Gifts> getAllGoods(@RequestParam(defaultValue="1")int pageNum,Model model){
		PageHelper.startPage(pageNum, 10);
		List<Gifts> ul = gtogss.getAllGoods();
		PageInfo<Gifts> pi = new PageInfo<>(ul);
		
		return pi;
	}
	
	@RequestMapping(value = "/newGifts")
	@ResponseBody
	public Gifts getNewGoodsById(int id) {
		
		Gifts goodsById = gtogss.getNewGoodsById(id);
		return goodsById;	
	}
	
	@RequestMapping(value = "/add")
	@ResponseBody
	public void add(int id,String gname,String type,String number,String price,String cost,String color,String addgifts,String newprice,String code) {
		int code1 = Integer.parseInt(code);
		
		int number1 = Integer.parseInt(number);
		int price1 = Integer.parseInt(price);
		int cost1 = Integer.parseInt(cost);
		int addgifts1 = Integer.parseInt(addgifts);
		int newprice1 = Integer.parseInt(newprice);
		gtogss.AddAudit(id,gname,type,number1,price1,cost1,color,addgifts1,newprice1,code1);
	    
	}
	
	@RequestMapping(value = "/Querybtn")
	@ResponseBody
	public GiftsAudit Querybtn(String code) {
		int code2 = Integer.parseInt(code);
		GiftsAudit goods = gtogss.getGoodsByCode(code2);
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
	public GiftsAudit SHGZbtn(int id) {
		GiftsAudit shgZbtn = gtogss.SHGZbtn(id);
		
		return shgZbtn;
	}
	
	@RequestMapping(value = "/ssgoods")
	@ResponseBody
	public PageInfo<GiftsAudit> SSGoods(@RequestParam(defaultValue="1")int pageNum,String gname,String type,String status) {
		PageHelper.startPage(pageNum, 10);
		List<GiftsAudit> ssGoods = gtogss.SSGoods(gname,type,status);
		PageInfo<GiftsAudit> pi = new PageInfo<>(ssGoods);
		return pi;
	}
	
	
	
}
