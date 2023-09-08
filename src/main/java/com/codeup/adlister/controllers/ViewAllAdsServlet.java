package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "controllers.ViewAllAdsServlet", urlPatterns = "/viewads")
public class ViewAllAdsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("ads", DaoFactory.getAdsDao().all());
        req.setAttribute("users", DaoFactory.getUsersDao().all());
        req.getRequestDispatcher("/WEB-INF/ads/viewAds.jsp").forward(req, resp);
    }
}
