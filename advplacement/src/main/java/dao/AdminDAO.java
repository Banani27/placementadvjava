package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Admin;
import util.DBConnection;


public class AdminDAO {

    private static final String AUTHENTICATE_ADMIN = 
        "SELECT id, username, name FROM admin WHERE username = ? AND password = ?";
    private static final String INSERT_ADMIN = 
        "INSERT INTO admin (username, password, name) VALUES (?, ?, ?)";

    // --- LOGIN (Authentication) ---
    public Admin validateLogin(String username, String password) throws SQLException {
        Admin admin = null;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(AUTHENTICATE_ADMIN)) {
            
            ps.setString(1, username);
            ps.setString(2, password);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    admin = new Admin(rs.getInt("id"), rs.getString("username"), rs.getString("name"));
                }
            }
        } 
        return admin;
    }

    // --- REGISTER (Create) ---
    public void insertAdmin(Admin admin) throws SQLException {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(INSERT_ADMIN)) {
            
            ps.setString(1, admin.getUsername());
            ps.setString(2, admin.getPassword());
            ps.setString(3, admin.getName());
            
            ps.executeUpdate();
            
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) { 
                 throw new SQLException("Admin username already exists.", e);
            }
            throw new SQLException("Error registering admin.", e);
        }
    }
}