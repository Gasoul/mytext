package com.itcast.dao;

import com.itcast.model.User;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserDao {

    @Select("SELECT * FROM s_user WHERE username=#{username} AND password=#{password}")
    User findOne(@Param("username") String username, @Param("password") String password);

    @Select("SELECT * FROM s_user")
    List<User> findAll();

}
