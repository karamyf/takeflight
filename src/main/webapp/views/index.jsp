<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
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
    </style>
</head>
<body>
<section class="hero" style="background-image: url('https://media.cntraveler.com/photos/63cac962a20dd5b7d9e22c46/16:9/w_2560%2Cc_limit/Airplane%2520night%2520sky%2520moon%2520_%2520marvin-van-beek-z3faD7yMRwg-unsplash.jpg')">
    <h1>Welcome to TakeFlight</h1>
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
                        <option value="">Select a country</option>
                        <option value="all">All</option>
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
                        String selectedCountry = request.getParameter("country");
                        if (selectedCountry.equals("all")) {
                            // Select all products if "all" option is selected
                            countryFilter = "";
                        } else {
                            // Filter by selected country
                            countryFilter = " WHERE name='" + selectedCountry + "'";
                        }
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
</section>

<section class="testimonials">
    <div class="container">
        <h2 class="mb-5">What our customers are saying</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="testimonial">
                    <img src="https://www.ccme.org.ma/media/k2/items/cache/d466a5b8137d34830a87d25a15449e83_XL.jpg" alt="Customer profile">
                    <p>"I had the most amazing vacation experience with TakeFlight. The customer service was top-notch and the accommodations were superb."</p>
                    <span>John Doe</span>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial">
                    <img src="https://i1.sndcdn.com/artworks-000394079556-9hg1jr-t500x500.jpg" alt="Customer profile">
                    <p>"I highly recommend TakeFlight for anyone looking to book their next vacation. The booking process was simple and the prices were unbeatable."</p>
                    <span>Jane Smith</span>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial">
                    <img src="https://i0.wp.com/bnlib.com/wp-content/uploads/2020/04/Marie-Curie.jpg?fit=500%2C500&ssl=1" alt="Customer profile">
                    <p>"TakeFlight made my dream vacation a reality. I never thought I could afford to travel to such amazing destinations, but they made it possible."</p>
                    <span>Tom Wilson</span>
                </div>
            </div>
        </div>
    </div>

</section>

</body>
</html>
<!-- End of HTML code -->
