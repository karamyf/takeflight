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
	<link rel="stylesheet"
		  href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
		  integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
		  crossorigin="anonymous">
	<title>Document</title>

	<style>
		body {
			background-color: #F7F7F7;
		}

		.navbar {
			background-color: #343A40 !important;
		}

		.card {
			background-color: #FFFFFF;
			border: 1px solid #E6E6E6;
		}

		.card:hover {
			box-shadow: 0px 0px 5px 0px rgba(0,0,0,0.25);
		}
	</style>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"> <img
				src="../static/images/logo.png" width="auto" height="40"
				class="d-inline-block align-top" alt="" />
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
				<li class="nav-item active"><a href="/user/products" class="card-link btn " style="background-color: #459b46; margin-right: 10px;">Home</a></li>
				<li class="nav-item active"><a href="/admin" class="card-link btn " style="background-color: #ee9f2f;">Logout</a></li>
			</ul>

		</div>
	</div>
</nav>

	<div class="jumbotron text-center bg-light">

<div class="container-fluid">
	<div class="row justify-content-center">
		<div class="col-sm-4">
			<div class="card border-0 h-100">
				<div class="card-body text-center">
					<h4 class="card-title">Categories</h4>
					<p class="card-text">Manage the categories section here.</p>
					<a href="/admin/categories" class="card-link btn btn-primary" style="background-color: #2f74a4;">Manage</a>
				</div>
			</div>
		</div>

		<div class="col-sm-4">
			<div class="card border-0 h-100">
				<div class="card-body text-center">
					<h4 class="card-title">Products</h4>
					<p class="card-text">Manage all the products here.</p>
					<a href="/admin/products" class="card-link btn btn-primary"style="background-color: #2f74a4;">Manage</a>
				</div>
			</div>
		</div>

		<div class="col-sm-4">
			<div class="card border-0 h-100">
				<div class="card-body text-center">
					<h4 class="card-title">Customers</h4>
					<p class="card-text">Manage all the customer here.</p>
					<a href="/admin/customers" class="card-link btn btn-primary"style="background-color: #2f74a4;">Manage</a>
				</div>
			</div>
		</div>


	</div>
</div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
