package com.etoak.service.impl;

import java.util.List;
import java.util.Map;

import com.etoak.bean.House;



public interface HouseService {
	
	Map<String,Object> query(Integer page,Integer rows,House h);
	void addHouse(House h);
	House getHouseByNum(String num);
	void updateHouse(House h);
	int delete(Integer id);
	House getHouseByid(Integer id);
	List<House> getAll();
}
