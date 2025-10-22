package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Job;
import util.DBConnection;

//package dao; ... (imports)
//... (JobDAO class definition)

public class JobDAO {
 // ... (existing constants and methods like insertJob, deleteJob) ...

 // --- NEW: Filter jobs based on student's CGPA ---
 private static final String SELECT_ELIGIBLE_JOBS = 
     "SELECT j.id, j.company_id, j.title, j.description, j.required_cgpa, j.salary_package, j.posting_date, c.name AS company_name " +
     "FROM job j JOIN company c ON j.company_id = c.id " +
     "WHERE j.required_cgpa <= ? ORDER BY j.posting_date DESC";

 // This method is designed to fetch Job objects and also include the Company Name.
 // NOTE: You'll need a new Job constructor or a wrapper class to hold both Job and Company Name.
 // For simplicity, I'll return the list and rely on a service layer later if needed.
 
 // TEMPORARY: Use the existing Job model, but fetch based on CGPA
 public List<Job> getEligibleJobListings(double studentCgpa) {
     List<Job> jobs = new ArrayList<>();
     // Note: Using the SELECT_ELIGIBLE_JOBS statement defined above
     try (Connection con = DBConnection.getConnection();
          PreparedStatement ps = con.prepareStatement(SELECT_ELIGIBLE_JOBS)) {
         
         ps.setDouble(1, studentCgpa); // Set the student's CGPA as the filtering parameter
         
         try (ResultSet rs = ps.executeQuery()) {
             while (rs.next()) {
                 // This assumes the Job model or a Job wrapper will handle the company_name later.
                 // For now, we fetch the core Job properties.
                 jobs.add(new Job(
                     rs.getInt("id"),
                     rs.getInt("company_id"),
                     rs.getString("title"),
                     rs.getString("description"),
                     rs.getDouble("required_cgpa"),
                     rs.getDouble("salary_package"),
                     rs.getTimestamp("posting_date")
                 ));
             }
         }
     } catch (SQLException e) {
         e.printStackTrace();
     }
     return jobs;
 }
}

