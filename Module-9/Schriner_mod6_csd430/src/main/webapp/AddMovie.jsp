<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<!--
 Jason Schriner
 Module 7
 Project Part 2
 6/29/25
-->
<!--This JSP receives the data from the InputNewMovie.jsp and inserts it into the database then redirects to DisplayAllMovies.jsp -->

<head>
    <title>Adding Movie...</title>
</head>
<body>

<%
	String url = "jdbc:mysql://localhost:3306/csd430";
	String username = "student1";
	String password = "pass";
    
	// Get inputs from InputNewMovie.jsp
    String title = request.getParameter("title");
    String director = request.getParameter("director");
    String genre = request.getParameter("genre");
    String rating = request.getParameter("rating");
    String lengthStr = request.getParameter("length"); 

    int length = 0;
    // Length is a string convert to integer
    if (lengthStr != null && !lengthStr.trim().equals("")) {
        length = Integer.parseInt(lengthStr);
    }

    Connection conn = null;         
    PreparedStatement insertStmt = null; // Using a preparedStatement to insert movie

    try {
        
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection to the database
        conn = DriverManager.getConnection(url, username, password);

        // Prepared statement to insert fields into database
        String insertSQL = "INSERT INTO Schriner_movie_data (title, director, genre, rating, length) VALUES (?, ?, ?, ?, ?)";
        insertStmt = conn.prepareStatement(insertSQL);

        // Input values from form into prepared statement
        insertStmt.setString(1, title);
        insertStmt.setString(2, director);
        insertStmt.setString(3, genre);
        insertStmt.setString(4, rating);
        insertStmt.setInt(5, length);

        // Execute the prepared statement
        insertStmt.executeUpdate();

        // If Redirect user to DisplayAllMovies
        response.sendRedirect("DisplayAllMovies.jsp");

    } catch (Exception e) {
%>
    <p style="color:red;">Error: <%= e.getMessage() %></p>
<%
    } finally {
        if (insertStmt != null) try { insertStmt.close(); } catch (Exception ignore) {}
        if (conn != null) try { conn.close(); } catch (Exception ignore) {}
    }
%>

</body>
</html>
