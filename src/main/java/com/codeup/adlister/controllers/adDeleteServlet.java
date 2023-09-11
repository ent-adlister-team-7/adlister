package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.AdDeleteServlet", urlPatterns = "/delete")
public class adDeleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        if (request.getSession().getAttribute("user") == null) {
//            response.sendRedirect("/login");
//            // add a return statement to exit out of the entire method.
//            return;
//        }
        request.getRequestDispatcher("/WEB-INF/ads/displayad.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User loggedInUser = (User) request.getSession().getAttribute("user");
        String adId = request.getParameter("adId");
        long id = Long.parseLong(adId);
        Ad ad = DaoFactory.getAdsDao().getAdByID(id);
        if (loggedInUser != null) {
            DaoFactory.getAdsDao().delete(ad);
            response.sendRedirect("/ads");
        }
    }
}

