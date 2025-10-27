package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CompanyDAO;
import model.Company;

@WebServlet("/CompanyLoginServlet")
public class CompanyLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CompanyDAO companyDAO;

    public void init() {
        companyDAO = new CompanyDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Retrieve credentials from the form
        String hrEmail = request.getParameter("hrEmail");
        String password = request.getParameter("password");
        
        // 2. Input validation
        if (hrEmail == null || hrEmail.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("errorMessage", "HR Email and Password are required.");
            request.getRequestDispatcher("/company_dashboard.jsp").forward(request, response);
            return;
        }

        try {
            // 3. Validate credentials using the DAO
            Company company = companyDAO.validateLogin(hrEmail, password);
            
            if (company != null) {
                // 4. SUCCESS: Create session, store company object, and redirect
                HttpSession session = request.getSession();
                session.setAttribute("companyUser", company); // object
                session.setAttribute("companyId", company.getId()); // integer
                session.setAttribute("currentCompany", company); // optional for dashboard
                
                // Redirect to the dashboard controller to load data
                response.sendRedirect(request.getContextPath() + "/CompanyDashboardController");
            } else {
                // 5. FAILURE: Set error message and return to the login page
                request.setAttribute("errorMessage", "Invalid HR Email or Password.");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "A database error occurred during login.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}

