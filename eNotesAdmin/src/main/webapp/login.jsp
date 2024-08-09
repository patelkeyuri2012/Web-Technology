<%@ include file="all_component/allcss.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="icon" type="image/png" href="img/enotes.png" />
<style>
body {
    background-color: #e3e5e2 !important;
}

.containerformlogin {
    margin-bottom: 75px;
    margin-top: 150px;
}

.contact-form-wrap {
    margin-top: -60px;
}

.link-container {
    margin-top: 30px;
    text-align: right;
}

.link {
    font-size: 16px;
    color: #666;
    text-decoration: none;
    margin-right: 10px;
}

.link:hover {
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
            <form action="login.htm" method="POST" onsubmit="return validate()">
                <div class="form-group">
                    <input type="text" id="loginemail" name="loginemail" placeholder="E-mail">
                </div>
                <div class="form-group">
                    <input type="password" id="loginpassword" name="loginpassword" placeholder="Password">
                </div>
                <div class="link-container">
                    <a href="register.jsp" class="link">Register</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="forgotpassword.jsp" class="link">Forgot Password?</a>
                </div>
                <div class="cr__btn">
                    <button type="submit" class="btn">Login</button>
                </div>
            </form>
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
