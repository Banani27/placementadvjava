package dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Student;
import util.DBConnection;

public class StudentDAO {

    private static final String INSERT_STUDENT = 
        "INSERT INTO student (name, roll_no, branch, cgpa, email, password) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_ALL_STUDENTS = 
        "SELECT id, name, roll_no, branch, cgpa, email FROM student ORDER BY roll_no";
    private static final String AUTHENTICATE_STUDENT = 
        "SELECT id, name, roll_no, branch, cgpa, email FROM student WHERE roll_no = ? AND password = ?";
    private static final String DELETE_STUDENT = 
        "DELETE FROM student WHERE id = ?";

    // --- NEW: BATCH INSERT FOR EXCEL IMPORT ---
    /**
     * Inserts a list of Student objects into the database using JDBC batch processing.
     * @param students The list of students to be inserted.
     * @return The total number of rows inserted.
     */
    public int batchInsertStudents(List<Student> students) throws SQLException {
        int insertedCount = 0;
        
        // Use try-with-resources to ensure connection is closed
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(INSERT_STUDENT)) {
            
            // Set auto-commit to false for transaction management
            con.setAutoCommit(false); 

            for (Student student : students) {
                // Set parameters for the prepared statement
                ps.setString(1, student.getName());
                ps.setString(2, student.getRollNo());
                ps.setString(3, student.getBranch());
                ps.setDouble(4, student.getCgpa());
                ps.setString(5, student.getEmail());
                ps.setString(6, student.getPassword());
                
                // Add the current set of parameters to the batch queue
                ps.addBatch();
            }

            // Execute the batch and get an array of counts for each insert
            int[] results = ps.executeBatch();
            
            // Commit the transaction only if the batch executes successfully
            con.commit();
            
            // Sum the total number of inserted rows
            for (int count : results) {
                insertedCount += count;
            }

        } catch (SQLException e) {
            // Log error and rethrow after rolling back
            System.err.println("Batch Insert Failed. Rolling back transaction.");
            e.printStackTrace();
            throw new SQLException("Error performing batch insert: " + e.getMessage(), e);
        }
        return insertedCount;
    }


    // --- INSERT (Registration - single record) ---
    public void insertStudent(Student student) throws SQLException {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(INSERT_STUDENT)) {
            
            ps.setString(1, student.getName());
            ps.setString(2, student.getRollNo());
            ps.setString(3, student.getBranch());
            ps.setDouble(4, student.getCgpa());
            ps.setString(5, student.getEmail());
            ps.setString(6, student.getPassword());
            ps.executeUpdate();
            
        } catch (SQLException e) {
            if (e.getErrorCode() == 1062) {
                 throw new SQLException("Roll Number or Email already exists.", e);
            }
            throw new SQLException("Error registering student.", e);
        }
    }

    // --- LOGIN (Authentication) ---
    public Student validateLogin(String rollNo, String password) throws SQLException {
        Student student = null;
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(AUTHENTICATE_STUDENT)) {
            
            ps.setString(1, rollNo);
            ps.setString(2, password);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    student = new Student(
                        rs.getInt("id"), rs.getString("name"), rs.getString("roll_no"), 
                        rs.getString("branch"), rs.getDouble("cgpa"), rs.getString("email")
                    );
                }
            }
        } 
        return student;
    }
    
    // --- READ (Admin/Company View) ---
    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(SELECT_ALL_STUDENTS);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                students.add(new Student(
                    rs.getInt("id"), rs.getString("name"), rs.getString("roll_no"), 
                    rs.getString("branch"), rs.getDouble("cgpa"), rs.getString("email")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }
    
    // --- DELETE (Admin Action) ---
    public boolean deleteStudent(int id) throws SQLException {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(DELETE_STUDENT)) {
            
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        }
    }
    
    // --- UPDATE (Implementation Placeholder) ---
    // public void updateStudent(Student student) throws SQLException { ... }
}
