package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();

    Ad getAdByUserID(Long id);

    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    List<Ad> findByTitle(String title);

    void delete(Ad ad);
    Ad getAdByID(Long id);

    Ad getAdByUserId(Long id);
}


