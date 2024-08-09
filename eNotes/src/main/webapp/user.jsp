<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>
<%@ include file="all_component/allcss.jsp" %>
<%@ include file="all_component/navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Profile</title>
<style>
body {
    background-color: #e3e5e2 !important;
}

.containerformregister {
    margin-bottom: 75px;
    margin-top: 75px;
}

.circle {
    height: 225px;
    width: 225px;
    background-color: #ddd;
    border-radius: 50%;
    text-align: center;
    margin-top: 25px;
    margin-bottom: 50px;
    margin-left: auto;
    margin-right: auto;
}

.nav-links {
    color: #202c40 !important;
}

.profile-header {
    text-align: center;
    margin-bottom: 20px;
}

.profile-header h1 {
    margin: 0;
    font-size: 24px;
    color: #333;
}

.profile-header p {
    margin: 5px 0;
    color: #666;
}

.profile-info {
    text-align: center;
    margin-top: 50px;
    margin-bottom: 20px;
}

.profile-info h2 {
    font-size: 20px;
    color: #333;
    border-bottom: 1px solid #ccc;
    padding-bottom: 5px;
    margin-bottom: 10px;
}

.profile-info p {
    color: #666;
    margin: 5px 0;
}
</style>
</head>
<body>

    <%
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "");

        statement = connection.createStatement();
        
        Integer userId = (Integer) session.getAttribute("userId");

        
        String query = "SELECT * FROM user WHERE userId = '" + userId + "'";
        resultSet = statement.executeQuery(query);

        if (resultSet.next()) {
            String firstName = resultSet.getString("firstName");
            String lastName = resultSet.getString("lastName");
            String email = resultSet.getString("email");
            String gender = resultSet.getString("gender");
            java.sql.Date birthday = resultSet.getDate("birthday");
            String contactNo = resultSet.getString("contactNo");

            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
            String formattedBirthday = outputFormat.format(birthday);

            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);
            request.setAttribute("email", email);
            request.setAttribute("gender", gender);
            request.setAttribute("formattedBirthday", formattedBirthday);
            request.setAttribute("contactNo", contactNo);
    %>
    <div class="container">
        <div class="containerformregister">
            <div class="profile-header">

                <div class="circle">
                <a class="nav-links" href="editprofile.htm">
                    <i class="fa fa-user" style="font-size: 150px; margin-top: 30px;"></i>
                    </a>
                </div>
                <h1><%=firstName + " " + lastName%></h1>
                <p><%=email%></p>
            </div>
            <div class="profile-info">
                <h2>Personal Information</h2>
                <p>
                    <strong>Gender:</strong>
                    <%=gender%></p>
                <p>
                    <strong>Birthday:</strong>
                    <%=formattedBirthday%></p>
                <p>
                    <strong>Contact No:</strong>
                    <%=contactNo%></p>

            </div>

        </div>
    </div>
    <%
    }
    } catch (Exception e) {
    e.printStackTrace();
    } finally {
    try {
    if (resultSet != null)
        resultSet.close();
    if (statement != null)
        statement.close();
    if (connection != null)
        connection.close();
    } catch (SQLException e) {
    e.printStackTrace();
    }
    }
    %>
    
    <%@ include file="all_component/footer.jsp"%>
</body>
</html>
