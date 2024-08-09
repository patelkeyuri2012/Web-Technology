package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/forgotpassword.htm")
public class ForgotPasswordServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        
        if (isEmailExists(email)) {
            HttpSession session = request.getSession();
            session.setAttribute("resetEmail", email);
            response.sendRedirect("resetpassword.jsp");
        } else {
            String errorMessage = "Email does not exist";
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
        }
    }

    private boolean isEmailExists(String email) {
        String query = "SELECT email FROM admin WHERE email = ?";
        
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");

             PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, email);
            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
        return false;
    }
}
