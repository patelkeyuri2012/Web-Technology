<%@ include file="all_component/allcss.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password</title>
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
		var email = document.getElementById("email").value;
	
		var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

		if (!emailPattern.test(email)) {
			alert("Please enter a valid email address");
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
					
					<form action="forgotpassword.htm" method="POST" onsubmit="return validate()">
						<div class="form-group">
							<label for="password">Email</label>
							<input type="text" id="email" name="email">
						</div>
						
						<div class="cr__btn">
							<button type="submit" class="btn">Reset Password</button>
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
