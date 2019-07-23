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
import com.javasm.crm.goodsAndGifts.entity.Supplier;
import com.javasm.crm.goodsAndGifts.service.SupplierService;
import com.javasm.crm.goodsAndGifts.utils.PageUtil;

/**
 * 供应商处理类
 * @author JAVASM
 *
 */
@Controller
@RequestMapping("/goods")
public class SupplierHandler {

	@Autowired
	public SupplierService ss;
	
	@RequestMapping("/goSupplier")
	public String goSupplier() {
		return "goods/supplierShow";
	}
	
	//获取所有供应商的联系地址
	@RequestMapping("/getAllSupplierAddress")
	@ResponseBody
	public Map<String,Object> getAllSupplierAddress(){
		List<String> allSupplierAddress = ss.getAllSupplierAddress();
		Map<String,Object> map=new HashMap<>();
		map.put("addressList", allSupplierAddress);
		return map;
	}
	
	//获取所有供应商
	@RequestMapping("getAllSuppliers")
	@ResponseBody
	public PageUtil<Supplier> getAllSuppliers(@RequestParam(defaultValue="1")int pageNumber,@RequestParam(defaultValue="5")int pageSize,Supplier s){
		PageHelper.startPage(pageNumber, pageSize);
		List<Supplier> allSupplier = ss.getAllSupplier(s);
		PageUtil<Supplier> pageUtil = new PageUtil<>(allSupplier);
		return pageUtil;
	}
	
	//根据id查询供应商
	@RequestMapping("/getSupplierById")
	@ResponseBody
	public Map<String,Object> getSupplierById(Integer s_id){
		Supplier supplier = ss.getSupplierById(s_id);
		Map<String,Object> map=new HashMap<>();
		map.put("supplier",supplier);
		return map;
	}
	
	//新增供应商
	@RequestMapping("/addSupplier")
	@ResponseBody
	public String addSupplier(Supplier supplier) {
		System.out.println("----------------------"+supplier);
		Integer result = ss.addSupplier(supplier);
		String msg="";
		if(result!=0) {
			msg="新增成功！";
		}else {
			msg="新增失败！";
		}
		return msg;
	}
	
	//根据id删除供应商
	@RequestMapping("/deleteSupplierById")
	@ResponseBody
	public String deleteSupplierById(Integer s_id) {
		Integer result = ss.deleteSupplierById(s_id);
		String msg="";
		if(result!=0) {
			msg="删除成功！";
		}else {
			msg="删除失败！";
		}
		return msg;
	}
	
	//修改供应商
	@RequestMapping("/updateSupplier")
	@ResponseBody
	public String updateSupplier(Supplier supplier) {
		Integer result = ss.updateSupplier(supplier);
		String msg="";
		if(result!=0) {
			msg="修改成功！";
		}else {
			msg="修改失败！";
		}
		return msg;
	}
	
}
