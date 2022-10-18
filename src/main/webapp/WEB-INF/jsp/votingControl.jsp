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
		<h4>Voting Control</h4>
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="card">
					<div class="card-header">
						<ul class="nav nav-tabs card-header-tabs">
							<li class="nav-item"><a class="nav-link active" id="addId"
								onclick="openAdd()">Add</a></li>
							<li class="nav-item"><a class="nav-link" id="startId"
								onclick="openStart()">Start</a></li>
							<li class="nav-item"><a class="nav-link" id="endId"
								onclick="openEnd()">End</a></li>
						</ul>
					</div>


				</div>
			</div>
		</div>
		<div class="card-body">

			<div id="add">
				<h4>Declare Post</h4>
				<div class="container border">
					<form class="form-group" action="./savePostDetails" method="post">
						<input type="hidden" name="postDetailsId" id="postDetailsId"
							value="${updatePostDetails.postDetailsId}">
						<div class="row">
							<div class="col-sm-6">
								<label class="form-label text-info">Post Name<span
									class="text-danger">*</span> :
								</label> <select class="form-control" name="post" id="post">
									<option value="Select">Select</option>
									<c:forEach items="${postList}" var="post">
										<option value="${post.postId}"
											<c:if test="${updatePostDetails.post.postId eq post.postId}">selected="selected"</c:if>>${post.postName}</option>

									</c:forEach>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6">
								<label class="form-label text-info">No of Candidate </label> <input
									type="number" id="noOfCandidate" name="noOfCandidate"
									class="form-control" autocomplete="off"
									value="${updatePostDetails.noOfCandidate}">

							</div>
						</div>

						<div class="row">
							<div class="col-sm-6">
								<label class="form-label text-info">Remarks : </label>
								<textarea id="remark" name="remark" rows="2"
									class="form-control" autocomplete="off">${updatePostDetails.remark}
								</textarea>
							</div>
						</div>

						<div class="row mt-2">
							<div class="col-sm-2">
								<button class="btn btn-success">Add</button>

							</div>
						</div>
					</form>
				</div>
			</div>
			<div id="start">
				<c:if test="${onGoingElection ne NULL}">
					<h4 class="text-danger" align="center">
						<b>${onGoingElection.electionName } is going on</b>
					</h4>
				</c:if>
				<c:if test="${onGoingElection eq NULL}">
					<h3 class="card-title" align="center">Election Name</h3>
				</c:if>

				<div class="table-container mt-4 ">
					<table class="table table-bordered" id="dataTable">
						<thead>
							<tr>
								<th>S.No</th>
								<th>Post Name</th>
								<th>No Of Candidate</th>
								<th>Remark</th>

								<c:if test="${onGoingElection eq NULL}">
									<th colspan="2">Action</th>
								</c:if>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${postDetailsList}" var="postDetails"
								varStatus="count">
								<tr>
									<td>${count.count}</td>
									<td>${postDetails.post.postName}</td>
									<td>${postDetails.noOfCandidate}</td>
									<td>${postDetails.remark}</td>
									<c:if test="${onGoingElection eq NULL}">
										<td><a class='fas fa-edit' style='font-size: 24px;'
											href="./updatepostDetails?postDetailsId=${postDetails.postDetailsId}"></a></td>
										<td><a class='fas fa-trash' style='font-size: 24px'
											href="./deletepostDetails?postDetailsId=${postDetails.postDetailsId}"></a></td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<hr>
				<c:if test="${onGoingElection eq NULL}">
					<h4>Start Election</h4>
					<div class="StartContainer border">

						<form class="form-group" action="./electionDetails" method="post">
							<div class="row">
								<div class="col-sm-6">
									<label class="form-label text-info">Election Name<span
										class="text-danger">*</span> :
									</label> <input type="text" id="electionName" name="electionName"
										class="form-control" autocomplete="off">
								</div>
								<div class="col-sm-6">
									<label class="form-label text-info">Election Year<span
										class="text-danger">*</span> :
									</label> <select class="form-control" name="electionYear"
										id="electionYear">
										<option value="0">Select</option>
										<option value="2019-20">2019-20</option>
										<option value="2020-21">2020-21</option>
										<option value="2021-22">2021-22</option>
										<option value="2022-23">2022-23</option>
										<option value="2023-24">2023-24</option>
										<option value="2024-25">2024-25</option>
										<option value="2025-26">2025-26</option>

									</select>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-6">
									<label class="form-label text-info">Remarks : </label>
									<textarea id="remark" name="remark" rows="2"
										class="form-control" autocomplete="off">
								</textarea>
								</div>
								<div class="col-sm-2"></div>
								<div class="col-sm-3 mt-5">
									<button class="btn btn-success">Start</button>

								</div>
							</div>
						</form>
					</div>
				</c:if>



			</div>
			<div id="end">
				<h4>End Election</h4>
				<div class="Container border">
					<form class="form-group" action="./endElection" method="post">
						<div class="row ml-2">
							<div class="col-sm-6">
								<label class="form-label text-info">Election Name : </label> <input
									type="text" id="electionName" name="electionName"
									class="form-control" value="${onGoingElection.electionName }"
									readonly>
							</div>
						</div>
						<div class="row ml-2">
							<div class="col-sm-6 ">
								<label class="form-label text-info">Election Year : </label> <input
									type="text" value="${onGoingElection.electionYear }"
									class="form-control" readonly>
							</div>
						</div>
						<div class="row ml-2">
							<div class="col-sm-5 mt-3 ">
								<button class="btn btn-danger">End</button>

							</div>
						</div>

					</form>
				</div>
			</div>

		</div>
	</div>
	<script>
		$(document).ready(function() {
			$('#add').show();
			$('#start').hide();
			$('#end').hide();
		});

		function openAdd() {
			$('#start').hide();
			$('#add').show();
			$('#end').hide();

			$('#addId').addClass("active");
			$('#startId').removeClass("active");
			$('#endId').removeClass("active");
		}
		function openStart() {
			$('#start').show();
			$('#add').hide();
			$('#end').hide();

			$('#addId').removeClass("active");
			$('#startId').addClass("active");
			$('#endId').removeClass("active");
		}

		function openEnd() {
			$('#start').hide();
			$('#end').show();
			$('#add').hide();

			$('#endId').addClass("active");
			$('#startId').removeClass("active");
			$('#addId').removeClass("active");
		}

		function startElection() {

		}

		$(document).ready(function() {
			$('#dataTable').DataTable();
		});
	</script>
</body>
</html>