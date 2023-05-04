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
<section class="hero">
    <h1>Welcome to TakeFlight</h1>
    <p>Book your dream vacation today!</p>
    <a href="#" class="btn btn-lg btn-primary">Book now</a>
</section>

<section class="container my-5">
    <h2 class="text-center mb-5">Our Services</h2>
    <div class="row">
        <div class="col-lg-4 col-md-6">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1565892669247-88a5e9edaa6b" class="card-img-top" alt="Beach resort">
                <div class="card-body">
                    <h5 class="card-title">Beach resorts</h5>
                    <p class="card-text">Relax on a beautiful sandy beach with crystal clear water at our top-rated beach resorts.</p>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1500227249704-87bd9504c825" class="card-img-top" alt="City skyline">
                <div class="card-body">
                    <h5 class="card-title">City getaways</h5>
                    <p class="card-text">Experience the excitement of big city life and stay in luxurious accommodations at our city getaways.</p>
                </div>
            </div>
        </div>
        <div class="col-lg-4 col-md-6">
            <div class="card">
                <img src="https://images.unsplash.com/photo-1548438498-35b24468b1c7" class="card-img-top" alt="Mountain cabin">
                <div class="card-body">
                    <h5 class="card-title">Mountain cabins</h5>
                    <p class="card-text">Get back to nature and stay in cozy cabins nestled in the mountains at our top-rated mountain destinations.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="testimonials">
    <div class="container">
        <h2 class="mb-5">What our customers are saying</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="testimonial">
                    <img src="https://images.unsplash.com/photo-1596949112592-d9cfc61534d3" alt="Customer profile">
                    <p>"I had the most amazing vacation experience with TakeFlight. The customer service was top-notch and the accommodations were superb."</p>
                    <span>John Doe</span>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial">
                    <img src="https://images.unsplash.com/photo-1523043769446-8a8178e791f6" alt="Customer profile">
                    <p>"I highly recommend TakeFlight for anyone looking to book their next vacation. The booking process was simple and the prices were unbeatable."</p>
                    <span>Jane Smith</span>
                </div>
            </div>
            <div class="col-md-4">
                <div class="testimonial">
                    <img src="https://images.unsplash.com/photo-1543196626-71c3d5b32238" alt="Customer profile">
                    <p>"TakeFlight made my dream vacation a reality. I never thought I could afford to travel to such amazing destinations, but they made it possible."</p>
                    <span>Tom Wilson</span>
                </div>
            </div>
        </div>
    </div>

</section>
<section class="contact">
    <div class="container">
        <h2 class="text-center mb-5">Contact Us</h2>
        <div class="row">
            <div class="col-md-6">
                <form>
                    <div class="form-group">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter your name">
                    </div>
                    <div class="form-group">
                        <label for="email">Email address</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter your email address">
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea class="form-control" id="message" rows="5"></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
            <div class="col-md-6">
                <h4>Our Location</h4>
                <p>123 Main Street</p>
                <p>New York, NY 10001</p>
                <h4>Phone Number</h4>
                <p>(123) 456-7890</p>
                <h4>Email Address</h4>
                <p>info@takeflight.com</p>
            </div>
        </div>
    </div>
</section>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <p>&copy; 2023 TakeFlight</p>
            </div>
            <div class="col-md-6">
                <nav class="footer-nav">
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Our Services</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</footer>
</body>
</html>
<!-- End of HTML code -->
