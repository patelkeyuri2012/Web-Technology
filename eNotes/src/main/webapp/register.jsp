<%@ include file="all_component/allcss.jsp"%>
<%@include file="all_component/navbar.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>
<style>
body {
	background-color: #e3e5e2 !important;
}

.containerformregister {
	margin-bottom: 75px;
	margin-top: 75px;
}

.contact-form-wrap {
	margin-top: 0px;
}

.custom-radio {
	position: relative;
	display: inline-block;
	margin-left: 100px;
	cursor: pointer;
}

.custom-radio input[type="radio"] {
	position: relative;
	opacity: 1;
	display: inline-block;
	width: 20px;
	height: 20px;
	border: 2px solid #666;
	border-radius: 50%;
	cursor: pointer;
}

.custom-radio input[type="radio"]:checked+.radio-icon {
	background-color: #202c40;
}

.custom-radio label {
	margin-left: 5px;
	margin-bottom: 25px;
	vertical-align: middle;
}
</style>
<script>
	function validate() {
		var firstName = document.getElementById("firstname").value;
		var lastName = document.getElementById("lastname").value;
		var email = document.getElementById("email").value;
		var password = document.getElementById("password").value;
		var confirmPassword = document.getElementById("confirmpassword").value;
		var gender = document.querySelector('input[name="gender"]:checked');
		var bday = document.getElementById("bday").value;
		var phone = document.getElementById("cno").value;

		var alphaPattern = /^[a-zA-Z]+$/;
		var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		var phonePattern = /^[6-9]\d{9}$/;

		if (!alphaPattern.test(firstName)) {
			alert("Please enter a valid first name");
			return false;
		}
		if (!alphaPattern.test(lastName)) {
			alert("Please enter a valid last name");
			return false;
		}
		if (!emailPattern.test(email)) {
			alert("Please enter a valid email address");
			return false;
		}
		if (password.length < 6) {
			alert("Password must be at least 6 characters long");
			return false;
		}
		if (password !== confirmPassword) {
			alert("Passwords do not match");
			return false;
		}
		if (!gender) {
			alert("Please select your gender");
			return false;
		}
		if (!bday) {
			alert("Please select your birthday");
			return false;
		}
		if (!phonePattern.test(phone)) {
			alert("Please enter a valid phone number (10 digits)");
			return false;
		}

		return true;
	}
</script>


</head>
<body>
	<div class="container">
		<div class="containerformregister">
			<div class="row contact-form-wrap">

				<form action="userregister.htm" method="POST"
					onsubmit="return validate()">
					<div class="form-group">
						<label for="firstname">First Name</label><input type="text"
							id="firstname" name="firstname">
					</div>
					<div class="form-group">
						<label for="lastname">Last Name</label><input type="text"
							id="lastname" name="lastname">
					</div>

					<div class="form-group">
						<label for="email">Email</label><input type="email" id="email"
							name="email">
					</div>
					<div class="form-group">
						<label for="password">Password</label><input type="password"
							id="password" name="password">
					</div>
					<div class="form-group">
						<label for="confirmpassword">Confirm Password</label><input
							type="password" id="confirmpassword" name="confirmpassword">
					</div>
					<div class="form-group">
						<label>Gender</label>
						<div class="custom-radio">
							<input type="radio" id="male" value="male" name="gender">
							<span class="radio-icon"></span> <label for="male">Male</label>
						</div>
						<div class="custom-radio">
							<input type="radio" id="female" value="female" name="gender">
							<span class="radio-icon"></span> <label for="female">Female</label>
						</div>
					</div>
					<div class="form-group">
						<label for="bday">Birthday</label><input type="date" id="bday"
							name="bday" max="2015-12-31">
					</div>
					<div class="form-group">
						<label for="cno">Contact No</label><input type="text" id="cno"
							name="cno">
					</div>
					<div class="cr__btn">
						<button type="submit" class="btn">Register</button>
					</div>
				</form>

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
