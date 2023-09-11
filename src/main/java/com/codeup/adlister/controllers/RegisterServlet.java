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
import java.util.List;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        try {
            if (checkUsername(username)){
                response.sendRedirect("/register");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String firstname = request.getParameter("first_name");
        String lastname = request.getParameter("last_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

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
        System.out.println("password in registerservlet is: " +password);
        String hash = BCrypt.hashpw(password, BCrypt.gensalt());
        System.out.println("username after hash in registerservlet is: " +username);
        System.out.println("password after hash in registerservlet is: " +hash);

        // create and save a new user
        User user = new User(firstname, lastname,username, email, hash);
//String firstName, String lastName, String username, String email, String password

        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }

    public boolean checkUsername(String username) throws SQLException {
        // Create a connection to the database
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/8080", "root", "codeup");
        // Create a prepared statement to check if the username already exists
        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE username = ?");
        // Set the parameter value
        preparedStatement.setString(1, username);
        // Execute the prepared statement
        ResultSet resultSet = preparedStatement.executeQuery();
        // Check the result of the query
        if (resultSet.next()) {
            // The username exists
            return true;
        } else {
            // The username does not exist
            return false;
        }
    }
}
