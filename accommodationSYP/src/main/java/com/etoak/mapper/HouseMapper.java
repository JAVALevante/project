package com.etoak.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.etoak.bean.House;

@Repository
public interface HouseMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(House record);

    int insertSelective(House record);

    House selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(House record);

    int updateByPrimaryKey(House record);
    
    List<House> query(House h);
    
    List<House> queryAll();
    
    House selectHouseByHnum(String hnum);
}