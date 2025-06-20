package Project1;

import java.sql.*;
import java.util.*;

/*
 * Jason Schriner
 * Module 5&6
 * 6/20/25
 */

// JavaBean to connect to the MySQL Database and Retrieve the data

public class MovieBean {
    private Connection conn;

    // Constructor to initialize the database connection
    public MovieBean() {
        try {
            // Establish DB connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/csd430", "student1", "pass");  
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Method to get all movie IDs
    public List<Integer> getMovieIds() {
        List<Integer> movieIds = new ArrayList<>();
        try {
            String sql = "SELECT id FROM movies";  
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                movieIds.add(rs.getInt("id")); 
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movieIds;
    }

    // Method to get movie details by movie ID and store in MAP
    public Map<String, String> getMovieData(int movieId) {
        Map<String, String> movieData = new HashMap<>();
        try {
            String sql = "SELECT * FROM movies WHERE id = ?"; 
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, movieId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                movieData.put("Movie ID", String.valueOf(rs.getInt("id")));
                movieData.put("Title", rs.getString("title"));
                movieData.put("Director", rs.getString("director"));
                movieData.put("Genre", rs.getString("genre"));
                movieData.put("Rating", rs.getString("rating"));
                movieData.put("Length", String.valueOf(rs.getInt("length")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movieData;
    }
}
