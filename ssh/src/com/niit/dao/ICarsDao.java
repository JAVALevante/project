package com.niit.dao;

import java.util.List;

import com.niit.entity.Cars;

public interface ICarsDao {
	void save(Cars house);
	List<Cars> findHouseByHid(Integer hid);
	List<Cars> findBySid(Integer sid);
	void updateHouse(Integer h_id,String h_name,String h_province,String h_city,String h_distric,Double h_area,String h_info,Double h_money);

	void deleteHouseByHid(Integer hid);
	List<Cars> findInfo();
	
	List<Cars> findRenthouse(String distric,double minarea,double maxarea,double minmoney,double maxmoney,String type,String RB,String EscOrDesc);
	
	List<Cars> find();
	List<Cars> find2(double a,double b);
	List<Cars> find3(double a,double b);
	List<Cars> find4(String a);
	List<Cars> find5(double a1,double a2,double b1,double b2);
	List<Cars> find6(double x,double y);
}
