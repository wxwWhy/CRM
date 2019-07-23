package com.javasm.crm.goodsAndGifts.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.javasm.crm.goodsAndGifts.entity.GoodsTypeNode;
import com.javasm.crm.goodsAndGifts.entity.Goodsquery;
import com.javasm.crm.goodsAndGifts.service.GoodsTypeNodeService;
import com.javasm.crm.goodsAndGifts.utils.PageUtil;


@Controller
@RequestMapping("/goods")
public class GoodTypeHandler{
	@Autowired
	private GoodsTypeNodeService goodsTypeService;
	
	private Logger gloger = LogManager.getLogger(GoodTypeHandler.class);
	
	@RequestMapping("/tpview")
	public String gotypeview() {
		return"goods/goodTypeView"; 
	}
	
	
	
	@RequestMapping(value="/tree")
	@ResponseBody
	public List<GoodsTypeNode> tree(){
		List<GoodsTypeNode> listAll = goodsTypeService.getAllType();
//		 List<GoodsTypeNode> treeList = new ArrayList<GoodsTypeNode>();
//	        for (GoodsTypeNode tree : listAll) {
//	            if (tree.getpId() == 0) {
//	                treeList.add(findChildren(tree, listAll));
//	            }
//	        }
//	     String jsonString = JSON.toJSONString(listAll);
		return listAll;
	  }
	
//	private GoodsTypeNode findChildren(GoodsTypeNode tree, List<GoodsTypeNode> listAll) {
//		for (GoodsTypeNode node : listAll) {
//            if (node.getpId() == tree.getId()) {
//                if (tree.getChilidren() == null) {
//                    tree.setChilidren(new ArrayList<GoodsTypeNode>());
//                }
//                tree.getChilidren().add(findChildren(node, listAll));
//            }
//        }
//        return tree;
//	}

//	@RequestMapping("/listChild")
//	@ResponseBody
//	public Map<String, Object> listChild(@RequestParam int nodeId){
//		Map<String, Object> map = new HashMap<>();
//		//map.put("data", goodsTypeService.listChild(nodeId));
//	      return map;
//	  }
	@RequestMapping(value="/alltypinfo",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public PageUtil<GoodsTypeNode> alltypinfo(@RequestParam(defaultValue="1")int pageNumber,@RequestParam(defaultValue="2")int pageSize,GoodsTypeNode goodsTypeNode){
		PageHelper.startPage(pageNumber, pageSize);
		List<GoodsTypeNode> gList = goodsTypeService.getAllTypeInfo(goodsTypeNode);
		PageUtil<GoodsTypeNode> pageUtil = new PageUtil<>(gList);
		return pageUtil;
	}
	
	@RequestMapping(value="/getPidinfo",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public GoodsTypeNode getPidinfo(GoodsTypeNode goodsTypeNode){
		GoodsTypeNode goodsTypeNode2 = goodsTypeService.getTypesByPid(goodsTypeNode);
		return goodsTypeNode2;
	  }

	//插入
	@RequestMapping(value="/inserttype",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String inserttype(GoodsTypeNode goodsTypeNode){
		Integer temp = goodsTypeService.inserttype(goodsTypeNode);//
		return "msg from insert";
	  }
	//修改
	@RequestMapping(value="/updatetypeinfo",method= {RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public String updatetypeinfo(GoodsTypeNode goodsTypeNode){
		Integer temp = goodsTypeService.updatetype(goodsTypeNode);//
		return "msg from update";
	  }
	//删除
		@RequestMapping(value="/deletetypeinfo",method= {RequestMethod.GET,RequestMethod.POST})
		@ResponseBody
		public String deletetypeinfo(GoodsTypeNode goodsTypeNode){
			Integer temp = goodsTypeService.deletetype(goodsTypeNode);//
			return "msg from delete";
		  }
	
	
	
		
		
}








