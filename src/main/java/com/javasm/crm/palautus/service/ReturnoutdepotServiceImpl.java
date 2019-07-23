package com.javasm.crm.palautus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasm.crm.palautus.entity.Returnoutdepot;
import com.javasm.crm.palautus.mapper.ReturnoutdepotMapper;

@Service
public class ReturnoutdepotServiceImpl implements IReturnoutdepotService {

	@Autowired
	private ReturnoutdepotMapper rodm;
	
	@Override
	public int deleteByPrimaryKey(Integer outdepotid) {
		int i = rodm.deleteByPrimaryKey(outdepotid);
		return i;
	}

	@Override
	public int insert(Returnoutdepot record) {
		int i = rodm.insert(record);
		return i;
	}

	@Override
	public int insertSelective(Returnoutdepot record) {
		int i = rodm.insertSelective(record);
		return i;
	}

	@Override
	public Returnoutdepot selectByPrimaryKey(Integer outdepotid) {
		Returnoutdepot returnoutdepot = rodm.selectByPrimaryKey(outdepotid);
		return returnoutdepot;
	}

	@Override
	public int updateByPrimaryKeySelective(Returnoutdepot record) {
		int i = rodm.updateByPrimaryKeySelective(record);
		return i;
	}

	@Override
	public int updateByPrimaryKey(Returnoutdepot record) {
		int i = rodm.updateByPrimaryKey(record);
		return i;
	}

	@Override
	public List<Returnoutdepot> all(Returnoutdepot r) {
		List<Returnoutdepot> all = rodm.all(r);
		return all;
	}

}
