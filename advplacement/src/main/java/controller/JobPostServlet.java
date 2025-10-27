package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.JobDAO;
import model.Job;
/**
 * Handles all actions related to Job Posting and Listing for the Company HR user.
 * Mapped to /JobPostServlet
 */
@WebServlet("/JobPostServlet")
public class JobPostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private JobDAO jobDAO;

    @Override
    public void init() {
        jobDAO = new JobDAO();
    }

    // Helper method to check if the user is logged in as a Company HR
    private boolean isCompanyLoggedIn(HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
        if (session == null || session.getAttribute("companyId") == null) {
            // Redirect to login page and terminate request
            System.out.println("Session invalid or companyId missing. Redirecting to index.jsp.");
            // Set an error message if possible (though redirect clears request scope)
            // request.setAttribute("loginError", "Session expired. Please log in."); // Only useful if forwarding
            response.sendRedirect(request.getContextPath() + "/index.jsp"); 
            return false;
        }
        return true;
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        
        // 1. Authentication Check
        if (!isCompanyLoggedIn(session, response, request)) {
            return;
        }
        
        // 2. Safely get companyId and set default action
        Integer companyId = (Integer) session.getAttribute("companyId");
        String action = request.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "add":
                    showPostForm(request, response);
                    break;
                case "list":
                default:
                    // Only proceed if companyId is valid
                    if (companyId != null) {
                        listCompanyJobs(request, response, companyId.intValue());
                    } else {
                        // Invalidate session if companyId is suddenly null, forcing relogin
                        session.invalidate();
                        response.sendRedirect(request.getContextPath() + "/index.jsp");
                    }
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Something went wrong: " + e.getMessage());
            request.getRequestDispatcher("/company_dashboard.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if ("insert".equals(action)) {
            insertJob(request, response);
        } else {
            // Fallback to doGet for unknown POST actions
            doGet(request, response);
        }
    }

    // Renders the job_post.jsp form
    private void showPostForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/job_post.jsp");
        dispatcher.forward(request, response);
    }

    // Fetches and displays the company's job listings in company_jobs.jsp
    private void listCompanyJobs(HttpServletRequest request, HttpServletResponse response, int companyId)
            throws SQLException, ServletException, IOException {

        List<Job> jobs = jobDAO.getJobsByCompany(companyId);
        request.setAttribute("companyJobs", jobs);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/company_jobs.jsp");
        dispatcher.forward(request, response);
    }

    // Handles form submission and inserts the new job into the database
    private void insertJob(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // We still need the session for the success message, but not for the ID.
    	HttpSession session = request.getSession(); 
        String message;

        try {
            // --- THIS IS THE CHANGE ---
            // We now get companyId from the form's hidden field, NOT the session.
            int companyId = Integer.parseInt(request.getParameter("companyId"));
            // --- END OF CHANGE ---

            String title = request.getParameter("title");
            String description = request.getParameter("description");
            double requiredCgpa = Double.parseDouble(request.getParameter("requiredCgpa"));
            double salaryPackage = Double.parseDouble(request.getParameter("salaryPackage"));

            Job job = new Job(companyId, title, description, requiredCgpa, salaryPackage);
            jobDAO.insertJob(job);

            message = "Job posted successfully!";
            // Use session for success message in Post/Redirect/Get pattern
            session.setAttribute("successMessage", message); 
            
            // Redirect to the list view after successful insert (PRG pattern)
            response.sendRedirect(request.getContextPath() + "/JobPostServlet?action=list");

        } catch (NumberFormatException e) {
            // This error now also catches if companyId is a bad value
            request.setAttribute("errorMessage", "Invalid number format for ID, CGPA, or Salary. Please use numbers.");
            showPostForm(request, response); // Return to form with error
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: Failed to post job.");
            showPostForm(request, response); // Return to form with error
        }
    }
}
