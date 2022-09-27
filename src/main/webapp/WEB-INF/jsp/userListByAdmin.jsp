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
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
</head>
<body>
	<div>
		<h4>User List</h4>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs card-header-tabs">
							<li class="nav-item"><a class="nav-link active" id="pendingId"
								onclick="openPending()">Pending</a></li>
							<li class="nav-item"><a class="nav-link" id="approvedId"
								onclick="openApproved()">Approved</a></li>
							<li class="nav-item"><a class="nav-link" id="discardId"
								onclick="openDiscard()">Discard</a></li>
						</ul>
					</div>


				</div>
			</div>
		</div>
		<div class="card-body">


			<div id="pending">
				<h3 class="card-title">Filter</h3>
				<div class="container border mt-4">
					<form action="./searchPendingUser">
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
								<label class="text-primary">Email<span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" name="searchEmail" id="searchEmail"
									required="required" value="${updateUser.email}">
							</div>



						</div>
						<div class="row">
							<div class="col-sm-6">
								<label class="text-primary">Course Name<span
									class="text-danger">*</span>
								</label> <select class="form-control" name="searchCourse"
									id="searchCourse" onchange="getBranch()">
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
								<th colspan="2">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pendingUserList}" var="user" varStatus="count">
								<tr>
									<td>${count.count}</td>
									<td>${user.userName}</td>
									<td>${user.regdNo}</td>
									<td>${user.course.courseName}</td>
									<td>${user.branch.branchName}</td>
									<td><fmt:formatDate pattern="dd/MM/yyyy"
											value="${user.dob}" /></td>
									<td>${user.mobileNo}</td>
									<td>${user.email}</td>
									<td>${user.gender}</td>
									<td>${user.remark}</td>
									<td><a href="/downloadFile?userId=${user.userId}">${user.idCard}</a></td>
									<td><fmt:formatDate pattern="dd/MM/yyyy"
											value="${user.createdOn}" /></td>
									<td><a  class="btn btn-success" style='font-size: 15px;'
										href="./approvedByAdmin?userId=${user.userId}">Approved</a></td>
									<td><a class='btn btn-warning' style='font-size: 15px'
										href="./discardByAdmin?userId=${user.userId}">Discard</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div id="approved">
				<h3 class="card-title">Filter</h3>
				<div class="container border mt-4">
					<form action="./searchPendingUser">
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
								<label class="text-primary">Email<span
									class="text-danger">*</span></label> <input type="text"
									class="form-control" name="searchEmail" id="searchEmail"
									required="required" value="${updateUser.email}">
							</div>



						</div>
						<div class="row">
							<div class="col-sm-6">
								<label class="text-primary">Course Name<span
									class="text-danger">*</span>
								</label> <select class="form-control" name="searchCourse"
									id="searchCourse" onchange="getBranch()">
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
							<c:forEach items="${approvedUserList}" var="user" varStatus="count">
								<tr>
									<td>${count.count}</td>
									<td>${user.userName}</td>
									<td>${user.regdNo}</td>
									<td>${user.course.courseName}</td>
									<td>${user.branch.branchName}</td>
									<td><fmt:formatDate pattern="dd/MM/yyyy"
											value="${user.dob}" /></td>
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
			<div id="discard">
			<h3 class="card-title">Filter</h3>
			<div class="container border mt-4">
				<form action="./searchPendingUser">
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
							<label class="text-primary">Email<span
								class="text-danger">*</span></label> <input type="text"
								class="form-control" name="searchEmail" id="searchEmail" required="required"
								value="${updateUser.email}">
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
								name="searchBranch" id="searchBranch" >
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
						<c:forEach items="${discardUserList}" var="user" varStatus="count">
							<tr>
								<td>${count.count}</td>
								<td>${user.userName}</td>
								<td>${user.regdNo}</td>
								<td>${user.course.courseName}</td>
								<td>${user.branch.branchName}</td>
								<td><fmt:formatDate pattern="dd/MM/yyyy"
										value="${user.dob}" /></td>
								<td>${user.mobileNo}</td>
								<td>${user.email}</td>
								<td>${user.gender}</td>
								<td>${user.remark}</td>
								<td><a
									href="/downloadFile?userId=${user.userId}">${user.idCard}</a></td>
								<td><fmt:formatDate pattern="dd/MM/yyyy"
										value="${user.createdOn}" /></td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		</div>
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

		$(document).ready(function() {
			$('#pending').show();
			$('#approved').hide();
			$('#discard').hide();
			
		});

		
		function openPending() {
			$('#approved').hide();
			$('#discard').hide();
			$('#pending').show();

			$('#pendingId').addClass("active");
			$('#discardId').removeClass("active");
			$('#approvedId').removeClass("active");
		}
		
		function openApproved() {
			$('#approved').show();
			$('#discard').hide();
			$('#pending').hide();

			$('#approvedId').addClass("active");
			$('#discardId').removeClass("active");
			$('#pendingId').removeClass("active");
		}
		
		function openDiscard() {
			$('#approved').hide();
			$('#discard').show();
			$('#pending').hide();

			$('#approvedId').removeClass("active");
			$('#discardId').addClass("active");
			$('#pendingId').removeClass("active");
		}

		

		$(document).ready(function() {
			$('#dataTable').DataTable();
		});
	</script>
</body>
</html>