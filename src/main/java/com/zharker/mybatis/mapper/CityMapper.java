package com.zharker.mybatis.mapper;

import com.zharker.mybatis.entity.City;

public interface CityMapper {
    int insert(City record);

    int insertSelective(City record);

    City geCity(String name);
}