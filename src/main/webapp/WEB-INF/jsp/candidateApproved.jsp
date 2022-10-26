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
<body>

	<div>
		<h4>Candidate Approve Page</h4>
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

				<c:forEach items="${ongoinElection.postDetails }" var="postDetails"
					varStatus="count">
					<div class="container border">
						<h4>
							<b>${postDetails.post.postName }</b>
						</h4>
						<div class="table-container mt-4">
							<table class="table table-bordered" id="dataTable">
								<thead>
									<tr>
										<th>S.No</th>
										<th>User Name</th>
										<th>Regd No</th>
										<th>Course</th>
										<th>Branch</th>
										<th>Mobile No</th>
										<th>Email</th>
										<th>Student Id Card</th>
										<th colspan="2">Action</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${candidateApplyDetailsList}"
										var="candidateApplyDetails" varStatus="count">
										<c:if
											test="${candidateApplyDetails.postId.postId eq  postDetails.post.postId}">
											<tr>
												<td>${count.count}</td>
												<td>${candidateApplyDetails.userId.userName}</td>
												<td>${candidateApplyDetails.userId.regdNo}</td>
												<td>${candidateApplyDetails.userId.course.courseName}</td>
												<td>${candidateApplyDetails.userId.branch.branchName}</td>
												<td>${candidateApplyDetails.userId.mobileNo}</td>
												<td>${candidateApplyDetails.userId.email}</td>
												<td><a
													href="/downloadFile?userId=${candidateApplyDetails.userId.userId}">${candidateApplyDetails.userId.idCard}</a></td>
												<td><a class="btn btn-success" style='font-size: 15px;'
													href="./updateCandidateApproved?candidateApplyId=${candidateApplyDetails.candidateApplyId}">Approve</a></td>
												<td><a class='btn btn-warning' style='font-size: 15px'
													href="./candidateDiscard?candidateApplyId=${candidateApplyDetails.candidateApplyId}">Discard</a></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<hr>
				</c:forEach>

			</div>
			<div id="view">

				<h3 class="card-title">Approved Candidate Details</h3>
				<div class="table-container mt-4">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>S.No</th>
								<th>PostName</th>
								<th>User Name</th>
								<th>Regd No</th>
								<th>Course</th>
								<th>Branch</th>
								<th>Mobile No</th>
								<th>Student Id Card</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ApprovedcandidateApplyDetailsList}"
								var="ApprovedcandidateApplyDetailsList" varStatus="count">
								<tr>
									<td>${count.count}</td>
									<td>${ApprovedcandidateApplyDetailsList.postId.postName}</td>
									<td>${ApprovedcandidateApplyDetailsList.userId.userName}</td>
									<td>${ApprovedcandidateApplyDetailsList.userId.regdNo}</td>
									<td>${ApprovedcandidateApplyDetailsList.userId.course.courseName}</td>
									<td>${ApprovedcandidateApplyDetailsList.userId.branch.branchName}</td>
									<td>${ApprovedcandidateApplyDetailsList.userId.mobileNo}</td>
									<td><a
										href="/downloadFile?userId=${ApprovedcandidateApplyDetailsList.userId.userId}">${ApprovedcandidateApplyDetailsList.userId.idCard}</a></td>
									<td><a class='fas fa-trash' style='font-size: 24px'
										href="./candidateDiscard?candidateApplyId=${ApprovedcandidateApplyDetailsList.candidateApplyId}"></a></td>
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