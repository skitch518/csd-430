<%@ page import="java.util.*, Project1.MovieBean" %>
<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*" %>
<html>
<!--
 Jason Schriner
 Module 8
 7/6/25
-->
<head>
    <title>Updated Record</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<%
    // Retrieve form data
    int movieId = Integer.parseInt(request.getParameter("movieId"));
    String title = request.getParameter("movieTitle");
    String director = request.getParameter("movieDirector");
    String genre = request.getParameter("movieGenre");
    String rating = request.getParameter("movieRating");
    int length = Integer.parseInt(request.getParameter("movieLength"));

    MovieBean bean = new MovieBean();

    /*
    * The form from SelectRecordtoUpdate should pass those values as movieid etc. 
    * Then I call the updateMovie from the Java bean to update the record
    * passing in the selected values but I cannot get the record to update I am not sure where my logic 
    * is wrong. 
    */
    
    // Update the record at the id selected to the new data
    bean.updateMovie(movieId, title, director, genre, rating, length);

    // Get the updated record
    Map<String, String> updatedRecord = bean.getMovieData(movieId);

    // Get all records
    List<Map<String, String>> allMovies = bean.getAllMovieDetails();
%>

<h2> Updated Record</h2>
<table border="1">
    <tr>
        <th>ID</th><th>Title</th><th>Director</th><th>Genre</th><th>Rating</th><th>Length</th>
    </tr>
    <tr>
        <td><%= updatedRecord.get("Movie ID") %></td>
        <td><%= updatedRecord.get("Title") %></td>
        <td><%= updatedRecord.get("Director") %></td>
        <td><%= updatedRecord.get("Genre") %></td>
        <td><%= updatedRecord.get("Rating") %></td>
        <td><%= updatedRecord.get("Length") %> min</td>
    </tr>
</table>

<br><br>

<h2> All Movie Records</h2>
<table border="1">
    <tr>
        <th>ID</th><th>Title</th><th>Director</th><th>Genre</th><th>Rating</th><th>Length</th>
    </tr>
    <%
        for(Map<String, String> movie : allMovies) {
    %>
    <tr>
        <td><%= movie.get("id") %></td>
        <td><%= movie.get("title") %></td>
        <td><%= movie.get("director") %></td>
        <td><%= movie.get("genre") %></td>
        <td><%= movie.get("rating") %></td>
        <td><%= movie.get("length") %> min</td>
    </tr>
    <% } %>
</table>

</body>
</html>
