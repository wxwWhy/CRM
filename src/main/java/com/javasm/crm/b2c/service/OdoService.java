package com.javasm.crm.b2c.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.javasm.crm.b2c.entity.Odo;
import com.javasm.crm.b2c.entity.Order;
import com.javasm.crm.b2c.mapper.OdoMapper;
import com.javasm.crm.b2c.mapper.OrderMapper;

//销售出库单
@Service
public class OdoService {
     
	@Resource
    private OrderMapper orderMapper;

	@Resource
    private OdoMapper om;
	
	//生成销售出库单记录
	public String create(Order order) {
	 List<Order> listOrder = orderMapper.selectAll(order);
	  String reuslt = "";
	
	 //遍历listOrder,向每条记录插入创建人和创建时间，然后条用方法插入到相应的数据库中
	 for(int i=0;i<listOrder.size();i++) {
		 Order order1 = listOrder.get(i);
		 List<Odo>  listOdo = new ArrayList<>();
		 Odo  odo  = new Odo();
		 
		 //从Order中取值存放到Odo中
		 odo.setOrderid(order1.getOrderid());
		 odo.setOrdertype(order1.getOrdertype());
		 odo.setOrderaction(order1.getOrderaction());
		 odo.setBusinesstype(order1.getBusinesstype());
		 odo.setPaymode(order1.getPaymode());
		 odo.setOrderdate(order1.getOrderdate());
		 odo.setOrderstate(order1.getOrderstate());
		 odo.setDistributionway(order1.getDistributionway());
		 odo.setMemberaccount (order1.getMemberaccount());
		 odo.setProductid(order1.getProductid()); 
		 odo.setCommoditylist(order1.getCommoditylist());
		 
		 //获取当前的时间，并转化为字符创的形式
		 SimpleDateFormat tempDate = new SimpleDateFormat("yyyy-MM-dd");  
		 String datetime = tempDate.format(new java.util.Date());  
		 odo.setCreateTime (datetime);  
		 
		 odo.setCreateMan("小明");
		 listOdo.add(odo);
		 
		 int aa = om.insert(listOdo);
		 String str = String.valueOf(aa);
		 if(str !=null && str !="") {
			 reuslt = "生成销售出库单成功";
		 }else{
			 reuslt = "生成销售出库单失败";
		 }
	 }
	  
	 return reuslt;
	}

	
	//查询所有
	public List<Odo> selectAll(Odo odo){
		return om.selectAll(odo);
	}
	

	
	
}
