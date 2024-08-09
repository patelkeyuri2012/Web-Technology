<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="java.io.*"%>

<%
HttpSession sessions = request.getSession();
String customerLogin = (String) sessions.getAttribute("CUSTOMER_LOGIN");
%>
<!DOCTYPE html>
<html>

<head>
<title>eNotes</title>
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


.navbar {
	background-color: #202c40;
}

.navbar-toggler {
	color: #fff;
	border-color: #f5f5f5;
}

.nav-link {
	color: #e3e5e2 !important;
	font-weight: bold;
	font-size: 20px;
	margin-right: 15px;
	margin-top: 10px;
}

.nav-link:hover, .nav-link:focus {
	display: inline-block;
	background-color: #202c40;
	color: #fff;
	padding: 15px 30px;
	font-size: 18px;
	font-weight: bold;
	text-transform: uppercase;
	border-radius: 30px;
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

.dropdown:hover .dropdown-menu {
	display: block;
}
</style>

</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"> <i
				class="fas fa-pen-nib" style="font-size: 50px; color: #f5f5f5;"></i>
				<span class="enotes-text"
				style="font-size: 50px; font-family: 'Comic Sans MS', sans-serif; color: #f5f5f5;">eNotes</span>
			</a>


			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="index.jsp">HOME</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="addnotes.jsp">ADD
							NOTES</a></li>
					<li class="nav-item"><a class="nav-link" href="shownotes.htm">SHOW
							NOTES</a></li>
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
							<li><a class="dropdown-item" href="user.jsp">PROFILE </a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="logout.jsp"><i
									class="fa fa-power-off" style="font-size: 24px;">&nbsp;&nbsp;</i>
									LOGOUT</a></li>
						</ul></li>

					<%
					} else {
					%>
					<li class="nav-item dropdown" id="user-dropdown"><a
						class="nav-link"> <i class="fa fa-user user-icon"
							style="font-size: 24px;"></i>
					</a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="login.jsp">LOGIN</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="register.jsp">REGISTRATION</a></li>
						</ul></li>
					<%
					}
					%>

				</ul>
			</div>
		</div>
	</nav>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>

</html>
