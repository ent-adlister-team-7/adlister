package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLAdsDao;
import com.codeup.adlister.dao.MySQLUsersDao;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/search")

public class SearchAdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//            String searchResult = req.getParameter("search");
//            List<Ad> results = DaoFactory.getAdsDao().findByTitle(searchResult);
//            req.setAttribute("result", results);
//            req.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String searchResult = req.getParameter("search");
        List<Ad> results = DaoFactory.getAdsDao().findByTitle(searchResult);
        req.setAttribute("results", results);
        req.getRequestDispatcher("/WEB-INF/ads/search.jsp").forward(req, resp);


    }
}
