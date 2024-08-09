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

@WebServlet("/shownotes.htm")
public class ShowNotesServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Notes> notes = new ArrayList<>();
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("loginpages.jsp");
            return;
        }
        int userId = (int) session.getAttribute("userId");

        String searchKeyword = request.getParameter("searchKeyword");
        String orderBy = request.getParameter("orderBy");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");

            StringBuilder sqlBuilder = new StringBuilder("SELECT * FROM `notes` WHERE userId = ?");
            List<Object> params = new ArrayList<>();
            params.add(userId);

            if (searchKeyword != null && !searchKeyword.isEmpty()) {
                sqlBuilder.append(" AND (title LIKE ? OR content LIKE ?)");
                params.add("%" + searchKeyword + "%");
                params.add("%" + searchKeyword + "%");
            }

            if (orderBy != null && !orderBy.isEmpty()) {
                switch (orderBy.toLowerCase()) {
                    case "title":
                        sqlBuilder.append(" ORDER BY title ASC");
                        break;
                    case "latest":
                        sqlBuilder.append(" ORDER BY datetime DESC");
                        break;
                    case "oldest":
                        sqlBuilder.append(" ORDER BY datetime ASC");
                        break;
                    default:
                        break;
                }
            }

            PreparedStatement statement = connection.prepareStatement(sqlBuilder.toString());
            for (int i = 0; i < params.size(); i++) {
                statement.setObject(i + 1, params.get(i));
            }

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                String date = resultSet.getString("datetime");

                Notes note = new Notes(id, title, content, date);
                notes.add(note);
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        request.setAttribute("notes", notes);
        request.getRequestDispatcher("shownotes.jsp").forward(request, response);
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
