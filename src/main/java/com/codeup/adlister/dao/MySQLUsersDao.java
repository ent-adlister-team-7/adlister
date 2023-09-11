package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.codeup.adlister.util.Config;

public class MySQLUsersDao implements Users {
    private User user;
    private Connection connection;

    public MySQLUsersDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }


    @Override
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users(username, email, password, firstName, lastName) VALUES (?, ?, ?, ?, ?)";
        System.out.println("username in usersDAO is: " + user.getUsername());
        System.out.println("email in usersDAO is: " + user.getEmail());
        System.out.println("password in usersDAO is: " + user.getPassword());
        System.out.println("first name in usersDAO is: " + user.getFirstName());
        System.out.println("last name in usersDAO is: " + user.getLastName());

        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getFirstName());
            stmt.setString(5, user.getLastName());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    @Override
    public List<User> all() {
        try {
            PreparedStatement stmt = null;
            stmt = connection.prepareStatement("SELECT * FROM users");
            ResultSet rs = stmt.executeQuery();
            return createUsersFromResults(rs);

        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all users", e);
        }
    }

    @Override
    public User findById(long id) {
        System.out.println(id);
        try {
            String insertQuery = "SELECT * FROM users WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new User(
                        rs.getLong(1),
                        rs.getString(2),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5)
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error calling user (user may not exist).", e);
        }
        return user;
    }


    private List<User> createUsersFromResults(ResultSet rs) throws SQLException {
        List<User> user = new ArrayList<>();
        while (rs.next()) {
            user.add(extractUser(rs));
        }
        return user;
    }

    private User extractUser(ResultSet rs) throws SQLException {
        if (!rs.next()) {
            return null;
        }
        return new User(
                rs.getLong("id"),
                rs.getString("firstName"),
                rs.getString("lastName"),
                rs.getString("username"),
                rs.getString("email"),
                rs.getString("password")
        );
    }



}
