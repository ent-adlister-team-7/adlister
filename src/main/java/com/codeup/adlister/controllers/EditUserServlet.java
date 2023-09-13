package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/editUser")
public class EditUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("user") == null){
            resp.sendRedirect("/login");
            return;
        }
        String id = req.getParameter("userid");
        Long idL = Long.parseLong(id);
        User user = DaoFactory.getUsersDao().findById(idL);
        req.setAttribute("user", user);
        req.getRequestDispatcher("/WEB-INF/ads/editUser.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        User loggedInUser = (User) req.getSession().getAttribute("user");
        if (loggedInUser != null) {
            String firstname = req.getParameter("firstname");
            String lastname = req.getParameter("lastname");
            String username = req.getParameter("username");
            String email = req.getParameter("email");
            String userId = req.getParameter("userid");
            long id = Long.parseLong(userId);
            for (String usernames : DaoFactory.getUsersDao().allUsernames()){
                System.out.println(usernames);
                if (usernames.equalsIgnoreCase(username)){
                    resp.sendRedirect("/");
                    return;
                }
            }
            DaoFactory.getUsersDao().editUser(id, firstname, lastname, username, email);
            req.getSession().removeAttribute("user");
            req.getSession().setAttribute("user", DaoFactory.getUsersDao().findByUsername(username));
            resp.sendRedirect("/profile");
        } else {
            resp.sendRedirect("/login");
        }
    }

}

