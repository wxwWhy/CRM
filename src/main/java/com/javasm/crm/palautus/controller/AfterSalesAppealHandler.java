package com.javasm.crm.palautus.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javasm.crm.palautus.entity.AfterSalesAppeal;
import com.javasm.crm.palautus.service.IAfterSalesAppealService;
import com.javasm.crm.user.entity.User;

@Controller
@RequestMapping("/AfterSalesAppeal")
public class AfterSalesAppealHandler {

	@Autowired
	private IAfterSalesAppealService isas;
	
	@RequestMapping("/list")
	public String list() {
		return "palautus/AppealList";
	}
	
	@RequestMapping("/alist")
	public String alist() {
		return "palautus/AppealApproval";
	}
	
	@RequestMapping("/all")
	@ResponseBody
	public PageInfo<AfterSalesAppeal> all(int offset,int limit,AfterSalesAppeal a){
		PageHelper.startPage(offset/limit+1, limit);
		List<AfterSalesAppeal> all = isas.all(a);
		PageInfo<AfterSalesAppeal> p = new PageInfo<>(all);
		return p;
	}
	
	@RequestMapping("/dele")
	@ResponseBody
	public boolean dele(AfterSalesAppeal a) {
		System.out.println(a);
		int i = isas.dele(a);
		System.out.println(i);
		return true;
	}
	
	@RequestMapping("/saveadd")
	@ResponseBody
	public boolean saveadd(AfterSalesAppeal a,HttpServletRequest request) {
		 HttpSession session = request.getSession();
	     User loginUser = (User) session.getAttribute("loginUser");
		a.setProjectmakeperson(loginUser.getUname());
		SimpleDateFormat sf = new SimpleDateFormat("YYYY年MM月dd日HH时mm分ss秒");
		String date = sf.format(new Date());
		a.setProjectmaketime(date);
		isas.insertSelective(a);
		return true;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public boolean update(AfterSalesAppeal a) {
		isas.update(a);
		return true;
	}
	
	@RequestMapping("/update2")
	@ResponseBody
	public boolean update2(AfterSalesAppeal a,HttpServletRequest request) {
		HttpSession session = request.getSession();
	     User loginUser = (User) session.getAttribute("loginUser");
		SimpleDateFormat sf = new SimpleDateFormat("YYYY年MM月dd日HH时mm分ss秒");
		String date = sf.format(new Date());
		a.setProjectapprovaltime(date);
		a.setProjectapproval(loginUser.getUname());
		isas.update(a);
		return true;
	}
	
}
