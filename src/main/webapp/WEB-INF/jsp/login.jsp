<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>online voting system login page</title>
<style>

</style>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<style>
.container{
	height:50%;
	width:40%;
  align-items: center;
   margin-top: 8%;
}
</style>
</head>
<body>
	<div class="container border" >
	<form class="form-group">
	<h2 align="center">Login Page</h2>
		<div>
			<label>User Name</label>
			<input type="text" name="userId" id="userId" class="form-control">
		</div>
		<div>
			<label>Password</label>
			<input type="text" name="password" id="password" class="form-control">
		</div>
		<div>
			<label>captcha</label>
			<input type="text" name="password" id="password" class="form-control">
		</div>
		<div class="mt-3">
			<input type="submit" value="submit" class="form-control btn btn-success">
		</div>
		
		<div align="center">Not have an account ?<a href="./signUp" > sign up</a></div>
		</form>
	</div>
</body>
</html>