package controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.ApplicationDAO;

@WebServlet("/UpdateStatusServlet")
public class UpdateStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ApplicationDAO applicationDAO = new ApplicationDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Check if Company is logged in
        if (request.getSession().getAttribute("companyUser") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        try {
            // 2. Get parameters from the form
            int applicationId = Integer.parseInt(request.getParameter("applicationId"));
            String newStatus = request.getParameter("newStatus");
            String jobId = request.getParameter("jobId"); // Get jobId to redirect back

            // 3. Call your existing DAO method
            // Your DAO method uses studentId and jobId, but applicationId is better.
            // Let's modify the DAO call slightly.
            
            // We need a better DAO method: updateStatusById(int applicationId, String status)
            // But for now, let's use the one you have (it's less efficient)
            // **We will assume you will create a better DAO method**
            
            // --- New DAO method you should add to ApplicationDAO.java ---
            // public boolean updateStatusById(int applicationId, String status) {
            //   String sql = "UPDATE application SET status = ? WHERE id = ?";
            //   ... executeUpdate ...
            // }
            
            // Let's call the new DAO method
            applicationDAO.updateStatusById(applicationId, newStatus); // Create this method!
            
            // 4. Redirect back to the applicants list
            response.sendRedirect("ViewApplicantsServlet?jobId=" + jobId);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error updating status", e);
        }
    }
}