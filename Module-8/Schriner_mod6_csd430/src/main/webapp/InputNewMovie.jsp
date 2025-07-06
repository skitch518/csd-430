<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!--
 Jason Schriner
 Module 7
 Project Part 2
 6/29/25
-->
<!-- Form that Allows a user to enter A new movie into the Database-->
<!-- I just did it similar to our other form assignment-->
<head>
<head>
    <title>Add a Movie</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h2>Add a movie to the Database</h2>
    <form action="AddMovie.jsp" method="post"> <!-- References the AddMovie.jsp that inserts the following fields into the database -->
        <!-- Title -->
        <label for="title">Movie Title:</label><br>
        <input type="text" id="title" name="title" required><br><br>

        <!-- Director -->
        <label for="director">Director:</label><br>
        <input type="text" id="director" name="director"><br><br>

        <!-- Genre (radio buttons) -->
        <label>Genre:</label><br>
        <input type="radio" id="action" name="genre" value="Action" required>
        <label for="action">Action</label><br>

        <input type="radio" id="comedy" name="genre" value="Comedy">
        <label for="comedy">Comedy</label><br>

        <input type="radio" id="drama" name="genre" value="Drama">
        <label for="drama">Drama</label><br>
        
        <input type="radio" id="family" name="genre" value="Family">
		<label for="family">Family</label><br>

		<input type="radio" id="fantasy" name="genre" value="Fantasy">
		<label for="fantasy">Fantasy</label><br>

        <input type="radio" id="horror" name="genre" value="Horror">
        <label for="horror">Horror</label><br>

        <input type="radio" id="sci-fi" name="genre" value="Sci-Fi">
        <label for="sci-fi">Sci-Fi</label><br>

        <input type="radio" id="documentary" name="genre" value="Documentary">
        <label for="documentary">Documentary</label><br><br>

        <!-- Rating (dropdown) -->
        <label for="rating">Rating:</label><br>
        <select name="rating" id="rating" required>
            <option selected disabled value="">Please Select a Rating</option>
            <option value="G">G - General Audiences</option>
            <option value="PG">PG - Parental Guidance Suggested</option>
            <option value="PG-13">PG-13 - Parents Strongly Cautioned</option>
            <option value="R">R - Restricted</option>
            <option value="NC-17">NC-17 - Adults Only</option>
        </select><br><br>

        <!-- Length -->
        <label for="length">Length (in minutes):</label><br>
        <input type="number" id="length" name="length"><br><br>

        <!-- Submit -->
        <input type="submit" value="Add Movie">
    </form>
</body>
</html>
