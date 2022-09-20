<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Resistration</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.css"
	rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.js"></script>
</head>
<body>
	<div class="container">
		<div class="display-4  text-danger text-center mt-5">User
			Resistration Form</div>
		<form action="./saveUser" method="post" class="form-group" onsubmit="">
			<input type="hidden" name="userId" id="userId"
				value="${updateUser.userId}">
			<div class="row">
				<div class="col-sm-6">
					<label class="text-primary">User Name</label> <input type="text"
						class="form-control" name="userName" id="userName"
						required="required" value="${updateUser.userName}"
						<c:if test="${updateUser ne NULL}">readonly</c:if>>
				</div>
				<div class="col-sm-6">
					<label class="text-primary">Email</label> <input type="text"
						class="form-control" name="email" id="email" required="required"
						value="${updateUser.email}">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<label class="text-primary">Password</label> <input type="password"
						class="form-control" name="password" id="password"
						required="required" value="${updateUser.password}"
						<c:if test="${updateUser ne NULL}">readonly</c:if>>

				</div>

				<c:if test="${updateUser ne NULL}">
					<div class="col-sm-6">
						<label class="text-primary">User Type</label> <select
							name="userType" id="userType" class="form-control">
							<option>--select--</option>
							<c:forEach items="${userTypeList}" var="userType">
								<option value="${userType.userTypeId}"
									<c:if test="${updateUser.userType.userTypeId eq userType.userTypeId}">selected="selected"</c:if>>${userType.userTypeName}</option>
							</c:forEach>

						</select>
					</div>
				</c:if>
				<c:if test="${updateUser eq NULL}">

					<div class="col-sm-6">
						<label class="text-primary">Repeat Password</label> <input
							type="password" class="form-control" name="repeatPassword"
							id="repeatPassword" onchange="validatePassword()"
							required="required" value="${updateUser.password}"
							<c:if test="${updateUser ne NULL}">readonly</c:if>>
					</div>
				</c:if>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<label class="text-primary">mobile no</label> <input type="text"
						class="form-control" name="mobileNo" id="mobileNo"
						required="required" value="${updateUser.mobileNo}">
				</div>


				<div class="col-sm-6">
					<label class="text-primary">D.O.B</label> <input type="text"
						class="form-control" name="dobb" id="dob" required="required"
						value="
						<fmt:formatDate pattern = "dd/mm/yyyy" value="${updateUser.dob}"/>">
				</div>
			</div>

			<div class="row">
				<div class="col-sm-4 mt-4">
					<label class="text-primary">Gender</label> <input type="radio"
						name="gender" id="male" value="male"
						<c:if test="${updateUser.gender eq 'male'}">checked="checked"</c:if>>male
					<input type="radio" name="gender" id="female" value="female"
						<c:if test="${updateUser.gender eq 'female'}">checked="checked"</c:if>>female
				</div>


				<div class="col-sm-4">
					<label class="text-primary">Religion</label> <select
						name="religion" id="relogion" class="form-control">
						<option>--select--</option>
						<c:forEach items="${religionList}" var="religion">
							<option value="${religion.religionId}"
								<c:if test="${updateUser.religion.religionId eq religion.religionId}">selected="selected"</c:if>>${religion.religionName}</option>
						</c:forEach>

					</select>
				</div>
				<div class="col-sm-4 mt-4">
					<label class="text-primary">Language</label>
					<c:forEach items="${languageList}" var="language">
						<input type="checkbox" value="${language.languageId}"
							name="language"
							<c:forEach items="${updateUser.language}" var="lang"> <c:if test="${lang.languageId eq language.languageId}">checked="checked"</c:if></c:forEach>>${language.languageName} 
						</c:forEach>
				</div>
			</div>

			<div align="center" class="mt-5">
				<c:if test="${updateUser eq NULL}">
					<input type="submit" value="submit" class="btn btn-success">
				</c:if>
				<c:if test="${updateUser ne NULL}">
					<input type="submit" value="update" class="btn btn-success">
				</c:if>
				<input type="reset" value="clear" class="btn btn-secondary">

			</div>


		</form>
	</div>
	<script type="text/javascript">
		$('#dob').datepicker({
			format : 'dd/mm/yyyy'
		});
	</script>
</body>
</html>