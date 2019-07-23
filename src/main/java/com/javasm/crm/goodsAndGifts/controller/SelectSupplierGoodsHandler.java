package com.javasm.crm.goodsAndGifts.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.javasm.crm.goodsAndGifts.entity.SelectSupplierGoods;
import com.javasm.crm.goodsAndGifts.entity.Supplier;
import com.javasm.crm.goodsAndGifts.service.SelectSupplierGoodsService;
import com.javasm.crm.goodsAndGifts.service.SupplierService;
import com.javasm.crm.goodsAndGifts.utils.PageUtil;

/**
 * 选用供应商品处理类
 * @author JAVASM
 *
 */

@Controller
@RequestMapping("/goods")
public class SelectSupplierGoodsHandler {
	@Autowired
	private SelectSupplierGoodsService ssgs;
	
	@Autowired
	private SupplierService ss;
	
	@RequestMapping("/goSelectSupplierGoods")
	public String goSelectSupplierGoods() {
		return "goods/selectSupplierGoods";
	}
	
	//跳转到商品管理界面选择商品作为其供应商的供应商品
	@RequestMapping("/goSupplierSelectGood")
	public String goSupplierSelectGood() {
		return "goods/supplierSelectGood";
	}
	
	
	
	
	//把前端传过来的id存在session里
	@RequestMapping("/goAllSupplierGoods")
	@ResponseBody
	public String goAllSupplierGoods(@RequestParam(defaultValue="1")int pageNumber,@RequestParam(defaultValue="5")int pageSize,int s_id,HttpSession session) {
		session.setAttribute("s_idSession",s_id);
		String msg="跳转成功！";
		return msg;
	}
	
	@RequestMapping("/showSelectSupplierGoods")
	@ResponseBody
	public PageUtil<SelectSupplierGoods> selectSupplierGoods(@RequestParam(defaultValue="1")int pageNumber,@RequestParam(defaultValue="5")int pageSize,HttpServletRequest req){
		PageHelper.startPage(pageNumber, pageSize);
		HttpSession session = req.getSession();
		Integer obj = (Integer)session.getAttribute("s_idSession");
		List<SelectSupplierGoods> list = ssgs.getAllSelectSupplierGoods(obj);
		
		//根据id查询是哪个供应商，然后填充到页面
		Supplier supplier = ss.getSupplierById(obj);
//		System.out.println("输出看看---------------------"+supplier);
		//存到session里边先
		session.setAttribute("supplier", supplier);
		
		PageUtil<SelectSupplierGoods> pageUtil = new PageUtil<>(list);
		return pageUtil;
	}
	
	//往中间表里添加数据
	@RequestMapping("/toAdd")
	@ResponseBody
	public String toAdd(SelectSupplierGoods ssg,HttpServletRequest req) {
		String msg="操作失败！或商品已存在，请选择其他商品";
		try {
			HttpSession session = req.getSession();
			//获取其供应商的id
			Integer z_s_id = (Integer)session.getAttribute("s_idSession");
			//获取其供应商的名称
			String z_s_name = ss.getSupplierById(z_s_id).getS_name();
			//
			ssg.setZ_s_id(z_s_id);
			ssg.setZ_s_name(z_s_name);
			Integer result = ssgs.addSupplierGood(ssg);
			
			if(result!=0) {
				msg="操作成功！";
			}else {
				msg="操作失败！或商品已存在，请选择其他商品";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	
	//删除中间表里的数据
	@RequestMapping("/toDelete")
	@ResponseBody
	public String toDelete(Integer z_id) {
		Integer result = ssgs.delSupplierGood(z_id);
		String msg="";
		if(result!=0) {
			msg="删除成功！";
		}else {
			msg="删除失败！";
		}
		return msg;
	}
	
}
