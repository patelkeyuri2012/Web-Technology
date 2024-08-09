<%@ page import="javax.servlet.http.*" %>

<%
    HttpSession sessions = request.getSession();
    sessions.invalidate();
    response.sendRedirect("login.jsp"); 
%>
