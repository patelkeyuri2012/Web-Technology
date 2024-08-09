package com.servlet;

import com.user.UserDetails;

import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user.htm")
public class ShowUserServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<UserDetails> users = fetchAllUsers();
        if (users != null) {
            request.setAttribute("users", users);
            request.getRequestDispatcher("user.jsp").forward(request, response);
        } else {
            // Handle error
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error fetching user details.");
        }
    }

    private List<UserDetails> fetchAllUsers() {
        List<UserDetails> users = new ArrayList<>();
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM user");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int userId = resultSet.getInt("userId");
                String firstName = resultSet.getString("firstName");
                String lastName = resultSet.getString("lastName");
                String email = resultSet.getString("email");
                String password = resultSet.getString("password");
                String gender = resultSet.getString("gender");
                Date birthday = resultSet.getDate("birthday");
                String contactNo = resultSet.getString("contactNo");

                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
                String formattedBirthday = outputFormat.format(birthday);

                UserDetails user = new UserDetails(userId, firstName, lastName, email, password, gender, contactNo, formattedBirthday);
                users.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
