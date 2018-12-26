package com.etoak.service.impl;

import java.util.Map;

import com.etoak.bean.Houseinfo;


public interface HouseInfoService {
	Map<String,Object> query(Integer page,Integer rows);
	void add(Houseinfo h);
	void update(Houseinfo h);
}
