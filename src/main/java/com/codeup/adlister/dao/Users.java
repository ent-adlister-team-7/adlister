package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);

    User findUserByUsername(String username);
    Long insert(User user);
    List<User> all();

    User findById(long id);
}
