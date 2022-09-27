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
	<div class="container border">
		<div class="display-4  text-danger text-center mt-5">Student
			Resistration Page</div>
		<form action="./saveUserbySingUp" method="post" class="form-group" onsubmit="" enctype="multipart/form-data">
			<input type="hidden" name="userId" id="userId"
				value="${updateUser.userId}">
			<div class="row">
				<div class="col-sm-6">
					<label class="text-primary">User Name<span
						class="text-danger">*</span></label> <input type="text"
						class="form-control" name="userName" id="userName"
						required="required" value="${updateUser.userName}"
						<c:if test="${updateUser ne NULL}">readonly</c:if>>
				</div>
				<div class="col-sm-6">
					<label class="text-primary">Resistration Number<span class="text-danger">*</span></label>
					<input type="text" class="form-control" name="regdNo" id="regdNo"
						required="required" value="${updateUser.regdNo}">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<label class="text-primary">Password<span
						class="text-danger">*</span></label> <input type="password"
						class="form-control" name="password" id="password"
						required="required" value="${updateUser.password}"
						<c:if test="${updateUser ne NULL}">readonly</c:if>>

				</div>

				<div class="col-sm-6">
					<label class="text-primary">Repeat Password<span
						class="text-danger">*</span></label> <input type="password"
						class="form-control" name="repeatPassword" id="repeatPassword"
						onchange="validatePassword()" required="required"
						value="${updateUser.password}"
						<c:if test="${updateUser ne NULL}">readonly</c:if>>
				</div>
				
			</div>
			<div class="row">
				<div class="col-sm-6">
					<label class="text-primary">mobile no<span
						class="text-danger">*</span></label> <input type="text"
						class="form-control" name="mobileNo" id="mobileNo"
						required="required" value="${updateUser.mobileNo}">
				</div>
				<div class="col-sm-6">
					<label class="text-primary">Email<span class="text-danger">*</span></label>
					<input type="text" class="form-control" name="email" id="email"
						required="required" value="${updateUser.email}">
				</div>


				
			</div>
			<div class="row">
				<div class="col-sm-6">
					<label class="text-primary">Course Name<span
						class="text-danger">*</span>
					</label> <select class="form-control" name="course" id="course"
						onchange="getBranch()">
						<option value="Select">Select</option>
						<c:forEach items="${courseList}" var="course">
							<option value="${course.courseId}">${course.courseName}</option>

						</c:forEach>
					</select>
				</div>


				<div class="col-sm-6">
					<label class="text-primary">Branch Name<span
						class="text-danger">*</span></label> <select class="form-control "
						name="branch" id="branch" onchange="getfees()">
						<option value="0">Select</option>
					</select>
				</div>
			</div>


			<div class="row">
				<div class="col-sm-4">
					<label class="text-primary">D.O.B<span class="text-danger">*</span></label>
					<input type="text" class="form-control" name="dobb" id="dob"
						required="required"
						value="
						<fmt:formatDate pattern = "dd/mm/yyyy" value="${updateUser.dob}"/>">
				</div>
				<div class="col-sm-4 mt-4">
					<label class="text-primary mt-2 ml-2">Gender <span class="text-danger"> *</span></label>
					<input type="radio" name="gender" id="male" value="male"
						<c:if test="${updateUser.gender eq 'male'}">checked="checked"</c:if>>male
					<input type="radio" name="gender" id="female" value="female"
						<c:if test="${updateUser.gender eq 'female'}">checked="checked"</c:if>>female
				</div>
				<div class="col-md-4 control-label">
					<div class="form-group">
						<label class="text-primary">Upload Student ID card<span
							class="text-danger">*</span></label> <input type="file"
							class="form-control" name="studenIidCard" id="studenIidCard">
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-sm-6">
					<label class="text-primary">Address<span
						class="text-danger">*</span></label>
					<textarea name="address" id="address" class="form-control"></textarea>
				</div>
				<div class="col-sm-6">
					<label class="text-primary">Remark</label>
					<textarea name="remark" id="remark" class="form-control"></textarea>
				</div>
			</div>


			<div align="center" class="mt-5">
				<c:if test="${updateUser eq NULL}">
					<input type="submit" value="resister" class="btn btn-success">
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

		function getBranch() {
			var courseId = $("#course").val();
			$.ajax({
				type : "GET",
				url : "./getBranchByCourse",
				data : "courseId=" + courseId,
				success : function(response) {
					$("#branch").html(response);
				}

			});
		}
	</script>
</body>
</html>