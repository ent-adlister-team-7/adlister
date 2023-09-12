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

@WebServlet("/edit")
public class EditAdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("user") == null){
            resp.sendRedirect("/login");
            return;
        }
        String id = req.getParameter("adId");
        Long idL = Long.parseLong(id);
        System.out.println("edit long id " + idL);
        req.setAttribute("ad", DaoFactory.getAdsDao().getAdByID(idL));
        req.getRequestDispatcher("/WEB-INF/ads/editAd.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User loggedInUser = (User) req.getSession().getAttribute("user");
        if (loggedInUser != null) {
            String title = req.getParameter("title");
            String link = req.getParameter("link");
            String description = req.getParameter("description");
            String adId = req.getParameter("adId");
            long id = Long.parseLong(adId);
            System.out.println("dop id : ->"+ id);
            DaoFactory.getAdsDao().editAd(id, title, link, description);
            resp.sendRedirect("/ads");
        }
        else {
            resp.sendRedirect("/login");
        }
    }

}
