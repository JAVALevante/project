package com.niit.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.orm.hibernate5.HibernateTemplate;

import com.niit.entity.Cars;

@SuppressWarnings("all")
public class CarsDao implements ICarsDao
{
	private HibernateTemplate hibernateTemplate;

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate)
	{
		this.hibernateTemplate = hibernateTemplate;
	}

	public HibernateTemplate getHibernateTemplate()
	{
		return hibernateTemplate;
	}

	@Override
	public void save(Cars cars)
	{
		hibernateTemplate.save(cars);
	}

	@Override
	public List<Cars> findBySid(Integer sid)
	{
		return (List<Cars>) hibernateTemplate.find("from Cars where s_id = ?", sid);
	}

	@Override
	public void deleteHouseByHid(Integer hid)
	{
		hibernateTemplate.bulkUpdate("delete Cars as h where h.h_id=?", hid);
	}

	@Override
	public List<Cars> findInfo()
	{
		String sql = "from Cars";
		List list = hibernateTemplate.find(sql);
		return list;
	}

	@Override
	public List<Cars> findRenthouse(String distric, double minarea, double maxarea, double minmoney, double maxmoney,
			String type, String RB, String EscOrDesc)
	{
		String sql = "from Cars";
		String strAnd = " and";
		String strWhere = " where";
		String strbetween = " between";
		String strName = " h_name=?";
		String strdistric = " h_distric=?";
		String strarea = " h_area";
		String strmoney = " h_money";
		String strmark = " ?";
		String strtype = " h_type like ?";
		String strRent = " h_RB=?";

		List list = new ArrayList<Cars>();

		if (distric == "")
		{
			if (minarea == 0 && maxarea == 0)
			{
				if (minmoney == 0 && maxmoney == 0)
				{
					if (type == "")
					{
						String hql = sql + strWhere + strRent + " order by " + EscOrDesc;
						list = hibernateTemplate.find(hql, RB);
					} else
					{
						String hql = sql + strWhere + strtype + strAnd + strRent + " order by " + EscOrDesc;
						list = hibernateTemplate.find(hql, type, RB);
					}
				} else
				{
					if (type == "")
					{
						String hql = sql + strWhere + strmoney + strbetween + strmark + strAnd + strmark + strAnd
								+ strRent + " order by " + EscOrDesc;
						list = hibernateTemplate.find(hql, minmoney, maxmoney, RB);
					} else
					{
						String hql = sql + strWhere + strtype + strAnd + strmoney + strbetween + strmark + strAnd
								+ strmark + strAnd + strRent + " order by " + EscOrDesc;
						list = hibernateTemplate.find(hql, type, minmoney, maxmoney, RB);
					}
				}
			} else
			{
				if (minmoney == 0 && maxmoney == 0)
				{
					if (type == "")
					{
						String hql = sql + strWhere + strarea + strbetween + strmark + strAnd + strmark + strAnd
								+ strRent + " order by " + EscOrDesc;
						list = hibernateTemplate.find(hql, minarea, maxarea, RB);
					} else
					{
						String hql = sql + strWhere + strtype + strAnd + strarea + strbetween + strmark + strAnd
								+ strmark + strAnd + strRent + " order by " + EscOrDesc;
						list = hibernateTemplate.find(hql, type, minarea, maxarea, RB);
					}

				} else
				{
					if (type == "")
					{
						String hql = sql + strWhere + strarea + strbetween + strmark + strAnd + strmark + strAnd
								+ strmoney + strbetween + strmark + strAnd + strmark + strAnd + strRent + " order by "
								+ EscOrDesc;
						list = hibernateTemplate.find(hql, minarea, maxarea, minmoney, maxmoney, RB);
					} else
					{
						String hql = sql + strWhere + strtype + strAnd + strarea + strbetween + strmark + strAnd
								+ strmark + strAnd + strmoney + strbetween + strmark + strAnd + strmark + strAnd
								+ strRent + " order by " + EscOrDesc;
						list = hibernateTemplate.find(hql, type, minarea, maxarea, minmoney, maxmoney, RB);
					}
				}
			}
		} else
		{
			if (minarea == 0 && maxarea == 0)
			{
				if (minmoney == 0 && maxmoney == 0)
				{
					if (type == "")
					{
						String hql = sql + strWhere + strdistric + strAnd + strRent + " order by " + EscOrDesc;
						list = hibernateTemplate.find(hql, distric, RB);
					} else
					{
						String hql = sql + strWhere + strtype + strAnd + strdistric + strAnd + strRent + " order by "
								+ EscOrDesc;
						list = hibernateTemplate.find(hql, type, distric, RB);
					}
				} else
				{
					if (type == "")
					{
						String hql = sql + strWhere + strdistric + strAnd + strmoney + strbetween + strmark + strAnd
								+ strmark + strAnd + strRent + " order by " + EscOrDesc;
						list = hibernateTemplate.find(hql, distric, minmoney, maxmoney, RB);
					} else
					{
						String hql = sql + strWhere + strtype + strAnd + strdistric + strAnd + strmoney + strbetween
								+ strmark + strAnd + strmark + strAnd + strRent + " order by " + EscOrDesc;
						list = hibernateTemplate.find(hql, type, distric, minmoney, maxmoney, RB);
					}
				}
			} else
			{
				if (minmoney == 0 && maxmoney == 0)
				{
					if (type == "")
					{
						String hql = sql + strWhere + strdistric + strAnd + strarea + strbetween + strmark + strAnd
								+ strmark + strAnd + strRent + " order by " + EscOrDesc;
						list = hibernateTemplate.find(hql, distric, minarea, maxarea, RB);
					} else
					{
						String hql = sql + strWhere + strtype + strAnd + strdistric + strAnd + strarea + strbetween
								+ strmark + strAnd + strmark + strAnd + strRent + " order by " + EscOrDesc;
						list = hibernateTemplate.find(hql, type, distric, minarea, maxarea, RB);
					}

				} else
				{
					if (type == "")
					{
						String hql = sql + strWhere + strdistric + strAnd + strmoney + strbetween + strmark + strAnd
								+ strmark + strAnd + strarea + strbetween + strmark + strAnd + strmark + strAnd
								+ strRent + " order by " + EscOrDesc;
						list = hibernateTemplate.find(hql, distric, minmoney, maxmoney, minarea, maxarea, RB);
					} else
					{
						String hql = sql + strWhere + strtype + strAnd + strdistric + strAnd + strmoney + strbetween
								+ strmark + strAnd + strmark + strAnd + strarea + strbetween + strmark + strAnd
								+ strmark + strAnd + strRent + " order by " + EscOrDesc;
						list = hibernateTemplate.find(hql, type, distric, minmoney, maxmoney, minarea, maxarea, RB);
					}
				}
			}
		}
		return list;
	}

	public List<Cars> find()
	{
		return (List<Cars>) hibernateTemplate.find("from Cars");
	}

	public List<Cars> find2(double a, double b)
	{
		List<Cars> house = (List<Cars>) hibernateTemplate
				.find("from Cars cars where cars.h_money between ?  and ?", a, b);
		return house;
	}

	public List<Cars> find3(double a, double b)
	{

		@SuppressWarnings("unchecked")
		List<Cars> house = (List<Cars>) hibernateTemplate.find("from Cars house where house.h_area between ?  and ?",
				a, b);

		return house;
	}

	public List<Cars> find4(String a)
	{
		List<Cars> house = (List<Cars>) hibernateTemplate.find("from Cars house where house.h_type = ?", a);
		return house;
	}

	public List<Cars> find5(double a1, double a2, double b1, double b2)
	{
		List<Cars> house = (List<Cars>) hibernateTemplate.find(
				"from Cars house where house.h_x between ?  and ? and house.h_y between ?  and ? ", a1, a2, b1, b2);

		return house;
	}

	public List<Cars> find6(double x, double y)
	{
		List<Cars> house = (List<Cars>) hibernateTemplate
				.find("from Cars house where house.h_x = ? and house.h_y = ?", x, y);
		return house;
	}

	@Override
	public List<Cars> findHouseByHid(Integer hid)
	{
		return (List<Cars>) hibernateTemplate.find("from Cars where h_id = ?", hid);
	}

	@Override
	public void updateHouse(Integer h_id, String h_name, String h_province, String h_city, String h_distric,
			Double h_area, String h_info, Double h_money)
	{
		Cars house = hibernateTemplate.get(Cars.class, h_id);
		house.setH_name(h_name);
		house.setH_province(h_province);
		house.setH_city(h_city);
		house.setH_distric(h_distric);
		house.setH_area(h_area);
		house.setH_info(h_info);
		house.setH_money(house.getH_money());
		hibernateTemplate.update(house);

	}

}
