package com.javasm.crm.palautus.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.DataFormat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.javasm.crm.palautus.entity.Returnindepot;
import com.javasm.crm.palautus.entity.Returnoutdepot;
import com.javasm.crm.palautus.entity.Returnrepirgoods;
import com.javasm.crm.palautus.entity.returngoods;
import com.javasm.crm.palautus.mapper.ReturnindepotMapper;
import com.javasm.crm.palautus.mapper.ReturnoutdepotMapper;
import com.javasm.crm.palautus.mapper.ReturnrepirgoodsMapper;
import com.javasm.crm.palautus.service.IReturnGoodsService;
import com.javasm.crm.palautus.service.IReturnIndepotService;
import com.javasm.crm.palautus.service.IReturnRepirGoodsService;
import com.javasm.crm.palautus.service.IReturnoutdepotService;
import com.javasm.crm.palautus.utils.WriteWord;
import com.javasm.crm.user.entity.User;

@Controller
@RequestMapping(value="/returngoods")
public class ReturnGoodsHandler {
	
	@Autowired
	private IReturnGoodsService igs;
	
	@Autowired
	private IReturnoutdepotService irds;
	
	@Autowired
	private IReturnRepirGoodsService irrgs;
	
	@Autowired
	private IReturnIndepotService iris;
	
	
	@RequestMapping("/adddepot")
	public String adddepot() {
		return "palautus/addoutdepot";
	}
	
	@RequestMapping("/show")
	public String show() {
		return "palautus/outdepotlist";
	}
	
	@RequestMapping("/showin")
	public String showin() {
		return "palautus/indepotlist";
	}
	
	@RequestMapping("/test")
	@ResponseBody
	public boolean test(@RequestParam(value="test")String m,HttpServletRequest request) {
		try {
			
			 HttpSession session = request.getSession();
		     User loginUser = (User) session.getAttribute("loginUser");
			String paramsTrans = new String(m.getBytes("ISO-8859-1"),"UTF-8");
			m = java.net.URLDecoder.decode(paramsTrans , "UTF-8");
			System.out.println(m);
			JSONObject object = JSON.parseObject(m);
			String returngoodsbrand = object.getString("returngoodsbrand");
			String retutngoodsimei = object.getString("retutngoodsimei");
			String returngoodsname = object.getString("returngoodsname");
			String returngoodsmodel = object.getString("returngoodsmodel");
			String returngoodscolor = object.getString("returngoodscolor");
			String returngoodsfactory = object.getString("returngoodsfactory");
			String returngoodsmessage = object.getString("returngoodsmessage");
			String textarea = object.getString("textarea");
			String location = object.getString("location");
			String area = object.getString("area");
			String remark = object.getString("remark");
			Returnoutdepot r = new Returnoutdepot();
			r.setReturngoodsbrand(returngoodsbrand);
			r.setRetutngoodsimei(retutngoodsimei);
			r.setReturngoodsname(returngoodsname);
			r.setReturngoodsmodel(returngoodsmodel);
			r.setReturngoodscolor(returngoodscolor);
			r.setReturngoodsfactory(returngoodsfactory);
			r.setReturngoodsmessage(returngoodsmessage);
			r.setTextarea(textarea);
			r.setLocation(location);
			r.setArea(area);
			r.setRemark(remark);
			r.setMaketableperson(loginUser.getUname());
			Date d = new Date();
			SimpleDateFormat s = new SimpleDateFormat("YYYY-MM-dd");
			String date = s.format(d);
			r.setMaketabledate(date);
			irds.insertSelective(r);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return true;
	}
	
	
	@RequestMapping("/all")
	@ResponseBody
	public PageInfo<returngoods> all(@RequestParam(value="offset",defaultValue="1")int n,@RequestParam(value="limit",defaultValue="5")int s,returngoods r){
		PageHelper.startPage(n/s+1,s);
		List<returngoods> lrg = igs.all(r);
		PageInfo<returngoods> p = new PageInfo<>(lrg);
		return p;
	}
	
	@RequestMapping("/listall")
	@ResponseBody
	public PageInfo<Returnoutdepot> listall(@RequestParam(value="offset",defaultValue="1")int n,@RequestParam(value="limit",defaultValue="5")int s,Returnoutdepot r){
		PageHelper.startPage(n/s+1,s);
		List<Returnoutdepot> a = irds.all(r);
		PageInfo<Returnoutdepot> p = new PageInfo<>(a);
		return p;
	}
	
	
	@RequestMapping("/dele")
	@ResponseBody
	public boolean dele(int outdepotid) {
		int i = irds.deleteByPrimaryKey(outdepotid);
		System.out.println(i);
		return true;
	}
	
	@RequestMapping("/indele")
	@ResponseBody
	public boolean indele(int indepotid) {
		int i = iris.deleteByPrimaryKey(indepotid);
		System.out.println(i);
		return true;
	}
	
	@RequestMapping("/ch")
	@ResponseBody
	public boolean ch(Returnoutdepot r) {
		int i = irds.updateByPrimaryKeySelective(r);
		System.out.println(i);
		return true;
	}
	
	@RequestMapping("/ch2")
	@ResponseBody
	public boolean ch2(Returnoutdepot r,HttpServletRequest request) {
		HttpSession session = request.getSession();
	     User loginUser = (User) session.getAttribute("loginUser");
		SimpleDateFormat d = new SimpleDateFormat("YYYY年-MM月-dd日");
		String date = d.format(new Date());
		r.setApprovaltime(date);
		r.setApprover(loginUser.getUname());
		int i = irds.updateByPrimaryKeySelective(r);
		System.out.println(i);
		return true;
	}
	
	@RequestMapping("/showapprover")
	public String showapprover() {
		return "palautus/outapprover";
	}
	
	@RequestMapping("/showinapprover")
	public String showinapprover() {
		return "palautus/inapprover";
	}
	
	
	@RequestMapping("/addindepot")
	public String addindepot() {
		return "palautus/addindepot";
	}
	
	
	@RequestMapping("/allrepair")
	@ResponseBody
	public PageInfo<Returnrepirgoods> allrepair(@RequestParam(value="offset",defaultValue="1")int n,@RequestParam(value="limit",defaultValue="5")int s,Returnrepirgoods rr){
		PageHelper.startPage(n/s+1,s);
		List<Returnrepirgoods> a = irrgs.all(rr);
		PageInfo<Returnrepirgoods> p = new PageInfo<>(a);
		return p;
	}
	
	@RequestMapping("/test2")
	@ResponseBody
	public boolean test2(Returnindepot r,HttpServletRequest request) {
		 HttpSession session = request.getSession();
	     User loginUser = (User) session.getAttribute("loginUser");
		String s = r.getRetutnrepairgoodsimei();
		String st = r.getReturnrepirgoodsbeforeimei();
		r.setReturnrepirgoodsbeforeimei(s);
		r.setRetutnrepairgoodsimei(st);
		r.setMaketableperson(loginUser.getUname());
		SimpleDateFormat sf = new SimpleDateFormat("YYYY-MM-dd");
		String format = sf.format(new Date());
		r.setMaketabledate(format);
		int i = iris.insertSelective(r);
		System.out.println(i);
		Returnrepirgoods rr = new Returnrepirgoods();
		if(!st.equals("")) {
			rr.setRetutnrepairgoodsimei(Integer.valueOf(st));
			
		}
		rr.setReturnrepirgoodsbeforeimei(Integer.valueOf(s));
		rr.setReturnrepirgoodsname(r.getReturnrepirgoodsname());
		rr.setReturnrepirgoodsmodel(r.getReturnrepirgoodsmodel());
		rr.setReturnrepirgoodsstatus(r.getReturnrepirgoodsstatus());
		int j = irrgs.update(rr);
		System.out.println(j);
		return true;
	}
	
	
	@RequestMapping("/allinlist")
	@ResponseBody
	public PageInfo<Returnindepot> allinlist(@RequestParam(value="offset",defaultValue="1")int n,@RequestParam(value="limit",defaultValue="5")int s,Returnindepot r){
		PageHelper.startPage(n/s+1,s);
		System.out.println(r);
		List<Returnindepot> a = iris.all(r);
		PageInfo<Returnindepot> p = new PageInfo<>(a);
		return p;
	}
	
	
	@RequestMapping("/test3")
	@ResponseBody
	public boolean test3(Returnindepot r) {
		System.out.println(r);
		iris.updateByPrimaryKeySelective(r);
		return true;
	}
	
	@RequestMapping("/test4")
	@ResponseBody
	public boolean test4(Returnindepot r,HttpServletRequest request) {
		HttpSession session = request.getSession();
	     User loginUser = (User) session.getAttribute("loginUser");
		SimpleDateFormat sf = new SimpleDateFormat("YYYY-MM-dd");
		String format = sf.format(new Date());
		r.setApprover(loginUser.getUname());
		r.setApprovaltime(format);
		iris.updateByPrimaryKeySelective(r);
		return true;
	}
	
	String pa = "";
	@RequestMapping("/writeout")
	@ResponseBody
	public void writeout(Returnoutdepot r) {
		String path = "";
		try {
			path = WriteWord.outwrite(r);
			pa=path;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	@RequestMapping("/download")
	public void download(HttpServletResponse response) {
		InputStream ios = null;
		BufferedOutputStream out = null;
		try {
			ios = new FileInputStream(new File(pa));
			pa=pa.substring(pa.lastIndexOf("/")+1, pa.length());
			String filename="outdepot"+pa;
			filename=URLEncoder.encode(filename,"UTF-8");
			response.addHeader("Content-Disposition", "attachment;filename=" + filename); 
			response.setContentType("application/octet-stream");
			out = new BufferedOutputStream(response.getOutputStream());
			int len = 0;
			while((len=ios.read())!= -1) {
				out.write(len);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	String pa2 = "";
	@RequestMapping("/writein")
	@ResponseBody
	public void writein(Returnindepot r) {
		String path = "";
		try {
			path = WriteWord.inwrite(r);
			pa2=path;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	@RequestMapping("/downloadin")
	public void downloadin(HttpServletResponse response) {
		InputStream ios = null;
		BufferedOutputStream out = null;
		try {
			ios = new FileInputStream(new File(pa2));
			pa2=pa2.substring(pa2.lastIndexOf("/")+1, pa2.length());
			String filename="indepot"+pa2;
			filename=URLEncoder.encode(filename,"UTF-8");
			response.addHeader("Content-Disposition", "attachment;filename=" + filename); 
			response.setContentType("application/octet-stream");
			out = new BufferedOutputStream(response.getOutputStream());
			int len = 0;
			while((len=ios.read())!= -1) {
				out.write(len);
				out.flush();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
