package com.zharker.mybatis.mapper;

import com.zharker.mybatis.entity.Weather;

public interface WeatherMapper {
    int insert(Weather record);

    int insertSelective(Weather record);
}