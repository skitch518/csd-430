package Project1;
import java.sql.*;

/*
 * Jason Schriner
 * Module 5&6
 * 6/20/25
 */

// Class to create and Initialize the Database

public class CreateMovieDatabase {

    public static void main(String[] args) {
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/csd430";  
        String username = "student1";  
        String password = "pass";  
        
        String dropTableSQL = "DROP TABLE IF EXISTS Schriner_movie_data;";

        // Creates the Table and Columns
        String createTableSQL = "CREATE TABLE IF NOT EXISTS Schriner_movie_data (" +
                "id INT PRIMARY KEY AUTO_INCREMENT, " +  // make sure this matches the insert statement
                "title VARCHAR(255) NOT NULL, " +
                "director VARCHAR(255), " +
                "genre VARCHAR(100), " +
                "rating VARCHAR(10), " +
                "length INT" +
                ");";

        // Inserts fields into the table
        String insertDataSQL = "INSERT INTO Schriner_movie_data (id, title, director, genre, rating, length) VALUES " +
                "(1, 'How to Train Your Dragon', 'Dean DeBlois', 'Family', 'PG', 98), " +
                "(2, 'Paddington', 'Paul King', 'Family', 'PG', 95), " +
                "(3, 'Braveheart', 'Mel Gibson', 'Drama', 'R', 178), " +
                "(4, 'The Usual Suspects', 'Bryan Singer', 'Drama', 'R', 106), " +
                "(5, 'Dune: Part Two', 'Denis Villeneuve', 'Sci-Fi', 'PG-13', 166), " +
                "(6, 'Toy Story 3', 'Lee Unkrich', 'Family', 'G', 103), " +
                "(7, 'Street Kings', 'David Ayer', 'Action', 'R', 109), " +
                "(8, 'The Big Short', 'Adam McKay', 'Drama', 'R', 130), " +
                "(9, 'Generation Iron', 'Vlad Yudin', 'Documentary', 'PG-13', 106), " +
                "(10, 'The Princess Bride', 'Rob Reiner', 'Fantasy', 'PG', 98);";

        // Establishes the database connection
        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            // Drop the table if it exists to avoid errors
            try (Statement stmt = connection.createStatement()) {
                stmt.executeUpdate(dropTableSQL);
                System.out.println("Table 'Schriner_movie_data' dropped (if it existed).");
            }

            // Creates the table
            try (Statement stmt = connection.createStatement()) {
                stmt.executeUpdate(createTableSQL);
                System.out.println("Table 'Schriner_movie_data' created successfully.");
            }

            // Inserts the movie data
            try (Statement stmt = connection.createStatement()) {
                stmt.executeUpdate(insertDataSQL);
                System.out.println("Movie data inserted successfully.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}