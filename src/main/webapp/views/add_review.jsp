<!DOCTYPE html>
<html>
<head>
    <title>Add Review</title>
</head>
<body>
<h1>Add Review</h1>
<form action="add_review" method="POST" enctype="multipart/form-data">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required><br>

    <label for="rating">Rating:</label>
    <select id="rating" name="rating" required>
        <option value="1">1 star</option>
        <option value="2">2 stars</option>
        <option value="3">3 stars</option>
        <option value="4">4 stars</option>
        <option value="5">5 stars</option>
    </select><br>

    <label for="image">Image:</label>
    <input type="file" id="image" name="image"><br>

    <label for="text">Review:</label>
    <textarea id="text" name="text" required></textarea><br>

    <input type="submit" value="Add Review">
</form>
</body>
</html>
