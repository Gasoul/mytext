package com.itcast.service;

import com.itcast.model.User;

import java.util.List;

public interface UserService {
    User findOne(String username, String password);

    List<User> findAll();
}
