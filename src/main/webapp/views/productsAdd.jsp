<!doctype html>
<%@page import="java.sql.*"%>
<%@ include file="header.jsp" %>
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
</head>
<body>
	<br>
	<div class="jumbotron container border border-info">
		<h3>Add a New Flight</h3>
		<form action="sendData" method="post">
			<div class="row">
				<div class="col-sm-5">
					<%
					try {
						String url = "jdbc:mysql://localhost:3306/springproject";
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con = DriverManager.getConnection(url, "root", "");
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("select * from products order by id desc");
					%>
					<div class="form-group">
						<%
						if (rs.next()) {
						%>
						<label for="name">Id</label> 
						<input type="number" readonly="readonly" class="form-control border border-warning" name="id"  value="<%=rs.getInt(1) + 1%>">
						
						<%
						}
						%>
						

					</div>
					<div class="form-group">
						<label for="name">Name</label> 
						<input type="text" class="form-control border border-warning" required name="name" placeholder="Enter name">
					</div>
					
					<div class="form-group">
					
						<label for="category">Select Category</label> 
						<select class="form-control border border-warning" name="categoryid" required>
							<% 
							rs = stmt.executeQuery("select * from categories");
							while(rs.next())
							{
								%>
								<option ><%= rs.getString(2) %></option>
								<%	
							}
							%>
						</select>
					</div>
					<%
						} catch (Exception e) {
						System.out.println("Exception: " + e);
						}
						%>
					<div class="form-group">
						<label for="price">Price</label> 
						<input type="number" class="form-control border border-warning" required name="price" min="1" placeholder="Price">
					</div>
					<div class="form-group">
						<label for="quantity">Available Seats</label>
						<input type="number" class="form-control border border-warning" required name="quantity" min="1" placeholder="Quantity">
					</div>
					
					
				</div>
				
				<div class="col-sm-5"><br>
				<div class="form-group">
						<label for="description">Product Description</label>
						<textarea class="form-control border border-warning" rows="4" name="description" placeholder="Product Details" value= "no product details"></textarea>
					</div>
					<p>Product Image</p>
					<div class="custom-file">
						<textarea class="form-control border border-warning" rows="4" name="productImage" placeholder="productImage" value= "no product image"></textarea>

					</div>
					<div class="form-group">

					</div>
					<input type="hidden" name="imgName">
					<input type="submit" class="btn btn-primary">
				</div>
			</div>
		</form>
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
		<script type="text/javascript">
						var loadFile = function(event) {
							var image = document.getElementById('imgPreview');
							image.src = URL.createObjectURL(event.target.files[0]);
						};
						</script>
</body>
</html></html>