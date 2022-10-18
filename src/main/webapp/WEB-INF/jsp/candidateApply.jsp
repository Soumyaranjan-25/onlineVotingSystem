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
		<div class="table-container mt-4">
			<table class="table table-bordered" id="dataTable">
				<thead>
					<tr>
						<th>S.No</th>
						<th>Post Name</th>
						<th>No Of Candidate</th>
						<th>Remark</th>
						<th>Action</th>
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
							<td><a
								href="./updatepostDetails?postDetailsId=${postDetails.postDetailsId}" class="btn btn-success">Apply</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</c:if>
</body>
</html>