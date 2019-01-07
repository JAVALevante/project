package com.niit.dao;

import java.util.List;

import com.niit.entity.Buyer;
import com.niit.entity.Liker;
import com.niit.entity.Saler;

import javax.annotation.Resource;

import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

@SuppressWarnings("all")
public class UserDao implements IUserDao
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
	public List<Saler> findSalerByUnPw(String username, String password)
	{
		return (List<Saler>) hibernateTemplate.find("from Saler s where s.s_username=? and s.s_password=?", username,
				password);
	}

	@Override
	public List<Buyer> findBuyerByUnPw(String username, String password)
	{
		return (List<Buyer>) hibernateTemplate.find("from Buyer b where b.b_username=? and b.b_password=?", username,
				password);
	}

	@Override
	public void save(Saler saler)
	{
		hibernateTemplate.save(saler);
	}

	@Override
	public void save(Buyer buyer)
	{
		hibernateTemplate.save(buyer);
	}

	@Override
	public List<Liker> findLikerBySid(Integer sid)
	{
		return (List<Liker>) hibernateTemplate.find("from Liker l where l.s_id=?", sid);
	}

}
