package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginpages.htm")
public class LoginPagesServlet extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("loginemail");
		String password = request.getParameter("loginpassword");

		if (email == null || email.isEmpty() || password == null || password.isEmpty()) {
			String errorMessage = "Email and password are required";
			request.setAttribute("errorMessage", errorMessage);
			forwardToLoginPage(request, response);
			return;
		}

		try {
			if (authenticateUser(email, password)) {
				HttpSession session = request.getSession();
				int userId = getUserIdByEmail(email);
				String userName = getUserNameById(userId);
				session.setAttribute("CUSTOMER_LOGIN", "true");
				session.setAttribute("userId", userId);
				session.setAttribute("USERNAME", userName);
				response.sendRedirect("shownotes.jsp");
			} else {
				String errorMessage = "Invalid email or password";
				request.setAttribute("errorMessage", errorMessage);
				forwardToLoginPage(request, response);
			}
		} catch (ClassNotFoundException | IOException | ServletException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private boolean authenticateUser(String email, String password) throws ClassNotFoundException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");

			PreparedStatement statement = connection
					.prepareStatement("SELECT * FROM user WHERE email = ? AND password = ?");
			statement.setString(1, email);
			statement.setString(2, password);

			ResultSet resultSet = statement.executeQuery();
			return resultSet.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	private void forwardToLoginPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
		dispatcher.forward(request, response);
	}
	private int getUserIdByEmail(String email) throws SQLException, ClassNotFoundException {
		try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "")) {
			PreparedStatement statement = connection.prepareStatement("SELECT userId FROM user WHERE email = ?");
			statement.setString(1, email);
			try (ResultSet resultSet = statement.executeQuery()) {
				if (resultSet.next()) {
					return resultSet.getInt("userId");
				}
			}
		}
		return -1;
	}
	private String getUserNameById(int userId) throws SQLException, ClassNotFoundException {
	    try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "")) {
	        PreparedStatement statement = connection.prepareStatement("SELECT firstName FROM user WHERE userId = ?");
	        statement.setInt(1, userId);
	        try (ResultSet resultSet = statement.executeQuery()) {
	            if (resultSet.next()) {
	                return resultSet.getString("firstName");
	            }
	        }
	    }
	    return null;
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
