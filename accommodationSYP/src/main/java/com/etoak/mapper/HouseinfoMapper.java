package com.etoak.mapper;

import java.util.List;



import org.springframework.stereotype.Repository;

import com.etoak.bean.Houseinfo;

@Repository
public interface HouseinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Houseinfo record);

    int insertSelective(Houseinfo record);

    Houseinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Houseinfo record);

    int updateByPrimaryKey(Houseinfo record);
    
    List<Houseinfo> query();
}