package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);

    User findUserByUsername(String username);
    Long insert(User user);
    List<User> all();

    User findById(long id);

    User getAdByUserId(Long userId);

    Long editUser(Long id, String firstname, String lastname, String username, String email);

    List<String> allUsernames();
}
