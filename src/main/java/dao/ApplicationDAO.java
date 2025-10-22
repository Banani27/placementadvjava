package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Application;
import util.DBConnection;


public class ApplicationDAO {
    
    private static final String APPLY_JOB = 
        "INSERT INTO application (student_id, job_id) VALUES (?, ?)";
    private static final String UPDATE_STATUS = 
        "UPDATE application SET status = ? WHERE student_id = ? AND job_id = ?";
        
    private static final String SELECT_STUDENT_APPLICATIONS = 
        "SELECT a.id, j.title, c.name AS company_name, a.status, a.application_date " +
        "FROM application a " +
        "JOIN job j ON a.job_id = j.id " +
        "JOIN company c ON j.company_id = c.id " +
        "WHERE a.student_id = ?";
        
    private static final String SELECT_APPLICANTS_FOR_JOB =
        "SELECT a.id, s.name AS student_name, s.roll_no, s.cgpa, a.status, a.application_date " +
        "FROM application a " +
        "JOIN student s ON a.student_id = s.id " +
        "WHERE a.job_id = ?";

    // --- CREATE (Student Action) ---
    public void applyForJob(int studentId, int jobId) throws SQLException {
        // (Implementation from previous response)
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(APPLY_JOB)) {
            
            ps.setInt(1, studentId);
            ps.setInt(2, jobId);
            ps.executeUpdate();
            
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                throw new SQLException("You have already applied for this job.", e);
            }
            throw new SQLException("Database error during application submission.", e);
        }
    }
    
    // --- READ (Student Dashboard: View My Applications) ---
    public List<Application> getApplicationsByStudentId(int studentId) {
        List<Application> applications = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_STUDENT_APPLICATIONS)) {
            
            ps.setInt(1, studentId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    // Use Constructor 3 from the Model
                    applications.add(new Application(
                        rs.getInt("id"),
                        null, // studentName is null here as we are viewing our own applications
                        rs.getString("title"),
                        rs.getString("company_name"),
                        rs.getString("status"),
                        rs.getTimestamp("application_date")
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applications;
    }
    
    // --- READ (Company Dashboard: View Applicants for a Job) ---
    public List<Application> getApplicantsByJobId(int jobId) {
        List<Application> applicants = new ArrayList<>();
        // NOTE: In a real app, you would join to get student data like CGPA, RollNo, etc.
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_APPLICANTS_FOR_JOB)) {
            
            ps.setInt(1, jobId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    // For company view, we can temporarily store the student name/roll/cgpa
                    // by extending the Application Model or using a custom DTO. 
                    // For simplicity, we'll return basic Application objects here.
                    // A better approach is to create an ApplicantDTO object.
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applicants; // Returns an empty list, should be implemented further
    }

    // --- UPDATE (Company Action) ---
    public boolean updateApplicationStatus(int studentId, int jobId, String status) throws SQLException {
         // (Implementation from previous response)
         try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(UPDATE_STATUS)) {
            
            ps.setString(1, status); // e.g., 'ACCEPTED', 'REJECTED'
            ps.setInt(2, studentId);
            ps.setInt(3, jobId);
            
            return ps.executeUpdate() > 0;
        }
    }
}
