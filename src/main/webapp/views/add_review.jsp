<!DOCTYPE html>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>Add Review</title>
    <style>
        body {
            background-color: #5c9fd1;
            font-family: Arial, sans-serif;
            color: white;
            text-align: center;
        }
        h1 {
            font-size: 3rem;
            margin-top: 2rem;
        }
        form {
            margin-top: 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        label {
            font-size: 1.2rem;
            margin-top: 1rem;
            display: block;
        }
        input[type="text"], select, textarea {
            padding: 0.5rem;
            border-radius: 0.5rem;
            border: none;
            margin-top: 0.5rem;
            font-size: 1.2rem;
            width: 80%;
            max-width: 20rem;
            box-shadow: 0 0.2rem 0.5rem rgba(0, 0, 0, 0.2);
        }
        input[type="file"] {
            margin-top: 0.5rem;
        }
        input[type="submit"] {
            background-color: #ff5a5f;
            color: white;
            font-size: 1.2rem;
            border-radius: 0.5rem;
            padding: 0.5rem 2rem;
            border: none;
            margin-top: 1rem;
            cursor: pointer;
            box-shadow: 0 0.2rem 0.5rem rgba(0, 0, 0, 0.2);
        }
        input[type="submit"]:hover {
            background-color: white;
            color: #ff5a5f;
        }
    </style>
</head>
<body>
<h1>Add Review</h1>
<form action="add_review" method="POST" enctype="multipart/form-data">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>

    <label for="rating">Rating:</label>
    <select id="rating" name="rating" required>
        <option value="1">1 star</option>
        <option value="2">2 stars</option>
        <option value="3">3 stars</option>
        <option value="4">4 stars</option>
        <option value="5">5 stars</option>
    </select>


    <label for="text">Review:</label>
    <textarea id="text" name="text" required></textarea>

    <input type="submit" value="Add Review">
</form>
</body>
</html>
