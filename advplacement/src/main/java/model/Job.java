package model;

import java.sql.Timestamp;

public class Job {
    private int id;
    private int companyId;
    private String title;
    private String description;
    private double requiredCgpa;
    private double salaryPackage;
    private Timestamp postingDate;

    // Constructor for creating a new Job post
    public Job(int companyId, String title, String description, double requiredCgpa, double salaryPackage) {
        this.companyId = companyId;
        this.title = title;
        this.description = description;
        this.requiredCgpa = requiredCgpa;
        this.salaryPackage = salaryPackage;
    }

    // Constructor for fetching an existing Job (with ID and posting date)
    public Job(int id, int companyId, String title, String description, double requiredCgpa, double salaryPackage, Timestamp postingDate) {
        this(companyId, title, description, requiredCgpa, salaryPackage);
        this.id = id;
        this.postingDate = postingDate;
    }

    // --- Getters ---
    public int getId() { return id; }
    public int getCompanyId() { return companyId; }
    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public double getRequiredCgpa() { return requiredCgpa; }
    public double getSalaryPackage() { return salaryPackage; }
    public Timestamp getPostingDate() { return postingDate; }
    
    // --- Setters (optional, but good practice) ---
    public void setId(int id) { this.id = id; }
    public void setCompanyId(int companyId) { this.companyId = companyId; }
    public void setTitle(String title) { this.title = title; }
    public void setDescription(String description) { this.description = description; }
    public void setRequiredCgpa(double requiredCgpa) { this.requiredCgpa = requiredCgpa; }
    public void setSalaryPackage(double salaryPackage) { this.salaryPackage = salaryPackage; }
    public void setPostingDate(Timestamp postingDate) { this.postingDate = postingDate; }
}
