package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet(name="/WEB-INF/displayAd", urlPatterns="/displayAd")
public class AdDetailsServlet extends HttpServlet {
    @Override //test comment
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String adId = req.getParameter("id");
        Long id = Long.parseLong(adId);
        Ad ad = DaoFactory.getAdsDao().getAdByID(id);
        req.setAttribute("ad", ad);
        req.getRequestDispatcher("/WEB-INF/ads/displayAd.jsp").forward(req, resp);
    }
}
