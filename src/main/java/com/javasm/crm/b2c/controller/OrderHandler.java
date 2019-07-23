package com.javasm.crm.b2c.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.github.pagehelper.PageHelper;
import com.javasm.crm.b2c.entity.Consignee;
import com.javasm.crm.b2c.entity.Order;
import com.javasm.crm.b2c.entity.Orderinformation;
import com.javasm.crm.b2c.service.ConsigneeService;
import com.javasm.crm.b2c.service.OrderService;
import com.javasm.crm.b2c.service.OrderinformationService;
import com.javasm.crm.b2c.utils.ReadExcel;
import com.javasm.crm.b2c.utils.WriteWordUtil2;
import com.javasm.crm.goodsAndGifts.utils.PageUtil;

//订单

@Controller
@RequestMapping("/order")
public class OrderHandler {

	@Autowired
	 private OrderService os;
	 
	@Autowired
	private ConsigneeService cs;
	
	@Autowired
	private OrderinformationService om;
	
	@RequestMapping("/go")
	public String go() {
		return "b2c/orderSelect";
	}
	
	@RequestMapping("/sodetail")
	public String testb2c() {
		return"b2c/b2cSalesOrderDetails";
	}
	
	//分页查询所有
	@RequestMapping("/selAll")
	@ResponseBody
	public  PageUtil<Order> selectAll(@RequestParam(defaultValue="1")int pageNumber,@RequestParam(defaultValue="5")int pageSize,Order order){
		PageHelper.startPage(pageNumber, pageSize);//分页开始
		List<Order> pp = os.selectAll(order);
		PageUtil<Order> pageUtil = new PageUtil<Order>(pp);
		return  pageUtil;
	}
	
	//查询所有并倒出数据库中的表格
	@RequestMapping("/derive")
	@ResponseBody
	public void  derive() {
		ReadExcel readExcel = new ReadExcel();
		 String savePath = "D://dd.xlsx";
		List<Map<String,String>> list = os.Derive();
		readExcel.write(savePath,list,"我的表格");
	}
	
	
	
	//从Excel中导入数据，批量插入到数据库中
	//批量插入数据
	@RequestMapping("/insert")
	@ResponseBody
	public void insertAll() {
		ReadExcel readExcel = new ReadExcel();
		String path = "D://aa.xlsx";
		List<Order> list = readExcel.read(path);
		os.insertOrder(list);
	}
	
	
	
	//查询订单类型     共五个查询，封装到map中返回到前端页面
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
		 
		 //查询动作订单   selectOrderAction
		 List<String> listOrderAction = os.selectOrderAction();
		 map.put("listOrderAction", listOrderAction);
		 
		 //查询订单状态 
		 List<String> listOrderState = os.selectOrderState();
		 map.put("listOrderState", listOrderState);
		 
		return map;
	}
	
	
	//根据销售订单表中的会员账号查询收货人资料表
   //根据销售订单表中的商品编号查询商品订单信息表
		@RequestMapping("/selectTwo")
		@ResponseBody
		public Map<String,Object> selectTwo(int memberAccount,int orderId){
			Map<String,Object> map = new HashMap<>();
			
			//查询会员资料  测试通过
			List<Consignee> listConsignee = cs.selectTwo(memberAccount);
			 map.put("listConsignee", listConsignee);
			 
			//查询订单商品信息   测试通过
			 List<Orderinformation> listOrderinformation = om.selectOne(orderId);
			  map.put("listOrderinformation", listOrderinformation);
			return map;
		}
		
		
		@RequestMapping("/getoudetail")
		@ResponseBody
		public String getOrderUserById(@RequestParam("orderId") int orderid,HttpSession session){
			Map<String, Object> map = new HashMap<>();
			Order order = new Order();
			order.setOrderid(orderid);
			Order orderUser = os.selectOrderAndUserByOid(order);
			session.setAttribute("orderUser", orderUser);
//			System.out.println("测试---------："+orderUser);
			return "msg from getorderuserbyid";
			
		}
		
		@RequestMapping("/dlword")
		@ResponseBody
		public String downloadWord(HttpSession session,HttpServletResponse response) {
			Order order = (Order) session.getAttribute("orderUser");
			Map<String, Object> map = new HashMap<>();
			map.put("orderid", order.getOrderid());
			map.put("ordertype", order.getOrdertype());
			map.put("orderdate", order.getOrderdate());
			map.put("orderaction", order.getOrderaction());
			map.put("businesstype", order.getBusinesstype());
			map.put("orderstate", order.getOrderstate());
			
			map.put("consigneename", order.getOconsignee().getConsigneename());
			map.put("memberaccount", order.getOconsignee().getMemberaccount());
			map.put("telphone", order.getOconsignee().getTelphone());
			map.put("phone", order.getOconsignee().getPhone());
			map.put("zipcode", order.getOconsignee().getZipcode());
			map.put("shipingaddress", order.getOconsignee().getShipingaddress());
			map.put("distributionregion", order.getOconsignee().getDistributionregion());
			map.put("distributionway", order.getOconsignee().getDistributionway());
			map.put("distributioncosts", order.getOconsignee().getDistributioncosts());
			map.put("modeofpayment", order.getOconsignee().getModeofpayment());
			map.put("tothetime", order.getOconsignee().getTothetime());
			map.put("emailaddress", order.getOconsignee().getEmailaddress());
			map.put("remitter", order.getOconsignee().getRemitter());
			map.put("orderinfo", order.getOrderinfo());
			
//			System.out.println("测试路径："+OrderHandler.class.getClassLoader().getResourceAsStream("/") );
//			String templatePath =  "D:\\eclipse-workspace\\javaeeWorkspace\\CRM\\src\\main\\java\\com\\javasm\\crm\\b2c\\utils";
			 File file = null;  
	         InputStream fin = null;  
	         ServletOutputStream out = null;  
	         try {  
	             // 调用工具类WordGenerator的createDoc方法生成Word文档  
	             file = WriteWordUtil2.createDoc(map, "userDoc");  
	             fin = new FileInputStream(file);  
	               
	             response.setCharacterEncoding("utf-8");  
	             response.setContentType("application/msword");  
	             // 设置浏览器以下载的方式处理该文件默认名为resume.doc  
	             response.addHeader("Content-Disposition", "attachment;filename=userDoc.doc");  
	               
	             out = response.getOutputStream();  
	             byte[] buffer = new byte[1024];  // 缓冲区  
	             int bytesToRead = -1;  
	             // 通过循环将读入的Word文件的内容输出到浏览器中  
	             while((bytesToRead = fin.read(buffer)) != -1) {  
	                 out.write(buffer, 0, bytesToRead);  
	             }  
	             
	         }catch (Exception e) {
			} finally {  
					try {
						 if(fin != null) fin.close();
						 if(out != null) out.close();  
			             if(file != null) file.delete(); // 删除临时文件  
					} catch (IOException e) {
						e.printStackTrace();
					}  
	             
	         } 
			
			
			return "msg from dlword";
		}
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

