<%@ page import="java.util.*, Project1.MovieBean" %>
<html>
<!--
 Jason Schriner
 Module 8
 7/6/25
-->
<!-- JSP to allow User to select a value from a drop down to update a record  -->
<head>
    <title>Select Movie Details</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h3>Select Movie Details</h3>
    <form action="UpdateRecord.jsp" method="post">
        
        <!-- Movie ID Dropdown -->
        <label for="movieId">Select Movie ID:</label>
        <select name="movieId" id="movieId" required>
            <option selected disabled value="">Please Select a Movie ID</option>
            <%
                MovieBean movieBean = new MovieBean();
                List<Integer> movieIds = movieBean.getMovieIds(); 
                for(Integer movieId : movieIds) {
            %>
                <option value="<%= movieId %>"><%= movieId %></option>
            <% 
                }
            %>
        </select><br><br>

        <!-- Movie Title Dropdown -->
        <label for="movieTitle">Select Movie Title:</label>
        <select name="movieTitle" id="movieTitle" required>
            <option selected disabled value="">Please Select a Movie Title</option>
            <%
                List<Map<String, String>> movies = movieBean.getAllMovieDetails(); // Retrieves rows for each record
                Set<String> uniqueTitles = new HashSet<>(); //Ensures no duplicates
                for(Map<String, String> movie : movies) {
                    String movieTitle = movie.get("title");
                    uniqueTitles.add(movieTitle); 
                }
                for(String movieTitle : uniqueTitles) {
            %>
                <option value="<%= movieTitle %>"><%= movieTitle %></option>
            <% 
                }
            %>
        </select><br><br>

        <!-- Movie Director Dropdown -->
        <label for="movieDirector">Select Movie Director:</label>
        <select name="movieDirector" id="movieDirector" required>
            <option selected disabled value="">Please Select a Director</option>
            <%
                Set<String> uniqueDirectors = new HashSet<>(); 
                for(Map<String, String> movie : movies) {
                    String movieDirector = movie.get("director");
                    uniqueDirectors.add(movieDirector); 
                }
                for(String movieDirector : uniqueDirectors) {
            %>
                <option value="<%= movieDirector %>"><%= movieDirector %></option>
            <% 
                }
            %>
        </select><br><br>

        <!-- Movie Genre Dropdown -->
        <label for="movieGenre">Select Movie Genre:</label>
        <select name="movieGenre" id="movieGenre" required>
            <option selected disabled value="">Please Select a Genre</option>
            <%
                Set<String> uniqueGenres = new HashSet<>(); 
                for(Map<String, String> movie : movies) {
                    String movieGenre = movie.get("genre");
                    uniqueGenres.add(movieGenre); 
                }
                for(String movieGenre : uniqueGenres) {
            %>
                <option value="<%= movieGenre %>"><%= movieGenre %></option>
            <% 
                }
            %>
        </select><br><br>

        <!-- Movie Rating Dropdown -->
        <label for="movieRating">Select Movie Rating:</label>
        <select name="movieRating" id="movieRating" required>
            <option selected disabled value="">Please Select a Rating</option>
            <%
                Set<String> uniqueRatings = new HashSet<>(); 
                for(Map<String, String> movie : movies) {
                    String movieRating = movie.get("rating");
                    uniqueRatings.add(movieRating); 
                }
                for(String movieRating : uniqueRatings) {
            %>
                <option value="<%= movieRating %>"><%= movieRating %></option>
            <% 
                }
            %>
        </select><br><br>

        <!-- Movie Length Dropdown -->
        <label for="movieLength">Select Movie Length:</label>
        <select name="movieLength" id="movieLength" required>
            <option selected disabled value="">Please Select a Length</option>
            <%
                Set<String> uniqueLengths = new HashSet<>(); 
                for(Map<String, String> movie : movies) {
                    String movieLength = movie.get("length");
                    uniqueLengths.add(movieLength); 
                }
                for(String movieLength : uniqueLengths) {
            %>
                <option value="<%= movieLength %>"><%= movieLength %> min</option>
            <% 
                }
            %>
        </select><br><br>

        <input type="submit" value="Submit">
    </form>
</body>
</html>
