package com.javasm.crm.b2c.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.javasm.crm.b2c.entity.Order;
import com.javasm.crm.b2c.mapper.OrderMapper;

@Service
public class OrderService {

    @Resource
    private OrderMapper orderMapper;

    //查询所有以及条件查询
    public List<Order> selectAll(Order order) {
    	
    	//得到时间段，然后做字符串分割
    	String orderdate = order.getOrderdate();
    	if(orderdate!=null) {
    	String startTime = orderdate.substring(0, 10);
    	String endTime  = orderdate.substring(13,23);
    	order.setStartTime(startTime);
    	order.setEndTime(endTime);
    	}
        return orderMapper.selectAll(order);
    }

    //批量插入数据
    public int insertOrder(List<Order> list){
    	return orderMapper.insertOrder(list);
    }

    //查询订单类型
    public List<String> selectOrderType(){
    	return orderMapper.selectOrderType();
    }
    
    //查询支付方式 selectBusinessType
    public List<String> selectPayMode(){
    	return orderMapper.selectPayMode();
    }
    
  //查询业务类型  
    public List<String> selectBusinessType(){
    	return orderMapper.selectBusinessType();
    }
    
    //查询动作订单 selectOrderState
    public List<String> selectOrderAction(){
    	return orderMapper.selectOrderAction();
    }
    
  //查询动作订单 selectOrderState
    public List<String> selectOrderState(){
    	return orderMapper.selectOrderState();
    } 
    
    //查询所有数据并导出到excel表格中
    public List<Map<String,String>>  Derive(){
    	
    	List<Map<String,String>> list = new ArrayList<>();
    
    	
    	List<Order> list1 = orderMapper.Derive();
    	//循环遍历list结果集，得到对象
    	for(int i=0;i<list1.size();i++) {
    		Order order = list1.get(i);
    		Map<String,String> map = new HashMap<>();
    		//遍历数组，然后将对象与数组相应的属性保存到map集合中去
    			map = new HashMap<>();
    			 map.put("订单id",String.valueOf( order.getId()));
    			 map.put("订单编号",String.valueOf(order.getOrderid()));
    			 map.put("订单类型",order.getOrdertype() );
    			 map.put("订单动作",order.getOrderaction());
    			 map.put("业务类型",order.getBusinesstype());
    			 map.put("支付方式",order.getPaymode());
    			 map.put("下单日期",order.getOrderdate());
    			 map.put("订单状态",order.getOrderstate() );
    			 map.put("会员账号",String.valueOf(order.getMemberaccount()));
    			 map.put("商品编号", String.valueOf(order.getProductid()));
    			 map.put("配送方式",order.getDistributionway());
    			 map.put("商品清单",order.getCommoditylist());
    			 list.add(map);
    		}
		return list;
    	
    }
    
	/**
	 * 
	* @Title: selectOrderAndUserByOid  
	* @Description: TODO(查询订单id 获取订单和用户信息)  
	* @param @param order
	* @param @return    参数  
	* @return List<Order>    返回类型  
	* @throws
	 */
	public Order selectOrderAndUserByOid(Order order){
		return orderMapper.selectOrderAndUserByOid(order);
	}
    
    
}




