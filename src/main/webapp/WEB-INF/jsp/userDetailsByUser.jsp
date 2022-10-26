<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<h2>User Details</h2>
	<hr>
	<h3>Filter</h3>
	<div align="right">
	<!-- <button style="font-size:24px;color:red" onclick="./downloadExcel "><span class="fa fa-file-excel-o"></span></button> -->
	<a style="font-size:24px;color:red" class="fa fa-file-excel-o" href="./downloadExcel"></a>
	<button style="font-size:24px;color:red"><span class="fa fa-file-pdf-o"></span></button>
	
	</div>
	<div class="container border mt-4">
		<form action="./searchUser">
			<div class="row">
				<div class="col-sm-6">
					<label class="text-primary">User Name<span
						class="text-danger">*</span></label> <input type="text"
						class="form-control" name="searchuserName" id="searchuserName"
						required="required" value="${updateUser.userName}"
						<c:if test="${updateUser ne NULL}">readonly</c:if>>
				</div>
				<div class="col-sm-6">
					<label class="text-primary">Resistration Number<span
						class="text-danger">*</span></label> <input type="text"
						class="form-control" name="searchRegdNo" id="searchRegdNo"
						required="required" value="${updateUser.regdNo}">
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<label class="text-primary">mobile no<span
						class="text-danger">*</span></label> <input type="text"
						class="form-control" name="searchMobileNo" id="searchMobileNo"
						required="required" value="${updateUser.mobileNo}">
				</div>
				<div class="col-sm-6">
					<label class="text-primary">Email<span class="text-danger">*</span></label>
					<input type="text" class="form-control" name="searchEmail"
						id="searchEmail" required="required" value="${updateUser.email}">
				</div>



			</div>
			<div class="row">
				<div class="col-sm-6">
					<label class="text-primary">Course Name<span
						class="text-danger">*</span>
					</label> <select class="form-control" name="searchCourse" id="searchCourse"
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
						name="searchBranch" id="searchBranch">
						<option value="0">Select</option>
					</select>
				</div>
			</div>


			<div class=" control-label mt-4 " align="center">
				<input type="submit" class="btn btn-success mr-3" value="search">
			</div>
		</form>
	</div>
	<h3 class="card-title">User Details</h3>
	<div class="table-container mt-4">
		<table class="table table-bordered" id="dataTable">
			<thead>
				<tr>
					<th>S.No</th>
					<th>User Name</th>
					<th>Regd No</th>
					<th>Course</th>
					<th>Branch</th>
					<th>D.O.B</th>
					<th>Mobile No</th>
					<th>Email</th>
					<th>Gender</th>
					<th>Remark</th>
					<th>Student Id Card</th>
					<th>Created On</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userList}" var="user" varStatus="count">
					<tr>
						<td>${count.count}</td>
						<td>${user.userName}</td>
						<td>${user.regdNo}</td>
						<td>${user.course.courseName}</td>
						<td>${user.branch.branchName}</td>
						<td><fmt:formatDate pattern="dd/MM/yyyy" value="${user.dob}" /></td>
						<td>${user.mobileNo}</td>
						<td>${user.email}</td>
						<td>${user.gender}</td>
						<td>${user.remark}</td>
						<td><a href="/downloadFile?userId=${user.userId}">${user.idCard}</a></td>
						<td><fmt:formatDate pattern="dd/MM/yyyy"
								value="${user.createdOn}" /></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</div>
</body>
</html>