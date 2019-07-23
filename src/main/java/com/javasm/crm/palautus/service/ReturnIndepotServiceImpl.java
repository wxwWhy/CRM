package com.javasm.crm.palautus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javasm.crm.palautus.entity.Returnindepot;
import com.javasm.crm.palautus.mapper.ReturnindepotMapper;

@Service
public class ReturnIndepotServiceImpl implements IReturnIndepotService {

	@Autowired
	private ReturnindepotMapper rim;
	
	@Override
	public int deleteByPrimaryKey(Integer indepotid) {
		int i = rim.deleteByPrimaryKey(indepotid);
		return i;
	}

	@Override
	public int insert(Returnindepot record) {
		int i = rim.insert(record);
		return i;
	}

	@Override
	public int insertSelective(Returnindepot record) {
		int i = rim.insertSelective(record);
		return i;
	}

	@Override
	public Returnindepot selectByPrimaryKey(Integer indepotid) {
		Returnindepot returnindepot = rim.selectByPrimaryKey(indepotid);
		return returnindepot;
	}

	@Override
	public int updateByPrimaryKeySelective(Returnindepot record) {
		int i = rim.updateByPrimaryKeySelective(record);
		return i;
	}

	@Override
	public int updateByPrimaryKey(Returnindepot record) {
		int i = rim.updateByPrimaryKey(record);
		return i;
	}

	@Override
	public List<Returnindepot> all(Returnindepot record) {
		List<Returnindepot> all = rim.all(record);
		return all;
	}

}
