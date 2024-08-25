package pkg2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDB {
    private static final String URL = "jdbc:mysql://localhost:3306/LibraryManagementSystem";
    private static final String USER = "root";
    private static final String PASSWORD = "singh123";

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("JDBC Driver not found", e);
        }
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        if (conn != null) {
            System.out.println("Database connected successfully.");
        }
        return conn;
    }
}
