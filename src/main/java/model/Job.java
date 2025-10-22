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

    // Default constructor for creation
    public Job(int companyId, String title, String description, double requiredCgpa, double salaryPackage) {
        this.companyId = companyId;
        this.title = title;
        this.description = description;
        this.requiredCgpa = requiredCgpa;
        this.salaryPackage = salaryPackage;
    }

    // Constructor for fetching
    public Job(int id, int companyId, String title, String description, double requiredCgpa, double salaryPackage, Timestamp postingDate) {
        this(companyId, title, description, requiredCgpa, salaryPackage);
        this.id = id;
        this.postingDate = postingDate;
    }

    // Getters and Setters (essential)
    public int getId() { return id; }
    public int getCompanyId() { return companyId; }
    public String getTitle() { return title; }
    public String getDescription() { return description; }
    public double getRequiredCgpa() { return requiredCgpa; }
    public double getSalaryPackage() { return salaryPackage; }
    public Timestamp getPostingDate() { return postingDate; }
    // Setters omitted for brevity
}

