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
            String sql = "SELECT id FROM Schriner_movie_data";  
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
            String sql = "SELECT * FROM Schriner_movie_data WHERE id = ?"; 
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
    
    // Method to get all movie details (id, title, director, genre, rating, length) for all movies
    public List<Map<String, String>> getAllMovieDetails() {
        List<Map<String, String>> moviesList = new ArrayList<>();
        try {
            String sql = "SELECT id, title, director, genre, rating, length FROM Schriner_movie_data"; 
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);

            while (rs.next()) {
                Map<String, String> movieDetails = new HashMap<>();
                movieDetails.put("id", String.valueOf(rs.getInt("id")));        
                movieDetails.put("title", rs.getString("title"));              
                movieDetails.put("director", rs.getString("director"));        
                movieDetails.put("genre", rs.getString("genre"));              
                movieDetails.put("rating", rs.getString("rating"));            
                movieDetails.put("length", String.valueOf(rs.getInt("length")));
                moviesList.add(movieDetails);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return moviesList;
    }
    
    public void updateMovie(int movieId, String title, String director, String genre, String rating, int length) {
        String sql = "UPDATE Schriner_movie_data SET title=?, director=?, genre=?, rating=?, length=? WHERE id=?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, title);
            stmt.setString(2, director);
            stmt.setString(3, genre);
            stmt.setString(4, rating);
            stmt.setInt(5, length);
            stmt.setInt(6, movieId);
            int rowsUpdated = stmt.executeUpdate();
            if (rowsUpdated == 0) {
                System.out.println("No movie found ");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public void deleteMovie(int movieId) {
        String sql = "DELETE FROM Schriner_movie_data WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, movieId);
            int rowsDeleted = stmt.executeUpdate();
            if (rowsDeleted == 0) {
                System.out.println("No record found with ID: " + movieId);
            } else {
                System.out.println("Deleted movie with ID: " + movieId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
