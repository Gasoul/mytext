package com.itcast.service;

import com.itcast.model.Cust;

import java.util.List;

public interface CustService {
    List<Cust> findAll();

    int delete(Long cid);

    int add(Cust cust);

    List<Cust> find(String cust_name, String cust_type);
}
