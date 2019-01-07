package com.niit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.css.ElementCSSInlineStyle;

import com.niit.entity.Buyer;
import com.niit.entity.Cars;
import com.niit.entity.Liker;
import com.niit.entity.Saler;
import com.niit.service.ICarsService;
import com.niit.service.IUserService;

@Controller
public class UserController
{
	private ICarsService carsService;

	public void setCarsService(ICarsService carsService)
	{
		this.carsService = carsService;
	}

	private IUserService userService;

	public void setUserService(IUserService userService)
	{
		this.userService = userService;
	}

	@RequestMapping("/login.mvc")
	public String Login(HttpSession session, String user_username, String user_password, String user_type)
	{
		String name = null;
		String userType = null;
		Integer sid = null;
		if (user_type.equals("buyer"))
		{
			List<Buyer> buyers = userService.findBuyerByUnPw(user_username, user_password);
			if (buyers.isEmpty())
			{
				return "/jsp/Login.jsp";
			} else
			{
				for (Buyer buyer : buyers)
				{
					session.setAttribute("buyer", buyer);
					name = buyer.getB_name();
					session.setAttribute("name", name);
					userType = "buyer";
					session.setAttribute("userType", userType);
				}
				return "/index.jsp";
			}
		} else
		{
			List<Saler> salers = userService.findSalerByUnPw(user_username, user_password);
			if (salers.isEmpty())
			{
				return "/jsp/Login.jsp";
			} else
			{
				for (Saler saler : salers)
				{

					name = saler.getS_name();
					session.setAttribute("name", name);
					userType = "saler";
					session.setAttribute("userType", userType);
					sid = saler.getS_id();
					session.setAttribute("sid", sid);
					System.out.println(sid);
				}
				return "/index.jsp";
			}
		}

	}

	@RequestMapping("/loginout.mvc")
	public String LoginOut(HttpSession session)
	{
		session.removeAttribute("name");
		session.removeAttribute("userType");
		return "/index.jsp";
	}

	@RequestMapping("/register.mvc")
	public String Register(String user_username, String user_password, String user_name, String user_telephone,
			String user_gender, Integer user_age)
	{
		Buyer buyer = new Buyer();
		buyer.setB_username(user_username);
		buyer.setB_password(user_password);
		buyer.setB_name(user_name);
		buyer.setB_telephone(user_telephone);
		buyer.setB_gender(user_gender);
		buyer.setB_age(user_age);

		Saler saler = new Saler();
		saler.setS_username(user_username);
		saler.setS_password(user_password);
		saler.setS_name(user_name);
		saler.setS_telephone(user_telephone);
		saler.setS_gender(user_gender);
		saler.setS_age(user_age);

		userService.save(buyer);
		userService.save(saler);
		return "/index.jsp";
	}

	@RequestMapping("/findLiker.mvc")
	@ResponseBody
	public List<Liker> FindLiker(HttpSession session, HttpServletRequest request, HttpServletResponse response)
	{
		Integer sid = (Integer) session.getAttribute("sid");
		List<Liker> likers = userService.findLikerBySid(sid);
		return likers;
	}

	@RequestMapping("/about.mvc")
	public String About(HttpSession session)
	{
		return "/index.jsp";
	}

	@RequestMapping("/toSearch.mvc")
	public String ToSearch(HttpSession session)
	{
		return "/jsp/BuyResoldSearch.jsp";
	}

}
