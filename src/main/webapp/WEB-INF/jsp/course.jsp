<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Voting system</title>
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
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
<link
	rel="https://cdnjs.datatables/1.12.1/css/dataTables.bootstrap4.min.css">
<script
	src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap4.min.js"></script>
<body>

	<div>
		<h4>Course Page</h4>
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
					<form class="form-group" action="./saveCourse" method="post">
						<div>
							<input type="hidden" value="${updateCourse.courseId}" name="courseId" id="courseId">
						</div>
						<div class="row">
							<div class="col-sm-6">
								<label class="form-label text-info">Course Name<span
									class="text-danger">*</span> :
								</label> <input type="text" name="courseName" class="form-control"
									id="courseName" required autocomplete="off"
									value="${updateCourse.courseName}" />
							</div>
						</div>

						<div class="row">
							<div class="col-sm-6">
								<label class="form-label text-info">Remarks : </label>
								<textarea id="remark" name="remark" rows="2"
									class="form-control" autocomplete="off">${updateCourse.remark}
								</textarea>
							</div>
						</div>
						<div class="row mt-4 ml-5">
							<c:if test="${updateCourse eq NULL}">
								<input type="submit" value="submit" class="btn btn-success mr-3"
									onclick="validateForm()">
							</c:if>
							<c:if test="${updateCourse ne NULL}">
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
					<form action="./searchCourse">
						<div class="row mb-3">
							<div class="col-md-4 control-label">
								<label class="form-label control-label">Course Name : </label> <input
									type="text" name="searchCourseName" class="form-control"
									id="searchCourseName" required autocomplete="off" />
							</div>
							<div class="col-md-4 control-label">
								<label class="form-label control-label">Created After :
								</label> <input type="text" name="searchCreatedOn" class="form-control"
									id="searchCreatedOn" required autocomplete="off" placeholder="dd/mm/yyyy" />
							</div>
							<div class="col-md-4 control-label mt-4 ">
								<input type="submit" class="btn btn-success mr-3" value="submit">
							</div>
						</div>
					</form>
				</div>
				<h3 class="card-title">Course Details</h3>
				<div class="table-container mt-4">
					<table class="table table-bordered" id="dataTable">
						<thead>
							<tr>
								<th>S.No</th>
								<th>Course Name</th>
								<th>Remark</th>
								<th>Created On</th>
								<th>Created By</th>
								<th>Updated On</th>
								<th>Updated By</th>
								<th>No of Branch</th>
								<th colspan="2">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${courseList}" var="course" varStatus="count">
								<tr>
									<td>${count.count}</td>
									<td>${course.courseName}</td>
									<td>${course.remark}</td>
									<td><fmt:formatDate pattern="dd/MM/yyyy"
											value="${course.createdOn}" /></td>
									<td>${course.createdBy}</td>
									<td><fmt:formatDate pattern="dd/MM/yyyy"
											value="${course.updatedOn}" /></td>
									<td>${course.updatedBy}</td>
									<td>${course.branch.size()}</td>
									<td><a class='fas fa-edit' style='font-size: 24px;'
										href="./updateCourse?courseId=${course.courseId}"></a></td>
									<td><a class='fas fa-trash' style='font-size: 24px'
										href="./deleteCourse?courseId=${course.courseId}"></a></td>
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

		$(document).ready(function() {
			$('#dataTable').DataTable();
		});
		$('#searchCreatedOn').datepicker({
			format : 'dd/mm/yyyy'
		});
	</script>
</body>
</html>