package com.niit.service;

import java.util.List;
import com.niit.dao.IUserDao;
import com.niit.entity.Buyer;
import com.niit.entity.Liker;
import com.niit.entity.Saler;

public class UserService implements IUserService
{
	private IUserDao userDao;

	public IUserDao getUserDao()
	{
		return userDao;
	}

	public void setUserDao(IUserDao userDao)
	{
		this.userDao = userDao;
	}

	@Override
	public List<Saler> findSalerByUnPw(String username, String password)
	{
		return userDao.findSalerByUnPw(username, password);
	}

	@Override
	public List<Buyer> findBuyerByUnPw(String username, String password)
	{
		return userDao.findBuyerByUnPw(username, password);
	}

	@Override
	public void save(Saler saler)
	{
		userDao.save(saler);

	}

	@Override
	public void save(Buyer buyer)
	{
		userDao.save(buyer);

	}

	@Override
	public List<Liker> findLikerBySid(Integer sid)
	{
		return userDao.findLikerBySid(sid);
	}

}
