package model;

public class Admin {
    private int id;
    private String username;
    private String password; // Only used for registration/setter
    private String name;

    // Constructor for fetching/login
    public Admin(int id, String username, String name) {
        this.id = id;
        this.username = username;
        this.name = name;
    }

    // Constructor for registration
    public Admin(String username, String password, String name) {
        this.username = username;
        this.password = password;
        this.name = name;
    }

    // Getters
    public int getId() { return id; }
    public String getUsername() { return username; }
    public String getName() { return name; }
    public String getPassword() { return password; } // Only needed for DAO insert/auth
}