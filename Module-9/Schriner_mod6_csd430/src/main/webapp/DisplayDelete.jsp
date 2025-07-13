<%@ page import="java.util.*, Project1.MovieBean" %>
<html>
<head>
<!--
 Jason Schriner
 Module 9
 7/13/25
-->
<!-- JSP that displays all records and allows the user to delete additional records until table is empty  -->
    <title>Remaining Movie Records</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

<%
    // Get selected movie ID
    String idParam = request.getParameter("movieId");
    if (idParam != null && !idParam.trim().isEmpty()) {
        int movieId = Integer.parseInt(idParam);
        MovieBean bean = new MovieBean();

        // Call delete method to delete record
        bean.deleteMovie(movieId);
    }

    // Load remaining data
    MovieBean movieBean = new MovieBean();
    List<Map<String, String>> allMovies = movieBean.getAllMovieDetails();
    List<Integer> remainingIds = movieBean.getMovieIds();
%>

<h2>Movies</h2>
<table border="1">
    <thead>
        <tr>
            <th>ID</th><th>Title</th><th>Director</th><th>Genre</th><th>Rating</th><th>Length</th>
        </tr>
    </thead>
    <tbody>
    <%
        for (Map<String, String> movie : allMovies) {
    %>
        <tr>
            <td><%= movie.get("id") %></td>
            <td><%= movie.get("title") %></td>
            <td><%= movie.get("director") %></td>
            <td><%= movie.get("genre") %></td>
            <td><%= movie.get("rating") %></td>
            <td><%= movie.get("length") %> min</td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>


<br><br>

<% if (!remainingIds.isEmpty()) { %>
    <h3>Delete a Record</h3>
    <form action="DisplayDelete.jsp" method="post">
        <label for="movieId">Select Movie ID:</label>
        <select name="movieId" id="movieId" required>
            <option disabled selected value="">ID</option>
            <%
                for (int id : remainingIds) {
            %>
                <option value="<%= id %>"><%= id %></option>
            <% } %>
        </select>
        <br><br>
        <input type="submit" value="Submit">
    </form>
<% } %>

</body>
</html>
