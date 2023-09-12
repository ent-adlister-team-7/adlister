package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();

    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    List<Ad> findByTitle(String title);

    List<Ad> getAdsByUserId(long userId);

    Long editAd(Long id, String title, String link, String description);


    void delete(Ad ad);

    Ad getAdByID(Long id);

    User getUserByAdsId(long adId);
}


