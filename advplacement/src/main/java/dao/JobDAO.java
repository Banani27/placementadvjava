package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import model.Job;
import util.DBConnection;

public class JobDAO {

    private static final String INSERT_JOB =
        "INSERT INTO job (company_id, title, description, required_cgpa, salary_package) VALUES (?, ?, ?, ?, ?)";

    private static final String SELECT_JOBS_BY_COMPANY =
        "SELECT id, company_id, title, description, required_cgpa, salary_package, posting_date " +
        "FROM job WHERE company_id = ? ORDER BY posting_date DESC";
    
    
 // ✅ Fetch all jobs eligible for a student based on CGPA
    public List<Job> getEligibleJobListings(double studentCgpa) throws SQLException {
        List<Job> jobs = new ArrayList<>();

        String sql = "SELECT id, company_id, title, description, required_cgpa, salary_package, posting_date "
                   + "FROM job WHERE required_cgpa <= ? ORDER BY posting_date DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setDouble(1, studentCgpa);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Job job = new Job(
                        rs.getInt("id"),
                        rs.getInt("company_id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getDouble("required_cgpa"),
                        rs.getDouble("salary_package"),
                        rs.getTimestamp("posting_date")
                    );
                    jobs.add(job);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error fetching eligible job listings: " + e.getMessage(), e);
        }

        return jobs;
    }


    /**
     * Inserts a new Job object into the database.
     */
    public void insertJob(Job job) throws SQLException {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(INSERT_JOB)) {

            ps.setInt(1, job.getCompanyId());
            ps.setString(2, job.getTitle());
            ps.setString(3, job.getDescription());
            ps.setDouble(4, job.getRequiredCgpa());
            ps.setDouble(5, job.getSalaryPackage());
            
            ps.executeUpdate();

        } catch (SQLException e) {
            // Log the error and rethrow
            e.printStackTrace();
            throw new SQLException("Error inserting job: " + e.getMessage(), e);
        }
    }
    
    /**
     * Fetches all job postings belonging to a specific company.
     */
    public List<Job> getJobsByCompany(int companyId) throws SQLException {
        List<Job> jobs = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_JOBS_BY_COMPANY)) {

            ps.setInt(1, companyId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Job job = new Job(
                        rs.getInt("id"),
                        rs.getInt("company_id"),
                        rs.getString("title"),
                        rs.getString("description"),
                        rs.getDouble("required_cgpa"),
                        rs.getDouble("salary_package"),
                        rs.getTimestamp("posting_date")
                    );
                    jobs.add(job);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error fetching jobs by company: " + e.getMessage(), e);
        }
        return jobs;
    }
}