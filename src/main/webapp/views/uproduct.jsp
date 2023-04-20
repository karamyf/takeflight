<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<title>Flights</title>
</head>
<body class="bg-light">
	
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <img
				th:src="@{/images/logo.png}" src="../static/images/logo.png"
				width="auto" height="40" class="d-inline-block align-top" alt="" />
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto"></ul>
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link" href="/adminhome">Home
							Page</a></li>
					<li class="nav-item active"><a class="nav-link" href="/logout">Logout</a>
					</li>

				</ul>

			</div>
		</div>
	</nav>

	<div class="container-fluid">
		<div class="row mb-4">
			<div class="col-12">
				<h1 class="text-center">Available Flights</h1>
				<h3 class="text-center">Choose your destination</h3>
			</div>
			<div class="col-12">
				<form method="get" action="">
					<select class="form-control" name="country" onchange="this.form.submit()">
						<option value="">Select a country</option>
						<option value="Morocco">Morocco</option>
						<option value="Argentine">Argentine</option>
						<option value="Korea">Korea</option>
						<option value="France">France</option>
						<option value="Philippines">Philippines</option>
					</select>
				</form>
			</div>
		</div>
		<div class="row">
			<% 
			try {
				String url = "jdbc:mysql://localhost:3306/springproject";
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection(url, "root", "");
				Statement stmt = con.createStatement();
				String countryFilter = "";
				if(request.getParameter("country") != null) {
					countryFilter = " WHERE name='" + request.getParameter("country") + "'";
				}
				ResultSet rs = stmt.executeQuery("SELECT * FROM products" + countryFilter);
				int count = 0;
				while (rs.next()) {
					count++;
			%>
			<div class="col-lg-4 col-md-6 mb-4">
				<div class="card h-100">
					<a href="#"><img class="card-img-top" src="<%= rs.getString("image") %>" alt=""></a>
					<div class="card-body">
							<p class="card-text"><%= rs.getString(2) %> (<%= rs.getInt(6) %> USD)</p>
							<div class="d-flex justify-content-between align-items-center">
								<div class="btn-group">
									<form action="/buy" method="get">
										<input type="hidden" name="id" value="<%= rs.getInt(1) %>">
										<button type="submit" class="btn btn-sm btn-outline-secondary">Book Now</button>
									</form>
								</div>
							</div>
					</div>
				</div>
			</div>
			<% 
				if (count % 3 == 0) { 
			%>
		</div>
		<div class="row">
			<% } %>
			<% 
				}
			} catch (Exception ex) {
				out.println("Exception Occurred:: " + ex.getMessage());
			} 
			%>
		</div>
	</div>
	
	
	  
	  



	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>
</body>
</html>