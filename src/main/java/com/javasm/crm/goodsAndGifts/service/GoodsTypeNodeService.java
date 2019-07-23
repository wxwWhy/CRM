package com.javasm.crm.goodsAndGifts.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.javasm.crm.goodsAndGifts.entity.GoodsTypeNode;
import com.javasm.crm.goodsAndGifts.mapper.GoodsTypeNodeDao;

@Service
public class GoodsTypeNodeService {
	@Autowired
	private GoodsTypeNodeDao goodsTypeNodeDao;
	
//	public List<GoodsTypeNode> getNodeTree(){
//		return goodsTypeNodeDao.getNodeTree();
//	}
	
//	 public List<GoodsTypeNode> listChild(int nodeId){
//		 return goodsTypeNodeDao.listChild(nodeId);
//	 }
//	public JSONArray getTreeJson(){
//		Map<String, Object> treeMap = new HashMap<String, Object>();
//		Map<String, Object> treejsonMap = new HashMap<String, Object>();
//		treeMap.put("id",1);
//		treeMap.put("text", "用户");
//		treeMap.put("children", treeList());
//		JSONArray jsonObject = JSONArray.fromObject(treeMap);
//		return jsonObject;
//		
//	}
	
	//根据一级id查询所有的子集
//	public List<GoodsTypeNode> getNextSubSet2(GoodsTypeNode goodsTypeNode){
//		List<GoodsTypeNode> tNextLevel = goodsTypeNodeDao.getListBypid(goodsTypeNode);
//		for(GoodsTypeNode gNode:tNextLevel) {
//			List<GoodsTypeNode> ts = getDeepLevenl(gNode);
//			gNode.setChilidren(ts);
//		}
//		
//		return null;
//	}
	//递归
	private List<GoodsTypeNode> getDeepLevenl(GoodsTypeNode gNode) {
	List<GoodsTypeNode> listBypid = goodsTypeNodeDao.getListBypid(gNode);
	if (listBypid.size()>0) {
		for(int i=0;i<listBypid.size(); i++) {
			getDeepLevenl(listBypid.get(i));
		}
	}
	return listBypid;
}

//	public List<GoodsTypeNode> treeList(){
//		List<GoodsTypeNode> nextSubSet = new ArrayList<GoodsTypeNode>();
//		List<GoodsTypeNode> nextSubSet2 = new ArrayList<GoodsTypeNode>();
//		int minLeven = goodsTypeNodeDao.minId();
//		int maxLeven = goodsTypeNodeDao.maxId();
//		for(int i=minLeven;i<=maxLeven;i++) {
//			nextSubSet2.addAll(goodsTypeNodeDao.getListByLevel(i));
//		}
//		List<GoodsTypeNode> firstList = goodsTypeNodeDao.getFirstLevel(minLeven);
//		for(GoodsTypeNode gNode: firstList) {
//			gNode.setChilidren(nextSubSet);
//			nextSubSet = getNextSubSet2(gNode);
//		}
//		return nextSubSet;
//	} 
	
	public int getminLeven() {
		return goodsTypeNodeDao.minId();
	}
	public int getmaxLeven() {
		return goodsTypeNodeDao.maxId();
	}
	public List<GoodsTypeNode> getAllType(){
		return goodsTypeNodeDao.getAllType();
	}
	public List<GoodsTypeNode> getAllTypeInfo(GoodsTypeNode goodsTypeNode){
		return goodsTypeNodeDao.getAllTypeInfo(goodsTypeNode);
	}
	public  GoodsTypeNode getTypesByPid(GoodsTypeNode goodsTypeNode){
		return goodsTypeNodeDao.getTypesByPid(goodsTypeNode);
	}
	public Integer inserttype(GoodsTypeNode goodsTypeNode) {
		return goodsTypeNodeDao.inserttype(goodsTypeNode);
	}
	public Integer updatetype(GoodsTypeNode goodsTypeNode) {
		return goodsTypeNodeDao.updatetype(goodsTypeNode);
	}
	public Integer deletetype(GoodsTypeNode goodsTypeNode) {
		return goodsTypeNodeDao.deletetype(goodsTypeNode);
	}
	
}
