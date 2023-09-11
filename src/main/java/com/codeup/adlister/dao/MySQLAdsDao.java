package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;
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

    private Ad extractAd(ResultSet rs) throws SQLException {
        long id = rs.getLong("user_id");
        System.out.println(id);
        User user = DaoFactory.getUsersDao().findById(id);
        return new Ad(
            rs.getLong("id"),
//            rs.getLong("user_id"),
                user,
            rs.getString("title"),
            rs.getString("link"),
            rs.getString("description")
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


//    public static boolean checkIfUserExist(String username){
//        boolean usernameExist = false;
//        try{
//
//
//        } catch (Exception e){
//            throw new RuntimeException("Could not complete");
//        }
//    }

}
