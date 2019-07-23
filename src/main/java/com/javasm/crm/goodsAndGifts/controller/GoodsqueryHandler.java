package com.javasm.crm.goodsAndGifts.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.javasm.crm.goodsAndGifts.entity.Goodsquery;
import com.javasm.crm.goodsAndGifts.service.GoodsqueryService;
import com.javasm.crm.goodsAndGifts.utils.DfsUtil;
import com.javasm.crm.goodsAndGifts.utils.ExcelUtilplus;
import com.javasm.crm.goodsAndGifts.utils.PageUtil;

@Controller
@RequestMapping("/goods")
public class GoodsqueryHandler {
	
	@Autowired
	private GoodsqueryService goodsquerService;
	
	@RequestMapping(value="/qyview",method= {RequestMethod.GET,RequestMethod.POST})
	public String goodsQueryView() {
		return "goods/productQuery";
	}
	
/*	@RequestMapping(value="/all",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public PageUtil<Goodsquery> all(@RequestParam(defaultValue="1")int pageNumber,@RequestParam(defaultValue="2")int pageSize,Goodsquery goods){
		PageHelper.startPage(pageNumber, pageSize);
		List<Goodsquery> gList = goodsquerService.getallGoods(goods);
		PageUtil<Goodsquery> pageUtil = new PageUtil<>(gList);
		
		return pageUtil;
	}*/
	
	@RequestMapping(value="/all",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public PageUtil<Goodsquery> all(@RequestParam(defaultValue="1")int pageNumber,@RequestParam(defaultValue="2")int pageSize,Goodsquery goods){
		PageHelper.startPage(pageNumber, pageSize);
		List<Goodsquery> gList = goodsquerService.getallGoods(goods);
		PageUtil<Goodsquery> pageUtil = new PageUtil<>(gList);
		return pageUtil;
	}
	
	@RequestMapping(value="/coloroption",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> coloroption(){
		Map<String, Object> map = new HashMap<>();
		List<String> colorList = new ArrayList<>();
		colorList = goodsquerService.getDistinctColor();
		map.put("colorList", colorList);
		List<String> brandList = goodsquerService.getDistinctBrand();
		map.put("brandList", brandList);
		List<String> typeList = goodsquerService.getDistinctType();
		map.put("typeList", typeList);
		return map;
	}
	
//	@RequestMapping(value="/importqy",method= {RequestMethod.GET,RequestMethod.POST})
//	@ResponseBody
//	public String importqy(MultipartFile file, HttpServletRequest req,HttpServletResponse resp) throws Exception {
//		
		
//		ExcelUtilplus excelUtilplus = new ExcelUtilplus();
//		List<ArrayList<String>> importlist = excelUtilplus.poiReadXExcel("D://Projects/产品查询表.xlsx");
//		List<Goodsquery> qyList = new ArrayList<>();
//		
//		for (ArrayList<String> stringList : importlist) {
//			Goodsquery goodsquery = new Goodsquery();
//			int tempNum = 1;
//			for (String str : stringList) {
//                switch (tempNum) {
//				case 1:
//					goodsquery.setFilenumber(Integer.valueOf(str));	tempNum++;
//					break;
//				case 2:
//					goodsquery.setType(str);	tempNum++;
//						break;
//				case 3:
//					goodsquery.setBrand(str);	tempNum++;
//						break;
//				case 4:
//					goodsquery.setModel(str);	tempNum++;
//						break;
//				case 5:
//					goodsquery.setColor(str);	tempNum++;
//						break;
//				default:
//					break;
//				}
//            }
//			qyList.add(goodsquery);
//		}
//		int resultNum = goodsquerService.batchInsert(qyList);
//		if (resultNum>0) {
//			return"插入成功";
//		} else {
//			return"插入失败";
//		}
		
//		return"test";
//	}
	@RequestMapping(value="/importqy",method= {RequestMethod.GET,RequestMethod.POST})
	public String importqy(MultipartFile meFile,Model model,HttpServletRequest req) throws Exception {
		String fileuploadpath = req.getSession().getServletContext().getRealPath("/")+"upload\\tmp\\";  
		if (meFile != null) {
			              System.out.println(meFile.getContentType());//在控制台打印文件的类型
			              System.out.println(meFile.getName());//返回文件的名称
			              System.out.println(meFile.getOriginalFilename());//返回文件的原文件名
			              try {
			            	  fileuploadpath = fileuploadpath+UUID.randomUUID()+meFile.getOriginalFilename();
			                  meFile.transferTo(new File(fileuploadpath));
			                  System.out.println(fileuploadpath);
			              } catch (Exception e) {
			                 e.printStackTrace();
			                 System.out.println("上传失败");
			             } 
			         }
		//String dfsUploadPath = DfsUtil.upload(fileuploadpath);//dfs中文件的路径
		//System.out.println("测试dfsuploadpath:"+dfsUploadPath);
		
		ExcelUtilplus excelUtilplus = new ExcelUtilplus();
		List<ArrayList<String>> importlist = excelUtilplus.poiReadXExcel(fileuploadpath);
		List<Goodsquery> qyList = new ArrayList<>();
		
		for (ArrayList<String> stringList : importlist) {
			Goodsquery goodsquery = new Goodsquery();
			int tempNum = 1;
			for (String str : stringList) {
                switch (tempNum) {
				case 1:
					goodsquery.setFilenumber(Integer.valueOf(str));	tempNum++;
					break;
				case 2:
					goodsquery.setType(str);	tempNum++;
						break;
				case 3:
					goodsquery.setBrand(str);	tempNum++;
						break;
				case 4:
					goodsquery.setModel(str);	tempNum++;
						break;
				case 5:
					goodsquery.setColor(str);	tempNum++;
						break;
				default:
					break;
				}
            }
			qyList.add(goodsquery);
		}
		int resultNum = goodsquerService.batchInsert(qyList);
		//boolean delete = DfsUtil.delete(dfsUploadPath);
		if (resultNum>0) {
			System.out.println("插入成功");
		} else {
			System.out.println("插入失败");
		}
		
		
		return "goods/productQuery";//后试下重定向
		
	}
	
	
	
}
