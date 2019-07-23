package com.javasm.crm.aspect.service;

import com.javasm.crm.aspect.entity.Slog;

public interface LogService {


	//插入日志记录
	int insertSlog(Slog log);

	//分页查询
	//public PageInfomation<Log> getList(Log logModel, Integer pageno, Integer pagesize);

	//根据ID查询一条数据
	//public Log getOne(Integer id);
	
}
