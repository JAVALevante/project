package com.etoak.test;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestConnection {

	private static BeanFactory bf;
	static{
		bf = new ClassPathXmlApplicationContext("applicationContext-mybatis.xml");
	}
	
	public static void main(String[] args) throws Exception {
		SqlSessionFactoryBean aa = bf.getBean("sqlSessionFactoryBean",SqlSessionFactoryBean.class);
		/*SqlSessionFactory ssf = aa.getObject();
		System.out.println(ssf.openSession());*/
	}
}
