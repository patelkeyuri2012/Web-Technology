<%@ include file="all_component/allcss.jsp"%>
<%@include file="all_component/navbar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<style>
body {
	background-color: #e3e5e2 !important;
}

.containerformlogin {
	margin-bottom: 75px;
	margin-top: 75px;
}

.circle {
	height: 225px;
	width: 225px;
	background-color: #ddd;
	border-radius: 50%;
	padding: 40px 80px;
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
	margin-left: auto;
	margin-right: auto;
}

.contact-form-wrap {
	margin-top: -60px;
}

.register-link {
	font-size: 16px;
	color: #666;
	text-decoration: none;
	margin-top: 30px;
	display: block;
	text-align: center;
}

.register-link:hover {
	color: #101722;
	text-decoration: none;
	font-size: 16px;
	font-weight: bold;
}

.forgot-password-link {
	font-size: 14px;
	color: #666;
	text-decoration: none;
	margin-top: 20px;
	display: block;
	text-align: right;
}

.forgot-password-link:hover {
	color: #101722;
	text-decoration: none;
}
</style>
<script>
	function validate() {
		var email = document.getElementById("loginemail").value;
		var password = document.getElementById("loginpassword").value;

		var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

		if (!emailPattern.test(email)) {
			alert("Please enter a valid email address");
			return false;
		}
		if (password == "") {
			alert("Please enter a valid password");
			return false;
		}
		return true;
	}
</script>

</head>
<body>
	<div class="container">
		<div class="containerformlogin">
			<div class="row contact-form-wrap">
				<div class="col-xs-6">
					<div class="circle">
						<i class="fa fa-user"
							style="font-size: 150px; margin: -5px -5px 0 -33px;"></i>
					</div>
				</div>
				<div class="col-xs-6">

					<form action="login.htm" method="POST" onsubmit="return validate()">
						<div class="form-group">
							<input type="text" id="loginemail" name="loginemail" placeholder="E-mail">
						</div>
						<div class="form-group">
							<input type="password" id="loginpassword" name="loginpassword"
								placeholder="Password"> <a href="forgotpassword.jsp"
								class="forgot-password-link">Forgot Password?</a>
						</div>
						<div class="cr__btn">
							<button type="submit" class="btn">Login</button>
						</div>
						<div class="form-group">
							<a href="register.jsp" class="register-link">Register</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="all_component/footer.jsp"%>
	<%
        String errorMessage = (String) request.getAttribute("errorMessage");
        if (errorMessage != null && !errorMessage.isEmpty()) {
    %>
            <script>
                alert('<%= errorMessage %>');
            </script>
    <%
        }
    %>
</body>
</html>
