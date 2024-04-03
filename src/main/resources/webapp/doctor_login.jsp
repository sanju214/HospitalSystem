<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Doctor Login Page</title>
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

		.bg-success {
			background-color: #28a745;
		}

		.text-white {
			color: #fff;
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
					<h4 class="mb-4 text-center">Doctor Login</h4>
					<form action="#" method="post">
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
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>
