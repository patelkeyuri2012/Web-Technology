package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/resetpassword.htm")
public class ResetPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("resetEmail") != null) {
            String email = (String) session.getAttribute("resetEmail");
            String password = request.getParameter("password");
            if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
                String errorMessage = "Email and password are required";
                request.setAttribute("errorMessage", errorMessage);
                forwardToResetPasswordPage(request, response);
                return;
            }
            try {
                updatePasswordInDatabase(email, password);
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
            session.invalidate();
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("resetpassword.jsp?error=session");
        }
    }

    private void updatePasswordInDatabase(String email, String password) throws ClassNotFoundException {
        String query = "UPDATE user SET password = ? WHERE email = ?";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, password);
            statement.setString(2, email);

            int rowsUpdated = statement.executeUpdate();

            if (rowsUpdated <= 0) {
                throw new SQLException("Error updating password");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private void forwardToResetPasswordPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
    }
}
