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
	<c:if test="${ onGoingElection eq NULL}">
		<h3 align="center" class="text-danger">
			<b> No Election is going on</b>
		</h3>
	</c:if>
	<c:if test="${ onGoingElection ne NULL}">
		<h2 align="center" class="text-danger">
			<b> ${ onGoingElection.electionName}</b>
		</h2>
		<c:if test="${appliedPost ne NULL }">
			<h4>
				<b>Applied Post</b>
			</h4>
			<div class="table-container mt-4">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>S.No</th>
							<th>Post Name</th>
							<th>Apply On</th>
							<c:if test="${appliedPost.candidateStatus eq 0}">
								<th>Action</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>${appliedPost.postId.postName}</td>
							<td>${appliedPost.applyOn}</td>
							<c:if test="${appliedPost.candidateStatus eq 0}">
								<td><a class='fas fa-trash' style='font-size: 24px'
									href="./deleteAppliedPost?candidateApplyId=${appliedPost.candidateApplyId}"></a></td>
							</c:if>


						</tr>
					</tbody>
				</table>
			</div>
		</c:if>
		<h4 class="mt-5">
			<b>Election Post Details</b>
		</h4>
		<div class="table-container mt-4">
			<table class="table table-bordered" id="dataTable">
				<thead>
					<tr>
						<th>S.No</th>
						<th>Post Name</th>
						<th>No Of Candidate</th>
						<th>Remark</th>
						<c:if test="${appliedPost eq NULL }">
							<th>Action</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${onGoingElection.postDetails}" var="postDetails"
						varStatus="count">
						<tr>
							<td>${count.count}</td>
							<td>${postDetails.post.postName}</td>
							<td>${postDetails.noOfCandidate}</td>
							<td>${postDetails.remark}</td>
							<c:if test="${appliedPost eq NULL }">
								<td><a
									href="./applyForPost?postId=${postDetails.post.postId}&electionId=${onGoingElection.electionId}"
									class="btn btn-success">Apply</a></td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</c:if>
</body>
</html>