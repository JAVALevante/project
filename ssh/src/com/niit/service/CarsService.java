package com.niit.service;

import java.util.ArrayList;
import java.util.List;

import com.niit.dao.ICarsDao;
import com.niit.entity.Cars;

public class CarsService implements ICarsService
{
	private ICarsDao carsDao;

	public ICarsDao getCarsDao()
	{
		return carsDao;
	}

	public void setCarsDao(ICarsDao carsDao)
	{
		this.carsDao = carsDao;
	}

	@Override
	public void save(Cars house)
	{
		carsDao.save(house);
	}

	@Override
	public List<Cars> findBySid(Integer sid)
	{
		return carsDao.findBySid(sid);
	}

	@Override
	public void deleteHouseByHid(Integer hid)
	{
		carsDao.deleteHouseByHid(hid);
	}

	@Override
	public List<Cars> findAll()
	{

		return carsDao.findInfo();
	}

	@Override
	public List<Cars> findRenthouse(String distric, double minarea, double maxarea, double minmoney, double maxmoney,
			String type, String RB, String EscOrDesc)
	{
		return carsDao.findRenthouse(distric, minarea, maxarea, minmoney, maxmoney, type, RB, EscOrDesc);
	}

	public List<Cars> find()
	{

		return carsDao.find();
	}

	public List<Cars> find2(double[] a, double[] b)
	{

		List<List<Cars>> list = new ArrayList<List<Cars>>(); // 存放List的List

		for (int i = 0; i < a.length; i++)
		{
			list.add(carsDao.find2(a[i], b[i])); // 存

		}

		for (int j = 1; j < a.length; j++)
		{

			list.get(0).addAll(list.get(j));// 第一个list和其他取并集
			// list.get(0).retainAll(list.get(j));
			//
		}

		return list.get(0);
	}

	public List<Cars> find3(double[] a, double[] b)
	{

		List<List<Cars>> list = new ArrayList<List<Cars>>(); // 存放List的List

		for (int i = 0; i < a.length; i++)
		{
			list.add(carsDao.find3(a[i], b[i])); // 存

		}

		for (int j = 1; j < a.length; j++)
		{

			list.get(0).addAll(list.get(j));// 第一个list和其他取并集
			// list.get(0).retainAll(list.get(j));
			//
		}

		return list.get(0);
	}

	public List<Cars> find4(String[] a)
	{

		List<List<Cars>> list = new ArrayList<List<Cars>>(); // 存放List的List

		for (int i = 0; i < a.length; i++)
		{
			list.add(carsDao.find4(a[i]));// 存

		}

		for (int j = 1; j < a.length; j++)
		{

			list.get(0).addAll(list.get(j));// 第一个list和其他取并集
			// list.get(0).retainAll(list.get(j));
			//
		}

		return list.get(0);
	}

	public List<Cars> find5(double a1, double a2, double b1, double b2)
	{
		System.out.print(carsDao.find5(a1, a2, b1, b2).size());

		return carsDao.find5(a1, a2, b1, b2);
	}

	@Override
	public List<Cars> find6(double x, double y)
	{

		return carsDao.find6(x, y);
	}

	@Override
	public List<Cars> findHouseByHid(Integer hid)
	{
		return carsDao.findHouseByHid(hid);
	}

	@Override
	public void updateHouse(Integer h_id, String h_name, String h_province, String h_city, String h_distric,
			Double h_area, String h_info, Double h_money)
	{
		carsDao.updateHouse(h_id, h_name, h_province, h_city, h_distric, h_area, h_info, h_money);

	}
}
