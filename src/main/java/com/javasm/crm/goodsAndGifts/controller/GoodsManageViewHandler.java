package com.javasm.crm.goodsAndGifts.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.javasm.crm.goodsAndGifts.entity.FirstGoods;
import com.javasm.crm.goodsAndGifts.entity.SecondGoods;
import com.javasm.crm.goodsAndGifts.service.GoodsManageViewService;
import com.javasm.crm.goodsAndGifts.utils.PageUtil;

@Controller
@RequestMapping("/goods")
public class GoodsManageViewHandler {
	@Autowired
	GoodsManageViewService goodsManageService;

	@RequestMapping("/gmanage")
	public String goGMview() {
		return "/goods/goodsManageView";
	}
	
	@RequestMapping("/selfirst")
	public String gofirst() {
		return "/goods/productFirstSelectView";
	}
	
	
	//根据id查询商品
	@RequestMapping("/selectGoodById")
	@ResponseBody
	public FirstGoods selectGoodById(Integer fid) {
		return goodsManageService.getGoodById(fid);
	}

	
	//用FirstGoods传不过来，可能是name改变了
//	@RequestMapping(value="/addfirstgoods",method= {RequestMethod.GET,RequestMethod.POST})
//	@ResponseBody
//	public String addFirstGoods(FirstGoods firstGoods) {
//		System.out.println("addFirstGoods test");
//		goodsManageService.insertFirstGoods(firstGoods);
//	//	return "redirect:/goods/gmanage";
//		return "msg test";
//	}
	
	//出此下策，自己配,  因为form表单没有被 自动放入到FirstGoods，未知错误
	@RequestMapping("/addfir")
	@ResponseBody
	public void getgyeryinfo(@RequestParam("ffilenumber") String ffilenumber,
			@RequestParam("fbasetype") String fbasetype,
			@RequestParam("fbasebrand") String fbasebrand,
			@RequestParam("fbasemodel") String fbasemodel,
			@RequestParam("fbusinesspattern") String fbusinesspattern,
			@RequestParam("fbasecolor") String fbasecolor,
			@RequestParam("fbasepurchasepattern") String fbasepurchasepattern,
			@RequestParam("fmedic") String fmedic,
			@RequestParam("fbasestandby") String fbasestandby,
			@RequestParam("fname") String fname,
			@RequestParam("ftype") String ftype,
			@RequestParam("fpurchaseprice") String fpurchaseprice,
			@RequestParam("fmarketprice") String fmarketprice,
			@RequestParam("fshoppingmallprice") String fshoppingmallprice,
			@RequestParam("fminrepertory") String fminrepertory,
			@RequestParam("fifpurchase") String fifpurchase) {
		
		FirstGoods firstGoods = new FirstGoods(Integer.valueOf(ffilenumber),
				fbasecolor, fbasemodel,fbasebrand,fbasetype);
		if (fname!=null&&fname!="") {
			firstGoods.setFname(fname);
		}
		if (ftype!=null&&ftype!="") {
			firstGoods.setFtype(ftype);
		}
		if (fpurchaseprice!=null&&fpurchaseprice!="") {
			firstGoods.setFpurchaseprice(Double.valueOf(fpurchaseprice));
		}
		if (fmarketprice!=null&&fmarketprice!="") {
			firstGoods.setFmarketprice(Double.valueOf(fmarketprice));
		}
		if (fshoppingmallprice.trim()!=null&&fshoppingmallprice.trim()!="") {
			firstGoods.setFshoppingmallprice(Double.valueOf(fshoppingmallprice.trim()));
		}
		if (fminrepertory.trim()!=null&&fminrepertory.trim()!="") {
			firstGoods.setFminrepertory(Integer.valueOf(fminrepertory.trim()));
		}
		if (fifpurchase!=null&&fifpurchase!="") {
			firstGoods.setFifpurchase(fifpurchase);
		}
		
		int temp = goodsManageService.insertFirstGoods(firstGoods);
		
	}
	
	
	@RequestMapping(value="/secondOption",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> secondOption(){
		Map<String, Object> map = new HashMap<>();
		List<String> brandList = new ArrayList<>();
		List<String> colorList = goodsManageService.selfDistinctColor();
		map.put("colorList", colorList);
		brandList = goodsManageService.selDistinctBrand();
		map.put("brandList", brandList);
		List<String> allBrandList = goodsManageService.getAllBrandName();
		map.put("allBrandList", allBrandList);
//		List<String> typeList = goodsquerService.getDistinctType();
//		map.put("typeList", typeList);
		return map;
	}
	
	@RequestMapping(value="/insirtsecond",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String insertSeGoods(SecondGoods secondGoods) {
		goodsManageService.insertSecondGoods(secondGoods);
		return "msg";
	}
	
	
	@RequestMapping(value="/allFSgoods",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public PageUtil<FirstGoods> allFSgoods(@RequestParam(defaultValue="1")int pageNumber,@RequestParam(defaultValue="2")int pageSize,FirstGoods firstGoods){
		PageHelper.startPage(pageNumber, pageSize);
		List<FirstGoods> gList = new ArrayList<>();
		gList  = goodsManageService.getallFirstGoods(firstGoods);
		PageUtil<FirstGoods> pageUtil = new PageUtil<>(gList);
		return pageUtil;
	}
	
	
	@RequestMapping(value="/updatefirst",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String updatefirst(FirstGoods firstGoods) {
		goodsManageService.updateFirstGoods(firstGoods);
		return "update msg";
	}
	
	@RequestMapping(value="/deletefirst",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String deletefirst(FirstGoods firstGoods) {
		goodsManageService.deleteFirstGoods(firstGoods);
		return "delete msg";
	}
}
























