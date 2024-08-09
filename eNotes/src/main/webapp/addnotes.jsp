<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javax.servlet.http.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:if test="${empty sessionScope.CUSTOMER_LOGIN}">
	<%
	response.sendRedirect("loginpage.jsp");
	%>
</c:if>

<%@ include file="all_component/allcss.jsp"%>
<%@include file="all_component/navbar.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ADD Notes</title>
<style>
body {
	background-color: #e3e5e2 !important;
}

.containerformregister {
	margin-bottom: 75px;
	margin-top: 75px;
}

.contact-form-wrap {
	margin-top: -60px;
}

.circle {
	display: flex;
	justify-content: space-between;
	margin-top: 50px;
	margin-bottom: 20px;
}

.align-icons {
	font-size: 20px;
	display: flex;
}

.align-icons i {
	cursor: pointer;
	margin-right: 20px;
	font-size: 24px;
}

.action-icons {
	font-size: 20px;
	display: flex;
}

.action-icons i {
	cursor: pointer;
	margin-left: 20px;
	font-size: 24px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="containerformregister">
			<div class="row contact-form-wrap">
				<div class="col-xs-6">
					<div class="circle">
						<div class="align-icons">
							<i class="fas fa-align-left" onclick="alignLeft()"></i> <i
								class="fas fa-align-center" onclick="alignCenter()"></i> <i
								class="fas fa-align-right" onclick="alignRight()"></i> <i
								class="fas fa-align-justify" onclick="alignJustify()"></i>
						</div>
						<div class="action-icons">
							<i class="fa fa-undo" onclick="undoText()"></i> <i
								class="fas fa-redo-alt" onclick="redoText()"></i> <i
								class="fas fa-bold" onclick="boldText()"></i> <i
								class="fas fa-underline" onclick="underlineText()"></i> <i
								class="fa fa-italic" onclick="italicText()"></i> <i
								class="fas fa-paragraph" onclick="addParagraph()"></i>
						</div>
					</div>
				</div>
				<div class="col-xs-6">
					<form action="addnotes.htm" method="POST">
						<div class="form-group">
							<label for="firstname">Title</label><input type="text" id="title"
								name="title">
						</div>
						<div class="form-group">
							<label for="content">Content</label>
							<textarea id="content" name="content" rows="15" cols="50"></textarea>
						</div>

						<div class="cr__btn">
							<button type="submit" class="btn">Save</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
	<script>
		function alignLeft() {
			document.getElementById('content').style.textAlign = 'left';
		}

		function alignCenter() {
			document.getElementById('content').style.textAlign = 'center';
		}

		function alignRight() {
			document.getElementById('content').style.textAlign = 'right';
		}

		function alignJustify() {
			document.getElementById('content').style.textAlign = 'justify';
		}

		function undoText() {
			document.execCommand('undo', false, null);
		}

		function redoText() {
			document.execCommand('redo', false, null);
		}

		function boldText() {
			var content = document.getElementById('content');
			var startPos = content.selectionStart;
			var endPos = content.selectionEnd;
			var selectedText = content.value.substring(startPos, endPos);

			var newText = content.value.substring(0, startPos) + "<b>"
					+ selectedText + "</b>" + content.value.substring(endPos);

			content.value = newText;
		}

		function underlineText() {
			var content = document.getElementById('content');
			var startPos = content.selectionStart;
			var endPos = content.selectionEnd;
			var selectedText = content.value.substring(startPos, endPos);

			var newText = content.value.substring(0, startPos) + "<u>"
					+ selectedText + "</u>" + content.value.substring(endPos);

			content.value = newText;
		}

		function italicText() {
			var content = document.getElementById('content');
			var startPos = content.selectionStart;
			var endPos = content.selectionEnd;
			var selectedText = content.value.substring(startPos, endPos);

			var newText = content.value.substring(0, startPos) + "<i>"
					+ selectedText + "</i>" + content.value.substring(endPos);

			content.value = newText;
		}

		function addParagraph() {
			var content = document.getElementById('content');
			var startPos = content.selectionStart;
			var endPos = content.selectionEnd;
			var selectedText = content.value.substring(startPos, endPos);
			var newText = '		' + selectedText + ' ';

			content.value = content.value.substring(0, startPos) + newText
					+ content.value.substring(endPos);

			var newPosition = startPos + 1 + selectedText.length + 1;
			content.setSelectionRange(newPosition, newPosition);

			content.style.whiteSpace = 'pre-wrap';
			content.style.wordWrap = 'break-word';
		}
	</script>

</body>
</html>
