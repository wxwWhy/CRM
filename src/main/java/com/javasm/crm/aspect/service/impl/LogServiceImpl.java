package com.javasm.crm.aspect.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasm.crm.aspect.entity.Slog;
import com.javasm.crm.aspect.mapper.LogDao;
import com.javasm.crm.aspect.service.LogService;

@Service
public class LogServiceImpl implements LogService{
	@Autowired
	public LogDao logdao;

	@Override
	public int insertSlog(Slog log) {
		return logdao.insertSlog(log);
	}
	
	

	


}
