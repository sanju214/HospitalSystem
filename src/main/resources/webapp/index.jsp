<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-">
<title></title>
<%@include file="component/allcss.jsp"%>


<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
</style>


</head>

<body>
	<%@include file="component/navbar.jsp"%>

	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="true">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="img/doctor1.jpg" class="d-block w-100" alt="..."
					height="800px">
			</div>
			<div class="carousel-item">
				<img src="img/doctor2.jpg" class="d-block w-100" alt="..."
					height="800px">
			</div>
			<div class="carousel-item">
				<img src="img/doctor3.jpg" class="d-block w-100" alt="..."
					height="800px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>


	<div class="container p-3">
		<p class="text-center fs-2">Key Features of Our Hospital</p>

		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<h5 class="card-title">Patient Safety</h5>
								<p class="card-text">We prioritize the safety of our patients by adhering to strict protocols and standards to minimize risks and ensure a secure healthcare environment.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<h5 class="card-title">Clean Environment</h5>
								<p class="card-text">Our hospital maintains a clean and hygienic environment to prevent the spread of infections and promote healing and wellness.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<h5 class="card-title">Compassionate Care</h5>
								<p class="card-text">Our team of dedicated doctors and staff provide personalized care and support to every patient, ensuring their comfort.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6 mt-2">
						<div class="card paint-card">
							<div class="card-body">
								<h5 class="card-title">Advanced Medical Research</h5>
								<p class="card-text">We are committed to advancing medical research and innovation to provide cutting-edge treatments and improve patient outcomes.</p>
							</div>
						</div>
					</div>
				</div>
			</div>



	<div class="col-md-4">
				<img alt="" src="img/doctor1.jpg">
			</div>
		</div>

	</div>
	<hr>

	<div class="container p-2">
		<p class="text-center fs-2">Our Team</p>
		<div class="row justify-content-center">
			<div class="col-md-3 mb-4">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doc6.jpg" class="img-fluid" alt="Nimit Mann">
						<p class="fw-bold fs-5">Nimit Mann</p>
						<p class="fs-7">CEO & Chairman</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 mb-4">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doc7.jpg" class="img-fluid" alt="Sanjay Padmaraju Varma">
						<p class="fw-bold fs-5">Sanjay Padmaraju Varma</p>
						<p class="fs-7">Chief Doctor</p>
					</div>
				</div>
			</div>
			<div class="col-md-3 mb-4">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doc8.jpeg" class="img-fluid" alt="Nitsh R">
						<p class="fw-bold fs-5">Nitsh R</p>
						<p class="fs-7">Chief Doctor</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<style>
	.paint-card {
		border-radius: 10px;
		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
		transition: box-shadow 0.3s ease;
	}

	.paint-card:hover {
		box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
	}

	.card-title {
		color: #333;
		font-size: 1.2rem;
		font-weight: bold;
	}

	.card-text {
		color: #666;
		font-size: 1rem;
		line-height: 1.5;
	}

</style>

<%@include file="component/footer.jsp" %>

</body>
</html>