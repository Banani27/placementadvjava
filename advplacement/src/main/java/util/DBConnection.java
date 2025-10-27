package util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/placementdb";
    private static final String USERNAME = "root";  
    private static final String PASSWORD = "root";     
    
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("✅ MySQL JDBC Driver loaded successfully");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ MySQL JDBC Driver not found!");
            e.printStackTrace();
        }
    }
    
    public static Connection getConnection() {
        try {
            System.out.println("🔗 Attempting database connection...");
            System.out.println("   URL: " + URL);
            System.out.println("   Username: " + USERNAME);
            
            Connection conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
            System.out.println("✅ Database connection established successfully!");
            return conn;
        } catch (SQLException e) {
            System.err.println("❌ Database connection failed!");
            System.err.println("   Error: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
    
    // Test method
    public static void testConnection() {
        Connection conn = getConnection();
        if (conn != null) {
            System.out.println("✅ Connection test: PASSED");
            try { conn.close(); } catch (SQLException e) {}
        } else {
            System.out.println("❌ Connection test: FAILED");
        }
    }
}
