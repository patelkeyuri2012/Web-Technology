<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="all_component/allcss.jsp"%>
<%@ include file="all_component/navbar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>User Details</title>
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

table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 10px;
    border-bottom: 1px solid #ccc;
}

th {
    background-color: #f9f9f9;
    color: #202c40;
}

td {
    background-color: #fff;
    color: #202c40;
}

.delete-link i {
    color: #202c40;
    font-size: 18px;
    transition: color 0.3s;
}

.delete-link:hover i {
    color: #ff0000;
    font-size: 20px;
}

.nav-link {
    font-family: Arial, sans-serif;
    color: #79808C !important;
    font-size: 18px;
    margin-right: 25px;
    margin-top: 10px;
}

.nav-link:hover {
    font-family: Arial, sans-serif;
    color: #202c40 !important;
    font-size: 18px;
    margin-right: 25px;
    margin-top: 10px;
}
</style>
</head>
<body>
    <div class="right">
        <div class="containerformregister">
            <h1>User Details</h1>
            <br>

            <table>
                <thead>
                    <tr>
                        <th align="right">Id</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Gender</th>
                        <th>Birthday</th>
                        <th>Contact No</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td align="center"><a href="shownote.htm?userId=${user.userId}" class="nav-link">${user.userId}</a></td>
                            <td>${user.firstName}</td>
                            <td>${user.lastName}</td>
                            <td>${user.email}</td>
                            <td>${user.password}</td>
                            <td>${user.gender}</td>
                            <td>${user.birthday}</td>
                            <td>${user.contactNo}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <%@ include file="all_component/footer.jsp"%>
</body>
</html>
