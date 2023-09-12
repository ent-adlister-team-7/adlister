package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLUsersDao;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String firstname = request.getParameter("first_name");
        String lastname = request.getParameter("last_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");


        for(String usernameCheck : DaoFactory.getUsersDao().allUsernames()){
            System.out.println("username to be checked " + usernameCheck);
            if(username.toLowerCase().equals(usernameCheck.toLowerCase())){
                request.setAttribute("usernameTakenMessage", "Username is already taken. Please choose a different one.");
                try {
                    request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
                } catch (ServletException e) {
                    throw new RuntimeException(e);
                }
                return;
            }
        }
        // validate input
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty()
                || firstname.isEmpty()
                || lastname.isEmpty()
                || password.isEmpty()
                || (!password.equals(passwordConfirmation));

        if (inputHasErrors) {
            response.sendRedirect("/register");
            return;
        }



        // hash the password
        String hash = BCrypt.hashpw(password, BCrypt.gensalt());
        // create new user
        User user = new User(firstname, lastname,username, email, hash);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }


}
