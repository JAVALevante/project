package com.etoak.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoak.bean.House;
import com.etoak.bean.Houseinfo;
import com.etoak.service.impl.HouseInfoService;
import com.etoak.service.impl.HouseService;
import com.etoak.util.ResultMsg;

@Controller
@RequestMapping("/houseinfo")
public class HouseInfoController {

	@Autowired
	private HouseInfoService hs;
	@Autowired
	private HouseService s;
	
	
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public ResultMsg update(Houseinfo e){
		try {
			hs.update(e);
			House h = s.getHouseByNum(e.getHnum());
			h.setHstatus(0);
			s.updateHouse(h);
			return new ResultMsg(200,"修改成功！");
		} catch (Exception e2) {
			e2.printStackTrace();
			return new ResultMsg(500,e2.getMessage());
		}	
	}
	
	
	@RequestMapping("/getHouse")
	@ResponseBody
	public List<Map<String,Object>> getCount(){
		List<House> list = s.getAll();
		List<Map<String,Object>> list2 = new ArrayList<Map<String,Object>>();
		for(House b : list){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("id",b.getHnum());
			map.put("text", b.getHnum());
			map.put("state", "open");
			list2.add(map);
		}
		return list2;
		
	}
	
	@RequestMapping(value="/houseinfoAddAndUpdate",method=RequestMethod.GET)
	public String empAddAndUpdate(Integer id,HttpServletRequest request){
		return "houseinfo/addAndUpdate";
	}
	
	@ResponseBody
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ResultMsg add(Houseinfo e){
		try {
			String hnum = e.getHnum();
			House h = s.getHouseByNum(hnum);
			h.setHstatus(1);
			s.updateHouse(h);
			e.setDengjitime(new Date());
			e.setStatus(0);
			hs.add(e);
			return new ResultMsg(200,"新增员工：" + e.getName()+"成功！");
		} catch (Exception e2) {
			e2.printStackTrace();
			return new ResultMsg(500,e2.getMessage());
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/getPrice",method=RequestMethod.POST)
	public Integer getPrice(String hnum){
		House h = s.getHouseByNum(hnum);
		return h.getHprice();
	}
	
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(){
		return "houseinfo/list";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/query",method=RequestMethod.POST)
	public Map<String,Object> query(Integer page,Integer rows){
		return hs.query(page, rows);
	}
	
	
}
