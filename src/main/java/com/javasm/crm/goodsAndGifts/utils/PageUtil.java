package com.javasm.crm.goodsAndGifts.utils;

import java.util.List;

import com.github.pagehelper.Page;

public class PageUtil<T> {
	private List<T> rows;//结果集
	private long total;//总记录数
	private int pageNum;//当前页
	
	//自己封装一下构造函数
	public PageUtil(List<T> list) {
		this.rows = list;
		Page<T> p = (Page)list;
		this.total = p.getTotal();
		this.pageNum = p.getPageNum();
		
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	public long getTotal() {
		return total;
	}
	public void setTotal(long total) {
		this.total = total;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	@Override
	public String toString() {
		return "PageUtil [rows=" + rows + ", total=" + total + ", pageNum=" + pageNum + "]";
	}
	
	
}
