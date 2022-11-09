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
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
</head>
<body>

	<div>
		<h4>Vote to candidate Page</h4>
		<hr>
		<c:if test="${ onGoingElection.electionStatus eq 0}">
			<h3 class="text-info" align="center">
				<b>Election is not starting</b>
			</h3>
		</c:if>
		<c:if test="${ onGoingElection.electionStatus eq 1}">
			<c:if test="${candidateVotingDetailsList.size() ne 0}">
				<h3>
					<b>Your Vote Details</b>
				</h3>
				<hr>
				<div class="table-container mt-4">
					<table class="table table-bordered" id="dataTable">
						<thead>
							<tr>
								<th>S.No</th>
								<th>Post</th>
								<th>Candidate Name</th>
								<th>Election Name</th>
								<th>Date</th>

							</tr>
						</thead>
						<tbody>
							<c:forEach items="${candidateVotingDetailsList}"
								var="candidateVotingDetails" varStatus="count">
								<tr>
									<td>${count.count}</td>
									<td>${candidateVotingDetails.post.postName}</td>
									<td>${candidateVotingDetails.candidate_id.userName}</td>
									<td>${candidateVotingDetails.election.electionName}</td>
									<td><fmt:formatDate pattern="dd/MM/yyyy"
											value="${candidateVotingDetails.votingDate}" /></td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</c:if>
			<hr>
			<h3>
				<b>Candidate Details</b>
			</h3>
			<hr>
			<c:if test="${ongoingELectionPostDetailsList.size() eq 0}">
				<h3 class="text-danger mb-5" align="center">
					<b>You have already give vote for all posts</b>
				</h3>
			</c:if>
			<c:forEach items="${ongoingELectionPostDetailsList }"
				var="postDetails" varStatus="count">
				<h4 class="text-info">
					<b>${postDetails.post.postName}</b>
				</h4>
				<div class="container border">
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
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${approvedCandidateList}"
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
											<td><a class="btn btn-warning" style='font-size: 15px;'
												href="./saveCandidateVote?candidateApplyId=${candidateApplyDetails.candidateApplyId}">Vote</a></td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
				<hr>
			</c:forEach>
		</c:if>
	</div>

	
</body>
</html>