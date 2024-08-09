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

@WebServlet("/deletenotes.htm")
public class DeleteNotesServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Connection connection = null;
		String noteIdParam = request.getParameter("id");
		if (noteIdParam != null && !noteIdParam.isEmpty()) {
			try {
				int noteId = Integer.parseInt(noteIdParam);

				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");

				String deleteQuery = "DELETE FROM notes WHERE id = ?";
				PreparedStatement ps = connection.prepareStatement(deleteQuery);
				ps.setInt(1, noteId);

				int rowsAffected = ps.executeUpdate();

				if (rowsAffected > 0) {
					response.sendRedirect("shownotes.htm");
				}

			} catch (NumberFormatException ec) {
				ec.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e1) {
				e1.printStackTrace();

			} finally {
				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException ex) {
						ex.printStackTrace();
					}
				}
			}
		}
	}
}