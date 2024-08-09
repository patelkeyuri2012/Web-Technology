<%@ include file="all_component/allcss.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Reset Password</title>
<link rel="icon" type="image/png" href="img/enotes.png" />

<style>
body {
	background-color: #e3e5e2 !important;
}

.containerformlogin {
	margin-bottom: 75px;
	margin-top: 175px;
}

.contact-form-wrap {
	margin-top: 0px; 
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
		var password = document.getElementById("password").value;
		var confirmPassword = document.getElementById("confirmpassword").value;

		

		if (password.length < 6) {
            alert("Password must be at least 6 characters long");
            return false;
        }
        if (password !== confirmPassword) {
            alert("Passwords do not match");
            return false;
        }
		return true;
	}
</script>
<%
	String errorParam = request.getParameter("error");
	if (errorParam != null && errorParam.equals("true")) {
	%>
	<script>
	    alert("Error Register. Please try again.");
	</script>
	<%
	}
	%>


</head>
<body>
	<div class="container">
		<div class="containerformlogin">
			<div class="row contact-form-wrap">
				
				<div class="col-xs-6">
					
					<form action="resetpassword.htm" method="POST" onsubmit="return validate()">
						<div class="form-group">
							<label for="password">Password</label>
							<input type="password" id="password" name="password">
						</div>
						<div class="form-group">
							<label for="confirmpassword">Confirm Password</label>
							<input type="password" id="confirmpassword" name="confirmpassword">
						</div>
						<div class="cr__btn">
							<button type="submit" class="btn">Change Password</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
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