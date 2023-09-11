package com.codeup.adlister.dao;


import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;





import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


import com.codeup.adlister.util.Config;


public class MySQLAdsDao implements Ads {
    private Connection connection = null;


    public MySQLAdsDao(Config config) {
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
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }


    public Ad getAdByID(Long id) {
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ads WHERE ID=?");
            stmt.setLong(1, id);
            ResultSet rs = stmt.executeQuery();


            if (rs.next()) {
                User user = DaoFactory.getUsersDao().findById(id);


                return new Ad(
                        id,
                        user,
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getString("link")
                );
            } else {
                // Handle the case where no ad with the given ID was found
                return null;
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving ad by ID: " + id, e);
        }
    }

    @Override
    public Long editAd(Long id, String title, String link, String description) {
        try {
            PreparedStatement stmt = connection.prepareStatement("UPDATE ads SET title = ?, link = ?, description = ? WHERE id = ?");
            stmt.setString(1, title);
            stmt.setString(2, link);
            stmt.setString(3, description);
            stmt.setLong(4, id);
            int rowsUpdated = stmt.executeUpdate();

            if (rowsUpdated == 0) {
                throw new RuntimeException("Failed to update ad with ID: " + id);
            }
            return id;
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving ad by ID: " + id, e);
        }

    }


    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, link, description) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUser().getId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getLink());
            stmt.setString(4, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }


    @Override
    public void delete(Ad ad) {
        try {
            String deleteQuery = "DELETE FROM ads WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(deleteQuery);
            stmt.setLong(1, ad.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting ad from the database.", e);
        }
    }


    private Ad extractAd(ResultSet rs) throws SQLException {
        long adid = rs.getLong("id");
        long id = rs.getLong("user_id");
        String title = rs.getString("title");
        String link = rs.getString("link");
        String des = rs.getString("description");
        User user = DaoFactory.getUsersDao().findById(id);
        System.out.println("adid " + adid);
        System.out.println("id " + id);
        System.out.println("title" + title);
        System.out.println("link" + link);
        System.out.println("description" + des);
        return new Ad(
                rs.getLong("id"),
                user,
                rs.getString("title"),
                rs.getString("description"),
                rs.getString("link")
        );
    }


    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

 @Override
    public List<Ad> findByTitle(String title){
        String query = "SELECT * FROM ads WHERE title LIKE '%', ?, '%'";
        try{
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, title);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e){
            throw new RuntimeException("I'm sorry finding the add");
        }
    }

}
