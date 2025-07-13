<%@ page import="java.util.*, Project1.MovieBean" %>
<html>
<!--
 Jason Schriner
 Module 9
 7/13/25
-->
<!-- JSP to allow User to select a value from a drop down to delete a record  -->
<head>
    <title>Select Movie to Delete</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <h3>Select Movie to Delete</h3>
    <form action="DisplayDelete.jsp" method="post">
        
        <!-- Movie ID Dropdown -->
        <label for="movieId">Select Movie ID:</label>
        <select name="movieId" id="movieId" required>
            <option selected disabled value="">ID</option>
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
         
         <input type="submit" value="Submit">
    </form>
</body>
</html>