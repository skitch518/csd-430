<%@ page import="java.util.*, Project1.MovieBean" %>
<html>
<!--
 Jason Schriner
 Module 5&6
 6/20/25
-->
<!-- This file Creates a HTML Page where the user selects a movie id -->
<head>
    <title>Select Movie</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h3>Select a Movie</h3>
    <form action="DisplayMovie.jsp" method="post">
        <label for="movieId">Movie:</label>
        <select name="movieId">
            <%
            
                // Create an instance of MovieBean to access its methods
                MovieBean bean = new MovieBean();
                
                // Fetches all movie IDs from the database
                List<Integer> movieIds = bean.getMovieIds(); 
                
                // Loops through movie IDs and displays them as options in the dropdown
                for(Integer movieId : movieIds) {
            %>
                <option value="<%= movieId %>"><%= movieId %></option>
            <% 
                }
            %>
        </select>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
