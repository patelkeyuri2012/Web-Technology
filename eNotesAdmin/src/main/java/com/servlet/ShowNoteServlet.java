package com.servlet;

import com.user.Notes;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/shownote.htm")
public class ShowNoteServlet extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	         throws ServletException, IOException {
	     List<Notes> notes = new ArrayList<>();
	     request.setCharacterEncoding("UTF-8");
	     
	     String userIdParam = request.getParameter("userId");
	     if (userIdParam == null || userIdParam.isEmpty()) {
	         return;
	     }

	     int userId = Integer.parseInt(userIdParam);

	     try {
	         Class.forName("com.mysql.cj.jdbc.Driver");
	         try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");
	              PreparedStatement statement = connection.prepareStatement("SELECT * FROM notes WHERE userId = ?")) {
	             
	             statement.setInt(1, userId);
	             
	             try (ResultSet resultSet = statement.executeQuery()) {
	                 while (resultSet.next()) {
	                     int id = resultSet.getInt("id");
	                     String title = resultSet.getString("title");
	                     String content = resultSet.getString("content");
	                     String date = resultSet.getString("datetime");

	                     Notes note = new Notes(id, userId, title, content, date);
	                     notes.add(note);
	                 }
	             }
	         }
	     } catch (ClassNotFoundException | SQLException e) {
	         e.printStackTrace();
	     }

	     request.setAttribute("notes", notes);
	     request.getRequestDispatcher("shownote.jsp").forward(request, response);
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
