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
        String noteIdString = request.getParameter("id");
        if (noteIdString != null && !noteIdString.isEmpty()) {
            int noteId = Integer.parseInt(noteIdString);
            deleteNoteById(noteId);
        }
        response.sendRedirect("shownotes.htm");
    }

    private void deleteNoteById(int noteId) {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");
             PreparedStatement statement = connection.prepareStatement("DELETE FROM notes WHERE id = ?")) {
            statement.setInt(1, noteId);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
