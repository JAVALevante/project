package com.niit.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.niit.entity.Cars;
import com.niit.service.ICarsService;
import com.niit.service.IUserService;

@Controller
public class CarsController
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

	public String Createuuid()
	{
		UUID uuid = UUID.randomUUID();
		String str = uuid.toString();
		String uuidStr = str.replace("-", "");
		return uuidStr;

	}

	@RequestMapping("/saleHouse.mvc")
	public String saleHouse(HttpSession session, HttpServletRequest request)
	{
		String house_name = null;
		String house_province = null;
		String house_city = null;
		String house_distric = null;
		String house_design = null;
		String house_RB = null;
		Double house_money = null;
		Double house_area = null;

		String house_type = null;
		String house_url = null;
		String house_info = null;
		Double house_x = null;
		Double house_y = null;
		// 获取工厂，设置缓存大小与临时目录
		DiskFileItemFactory factory = new DiskFileItemFactory(20 * 1024, new File("C:/temp"));
		// 获取解析器，设置数据大小限制
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setFileSizeMax(1024 * 1024 * 1024);// 设置单个文件的限制大小
		sfu.setSizeMax(1024 * 1024 * 1024);// 设置整个表单数据的大小限制
		// 解析得到LIST，遍历文件
		try
		{
			List<FileItem> list = sfu.parseRequest(request);
			FileItem fileItem0 = list.get(0);
			FileItem fileItem1 = list.get(1);
			FileItem fileItem2 = list.get(2);
			FileItem fileItem3 = list.get(3);
			FileItem fileItem4 = list.get(4);
			FileItem fileItem5 = list.get(5);
			FileItem fileItem6 = list.get(6);
			FileItem fileItem7 = list.get(7);
			FileItem fileItem8 = list.get(8);
			FileItem fileItem9 = list.get(9);
			FileItem fileItem10 = list.get(10);
			FileItem fileItem11 = list.get(11);
			FileItem fileItem12 = list.get(12);
			house_name = fileItem0.getString("utf-8");
			house_province = fileItem1.getString("utf-8");
			house_city = fileItem2.getString("utf-8");
			house_distric = fileItem3.getString("utf-8");
			house_design = fileItem4.getString("utf-8");
			house_RB = fileItem5.getString("utf-8");
			house_money = Double.parseDouble(fileItem6.getString("utf-8"));
			house_area = Double.parseDouble(fileItem7.getString("utf-8"));
			house_type = fileItem8.getString("utf-8");
			house_info = fileItem10.getString("utf-8");
			house_x = Double.parseDouble(fileItem11.getString("utf-8"));
			house_y = Double.parseDouble(fileItem12.getString("utf-8"));
			// 得到文件的保存路径
			String root = request.getServletContext().getRealPath("/images/");
			// 生成二级目录
			String filename = fileItem9.getName();
			// 处理文件名为绝对路径的问题
			int index = filename.lastIndexOf("\\");
			if (index != -1)
			{
				filename = filename.substring(index + 1);
			}
			// 给文件名字添加UUID，防止同名文件
			String savename = Createuuid() + "_" + filename;
			// 得到HASHCODE
			int hashCode = filename.hashCode();
			String hex = Integer.toHexString(hashCode);
			// 获取hex的前两个字符，与root连在一起生成一个完整的路径
			File dirFile = new File(root, hex.charAt(0) + "/" + hex.charAt(1));
			// 创建目录
			dirFile.mkdirs();
			// 创建最后的目标文件名，病连起来形成最后路径
			File destFile = new File(dirFile, savename);
			house_url = destFile.toString().substring(destFile.toString().indexOf("\\images")).replaceAll("\\\\", "/");
			System.out.println(house_url);
			fileItem9.write(destFile);
		} catch (FileUploadException e)
		{
			e.printStackTrace();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		Calendar cal = Calendar.getInstance();
		Integer year = cal.get(Calendar.YEAR);
		Integer month = cal.get(Calendar.MONTH) + 1;
		Integer day = cal.get(Calendar.DATE);
		String house_date = year.toString() + "/" + month.toString() + "/" + day.toString();
		Cars house = new Cars();
		house.setH_name(house_name);
		house.setH_province(house_province);
		house.setH_city(house_city);
		house.setH_distric(house_distric);
		house.setH_design(house_design);
		house.setH_RB(house_RB);
		house.setH_money(house_money);
		house.setH_area(house_area);
		house.setH_type(house_type);
		house.setH_url(house_url);
		house.setH_info(house_info);
		house.setH_date(house_date);
		house.setH_x(house_x);
		house.setH_y(house_y);
		Integer s_id = (Integer) session.getAttribute("sid");
		house.setS_id(s_id);
		carsService.save(house);
		return "/jsp/salerOfCar.jsp";
	}

	@RequestMapping("/rentHouse.mvc")
	public String rentHouse(HttpSession session, HttpServletRequest request)
	{
		String house_name = null;
		String house_province = null;
		String house_city = null;
		String house_distric = null;
		String house_design = null;
		String house_date = null;
		String house_RB = null;
		Double house_money = null;
		Double house_area = null;
		String house_type = null;
		String house_url = null;
		String house_info = null;
		Double house_x = null;
		Double house_y = null;
		// 获取工厂，设置缓存大小与临时目录
		DiskFileItemFactory factory = new DiskFileItemFactory(20 * 1024, new File("C:/temp"));
		// 获取解析器，设置数据大小限制
		ServletFileUpload sfu = new ServletFileUpload(factory);
		sfu.setFileSizeMax(1024 * 1024 * 1024);// 设置单个文件的限制大小
		sfu.setSizeMax(1024 * 1024 * 1024);// 设置整个表单数据的大小限制
		// 解析得到LIST，遍历文件
		try
		{
			List<FileItem> list = sfu.parseRequest(request);
			FileItem fileItem0 = list.get(0);
			FileItem fileItem1 = list.get(1);
			FileItem fileItem2 = list.get(2);
			FileItem fileItem3 = list.get(3);
			FileItem fileItem4 = list.get(4);
			FileItem fileItem5 = list.get(5);
			FileItem fileItem6 = list.get(6);
			FileItem fileItem7 = list.get(7);
			FileItem fileItem8 = list.get(8);
			FileItem fileItem9 = list.get(9);
			FileItem fileItem10 = list.get(10);
			FileItem fileItem11 = list.get(11);
			FileItem fileItem12 = list.get(12);
			FileItem fileItem13 = list.get(13);
			house_name = fileItem0.getString("utf-8");
			house_province = fileItem1.getString("utf-8");
			house_city = fileItem2.getString("utf-8");
			house_distric = fileItem3.getString("utf-8");
			house_design = fileItem4.getString("utf-8");
			house_date = fileItem5.getString("utf-8");
			house_RB = fileItem6.getString("utf-8");
			house_money = Double.parseDouble(fileItem7.getString("utf-8"));
			house_area = Double.parseDouble(fileItem8.getString("utf-8"));
			house_type = fileItem9.getString("utf-8");
			house_info = fileItem11.getString("utf-8");
			house_x = Double.parseDouble(fileItem12.getString("utf-8"));
			house_y = Double.parseDouble(fileItem13.getString("utf-8"));
			// 得到文件的保存路径
			String root = request.getServletContext().getRealPath("/images/");
			// 生成二级目录
			String filename = fileItem10.getName();
			// 处理文件名为绝对路径的问题
			int index = filename.lastIndexOf("\\");
			if (index != -1)
			{
				filename = filename.substring(index + 1);
			}
			// 给文件名字添加UUID，防止同名文件
//			String savename = Createuuid() + "_" + filename;

			String savename =filename;
			// 得到HASHCODE
			int hashCode = filename.hashCode();
			String hex = Integer.toHexString(hashCode);
			// 获取hex的前两个字符，与root连在一起生成一个完整的路径
			File dirFile = new File(root, hex.charAt(0) + "/" + hex.charAt(1));
			// 创建目录
			dirFile.mkdirs();
			// 创建最后的目标文件名，病连起来形成最后路径
			File destFile = new File(dirFile, savename);
			house_url = destFile.toString().substring(destFile.toString().indexOf("\\images")).replaceAll("\\\\", "/");
			;
			fileItem10.write(destFile);
		} catch (FileUploadException e)
		{
			e.printStackTrace();
		} catch (Exception e)
		{
			e.printStackTrace();
		}
		Cars house = new Cars();
		house.setH_name(house_name);
		house.setH_province(house_province);
		house.setH_city(house_city);
		house.setH_distric(house_distric);
		house.setH_design(house_design);
		house.setH_date(house_date);
		house.setH_RB(house_RB);
		house.setH_money(house_money);
		house.setH_area(house_area);
		house.setH_type(house_type);
		house.setH_url(house_url);
		house.setH_info(house_info);
		house.setH_x(house_x);
		house.setH_y(house_y);
		Integer s_id = (Integer) session.getAttribute("sid");
		house.setS_id(s_id);
		carsService.save(house);
		return "/jsp/RentSearch.jsp";
	}

	@RequestMapping("/findSalerOfHouse.mvc")
	@ResponseBody
	public List<Cars> FindSalerOfHouse(HttpSession session, HttpServletRequest request, HttpServletResponse response)
	{
		Integer sid = (Integer) session.getAttribute("sid");
		List<Cars> houses = carsService.findBySid(sid);
		return houses;
	}

	@RequestMapping("/deleteSalerOfHouse.mvc")
	public String DeleteSalerOfHouse(Integer hid) throws IOException
	{
		System.out.println(hid);
		carsService.deleteHouseByHid(hid);
		return "/jsp/salerOfCar.jsp";
	}

	@RequestMapping(value = "ajaxhouse.mvc")
	@ResponseBody
	public Map<String, Object> ajaxInfoList(HttpServletRequest request, HttpSession session)
	{
		System.out.println("login");
		double minmoney, maxmoney, minarea, maxarea;
		String distric = request.getParameter("distric");
		String RB = request.getParameter("RB");
		String EscORDesc = request.getParameter("EscORDesc");
		if (request.getParameter("minmoney") == "")
		{
			minmoney = 0;
		} else
		{
			minmoney = Double.parseDouble(request.getParameter("minmoney"));
		}
		if (request.getParameter("maxmoney") == "")
		{
			maxmoney = 0;
		} else
		{
			maxmoney = Double.parseDouble(request.getParameter("maxmoney"));

		}
		if (request.getParameter("minarea") == "")
		{
			minarea = 0;
		} else
		{
			minarea = Double.parseDouble(request.getParameter("minarea"));
		}
		if (request.getParameter("maxarea") == "")
		{
			maxarea = 0;
		} else
		{
			maxarea = Double.parseDouble(request.getParameter("maxarea"));
		}
		String type = request.getParameter("types");
		Map<String, Object> mp = new HashMap<String, Object>();
		List<Cars> list = carsService.findRenthouse(distric, minarea, maxarea, minmoney, maxmoney, type, RB,
				EscORDesc);
		if (list.isEmpty())
		{
			mp.put("msg", "fail");
			return mp;
		} else
		{
			System.out.println(list.toString());
			mp.put("msg", list);
			return mp;
		}
	}

	// 存房屋信息
	@RequestMapping("/sa.mvc")
	public String House(Cars house)
	{
		carsService.save(house);
		return "index.jsp";
	}

	// 初始房屋的点
	@RequestMapping(value = "/sc.mvc")
	@ResponseBody
	public List<Map<String, Object>> login2() throws IOException
	{

		// System.out.println(request.getParameter("name"));
		List<Cars> listhouse;
		listhouse = carsService.find();
		System.out.println(listhouse.get(0).getH_x());
		List<Map<String, Object>> listMaps = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < listhouse.size(); i++)
		{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("x", listhouse.get(i).getH_x());
			map.put("y", listhouse.get(i).getH_y());
			map.put("content", listhouse.get(i).getH_info());
			map.put("add", listhouse.get(i).getH_distric());
			listMaps.add(map);
		}

		return listMaps;

	}

	// 筛选后的地图
	@RequestMapping(value = "/sd.mvc")
	@ResponseBody
	public List<Map<String, Object>> login4(String[] check_val, String[] check_val2, String[] check_val3)
			throws IOException
	{
		// System.out.print(check_val3[0]);

		double[] ds = new double[check_val.length];
		double[] cs = new double[check_val.length];
		double[] ds2 = new double[check_val2.length];
		double[] cs2 = new double[check_val2.length];
		String[] ds3 = new String[check_val3.length];
		List<Cars> listhouse;
		List<Cars> listhouse2;
		List<Cars> listhouse3;
		// start
		if (check_val[0].equals("1000"))
		{
			listhouse = carsService.find();// 若为空全部查询
			System.out.println(listhouse.get(0).getH_x());
		} else
		{
			for (int j = 0; j < check_val.length - 1; j++)
			{

				ds[j] = Double.parseDouble(check_val[j]);
				cs[j] = ds[j] + 49;

			}
			listhouse = carsService.find2(ds, cs);
		}
		// end
		// start
		if (check_val2[0].equals("1000"))
		{
			listhouse2 = carsService.find();// 若为空全部查询
		} else
		{
			for (int j = 0; j < check_val2.length - 1; j++)
			{

				ds2[j] = Double.parseDouble(check_val2[j]);
				cs2[j] = ds2[j] + 49;

			}
			listhouse2 = carsService.find3(ds2, cs2);
		}
		if (check_val3[0].equals("1000"))
		{
			listhouse3 = carsService.find();// 若为空全部查询
		} else
		{
			for (int j = 0; j < check_val3.length - 1; j++)
			{
				ds3[j] = check_val3[j];
				System.out.println(ds3[j]);
			}
			listhouse3 = carsService.find4(ds3);
		}

		// end
		listhouse.retainAll(listhouse2);
		listhouse.retainAll(listhouse3);
		List<Map<String, Object>> listMaps = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < listhouse.size(); i++)
		{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("x", listhouse.get(i).getH_x());
			map.put("y", listhouse.get(i).getH_y());
			map.put("content", listhouse.get(i).getH_info());
			map.put("add", listhouse.get(i).getH_distric());
			listMaps.add(map);
		}
		return listMaps;
	}

	// newpage 用来显示的
	@RequestMapping(value = "/se.mvc", method = RequestMethod.GET)
	public ModelAndView findse(HttpServletRequest request, HttpSession session)
	{

		// String s = request.getParameter("y");
		List<Cars> listhouse;
		listhouse = carsService.find();
		List<String> address = new ArrayList<String>();
		for (int i = 0; i < listhouse.size(); i++)
		{
			if (!(address.contains(listhouse.get(i).getH_distric())))
			{
				address.add(listhouse.get(i).getH_distric());
			}
		}

		ModelAndView mv = new ModelAndView();
		mv.addObject("house", address);
		mv.setViewName("/finddisti.jsp");
		return mv;
	}

	// newpage 用来翻页的
	@RequestMapping(value = "/sf.mvc")
	@ResponseBody
	public List<Map<String, Object>> sf() throws IOException
	{
		// System.out.println(request.getParameter("check_val"));
		List<Cars> listhouse;
		listhouse = carsService.find();

		List<Map<String, Object>> listMaps = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < listhouse.size(); i++)
		{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("x", listhouse.get(i).getH_x());
			map.put("y", listhouse.get(i).getH_y());
			map.put("content", listhouse.get(i).getH_info());
			map.put("add", listhouse.get(i).getH_info());
			listMaps.add(map);
		}

		return listMaps;
	}

	@RequestMapping(value = "/sg.mvc")
	@ResponseBody
	public List<Map<String, Object>> sg(double a1, double a2, double b1, double b2) throws IOException
	{

		List<Cars> listhouse;

		listhouse = carsService.find5(a1, a2, b1, b2);

		List<Map<String, Object>> listMaps = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < listhouse.size(); i++)
		{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("x", listhouse.get(i).getH_x());
			map.put("y", listhouse.get(i).getH_y());
			map.put("content", listhouse.get(i).getH_info());
			map.put("add", listhouse.get(i).getH_distric());
			listMaps.add(map);
		}

		return listMaps;

	}

	@RequestMapping(value = "/test3.mvc")
	@ResponseBody
	public Map<String, Object> login3(double lng, double lat) throws IOException
	{
		List<Cars> listhouse;

		listhouse = carsService.find6(lng, lat);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", listhouse.get(0).getH_name());
		map.put("x", listhouse.get(0).getH_x());
		map.put("y", listhouse.get(0).getH_y());
		map.put("content", listhouse.get(0).getH_info());
		map.put("province", listhouse.get(0).getH_province());
		map.put("city", listhouse.get(0).getH_city());
		map.put("distric", listhouse.get(0).getH_distric());
		map.put("acreage", listhouse.get(0).getH_area());
		map.put("housetype", listhouse.get(0).getH_houseType());
		map.put("H_type", listhouse.get(0).getH_type());
		map.put("price", listhouse.get(0).getH_money());
		map.put("RB", listhouse.get(0).getH_RB());
		map.put("url", listhouse.get(0).getH_url());
		return map;
	}

	@RequestMapping("/updateHouse.mvc")
	public String UpdateHouse(Integer h_id, String h_name, String h_province, String h_city, String h_distric,
			Double h_area, String h_info, Double h_money, HttpServletRequest reqeust)
	{
		carsService.updateHouse(h_id, h_name, h_province, h_city, h_distric, h_area, h_info, h_money);
		return "/jsp/salerOfCar.jsp";
	}

}
