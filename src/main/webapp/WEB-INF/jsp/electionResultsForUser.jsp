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
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>
</head>
<body>
	<div>
		<h4>
			<b>Election Results Page</b>
		</h4>
		<hr>
		<c:if test="${ onGoingElection.electionStatus eq 0}">
			<h3 class="text-info" align="center">
				<b>Election is not starting</b>
			</h3>
		</c:if>
		<c:if test="${ onGoingElection.electionStatus eq 1}">
			<h3 class="text-secondary" align="center">
				<b>${onGoingElection.electionName} results is not declare yet</b>
			</h3>
		</c:if>
		<c:if test="${onGoingElection.electionStatus eq 2}">
			<h3 class="text-secondary" align="center">${onGoingElection.electionName} Results</h3>
			<hr>
			<c:forEach items="${onGoingElection.postDetails }" var="postDetails"
				varStatus="count">
				<h4 class="text-info">
					<b>${postDetails.post.postName}</b>
				</h4>
				<div class="container border">
					<div class="table-container mt-4">
						<table class="table table-bordered" id="dataTable">
							<thead>
								<tr>
									<th>User Name</th>
									<th>Regd No</th>
									<th>Course</th>
									<th>Branch</th>
									<th>Mobile No</th>
									<th>Vote (in %)</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${postDetails.winningUser.userName}</td>
									<td>${postDetails.winningUser.regdNo}</td>
									<td>${postDetails.winningUser.course.courseName}</td>
									<td>${postDetails.winningUser.branch.branchName}</td>
									<td>${postDetails.winningUser.mobileNo}</td>
									<td>${postDetails.winnerVotingPercentage}</td>
								</tr>
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