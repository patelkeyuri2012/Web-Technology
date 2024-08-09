<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ include file="all_component/allcss.jsp"%>
<%@include file="all_component/navbar.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<div class="single__slide animation__style01 slider__fixed--height">
		<div class="container">
			<div class="row align-items__center">
				<div class="col-md-7 col-sm-7 col-xs-12 col-lg-6">
					<div class="slide">
						<div class="slider__inner">
							<br>
							<br>
							<h1>Let's start to write your notes</h1>
							<div class="cr__btn">
								<a href="addnotes.jsp">Start Writing</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-sm-5 col-xs-12 col-md-5">
					<div class="slide__thumb">
						<div class="container-fluid back-img"></div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_component/footer.jsp"%>
</body>
</html>
