<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>manageUserPage</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
<link
	rel="https://cdnjs.datatables/1.12.1/css/dataTables.bootstrap4.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
</head>
<body style="background-color: LightGray;">

	<div class="container  color mt-5">
		<div>
			<a class=" text-light bg-dark" href="leaderPage">View</a> 
			<a class=" text-light bg-dark" href="addPage">Add</a>
		</div>
		<h2 align="center">${msg}</h2>
		<div class="container border" style="background-color: violet;">
			<table border="1" id="example" class="table table-striped mt-5">
				<thead>
					<tr>
						<th>Sl.No</th>
						<th>User Name</th>
						<th>Email</th>
						<th>Mobile No</th>
						<th>Gender</th>
						<th>D.O.B</th>
						<th>Religion</th>
						<th>Language</th>
						<th>USer Type</th>
						<th>Action</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach items="${userList}" var="user" varStatus="count">
						<tr>
							<td>${count.count}</td>
							<td>${user.userName}</td>
							<td>${user.email}</td>
							<td>${user.mobileNo}</td>
							<td>${user.gender}</td>
							<td><fmt:formatDate pattern="dd/MM/yyyy" value="${user.dob}" /></td>
							<td>${user.religion.religionName}</td>
							<td><c:forEach items="${user.language}" var="lang">
						${lang.languageName}
						</c:forEach></td>
							<td>${user.userType.userTypeName}</td>
							<td><a href="./updateUser?userId=${user.userId}"
								class="btn btn-success">update</a><a
								href="deleteUser?userId=${user.userId}" class="btn btn-danger">delete</a></td>

						</tr>
					</c:forEach>


				</tbody>

			</table>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$('#example').DataTable();
		});
	</script>
</body>
</html>