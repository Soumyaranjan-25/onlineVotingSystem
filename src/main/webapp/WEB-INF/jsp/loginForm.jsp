<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mo-Bus login form</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body style=" background-image: url("src/main/resources/image/backGround.png.jpg");">
	<div class="container bg-success" >
		<div>
			<h2 align="center">MO Bus login page</h2>
		</div>
		<img alt="Image" src="src/main/resources/image/backGround.png.jpg">
		<form action="./checkUser"  onsubmit="" class="form-group">
			<div class="text-info" >${ errMsg }</div>
			<div class="row">
				<div class="col-sm-3"></div>
				<div class="col-sm-3">
					<label class="text-warning">User Name <span
						class="text-danger">*</span></label> <input type="text" name="userName" id="userName"
						class="form-control">
				</div>
				<div class="col-sm-3">
					<label class="text-warning">Password</label> <input type="text"
						class="form-control" name="password" id="password"
						required="required">
				</div>
				<div class="col-sm-3"></div>
			</div>

			<div class="mt-3" align="center">
				<input type="submit" value="login" class="btn btn-success">
			</div>


			<div align="center" class="mt-3">
				<h5>
					not have an account ? <a href="./resisterUser">Resister Now</a>
				</h5>
			</div>
		</form>
	</div>
</body>

</html>