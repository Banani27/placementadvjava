package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Company;
import util.DBConnection;


public class CompanyDAO {
    
    private static final String INSERT_COMPANY = 
        "INSERT INTO company (name, industry, hr_email, contact_person, password) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_COMPANIES = 
        "SELECT id, name, industry, hr_email, contact_person FROM company ORDER BY name";
    private static final String AUTHENTICATE_COMPANY =
        "SELECT id, name, industry, hr_email, contact_person FROM company WHERE hr_email = ? AND password = ?";
    private static final String DELETE_COMPANY = 
        "DELETE FROM company WHERE id = ?";

    // --- INSERT (Registration) ---
    public void insertCompany(Company company) throws SQLException {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(INSERT_COMPANY)) {
            
            ps.setString(1, company.getName());
            ps.setString(2, company.getIndustry());
            ps.setString(3, company.getHrEmail());
            ps.setString(4, company.getContactPerson());
            ps.setString(5, company.getPassword());
            ps.executeUpdate();
            
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                 throw new SQLException("Company Name or HR Email already exists.", e);
            }
            throw new SQLException("Error registering company.", e);
        }
    }

    // --- LOGIN (Authentication) ---
    public Company validateLogin(String hrEmail, String password) throws SQLException {
        Company company = null;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(AUTHENTICATE_COMPANY)) {
            
            ps.setString(1, hrEmail);
            ps.setString(2, password);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    company = new Company(
                        rs.getInt("id"), rs.getString("name"), rs.getString("industry"), 
                        rs.getString("hr_email"), rs.getString("contact_person")
                    );
                }
            }
        }
        return company;
    }

    // --- READ (Student/Admin View) ---
    public List<Company> getAllCompanies() {
        List<Company> companies = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_ALL_COMPANIES);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                companies.add(new Company(
                    rs.getInt("id"), rs.getString("name"), rs.getString("industry"), 
                    rs.getString("hr_email"), rs.getString("contact_person")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return companies;
    }
    
    // --- DELETE (Admin Action) ---
    public boolean deleteCompany(int id) throws SQLException {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(DELETE_COMPANY)) {
            
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }
    // --- UPDATE (Requires implementation of SQL UPDATE statement) ---
    // public void updateCompany(Company company) throws SQLException { ... }
}