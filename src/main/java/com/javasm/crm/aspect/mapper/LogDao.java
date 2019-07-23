package com.javasm.crm.aspect.mapper;

import com.javasm.crm.aspect.entity.Slog;

public interface LogDao {
	//保存日志记录
	int insertSlog(Slog log);

}
