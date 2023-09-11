package com.codeup.adlister.models;

import com.codeup.adlister.dao.DaoFactory;

import java.sql.*;

public class Ad {
    private long id;
    private User user;
    private String title;
    private String description;
    private String link;


    public Ad(Long id, User user, String title, String description, String link) {
        this.id = id;
        this.user = user;
        this.title = title;
        this.description = description;
        this.link = link;
    }

    public Ad(User user, String title, String description, String link) {
        this.user = user;
        this.title = title;
        this.description = description;
        this.link = link;
    }


    public User getUser(long userId) {
        try {
            Connection connection = null;
            String insertQuery = "SELECT * FROM users WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, userId);
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                user = new User(
                        user.getId(),
                        user.getFirstName(),
                        user.getLastName(),
                        user.getUsername(),
                        user.getEmail(),
                        user.getPassword()
                );
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error calling user (user may not exist).", e);
        }
        return user;
    }


    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }


    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

//    public Ad edit(Long id, String title, String link, String description) {
//        Ad ad = DaoFactory.getAdsDao().getAdByID(id);
//        ad.setTitle(title);
//        ad.setLink(link);
//        return ad;
//    }
}


