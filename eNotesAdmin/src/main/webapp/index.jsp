<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
    import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException"%>
<%@ include file="all_component/allcss.jsp"%>
<%@ include file="all_component/navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
body {
    background-color: #e3e5e2 !important;
}

.right {
    background-color: #e3e5e2;
    margin-left: 225px;
    padding: 20px;
    z-index: 1;
}

.containerformregister {
    margin-bottom: 75px;
    margin-top: 75px;
    max-width: 1200px;
    margin-left: auto;
    margin-right: auto;
}

.count-box {
    border-radius: 5px;
    background-color: #EEEFED;
    width: 500px;
    padding: 25px;
    margin-left: 15px;
    margin-bottom: 10px;
    margin-top: 30px;
    display: inline-block;
    vertical-align: middle;
}

.count-title {
    font-size: 20px;
    font-weight: bold;
}

.count-value {
    font-size: 28px;
    color: #4C5666;
}

.circle {
    width: 100px;
    height: 100px;
    background-color: #f0f0f0;
    border-radius: 50%;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 15px;
}

.circle i {
    font-size: 50px;
}

.address__details {
    display: flex;
    align-items: center;
}

.ht__product__dtl {
    margin-left: 10px;
}

</style>
</head>
<body>
    <div class="right">
        <div class="containerformregister">
            <%
            int userCount = 0;
            int notesCount = 0;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/enotes", "root", "")) {
                    PreparedStatement statement1 = connection.prepareStatement("SELECT COUNT(*) FROM user");
                    ResultSet resultSet1 = statement1.executeQuery();
                    if (resultSet1.next()) {
                        userCount = resultSet1.getInt(1);
                    }
                    
                    PreparedStatement statement2 = connection.prepareStatement("SELECT COUNT(*) FROM notes");
                    ResultSet resultSet2 = statement2.executeQuery();
                    if (resultSet2.next()) {
                        notesCount = resultSet2.getInt(1);
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
            %>
            <h1>eNotes Analysis</h1><br>
            <div class="count-box">
                <div class="address__details">
                    <div class="circle">
                        <i class="fa fa-user"></i>
                    </div>
                    <div class="ht__product__dtl">
                        <h3>Total Users</h3>
                        <h3 style="color: #4C5666;"><%= userCount %></h3>
                    </div>
                </div>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="count-box">
                <div class="address__details">
                    <div class="circle">
                        <i class="fa fa-sticky-note"></i>
                    </div>
                    <div class="ht__product__dtl">
                        <h3>Total Notes</h3>
                        <h3 style="color: #4C5666;"><%= notesCount %></h3>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<%@ include file="all_component/footer.jsp"%>
