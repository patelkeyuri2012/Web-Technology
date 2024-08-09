
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/style.css">

<script src="path/to/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>


<style>
.back-img {
	background: url("img/enote.jpg");
	width: 100%;
	height: 50vh;
	background-repeat: no-repeat;
	background-size: cover;
	animation-name: slideIn;
	animation-duration: 1s;
}

@keyframes slideIn {
    from {
        transform: translateX(100%);
    }
    to {
        transform: translateX(0);
    }
}
.single__slide {
	background-color: #f5f5f5;
	padding: 100px 0;
}

.slider__inner h1 {
	font-size: 72px;
	color: #202c40;
	font-weight: bold;
	margin-bottom: 40px;
	animation-name: slideOut;
	animation-duration: 1s;
}

@keyframes slideOut {
    from {
        transform: translateX(-100%);
    }
    to {
        transform: translateX(0);
    }
}
.cr__btn a {
	display: inline-block;
	background-color: #202c40;
	color: #fff;
	padding: 15px 30px;
	font-size: 16px;
	font-weight: bold;
	text-transform: uppercase;
	border-radius: 30px;
	transition: all 0.3s ease-in-out;
	text-decoration: none;
	animation-name: slideOut;
	animation-duration: 1s;
	text-decoration: none;
}

.cr__btn a:hover {
	transform: translateY(-5px);
	background-color: #fff;
	color: #202c40;
	border: 2px solid #202c40;
	text-decoration: none;
}

.slide__thumb img {
	width: 100%;
	height: auto;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
	display: none;
}

.containerformlogin {
	max-width: 500px;
	margin: 0 auto;
	padding: 50px;
	color: #202c40;
	background-color: #f5f5f5;
	border-radius: 10px;
}

.containerformregister {
	max-width: 700px;
	margin: 0 auto;
	padding: 50px;
	color: #202c40;
	background-color: #f5f5f5;
	border-radius: 10px;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-top: 15px;
	margin-bottom: 10px;
	font-weight: bold;
}

input, textarea {
	width: 100%;
	padding: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
}

button.btn {
	display: block;
	width: 100%;
	padding: 10px;
	margin-top: 40px;
	background-color: #202c40;
	color: #f5f5f5;
	font-weight: bold;
	text-transform: uppercase;
	border: none;
	border-radius: 5px;
}

button.btn:hover {
	transform: translateY(-5px);
	background-color: #fff;
	color: #202c40;
	border: 2px solid #202c40;
	text-decoration: none;
}
</style>