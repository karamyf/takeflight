

<!DOCTYPE html>
<html>
<head>


    <title>TakeFlight</title>
    <!-- Add any necessary CSS and JavaScript files here -->
    <style>
        /* Header styles */
        header {
            background-color: #24292e;
            color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 30px;
        }
        header a {
            color: #fff;
            text-decoration: none;
            margin: 0 10px;
            font-size: 1.2rem;
            border-bottom: 2px solid transparent;
            transition: border-bottom 0.2s;
            padding-bottom: 5px;
        }
        header a:hover {
            border-bottom: 2px solid #fff;
        }
        .user-greeting {
            font-size: 1.2rem;
            margin-right: 10px;
            padding: 10px;
            border: 1px solid #fff;
            border-radius: 20px;
        }
        article, aside, figcaption, figure, footer, header, hgroup, main, nav, section {
            display: flex!important;
        }
        nav ul {
            display: flex;
            list-style: none;
            align-items: center;
        }
        nav li {
            margin: 0 10px;
        }
    </style>
</head>
<body>
<header>
    <div class="user-greeting">Welcome ${ username } </div>
    <nav>
        <ul>
            <li><a href="index">Home</a></li>
            <li><a href="profileDisplay">Update Profile</a></li>
            <li><a href="admin">Admin</a></li>
            <li><a href="logout">Logout</a></li>
        </ul>
    </nav>
</header>
</body>

</html>
