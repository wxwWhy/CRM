package com.javasm.crm.b2c.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.javasm.crm.b2c.entity.Order;
import com.javasm.crm.b2c.service.ConsigneeService;
import com.javasm.crm.b2c.service.OdoService;
import com.javasm.crm.b2c.service.OrderService;
import com.javasm.crm.b2c.service.OrderinformationService;
import com.javasm.crm.goodsAndGifts.utils.PageUtil;

//销售出库管理

@Controller
@RequestMapping("/ob")
public class ObSalesHandler {
	

	@Autowired
	 private OrderService os;
	 
	@Autowired
	private ConsigneeService cs;
	
	@Autowired
	private OrderinformationService om;
	
	@Autowired
	private OdoService odoSevice;
	
	@RequestMapping("/go")
	public String go() {
		return "b2c/xiaoshouchuku";
	}

	
	//分页查询所有
	@RequestMapping("/selAll")
	@ResponseBody
	public  PageUtil<Order> selectAll(@RequestParam(defaultValue="1")int pageNumber,@RequestParam(defaultValue="5")int pageSize,Order order){
		   System.out.println(order.getCommoditylist()+"------------------------------------------");
		PageHelper.startPage(pageNumber, pageSize);//分页开始
		List<Order> pp = os.selectAll(order);
		PageUtil<Order> pageUtil = new PageUtil<Order>(pp);
		return  pageUtil;
}
	
    //生成销售出库单
	//分页查询所有
	@RequestMapping("/create")
	@ResponseBody
	public String create() {
		Order order = new Order();
		String result = odoSevice.create(order);
		
		return result;
	}
}
