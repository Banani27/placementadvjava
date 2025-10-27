package model;

import java.sql.Timestamp;

// This is a "View Model" or DTO to hold data from multiple tables
public class ApplicationDetails {
    private int applicationId;
    private String jobTitle;
    private String companyName;
    private String status;
    private Timestamp applicationDate;
    private Timestamp interviewDate;
    private String interviewDetails;

    public ApplicationDetails(int applicationId, String jobTitle, String companyName, 
                              String status, Timestamp applicationDate, 
                              Timestamp interviewDate, String interviewDetails) {
        this.applicationId = applicationId;
        this.jobTitle = jobTitle;
        this.companyName = companyName;
        this.status = status;
        this.applicationDate = applicationDate;
        this.interviewDate = interviewDate;
        this.interviewDetails = interviewDetails;
    }

    // --- Add all Getters and Setters for these fields ---
    // (Getters are most important for the JSP)
    public int getApplicationId() { return applicationId; }
    public String getJobTitle() { return jobTitle; }
    public String getCompanyName() { return companyName; }
    public String getStatus() { return status; }
    public Timestamp getApplicationDate() { return applicationDate; }
    public Timestamp getInterviewDate() { return interviewDate; }
    public String getInterviewDetails() { return interviewDetails; }
}