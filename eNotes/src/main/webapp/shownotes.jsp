<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.servlet.http.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:if test="${empty sessionScope.CUSTOMER_LOGIN}">
	<%
	response.sendRedirect("loginpages.jsp");
	%>
</c:if>
<%@ include file="all_component/allcss.jsp"%>
<%@include file="all_component/navbar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Show Notes</title>
<style>
body {
	background-color: #e3e5e2 !important;
}

.containerformregister {
	max-width: 100%;
	margin-bottom: 75px;
	margin-top: 75px;
	background-color: #fff;
}

.contact-form-wrap {
    margin-top: 0; 
}


.edit-link i, .delete-link i {
	color: #202c40;
	font-size: 18px;
	transition: color 0.3s;
}

.edit-link:hover i {
	color: #339900;
	font-size: 20px;
}

.delete-link:hover i {
	color: #ff0000;
	font-size: 20px;
}

input {
	width: 50%;
	padding: 10px;
	margin-top: 20px;
	margin-bottom: 50px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	background-color: #fff;
}

button {
	color: #202c40;
	background: none;
	cursor: pointer;
	font-size: 24px;
	border: none;
}

button i.fa-search {
	font-size: 28px;
	color: #202c40;
}

button:hover i.fa-search {
	font-size: 30px;
	color: #202c40 !important;
}

.note {
    padding: 10px;
    margin-bottom: 20px;
    position: relative;
    background-color: #f9f9f9;
}

.note::after {
    content: "";
    position: absolute;
    bottom: -1px;
    left: 0;
    width: 100%;
    height: 1px;
    background-color: #ccc;
}


.modify {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.note-details {
	font-size: 16px;
	margin-left: 975px;
	flex-grow: 1;
}

.note-actions {
	margin-left: 5px;
}

.sort-dropdown {
	position: absolute;
	top: 10px;
	right: 10px;
}

.sort-dropbtn {
	background-color: #202c40;
	color: white;
	padding: 10px;
	font-size: 16px;
	min-width: 150px;
	border: none;
	cursor: pointer;
	border-radius: 4px;
}

.sort-dropdown-content {
	display: none;
	position: absolute;
	right: 10px;
	background-color: #f9f9f9;
	min-width: 100px;
	border-radius: 4px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.sort-dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
	font-size: 16px;
}

.sort-dropdown-content a:hover {
	background-color: #f1f1f1;
}

.sort-dropdown:hover .sort-dropdown-content {
	display: block;
}
</style>
</head>
<body>
	<div class="container">
		<div class="containerformregister">
			<div class="row contact-form-wrap">
				<form action="shownotes.htm" method="POST" id="searchForm"
					style="margin-bottom: 75px; position: relative;">
					<input type="hidden" id="orderByInput" name="orderBy" value="">
					<button type="button" id="showSearchButton"
						onclick="toggleSearch()">
						<i class="fas fa-search"></i>
					</button>
					<input type="text" id="searchInput" name="searchKeyword"
						placeholder="Enter data to search..." style="display: none;">
					<button type="submit" id="searchButton" style="display: none;">
						<i class="fas fa-search"></i>
					</button>
					<div class="sort-dropdown">
						<button class="sort-dropbtn" id="sortDropdownButton">Sort
							by</button>
						<div class="sort-dropdown-content">
							<a href="shownotes.htm?orderBy=Title">Title</a> <a
								href="shownotes.htm?orderBy=Latest">Latest</a> <a
								href="shownotes.htm?orderBy=Oldest">Oldest</a>
						</div>
					</div>
				</form>
				<c:forEach var="note" items="${notes}">
					<div class="note">
						<h3>${note.title}</h3><br>
						<p>${note.content}</p>
						<div class="modify">
							<div class="note-details">
								<span>${note.date}</span>
							</div>
							<div class="note-actions">
								
									<form action="updatenotes.jsp" method="POST" style="display: inline;">
                    <input type="hidden" name="id" value="${note.id}">
                    <button type="submit" class="edit-link"><i class="fas fa-edit"></i></button>
                </form>
                <form action="deletenotes.htm" method="POST" onsubmit="return confirm('Are you sure you want to delete this note?');" style="display: inline;">
                    <input type="hidden" name="id" value="${note.id}">
                    <button type="submit" class="delete-link"><i class="fas fa-trash-alt"></i></button>
                </form>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<script>
		function sortBy(option) {
			document.getElementById("orderByInput").value = option;
			document.getElementById("searchForm").submit();
		}

		function showConfirmation(id) {
			var confirmDelete = confirm("Are you sure you want to delete this note?");
			if (confirmDelete) {
				window.location.href = "deletenotes.htm?id=" + id;
			}
		}

		function toggleSearch() {
			var searchInput = document.getElementById("searchInput");
			var searchButton = document.getElementById("searchButton");
			var showSearchButton = document.getElementById("showSearchButton");
			searchInput.style.display = "inline-block";
			searchButton.style.display = "inline-block";
			showSearchButton.style.display = "none";
		}
	</script>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
