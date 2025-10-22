package controller;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CompanyDAO;
import model.Company;

@WebServlet("/CompanyServlet")
public class CompanyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CompanyDAO companyDAO;

    public void init() {
        companyDAO = new CompanyDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Check if the user is an Admin (basic security check)
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminUser") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        // 2. Determine the action
        String action = request.getParameter("action");
        if (action == null) {
            action = "list"; // Default action for Admin view
        }

        try {
            switch (action) {
                case "delete":
                    // Redirect deletion requests to the dedicated DeleteServlet
                    response.sendRedirect(request.getContextPath() + "/DeleteServlet?type=company&id=" + request.getParameter("id"));
                    break;
                case "edit":
                    // Redirect to UpdateServlet to display the edit form
                    response.sendRedirect(request.getContextPath() + "/UpdateServlet?type=company&id=" + request.getParameter("id"));
                    break;
                case "list":
                default:
                    listCompanies(request, response);
                    break;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing the company request.");
            listCompanies(request, response);
        }
    }
    
    // --- POST requests are handled by specific registration/update servlets ---
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }

    // Method to fetch and display the list of all companies for the Admin
    private void listCompanies(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        
        List<Company> listCompanies;
        try {
            // Fetch all companies from the database
            listCompanies = companyDAO.getAllCompanies();
        } catch (Exception e) {
            // Handle DB connection or query errors
            e.printStackTrace();
            request.setAttribute("errorMessage", "Could not load company list from database.");
            listCompanies = new java.util.ArrayList<>(); // Provide empty list on error
        }
        
        // Set the list as a request attribute
        request.setAttribute("listCompanies", listCompanies);
        
        // Forward to the Admin management view (company_management.jsp)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/company_management.jsp");
        dispatcher.forward(request, response);
    }
}

