package com.servlet;

import com.user.Notes;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/shownotes.htm")
public class ShowNotesServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        List<Notes> notes = fetchAllNotes();

        request.setAttribute("notes", notes);
        request.getRequestDispatcher("shownotes.jsp").forward(request, response);
    }

    private List<Notes> fetchAllNotes() {
        List<Notes> notes = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");
                 PreparedStatement statement = connection.prepareStatement("SELECT * FROM notes");
                 ResultSet resultSet = statement.executeQuery()) {

                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    int userId = resultSet.getInt("userId");
                    String title = resultSet.getString("title");
                    String content = resultSet.getString("content");
                    String date = resultSet.getString("datetime");

                    Notes note = new Notes(id, userId, title, content, date);
                    notes.add(note);
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return notes;
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
