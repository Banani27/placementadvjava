package model;

public class Company {
    private int id;
    private String name;
    private String industry;
    private String hrEmail;
    private String contactPerson;
    private String password;

    // Constructor for registration
    public Company(String name, String industry, String hrEmail, String contactPerson, String password) {
        this.name = name;
        this.industry = industry;
        this.hrEmail = hrEmail;
        this.contactPerson = contactPerson;
        this.password = password;
    }

    // Constructor for fetching/login
    public Company(int id, String name, String industry, String hrEmail, String contactPerson) {
        this.id = id;
        this.name = name;
        this.industry = industry;
        this.hrEmail = hrEmail;
        this.contactPerson = contactPerson;
    }

    // Getters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getIndustry() { return industry; }
    public String getHrEmail() { return hrEmail; }
    public String getContactPerson() { return contactPerson; }
    public String getPassword() { return password; }
    public void setId(int id) { this.id = id; }
    // Other setters omitted for brevity
}
