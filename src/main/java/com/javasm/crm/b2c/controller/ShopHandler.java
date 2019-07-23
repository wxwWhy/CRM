package com.javasm.crm.b2c.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.javasm.crm.b2c.entity.Order;
import com.javasm.crm.b2c.service.ConsigneeService;
import com.javasm.crm.b2c.service.OrderService;
import com.javasm.crm.b2c.service.OrderinformationService;
import com.javasm.crm.goodsAndGifts.utils.PageUtil;

//网店订单管理

@Controller
@RequestMapping("shop")
public class ShopHandler {


	@Autowired
	 private OrderService os;
	 
	@Autowired
	private ConsigneeService cs;
	
	@Autowired
	private OrderinformationService om;
	
	@RequestMapping("/go")
	public String go() {
		return "b2c/Shoporder";
	}
		
		//分页查询所有
		@RequestMapping("/selAll")
		@ResponseBody
		public  PageUtil<Order> selectAll(@RequestParam(defaultValue="1")int pageNumber,@RequestParam(defaultValue="5")int pageSize,Order order){
			   System.out.println(order.getCommoditylist()+"");
			PageHelper.startPage(pageNumber, pageSize);//分页开始
			List<Order> pp = os.selectAll(order);
			PageUtil<Order> pageUtil = new PageUtil<Order>(pp);
			return  pageUtil;
	}
		
		

		//查询订单类型     共4个查询，封装到map中返回到前端页面
		@RequestMapping("/selectDow")
		@ResponseBody
		public Map<String,Object> selectDow(){
			Map<String,Object> map = new HashMap<>();
			 
			//查询订单条件
			List<String> listOrderType = os.selectOrderType();
			 map.put("listOrderType", listOrderType);
			 
			//查询支付方式
			 List<String> listPayMode = os.selectPayMode();
			 map.put("listPayMode", listPayMode);
			 
			 //查询业务类型
			 List<String> listBusinessType = os.selectBusinessType();
			 map.put("listBusinessType", listBusinessType);
			 
			 //查询订单状态 
			 List<String> listOrderState = os.selectOrderState();
			 map.put("listOrderState", listOrderState);
			 
			return map;
		}	
		
		
		
		
}
