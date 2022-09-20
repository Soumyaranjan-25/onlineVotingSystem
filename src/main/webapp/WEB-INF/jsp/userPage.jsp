<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h1 align="center" class="text-info">User Page</h1>
		<h2 align="center" class="text-warning">WelCome ${user.userName }</h2>
		<div class="container  mt-5">
			<table border="1" align="center">
				<tbody>
					<tr>
						<td>User Id :${user.userId }</td>
						<td>User Name :${user.userName }</td>
					</tr>
					<tr>
						<td>password : ${user.password }</td>
						<td>Mobile No : ${user.mobileNo }</td>
					</tr>
					<tr>
						<td>Religion : ${user.religion.religionName }</td>
						<td>Language :<c:forEach items="${user.language}" var="lang">  ${lang.languageName} </c:forEach></td>
					</tr>
					<tr>
						<td>Gender: ${user.gender }</td>
						<td>User Type :${user.userType.userTypeName }</td>
					</tr>
					<tr>
						<td>D.O.B: <fmt:formatDate pattern="dd/mm/yyyy"
								value="${user.dob}" /></td>
						<td>User status :${user.status }</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>