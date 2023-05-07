<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@ include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>TakeFlight</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Lato&display=swap" rel="stylesheet">
    <style>
        /* Custom styles */
        body {
            font-family: 'Lato', sans-serif;
            background-color: #F2F2F2;
            color: #333;
        }
        .hero {
            background-image: url('https://images.unsplash.com/photo-1478823780976-01b17a95a70b');
            background-size: cover;
            height: 80vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: #FFF;
        }
        .hero h1 {
            font-size: 4rem;
            margin-bottom: 1rem;
        }
        .hero p {
            font-size: 1.5rem;
            margin-bottom: 2rem;
        }
        .btn-primary {
            background-color: #FF5A5F;
            border-color: #FF5A5F;
        }
        .btn-primary:hover {
            background-color: #DF4348;
            border-color: #DF4348;
        }
        .card {
            border: none;
            margin-bottom: 1rem;
            transition: box-shadow 0.3s ease-in-out;
        }
        .card:hover {
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }
        .card img {
            height: 250px;
            object-fit: cover;
        }
        .testimonials {
            background-color: #FFF;
            padding: 4rem 2rem;
            text-align: center;
        }
        .testimonials h2 {
            margin-bottom: 2rem;
        }
        .testimonial {
            margin-bottom: 2rem;
        }
        .testimonial img {
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 1rem;
        }
        .testimonial p {
            font-size: 1.25rem;
            line-height: 1.5;
            margin-bottom: 1rem;
        }
        .testimonial span {
            font-weight: bold;
            font-size: 1.5rem;
            color: #FF5A5F;
            display: block;
            margin-top: 1rem;
        }
        .headline {
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);
        }


    </style>
</head>
<body>
<section class="hero" style="background-image: url('https://media.cntraveler.com/photos/63cac962a20dd5b7d9e22c46/16:9/w_2560%2Cc_limit/Airplane%2520night%2520sky%2520moon%2520_%2520marvin-van-beek-z3faD7yMRwg-unsplash.jpg')">
    <h1 class="headline">Welcome to TakeFlight</h1>
    <p>Book your dream vacation today!</p>
    <a href="#" class="btn btn-lg btn-primary">Book now</a>
</section>


<section class="container my-5">
    <div class="container-fluid">
        <div class="row mb-4">
            <div class="col-12">
                <h1 class="text-center">Available Flights</h1>
                <h3 class="text-center">Choose your destination</h3>
            </div>
            <div class="col-12">
                <form method="get" action="">
                    <select class="form-control" name="country" onchange="this.form.submit()">
                        <option value="" selected>Select a country</option>
                        <%
                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
                                Statement stmt = con.createStatement();
                                ResultSet rs = stmt.executeQuery("SELECT DISTINCT name FROM categories");
                                while (rs.next()) {
                                    String name = rs.getString("name");
                                    out.println("<option value='" + name + "'>" + name + "</option>");
                                }
                                con.close();
                            } catch (Exception e) {
                                out.println("Error: " + e.getMessage());
                            }
                        %>
                    </select>

                </form>
            </div>
        </div>
        <div class="row">
            <%
                String country = request.getParameter("country");
                if (country == null || country.isEmpty()) {
                    country = "all"; // par défaut, afficher tous les pays
                }
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
                    PreparedStatement pstmt;
                    if (country.equals("all")) {
                        pstmt = con.prepareStatement("SELECT * FROM products INNER JOIN categories ON products.categoryid = categories.categoryid");
                    } else {
                        pstmt = con.prepareStatement("SELECT * FROM products INNER JOIN categories ON products.categoryid = categories.categoryid WHERE categories.name = ?");
                        pstmt.setString(1, country);
                    }
                    ResultSet rs = pstmt.executeQuery();
                    while (rs.next()) {
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
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }

            %>
        </div>
    </div>
</section>

<section class="testimonials bg-dark py-5">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <h2 class="text-white mb-3">Testimonials</h2>
                <div class="row">
                    <div class="col-12 text-center">
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-star text-warning"></i>
                        <i class="fa fa-star text-warning"></i>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-12 text-center">
                        <a href="add_review" class="btn btn-lg btn-primary">Add Review</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row mt-5" id="testimonial-carousel">
            <% try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/springproject", "root", "");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM reviews ORDER BY RAND()");
                while (rs.next()) {
                    String name = rs.getString("name");
                    String text = rs.getString("text");
                    int rating = rs.getInt("rating");
                    String stars = "";
                    for (int i = 0; i < rating; i++) {
                        stars += "<i class='fa fa-star'></i>";
                    }
                    out.println("<div class='col-sm-4 mb-4'><div class='card h-100 shadow'><div class='card-body'><p class='card-text text-muted'>" + text + "</p></div><div class='card-footer bg-white'><small class='text-muted'>" + name + "</small><div class='stars'>" + stars + "</div></div></div></div>");
                }
                con.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
            %>
        </div>
    </div>
</section>




</body>
</html>
<!-- End of HTML code -->
