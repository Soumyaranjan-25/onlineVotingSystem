<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
</head>
<body>
	<div style="height: 100%">
		<h4>Branch Page</h4>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs card-header-tabs">
							<li class="nav-item"><a class="nav-link active" id="addId"
								onclick="openAdd()">Add</a></li>
							<li class="nav-item"><a class="nav-link" id="viewId"
								onclick="openView()">View</a></li>
						</ul>
					</div>


				</div>
			</div>
		</div>
		<div class="card-body">

			<div id="add">
				<div class="container border">
					<form class="form-group" action="./saveBranch" method="post">
						<div>
							<input type="hidden" value="${updateBranch.branchId}"
								name="branchId" id="branchId">
						</div>
						<div class="row">
							<div class="col-sm-6">
								<label class="text-primary">Course Name<span
									class="text-danger">*</span>
								</label> <select class="form-control" name="course" id="course"
									onchange="getBranch()">
									<option value="Select">Select</option>
									<c:forEach items="${courseList}" var="course">
										<option value="${course.courseId}"
											<c:if test="${updateBranch.course.courseId eq course.courseId }">selected="selected"</c:if>>${course.courseName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<label class="form-label">Branch Name<span
									class="text-danger">*</span> :
								</label> <input type="text" name="branchName" class="form-control"
									id="branchName" required value="${updateBranch.branchName}" />
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<label class="form-label">Remarks : </label>
								<textarea name="remark" id="remark" class="form-control">${updateBranch.remark }</textarea>
							</div>
						</div>
						<div class="row mt-4 ml-5">
							<c:if test="${updateBranch eq NULL}">
								<input type="submit" value="submit" class="btn btn-success mr-3"
									onclick="validateForm()">
							</c:if>
							<c:if test="${updateBranch ne NULL}">
								<input type="submit" value="update" class="btn btn-info mr-3"
									onclick="validateForm()">
							</c:if>
							<input type="reset" class="btn btn-warning" value="reset">
						</div>
					</form>
				</div>
			</div>
			<div id="view">
				<h3 class="card-title">Filter</h3>
				<div class="container border mt-4">
					<form action="./searchBranch">
						<div class="row mb-3">
							<div class="col-sm-6">
								<label class="text-primary">Course Name<span
									class="text-danger">*</span>
								</label> <select class="form-control" name="searchCourseName"
									id="searchCourseName" onchange="getBranch()">
									<option value="Select">Select</option>
									<c:forEach items="${courseList}" var="course">
										<option value="${course.courseId}">${course.courseName}</option>

									</c:forEach>
								</select>
							</div>
							<div class="col-md-6 control-label">
								<label class="form-label control-label">Branch Name : </label> <input
									type="text" name="searchBranchName" class="form-control"
									id="searchBranchName" required autocomplete="off" />
							</div>

						</div>
						<div class="row mb-3">
							<div class="col-md-6 control-label">
								<label class="form-label control-label">Created After :
								</label> <input type="text" name="searchCreatedOn" class="form-control"
									id="searchCreatedOn" required autocomplete="off"
									placeholder="dd/mm/yyyy" />
							</div>
							<div class="col-md-4 control-label mt-4 ">
								<input type="submit" class="btn btn-success mr-3" value="submit">
							</div>
						</div>
					</form>
				</div>
				<h3 class="card-title">Branch Details</h3>
				<div class="table-container mt-4">
					<table class="table table-bordered" id="dataTable">
						<thead>
							<tr>
								<th>S.No</th>
								<th>Branch Name</th>
								<th>Course Name</th>
								<th>Remark</th>
								<th>Created On</th>
								<th>Created By</th>
								<th>Updated On</th>
								<th>Updated By</th>
								<th colspan="2">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${branchList}" var="branch" varStatus="count">
								<tr>
									<td>${count.count}</td>
									<td>${branch.branchName}</td>
									<td>${branch.course.courseName}</td>
									<td>${branch.remark}</td>
									<td><fmt:formatDate pattern="dd/MM/yyyy"
											value="${branch.createdOn}" /></td>
									<td>${branch.createdBy}</td>
									<td><fmt:formatDate pattern="dd/MM/yyyy"
											value="${branch.updatedOn}" /></td>
									<td>${branch.updatedBy}</td>
									<td><a class='fas fa-edit' style='font-size: 24px;'
										href="./updateBranch?branchId=${branch.branchId}"></a></td>
									<td><a class='fas fa-trash' style='font-size: 24px'
										href="./deleteBranch?branchId=${branch.branchId}"></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('#add').show();
			$('#view').hide();
		});

		function openAdd() {
			$('#view').hide();
			$('#add').show();

			$('#addId').addClass("active");
			$('#viewId').removeClass("active");
		}
		function openView() {
			$('#view').show();
			$('#add').hide();

			$('#addId').removeClass("active");
			$('#viewId').addClass("active");
		}
	</script>
</body>
</html>