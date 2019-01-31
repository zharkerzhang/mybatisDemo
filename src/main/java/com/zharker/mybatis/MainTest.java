package com.zharker.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.session.SqlSessionFactory;

import java.io.InputStream;

public class MainTest {
    public static void main(String[] args){
        String resource = "conf.xml";
        InputStream is = MainTest.class.getClassLoader().getResourceAsStream(resource);
        SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(is);
        SqlSession session = sessionFactory.openSession();
        String statement = "com.zharker.mybatis.mapper.CityMapper.getCity";
        session.selectList(statement, "San Francisco").forEach(System.out::println);
    }
}
