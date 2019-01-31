package com.zharker.mybatis.entity;

import java.io.Serializable;

public class City implements Serializable {
    private String name;

    private Object location;

    private Integer altitude;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Object getLocation() {
        return location;
    }

    public void setLocation(Object location) {
        this.location = location;
    }

    public Integer getAltitude() {
        return altitude;
    }

    public void setAltitude(Integer altitude) {
        this.altitude = altitude;
    }

    @Override
    public String toString() {
        return "City{" +
                "name='" + name + '\'' +
                ", location=" + location +
                ", altitude=" + altitude +
                '}';
    }
}