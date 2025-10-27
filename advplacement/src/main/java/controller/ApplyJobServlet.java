package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Student;

import dao.ApplicationDAO;

@WebServlet("/ApplyJobServlet")
public class ApplyJobServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ApplicationDAO applicationDAO = new ApplicationDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
    	// 1. Security Check (only students can apply)
    	HttpSession session = request.getSession(false);
    	Student student = (session != null) ? (Student) session.getAttribute("currentStudent") : null;

    	if (student == null) {
    	    // User is not logged in as a student
    	    response.sendRedirect("index.jsp");
    	    return;
    	}
    	Integer studentId = student.getId(); // Get the ID from the Student object

        String jobIdParam = request.getParameter("jobId");
        int jobId = 0;
        try {
            jobId = Integer.parseInt(jobIdParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("StudentDashboardController");
            return;
        }

        try {
            // 2. Perform the application insertion
            applicationDAO.applyForJob(studentId, jobId);
            
            // 3. Success: Redirect back to the dashboard with a success message
            request.getSession().setAttribute("successMessage", "Application submitted successfully!");
            response.sendRedirect("StudentDashboardController");

        } catch (Exception e) {
            e.printStackTrace();
            String errorMessage = "Application failed. ";
            if (e.getMessage().contains("already applied")) {
                errorMessage += "You have already applied for this job.";
            } else {
                errorMessage += "Database error: " + e.getMessage();
            }
            
            // 4. Failure: Set error and redirect
            request.getSession().setAttribute("errorMessage", errorMessage);
            response.sendRedirect("StudentDashboardController");
        }
        
        
    }
}

