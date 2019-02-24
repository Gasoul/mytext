package com.itcast.service.impl;

import com.itcast.dao.UserDao;
import com.itcast.model.User;
import com.itcast.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public User findOne(String username, String password) {
        return userDao.findOne(username, password);
    }

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }
}
