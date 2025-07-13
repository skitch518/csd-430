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

<head>
	<title>All Movies</title>
	<!-- Link to external CSS stylesheet -->
	<link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>

	<h2>All Movies</h2>

	<%
	String url = "jdbc:mysql://localhost:3306/csd430";
	String username = "student1";
	String password = "pass";
	%>
	
	<%!
	// Declare variables at page level
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	%>
	
	<%
	try {
	    Class.forName("com.mysql.cj.jdbc.Driver");
	
	    // Establish connection to the database
	    conn = DriverManager.getConnection(url, username, password);
	
	    // SQL query to retrieve all movies
	    String query = "SELECT * FROM Schriner_movie_data";
	
	    // Create a Statement object to execute the query
	    stmt = conn.createStatement();
	
	    // Execute the query and store the results in ResultSet
	    rs = stmt.executeQuery(query);
	%>

	<!-- Create a table to display the results -->
	<table border="1" cellpadding="5">
		<thead>
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Director</th>
				<th>Genre</th>
				<th>Rating</th>
				<th>Length</th>
			</tr>
		</thead>
	<tbody>
	<%
    
	// Loop through each row in the result set and display it
    while (rs.next()) {
	%>
	<tr>
		<td><%= rs.getInt("id") %></td>
		<td><%= rs.getString("title") %></td>
		<td><%= rs.getString("director") %></td>
		<td><%= rs.getString("genre") %></td>
		<td><%= rs.getString("rating") %></td>
		<td><%= rs.getInt("length") %></td>
	</tr>
	<%
	    }
	%>
	</tbody>
	</table>
	
	<%
	} catch (Exception e) {
	%>
	<p style="color:red;">Error: <%= e.getMessage() %></p>
	<%
	} finally {
	    if (rs != null) try { rs.close(); } catch (Exception ignore) {}
	    if (stmt != null) try { stmt.close(); } catch (Exception ignore) {}
	    if (conn != null) try { conn.close(); } catch (Exception ignore) {}
	}
	%>

</body>
</html>