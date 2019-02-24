package com.itcast.dao;

import com.itcast.model.Cust;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CustDao {

    @Select("SELECT c.*, u.rolename FROM s_user u, s_cust c WHERE u.uid=c.cust_link_user ORDER BY cid")
    List<Cust> findAll();

    @Delete("DELETE FROM s_cust WHERE cid=#{cid}")
    int delete(Long cid);

    @Insert("INSERT INTO s_cust(cust_name,cust_type,cust_phone,cust_address,cust_link_user) VALUES(#{cust_name},#{cust_type},#{cust_phone},#{cust_address},#{cust_link_user})")
    int add(Cust cust);

    @Select("SELECT c.*, u.rolename FROM s_user u, s_cust c WHERE u.uid=c.cust_link_user AND cust_name LIKE #{cust_name} AND cust_type LIKE #{cust_type} ORDER BY cid")
    List<Cust> find(@Param("cust_name") String cust_name, @Param("cust_type") String cust_type);
}