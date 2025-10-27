package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Application;
import model.ApplicationDetails;
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
    
   
    
    
 // Method to check if student already applied for this job
    public boolean hasAlreadyApplied(int studentId, int jobId) throws SQLException {
        String sql = "SELECT 1 FROM application WHERE student_id = ? AND job_id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, studentId);
            ps.setInt(2, jobId);
            
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next(); // If rs.next() is true, a record exists
            }
        }
    }

 // This method gets ALL applications (for the "My Applications" page)
 // We need a new model `ApplicationDetails` to hold the joined data
 public List<ApplicationDetails> getApplicationsByStudent(int studentId) throws SQLException {
     List<ApplicationDetails> list = new ArrayList<>();
     String sql = "SELECT a.id, a.status, a.application_date, a.interview_date, a.interview_details, " +
                  "j.title AS job_title, c.name AS company_name " +
                  "FROM application a " +
                  "JOIN job j ON a.job_id = j.id " +
                  "JOIN company c ON j.company_id = c.id " +
                  "WHERE a.student_id = ? " +
                  "ORDER BY a.application_date DESC";
     
     try (Connection con = DBConnection.getConnection();
          PreparedStatement ps = con.prepareStatement(sql)) {
         
         ps.setInt(1, studentId);
         try (ResultSet rs = ps.executeQuery()) {
             while (rs.next()) {
                 // You need to create the ApplicationDetails model
                 ApplicationDetails details = new ApplicationDetails(
                     rs.getInt("id"),
                     rs.getString("job_title"),
                     rs.getString("company_name"),
                     rs.getString("status"),
                     rs.getTimestamp("application_date"),
                     rs.getTimestamp("interview_date"),
                     rs.getString("interview_details")
                 );
                 list.add(details);
             }
         }
     }
     return list;
 }

 // This method gets ONLY scheduled interviews (for the "Interviews" page)
 public List<ApplicationDetails> getInterviewsByStudent(int studentId) throws SQLException {
     List<ApplicationDetails> list = new ArrayList<>();
     String sql = "SELECT a.id, a.status, a.application_date, a.interview_date, a.interview_details, " +
                  "j.title AS job_title, c.name AS company_name " +
                  "FROM application a " +
                  "JOIN job j ON a.job_id = j.id " +
                  "JOIN company c ON j.company_id = c.id " +
                  "WHERE a.student_id = ? AND a.status = 'Interview Scheduled' " +
                  "ORDER BY a.interview_date ASC";
     
     // This try-with-resources block is the same as the one above
     try (Connection con = DBConnection.getConnection();
          PreparedStatement ps = con.prepareStatement(sql)) {
         
         ps.setInt(1, studentId);
         try (ResultSet rs = ps.executeQuery()) {
             while (rs.next()) {
                 ApplicationDetails details = new ApplicationDetails(
                     rs.getInt("id"),
                     rs.getString("job_title"),
                     rs.getString("company_name"),
                     rs.getString("status"),
                     rs.getTimestamp("application_date"),
                     rs.getTimestamp("interview_date"),
                     rs.getString("interview_details")
                 );
                 list.add(details);
             }
         }
       }
	 return list;
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
    
 // --- READ (Company Dashboard: View Applicants for a Job) ---
    public List<Application> getApplicantsByJobId(int jobId) {
        List<Application> applicants = new ArrayList<>();
        
        // This query joins application with student to get student details
        String sql = "SELECT a.id, a.status, a.application_date, s.name, s.cgpa " +
                     "FROM application a " +
                     "JOIN student s ON a.student_id = s.id " +
                     "WHERE a.job_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, jobId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    // We will use Constructor 3 from your model
                    Application app = new Application(
                        rs.getInt("id"),
                        rs.getString("name"),  // studentName
                        null,                  // jobTitle (not needed here)
                        null,                  // companyName (not needed here)
                        rs.getString("status"),
                        rs.getTimestamp("application_date")
                    );
                    // We can add the CGPA to the model if we add a setter
                    // For now, this is enough to display
                    applicants.add(app);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return applicants; // Returns the list of applicants
    }
    
    
    
    public boolean updateStatusById(int applicationId, String status) throws SQLException {
        String sql = "UPDATE application SET status = ? WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(sql)) {
           
           ps.setString(1, status);
           ps.setInt(2, applicationId);
           
           return ps.executeUpdate() > 0;
       }
   }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
