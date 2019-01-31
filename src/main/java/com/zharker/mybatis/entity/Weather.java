package com.zharker.mybatis.entity;

import java.util.Date;

public class Weather {
    private String city;

    private Integer tempLo;

    private Integer tempHi;

    private Float prcp;

    private Date date;

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public Integer getTempLo() {
        return tempLo;
    }

    public void setTempLo(Integer tempLo) {
        this.tempLo = tempLo;
    }

    public Integer getTempHi() {
        return tempHi;
    }

    public void setTempHi(Integer tempHi) {
        this.tempHi = tempHi;
    }

    public Float getPrcp() {
        return prcp;
    }

    public void setPrcp(Float prcp) {
        this.prcp = prcp;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}