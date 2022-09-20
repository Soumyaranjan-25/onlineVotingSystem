<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
</head>
<body style="background-color: LightGray;">
	<div class="container  color mt-5">
		<div>
			<div>
				<a class=" text-light bg-dark" href="leaderPage">View</a> <a
					class=" text-light bg-dark" href="addPage">Add</a>
			</div>
		</div>
		<div class="container border" style="background-color: violet;">
			<h2 align="center">Add Page</h2>

			<div class="mt-5 ">
				<form class="form-group" action="./saveUserType" method="post">
					<h2>Add User Type</h2>
					<input type="hidden" value="${updateUserType.userTypeId}" name="userTypeId">
					<div class="row " style="background-color: white;">
						<div class="col-sm-4 mb-3">
							<label class="text-primary">User Type Name</label> <input
								type="text" class="form-control" name="userTypeName"
								id="userTypeName" required="required" value="${updateUserType.userTypeName}">
						</div>
						<div class="col-sm-2 mt-4">
							<input type="submit" value="save" class="btn btn-success">
						</div>
						<div class="col-sm-6">
							<div class="container border" style="background-color: light;">
								<table border="1" id="example" class="table table-striped mt-5">
									<thead>
										<tr>
											<th>Sl.No</th>
											<th>User Type Id</th>
											<th>User Type Name</th>
											<th>Action</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${userTypeList}" var="userType"
											varStatus="count">
											<tr>
												<td>${count.count}</td>
												<td>${userType.userTypeId}</td>
												<td>${userType.userTypeName}</td>
												<td><a
													href="./updateUserType?userTypeId=${userType.userTypeId}"
													class="btn btn-success">update</a><a
													href="deleteUserType?userTypeId=${userType.userTypeId}"
													class="btn btn-danger">delete</a></td>
											</tr>
										</c:forEach>


									</tbody>

								</table>
							</div>
						</div>
					</div>
				</form>
			</div>
			
			<div class="mt-5 ">
				<form class="form-group" action="./saveLanguage" method="post">
					<h2>Add Language</h2>
					<input type="hidden" value="${updateLanguage.languageId}" name="languageId">
					<div class="row " style="background-color: white;">
						<div class="col-sm-4 mb-3">
							<label class="text-primary">Language Name</label> <input
								type="text" class="form-control" name="languageName"
								id="languageName" required="required" value="${updateLanguage.languageName}">
						</div>
						<div class="col-sm-2 mt-4">
							<input type="submit" value="save" class="btn btn-success">
						</div>
						<div class="col-sm-6">
							<div class="container border" style="background-color: light;">
								<table border="1" id="example" class="table table-striped mt-5">
									<thead>
										<tr>
											<th>Sl.No</th>
											<th>Language Id</th>
											<th>Language Name</th>
											<th>Action</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach items="${LanguageList}" var="language"
											varStatus="count">
											<tr>
												<td>${count.count}</td>
												<td>${language.languageId}</td>
												<td>${language.languageName}</td>
												<td><a
													href="./updateLanguage?languageId=${language.languageId}"
													class="btn btn-success">update</a><a
													href="deleteLanguage?languageId=${language.languageId}"
													class="btn btn-danger">delete</a></td>
											</tr>
										</c:forEach>


									</tbody>

								</table>
							</div>
						</div>
					</div>
				</form>
			</div>

		</div>

	</div>
</body>
</html>