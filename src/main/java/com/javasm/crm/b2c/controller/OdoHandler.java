package com.javasm.crm.b2c.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.javasm.crm.b2c.entity.Odo;
import com.javasm.crm.b2c.entity.Order;
import com.javasm.crm.b2c.service.OdoService;
import com.javasm.crm.goodsAndGifts.utils.PageUtil;

@Controller
@RequestMapping("/odo")
public class OdoHandler {

	@Autowired
	private OdoService odoService;
	
	
	@RequestMapping("/go")
	public String go() {
		return "b2c/Chukudan";
	}
	
	
	@RequestMapping("/selectAll")
	@ResponseBody
	public  PageUtil<Odo> selectAll(@RequestParam(defaultValue="1")int pageNumber,@RequestParam(defaultValue="5")int pageSize,Odo odo){
		PageHelper.startPage(pageNumber, pageSize);//分页开始
		List<Odo> pp = odoService.selectAll(odo);
		PageUtil<Odo> pageUtil = new PageUtil<Odo>(pp);
		return  pageUtil;
	}



}
