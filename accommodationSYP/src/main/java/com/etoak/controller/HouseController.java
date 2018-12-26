package com.etoak.controller;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etoak.bean.House;
import com.etoak.service.impl.HouseService;
import com.etoak.util.ResultMsg;

@Controller
@RequestMapping(value="/house")
public class HouseController {

	@Autowired
	private HouseService hs;
	
	
	@ResponseBody
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public ResultMsg update(House e){
		try {
			hs.updateHouse(e);
			return new ResultMsg(200,"修改成功！");
		} catch (Exception e2) {
			e2.printStackTrace();
			return new ResultMsg(500,e2.getMessage());
		}	
	}
	@RequestMapping(value="/remove",method=RequestMethod.POST)
	@ResponseBody
	public ResultMsg remove(Integer id){
			House h = hs.getHouseByid(id);
			System.out.println(h);
			if(h.getHstatus()==1){
				return new ResultMsg(null,"房间已被预订，无法删除");
			}
			int result = hs.delete(id);
			return new ResultMsg(null,"删除房间成功");
	}
	
	@ResponseBody
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public ResultMsg add(House h){
		System.out.println(h);
		try {
			if(h.getHnum()!=null&&!h.getHnum().equals("")){
				House h1 = hs.getHouseByNum(h.getHnum());
				if(h1!=null){
					return new ResultMsg(500,"房子编号已被注册");
				}
			}
			h.setHstatus(0);
			hs.addHouse(h);
			return new ResultMsg(200,"新增房子：" + h.getHnum()+"成功！");
		} catch (Exception e2) {
			e2.printStackTrace();
			return new ResultMsg(500,e2.getMessage());
		}
	}
	
	
	
	
	@RequestMapping(value="/houseAddAndUpdate",method=RequestMethod.GET)
	public String empAddAndUpdate(Integer id,HttpServletRequest request){
		House h = hs.getHouseByid(id);
		request.setAttribute("house", h);
		return "house/addAndUpdate";
	}
	
	
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list(){
		return "house/list";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/query",method=RequestMethod.POST)
	public Map<String,Object> query(Integer page,Integer rows,House e){
		return hs.query(page, rows, e);
	}
}
