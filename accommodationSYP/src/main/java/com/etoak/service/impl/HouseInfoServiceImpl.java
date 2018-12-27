package com.etoak.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoak.bean.House;
import com.etoak.bean.Houseinfo;
import com.etoak.mapper.HouseinfoMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class HouseInfoServiceImpl implements HouseInfoService {

	@Autowired
	private HouseinfoMapper maefgdf;
	
	@Override
	public Map<String, Object> query(Integer page, Integer rows) {
		PageHelper.startPage(page, rows);
		List<Houseinfo> list = mapper.query();
		
		PageInfo<Houseinfo> pi = new PageInfo<Houseinfo>(list);
		Map<String,Object> result = new HashMap<String, Object>();
		//easyui需要的两个值
		result.put("rows", list);
		result.put("total", pi.getTotal());
		return result;
	}

	@Override
	public void add(Houseinfo h) {
		mapper.insertSelective(h);
		
	}

	@Override
	public void update(Houseinfo h) {
		mapper.updateByPrimaryKeySelective(h);
		
	}
	
}
