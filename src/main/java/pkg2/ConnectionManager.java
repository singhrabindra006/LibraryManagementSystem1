package pkg2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

    // Database connection parameters
    private static final String URL = "jdbc:mysql://localhost:3306/LibraryManagementSystem?useSSL=false"; // Replace with your database URL
    private static final String USER = "root"; // Replace with your database username
    private static final String PASSWORD = "singh123"; // Replace with your database password

    // Method to get a database connection
    public static Connection getConnection() {
        Connection connection = null;
        try {
            // Load the database driver (MySQL in this case)
            Class.forName("com.mysql.cj.jdbc.Driver"); // For MySQL, use the appropriate driver for your database
            
            // Create a connection to the database
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("Database driver not found: " + e.getMessage());
        } catch (SQLException e) {
            System.out.println("Error connecting to the database: " + e.getMessage());
        }
        return connection;
    }
}
