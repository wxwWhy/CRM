package com.javasm.crm.goodsAndGifts.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.javasm.crm.goodsAndGifts.entity.Brand;
import com.javasm.crm.goodsAndGifts.service.BrandService;
import com.javasm.crm.goodsAndGifts.utils.ExcelUtilplus;
import com.javasm.crm.goodsAndGifts.utils.PageUtil;

@Controller
@RequestMapping("/goods")
public class BrandHandler {
	
	@Autowired
	private BrandService bs;
	
	@RequestMapping("/goBrands")
	public String go() {
		return "goods/brandsShow";
	}
	
	@RequestMapping("/importBrands")
	@ResponseBody               
	public String importBrands(MultipartFile brandsExcelFile,HttpServletRequest req) {
		String msg="导入失败！";
		String fileUploadPath=req.getSession().getServletContext().getRealPath("/")+"upload\\tmp\\";
		if (brandsExcelFile!=null) {
//			System.out.println(brandsExcelFile.getContentType());//文件的类型
//			System.out.println(brandsExcelFile.getName());//传过来的name属性
//			System.out.println(brandsExcelFile.getOriginalFilename());//上传的源文件名
			
			try {
				fileUploadPath=fileUploadPath+UUID.randomUUID()+brandsExcelFile.getOriginalFilename();
				brandsExcelFile.transferTo(new File(fileUploadPath));
//				System.out.println(fileUploadPath);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
				System.out.println("上传失败！");
			}
		}
		ExcelUtilplus excelUtilplus = new ExcelUtilplus();
		try {
			List<ArrayList<String>> importList = excelUtilplus.poiReadXExcel(fileUploadPath);
			System.out.println(importList);
			List<Brand> bList=new ArrayList<>();
			for (ArrayList<String> stringList:importList) {
				Brand brand = new Brand();
				int tempNum=1;
				for(String str:stringList) {
					switch (tempNum) {
					case 1:
						brand.setBrand_name(str);tempNum++;
						break;
					case 2:
						brand.setBrand_url(str);tempNum++;
						break;
					case 3:
						brand.setBrand_describe(str);tempNum++;
						break;
					default:
						break;
					}
				}
				bList.add(brand);
				System.out.println(bList);
			}
			Integer result = bs.batchAddBrands(bList);
			if(result!=0) {
				msg="导入成功";
			}else {
				msg="导入失败！";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
	
	//查询所有品牌
	@RequestMapping(value="/allBrands",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public PageUtil<Brand> allBrands(@RequestParam(defaultValue="1")int pageNumber,@RequestParam(defaultValue="5")int pageSize,Brand b){
		PageHelper.startPage(pageNumber, pageSize);//开始分页 
		List<Brand> allBrands = bs.getAllBrands(b);
		PageUtil<Brand> pageUtil = new PageUtil<>(allBrands);
		return pageUtil;
		
	} //往前端返回的数据格式：{total:11,pageNum:1，rows[{}]}
	
	//根据Id查询单个品牌
	//通用：往前端返回Map
	@RequestMapping(value="/getBrandById",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Map<String,Object> getBrandById(Integer brand_id) {
		Brand brand = bs.getBrandById(brand_id);
		Map<String,Object> map = new HashMap<>();
		map.put("Brand", brand);
		return map;
	}
	
	//新增品牌
	@RequestMapping(value="/addBrand",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String addBrand(Brand brand) {
		System.out.println("前端传来-------------"+brand);
		Integer result = bs.addBrand(brand);
		String msg="";
		if(result!=0) {
			msg="新增成功！";
		}else {
			msg="新增失败！";
		}
		return msg;
	}
	
	//删除品牌
	@RequestMapping(value="/deleteBrandById",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String deleteBrandById(@RequestParam(defaultValue="1")int pageNum,@RequestParam(defaultValue="5")int pageSize,Integer brand_id) {
		PageHelper.startPage(pageNum, pageSize);//开始分页 
		Integer result = bs.deleteBrandById(brand_id);
		String msg="";
		if(result!=0) {
			msg="删除成功";
		}else{
			msg="删除失败！";
		}
		return msg;
	}
	
	//修改品牌
	@RequestMapping(value="/updateBrandById",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String updateBrandById(Brand b) {
		System.out.println("测试--------------"+b);
		Integer result = bs.updateBrandById(b);
		System.out.println("测试--------------"+b);
		String msg="";
		if(result!=0) {
			msg="修改成功！";
		}else {
			msg="修改失败！";
		}
		return msg;
	}
	
}
