package model;
import java.sql.Timestamp;

public class Application {
    private int id;
    private int studentId;
    private int jobId;
    private String status; // Values like 'PENDING', 'ACCEPTED', 'REJECTED'
    private Timestamp applicationDate;
    
    // Optional: Fields for displaying linked data (not stored in this table, 
    // but useful when fetching joined results for a dashboard)
    private String studentName;
    private String jobTitle;
    private String companyName;

    // ----------------------------------------------------
    // Constructor 1: For creating a new application (only needs IDs)
    // ----------------------------------------------------
    public Application(int studentId, int jobId) {
        this.studentId = studentId;
        this.jobId = jobId;
    }

    // ----------------------------------------------------
    // Constructor 2: For fetching application records (includes status/date)
    // ----------------------------------------------------
    public Application(int id, int studentId, int jobId, String status, Timestamp applicationDate) {
        this.id = id;
        this.studentId = studentId;
        this.jobId = jobId;
        this.status = status;
        this.applicationDate = applicationDate;
    }
    
    // ----------------------------------------------------
    // Constructor 3: For fetching detailed records (e.g., Student dashboard view)
    // ----------------------------------------------------
    public Application(int id, String studentName, String jobTitle, String companyName, String status, Timestamp applicationDate) {
        this.id = id;
        this.studentName = studentName;
        this.jobTitle = jobTitle;
        this.companyName = companyName;
        this.status = status;
        this.applicationDate = applicationDate;
    }


    // ----------------------------------------------------
    // Getters and Setters
    // ----------------------------------------------------

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }

    public int getJobId() { return jobId; }
    public void setJobId(int jobId) { this.jobId = jobId; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Timestamp getApplicationDate() { return applicationDate; }
    public void setApplicationDate(Timestamp applicationDate) { this.applicationDate = applicationDate; }
    
    // Getters for display properties
    public String getStudentName() { return studentName; }
    public String getJobTitle() { return jobTitle; }
    public String getCompanyName() { return companyName; }
}
