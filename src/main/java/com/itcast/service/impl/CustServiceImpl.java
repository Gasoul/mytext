package com.itcast.service.impl;

import com.itcast.dao.CustDao;
import com.itcast.model.Cust;
import com.itcast.service.CustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustServiceImpl implements CustService {

    @Autowired
    private CustDao custDao;

    @Override
    public List<Cust> findAll() {
        return custDao.findAll();
    }

    @Override
    public int delete(Long cid) {
        return custDao.delete(cid);
    }

    @Override
    public int add(Cust cust) {
        return custDao.add(cust);
    }

    @Override
    public List<Cust> find(String cust_name, String cust_type) {
        cust_name = "%" + cust_name + "%";
        cust_type = "%" + cust_type + "%";
        return custDao.find(cust_name, cust_type);
    }
}
