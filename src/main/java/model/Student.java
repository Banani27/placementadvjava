package model;

public class Student {
    private int id;
    private String name;
    private String rollNo;
    private String branch;
    private double cgpa;
    private String email;
    private String password;

    // Constructor for registration
    public Student(String name, String rollNo, String branch, double cgpa, String email, String password) {
        this.name = name;
        this.rollNo = rollNo;
        this.branch = branch;
        this.cgpa = cgpa;
        this.email = email;
        this.password = password;
    }

    // Constructor for fetching/login/dashboard (without password)
    public Student(int id, String name, String rollNo, String branch, double cgpa, String email) {
        this.id = id;
        this.name = name;
        this.rollNo = rollNo;
        this.branch = branch;
        this.cgpa = cgpa;
        this.email = email;
    }
    
    // Getters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getRollNo() { return rollNo; }
    public String getBranch() { return branch; }
    public double getCgpa() { return cgpa; }
    public String getEmail() { return email; }
    public String getPassword() { return password; }
    public void setId(int id) { this.id = id; }
    // Other setters omitted for brevity
}
