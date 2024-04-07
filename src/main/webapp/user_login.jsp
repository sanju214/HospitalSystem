<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>User Login Page</title>
	<%@include file="component/allcss.jsp"%>
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

	<style type="text/css">
		body {
			font-family: 'Roboto', sans-serif;
			background-color: #f5f5f5;
		}

		.card {
			border: none;
			border-radius: 10px;
			box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
		}

		.card-body {
			padding: 40px;
		}

		.form-label {
			font-weight: bold;
			color: #333;
		}

		.form-control {
			border-radius: 5px;
		}

		.btn {
			border-radius: 5px;
		}

		.text-decoration-none {
			text-decoration: none;
		}
		.success-message {
			background-color: #d4edda;
			color: #155724;
			border: 1px solid #c3e6cb;
			padding: 10px;
			margin-bottom: 10px;
		}

		.error-message {
			background-color: #f8d7da;
			color: #721c24;
			border: 1px solid #f5c6cb;
			padding: 10px;
			margin-bottom: 10px;
		}
	</style>
</head>
<body>
<%@include file="component/navbar.jsp" %>

<div class="container">
	<div class="row justify-content-center mt-5">
		<div class="col-md-4">
			<div class="card">
				<div class="card-body">
					<h4 class="mb-4 text-center">User Login</h4>

					<c:if test="${not empty sucMsg }">
						<div class="success-message">${sucMsg}</div>
						<c:remove var = "sucMsg" scope="session"/>
					</c:if>

					<c:if test="${not empty errorMsg }">
						<div class="error-message">${errorMsg}</div>
						<c:remove var = "errorMsg" scope="session"/>
					</c:if>

					<form action="userLogin" method="post">
						<div class="mb-3">
							<label for="email" class="form-label">Email address</label>
							<input required id="email" name="email" type="email" class="form-control">
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label>
							<input required id="password" name="password" type="password" class="form-control">
						</div>
						<button type="submit" class="btn btn-success col-md-12">Login</button>
					</form>

					<div class="mt-3 text-center">
						Don't have an account? <a href="signup.jsp" class="text-decoration-none">Create one</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>
