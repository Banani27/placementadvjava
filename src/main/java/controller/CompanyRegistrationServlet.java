package controller;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CompanyDAO;
import model.Company;

@WebServlet("/CompanyRegistrationServlet")
public class CompanyRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CompanyDAO companyDAO;

    public void init() {
        companyDAO = new CompanyDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Retrieve parameters from the registration form
        String name = request.getParameter("name");
        String industry = request.getParameter("industry");
        String hrEmail = request.getParameter("hrEmail");
        String contactPerson = request.getParameter("contactPerson");
        String password = request.getParameter("password");

        // Basic input validation (optional, more robust validation should be added)
        if (name == null || name.trim().isEmpty() || hrEmail == null || hrEmail.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required for registration.");
            request.getRequestDispatcher("/company_register.jsp").forward(request, response);
            return;
        }

        // 2. Create the Company Model object
        Company newCompany = new Company(name, industry, hrEmail, contactPerson, password);
        
        // 3. Attempt to insert the record into the database
        try {
            companyDAO.insertCompany(newCompany);
            
            // Success: Set a message and redirect to the login page
            request.setAttribute("successMessage", "Company registered successfully! You can now log in.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            String message = "Registration failed. ";
            
            // Handle unique constraint violation (Company Name or HR Email already exists)
            if (e.getMessage().contains("already exists")) {
                message += "Company Name or HR Email is already in use.";
            } else {
                message += "A database error occurred during registration.";
            }
            
            // Failure: Set error message and forward back to the registration form
            request.setAttribute("errorMessage", message);
            request.getRequestDispatcher("/company_register.jsp").forward(request, response);
        }
    }
    
    // Handles GET requests, typically just forwarding to the registration form
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/company_register.jsp").forward(request, response);
    }
}
