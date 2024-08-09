package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.user.UserDetails;

@WebServlet("/userregister.htm")
public class UserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {

        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            PrintWriter out = response.getWriter();

            String firstName = request.getParameter("firstname");
            String lastName = request.getParameter("lastname");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirmpassword");
            String gender = request.getParameter("gender");
            String birthday = request.getParameter("bday");
            String cno = request.getParameter("cno");
            

            if (isDuplicateEmail(email)) {
                String errorMessage = "This email is already registered";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            if (isDuplicateContactNumber(cno)) {
                String errorMessage = "This contact number is already registered";
                request.setAttribute("errorMessage", errorMessage);
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            if (firstName == null || firstName.isEmpty() || lastName == null || lastName.isEmpty() || email == null
                    || email.isEmpty() || password == null || password.isEmpty() || confirmPassword == null
                    || confirmPassword.isEmpty() || gender == null || gender.isEmpty() || birthday == null
                    || birthday.isEmpty() || cno == null || cno.isEmpty()) {
                out.println("<script>alert('All fields are required');</script>");
                response.sendRedirect("register.jsp");
                return;
            }

            UserDetails ud = new UserDetails();
            ud.setFirstName(firstName);
            ud.setLastName(lastName);
            ud.setEmail(email);
            ud.setPassword(password);
            ud.setConfirmPassword(confirmPassword);
            ud.setGender(gender);
            ud.setBirthday(birthday);
            ud.setContactNo(cno);

            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");

            String sql = "INSERT INTO `enotes`.`user` (`firstName`, `lastName`, `email`, `password`, `gender`, `birthday`, `contactNo`) VALUES (?, ?, ?, ?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, ud.getFirstName());
            preparedStatement.setString(2, ud.getLastName());
            preparedStatement.setString(3, ud.getEmail());
            preparedStatement.setString(4, ud.getPassword());
            preparedStatement.setString(5, ud.getGender());
            preparedStatement.setString(6, ud.getBirthday());
            preparedStatement.setString(7, ud.getContactNo());

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
                response.sendRedirect("login.jsp");
            }

        } catch (IOException | SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

    private boolean isDuplicateEmail(String email) {
        String query = "SELECT COUNT(*) FROM user WHERE email = ?";
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, email);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    private boolean isDuplicateContactNumber(String cno) {
        String query = "SELECT COUNT(*) FROM user WHERE contactNo = ?";
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");
             PreparedStatement statement = connection.prepareStatement(query)) {

            statement.setString(1, cno);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    int count = resultSet.getInt(1);
                    return count > 0;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
