<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.io.*"%>

<%
HttpSession sessions = request.getSession();
String customerLogin = (String) sessions.getAttribute("CUSTOMER_LOGIN");

if (customerLogin == null || !customerLogin.equals("true")) {
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>eNotes Admin</title>
<link rel="icon" type="image/png" href="img/enotes.png" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<style>
body {
	background-color: #202c40;
	color: #e3e5e2 !important;
	font-family: Arial, sans-serif;
}

navbar-brand img {
	max-width: 100px;
}

.navbar-toggler {
	color: #202c40;
}

.navbar-nav .nav-link {
	font-family: Arial, sans-serif;
	color: #e3e5e2 !important;
	font-size: 18px;
	margin-right: 25px;
	margin-top: 10px;
}

.dropdown-menu {
	color: #202c40 !important;
	font-weight: bold;
	font-size: 20px;
	padding: 5px;
	background-color: #e3e5e2;
}

.dropdown-item {
	color: #202c40 !important;
	font-weight: bold;
	font-size: 14px;
	padding: 10px 10px;
	background-color: #e3e5e2;
}

.dropdown-item:hover {
	display: inline-block;
	background-color: #9096a0;
	color: #202c40;
	padding: 10px 10px;
	font-size: 16px;
	font-weight: bold;
	text-transform: uppercase;
}

.dropdown:hover .dropdown-menu{
	display: block;
	right: 0 !important;
	left: auto !important;
}
</style>
</head>
<body>
	<div id="left-panel" class="left-panel">
		<nav class="navbar navbar-expand-lg navbar-dark">
			<ul class="navbar-nav flex-column">
				<li class="menu-title">Menu</li>
				<li class="menu-item-has-children dropdown"><a
					href="index.jsp" class="nav-link">eNote Master</a></li>
					<li class="menu-item-has-children dropdown"><a
					href="user.htm" class="nav-link">User Master</a></li>
					<li class="menu-item-has-children dropdown"><a
					href="shownotes.htm" class="nav-link">Note Master</a></li>
				
			</ul>
		</nav>
	</div>
	<div id="right-panel" class="right-panel"
		style="background-color: #202c40;">
		<nav class="navbar navbar-expand-lg ">
			<div class="container">
				<a class="navbar-brand" href="index.jsp"> <i
					class="fas fa-pen-nib" style="font-size: 50px; color: #f5f5f5;"></i>
					<span class="enotes-text"
					style="font-size: 40px; font-family: 'Comic Sans MS', sans-serif; color: #f5f5f5;">eNotes</span>
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#navbarNav" aria-controls="navbarNav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ml-auto">
						<%
						if (customerLogin != null && customerLogin.equals("true")) {
							String username = (String) sessions.getAttribute("USERNAME");
						%>

						<li class="nav-item dropdown" id="user-dropdown"><a
							class="nav-link"> <i class="fa fa-user-lock"
								style="font-size: 24px;"></i>
						</a>
							<ul class="dropdown-menu dropdown-menu-end"
								aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="profile.jsp">PROFILE </a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="logout.jsp"><i
										class="fa fa-power-off" style="font-size: 28px;">&nbsp;&nbsp;</i>
										LOGOUT</a></li>
							</ul></li>

						<%
						}
						%>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.10.2/umd/popper.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/js/bootstrap.min.js"></script>
</body>
</html>
