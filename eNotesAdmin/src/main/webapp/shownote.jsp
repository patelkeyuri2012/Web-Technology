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
<title>User Notes</title>
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
</style>
</head>
<body>
	<div class="right">
		<div class="containerformregister">
			<h1>User Notes</h1>
			<br>
			<table>
				<thead>
					<tr>
						<th align="center">Id</th>
						<th>Title</th>
						<th>Content</th>
						<th>Date</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="note" items="${notes}">
						<tr>
							<td align="center">${note.id}</td>
							<td>${note.title}</td>
							<td>${note.content}</td>
							<td>${note.date}</td>
							<td><a href="#" class="delete-link"
								onclick="showConfirmation('${note.id}')"> <i
									class="fa fa-ban" style="margin-right: 5px;"></i>
							</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="all_component/footer.jsp"%>
	<script>
		function showConfirmation(noteId) {
			var confirmDelete = confirm("Are you sure you want to block this note?");
			if (confirmDelete) {
				window.location.href = "deletenote.htm?id=" + noteId;
			}
		}
	</script>
</body>
</html>
