<%@ page import="java.util.*, Project1.MovieBean" %>
<html>
<!--
 Jason Schriner
 Module 5&6
 6/20/25
-->
<!-- This file creates an HTML page that displays the movie data selected in a table -->
<head>
    <title>Display Movie Details</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h3>Movie Details</h3>

    <% 
        // Retrieve the selected movie ID from the form submission
        String movieIdParam = request.getParameter("movieId");
        int movieId = -1;

        if (movieIdParam != null) {
            try {
                movieId = Integer.parseInt(movieIdParam);
            } catch (NumberFormatException e) {
                out.println("Invalid movie ID.");
                return;
            }
        }

        // Create an instance of MovieBean to access its methods
        MovieBean bean = new MovieBean();
        
        // Fetch movie details using the selected movie ID
        Map<String, String> movieData = bean.getMovieData(movieId);
        
        if (movieData.isEmpty()) {
            out.println("No movie found with ID: " + movieId);
        } else {
    %>
        <!-- Creates a table to display movie details -->
        <table border="1">
            <thead>
                <tr>
                    <th>Field</th>
                    <th>Value</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Movie ID</td>
                    <td><%= movieData.get("Movie ID") %></td>
                </tr>
                <tr>
                    <td>Title</td>
                    <td><%= movieData.get("Title") %></td>
                </tr>
                <tr>
                    <td>Director</td>
                    <td><%= movieData.get("Director") %></td>
                </tr>
                <tr>
                    <td>Genre</td>
                    <td><%= movieData.get("Genre") %></td>
                </tr>
                <tr>
                    <td>Rating</td>
                    <td><%= movieData.get("Rating") %></td>
                </tr>
                <tr>
                    <td>Length (minutes)</td>
                    <td><%= movieData.get("Length") %></td>
                </tr>
            </tbody>
        </table>
    <% 
        }
    %>
</body>
</html>
