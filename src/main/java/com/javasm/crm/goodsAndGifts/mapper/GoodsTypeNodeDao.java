package com.javasm.crm.goodsAndGifts.mapper;

import java.util.List;

import com.javasm.crm.goodsAndGifts.entity.GoodsTypeNode;
import com.javasm.crm.goodsAndGifts.entity.Goodsquery;

public interface GoodsTypeNodeDao {

	 List<GoodsTypeNode> getNodeTree();

	//根据一级id查询所有的子集
	 List<GoodsTypeNode> getNextSubSet(GoodsTypeNode goodsTypeNode);
	 
	 //查询最小的level
	 int minId();
	
	 int maxId();
	 //根据最小的查询所有一级菜单
	 List<GoodsTypeNode> getFirstLevel(int minLevel);
	 //根据leven 查数据
	 List<GoodsTypeNode> getListByLevel(int level);
	 //根据pid查
	 List<GoodsTypeNode> getListBypid(GoodsTypeNode goodsTypeNode);
	 
	 List<GoodsTypeNode> getAllType();
	 
	 List<GoodsTypeNode> getAllTypeInfo(GoodsTypeNode goodsTypeNode);
	  	
	 GoodsTypeNode getTypesByPid(GoodsTypeNode goodsTypeNode);
	 
	 Integer inserttype(GoodsTypeNode goodsTypeNode);
	 
	 Integer updatetype(GoodsTypeNode goodsTypeNode);
	 
	 Integer deletetype(GoodsTypeNode goodsTypeNode);
}
