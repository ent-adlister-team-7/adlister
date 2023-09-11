package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.AdDeleteServlet", urlPatterns = "/ads/delete")
public class adDeleteServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            // add a return statement to exit out of the entire method.
            return;
        }
        // Dispatcher can be changed whenever we get to this, using viewAds.jsp as a placeholder jsp for now will need a  NOT FINAL UNLESS SAID OTHERWISE
        request.getRequestDispatcher("/WEB-INF/ads/displayad.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User loggedInUser = (User) request.getSession().getAttribute("user");
        Ad viewedAd = (Ad) request.getSession().getAttribute("ad");
        if (loggedInUser != null) {
            DaoFactory.getAdsDao().delete(viewedAd);
        }
        response.sendRedirect("/ads");
    }
}

