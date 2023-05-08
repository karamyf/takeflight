<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <style>
        body {
            background-color: #343a40;
            color: #fff;
        }

        .container {
            margin-top: 50px;
        }

        .jumbotron {
            background-color: #212529;
            padding: 30px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            color: #fff;
        }

        .form-group {
            margin-bottom: 20px;
        }

        input.form-control-lg {
            border: none;
            background-color: #343a40;
            color: #fff;
        }

        .btn-login {
            background-color: #007bff;
            border-color: #007bff;
            transition: background-color 0.3s ease;
        }

        .btn-login:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>

<body>
<div class="container">
    <div class="jumbotron">
        <h2 class="text-center">Admin Login</h2>
        <form action="loginvalidate" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" name="username" id="username" placeholder="Admin username" required
                       class="form-control form-control-lg">
            </div>

            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control form-control-lg" placeholder="Admin Password" required
                       name="password" id="password">
            </div>

            <button type="submit" class="btn btn-primary btn-block btn-login">Login</button>
            <div class="error-message">${message}</div>
        </form>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>
</html>
