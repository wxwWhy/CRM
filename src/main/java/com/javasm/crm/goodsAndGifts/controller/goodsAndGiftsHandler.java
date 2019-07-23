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

import com.javasm.crm.goodsAndGifts.service.GiftsService;





@Controller
@RequestMapping("/gifts")
public class goodsAndGiftsHandler {
    @Autowired
	private GiftsService gs;
    
    
	@RequestMapping("/go")
	public String goodsManager() {
		
		return "goods/GiftsManager";
		
	}
	
	
	@RequestMapping(value = "/all1")
	@ResponseBody
	public PageInfo<Gifts> all(@RequestParam(defaultValue="1")int pageNum,Model model){
		PageHelper.startPage(pageNum, 10);
		List<Gifts> ul = gs.getAll();
		PageInfo<Gifts> pi = new PageInfo<>(ul);
		System.out.println(pi);
		return pi;
	}
	
	@RequestMapping(value = "/add")
	@ResponseBody
	public void add(String gname,String type,int number,int price,int cost,String state) {
		Gifts g = new Gifts();
		g.setGname(gname);
		g.setType(type);
		g.setNumber(number);
		g.setPrice(price);
		g.setCost(cost);
		g.setState(state);
		gs.add(g);
	}
	
	@RequestMapping(value = "/update")
	@ResponseBody
	public void update(int id,String gname,String type,int number,int cost,String state) {
		Gifts g = new Gifts();
		g.setId(id);
		g.setGname(gname);
		g.setType(type);
		g.setNumber(number);
		g.setCost(cost);
		g.setState(state);
		gs.update(g);
	}
	
	@RequestMapping(value = "/delete")
	@ResponseBody
	public void delGifts(int id) {
		gs.delGifts(id);
	}
	

	
	@RequestMapping(value = "/Querybtn")
	@ResponseBody
	public Gifts Querybtn(String gid) {
		Integer gid2=Integer.parseInt(gid);
		Gifts giftByID = gs.getGiftByID(gid2);
		return giftByID;
		
	}
	
	@RequestMapping(value = "/Query")
	@ResponseBody
	public PageInfo<Gifts> QueryGift(String name,String type,@RequestParam(defaultValue="1")int pageNum) {
		PageHelper.startPage(pageNum, 10);
		List<Gifts> g = gs.QueryGift(name,type);
		PageInfo<Gifts> pi = new PageInfo<>(g);
		return pi;
	}
}
