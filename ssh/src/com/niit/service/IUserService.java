package com.niit.service;

import java.util.List;

import com.niit.entity.Buyer;
import com.niit.entity.Liker;
import com.niit.entity.Saler;

public interface IUserService
{
	List<Saler> findSalerByUnPw(String username, String password);

	List<Buyer> findBuyerByUnPw(String username, String password);

	void save(Saler saler);

	void save(Buyer buyer);

	List<Liker> findLikerBySid(Integer sid);
}
