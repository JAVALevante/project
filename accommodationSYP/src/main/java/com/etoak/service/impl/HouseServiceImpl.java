package com.etoak.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.etoak.bean.House;
import com.etoak.mapper.HouseMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class HouseServiceImpl implements HouseService {

	@Autowired
	private HouseMapper mapper;
	
	@Override
	public Map<String, Object> query(Integer page, Integer rows, House h) {
		PageHelper.startPage(page, rows);
		List<House> list = mapper.query(h);
		
		PageInfo<House> pi = new PageInfo<House>(list);
		Map<String,Object> result = new HashMap<String, Object>();
		//easyui需要的两个值
		result.put("rows", list);
		result.put("total", pi.getTotal());
		return result;
	}

	@Override
	public void addHouse(House h) {
		int result = mapper.insert(h);
		if(result <= 0){
			throw new RuntimeException("新增："+h.getHnum()+" 失败！");
		}
		
	}

	@Override
	public House getHouseByNum(String num) {
		return mapper.selectHouseByHnum(num);
	}

	@Override
	public void updateHouse(House h) {
		 mapper.updateByPrimaryKeySelective(h);	
	}

	@Override
	public int delete(Integer id) {
		return mapper.deleteByPrimaryKey(id);
	}

	@Override
	public House getHouseByid(Integer id) {
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public List<House> getAll() {
		return mapper.queryAll();
	}

}
