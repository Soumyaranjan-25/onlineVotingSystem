<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div style="height : 100%">
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
	<div class="container border">
		<form class="form-group" action="./saveBranch">
			<div class="row">
				<div class="col-sm-6">
					<label class="form-label">Course Name<span
						class="text-danger">*</span> :
					</label> <input type="text" name="email" class="form-control" id="email"
						required />
				</div>
			</div>
			<div class="row">
				<div class="col-sm-6">
					<label class="form-label">Remarks : </label> <input type="text"
						name="email" class="form-control" id="email" required />
				</div>
			</div>
			<div class="row mt-4 ml-5">
				<input type="submit" class="btn btn-success mr-3"
					onclick="validateForm()" value="submit"> <input
					type="reset" class="btn btn-warning" value="reset">
			</div>
		</form>
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