package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.ApplicationDAO;
import model.Application;

@WebServlet("/ViewApplicantsServlet")
public class ViewApplicantsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ApplicationDAO applicationDAO = new ApplicationDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Check if Company is logged in
        if (request.getSession().getAttribute("companyUser") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        try {
            // 2. Get the jobId from the link they clicked
            int jobId = Integer.parseInt(request.getParameter("jobId"));
            
            // 3. Get the list of applicants from the DAO
            List<Application> applicantList = applicationDAO.getApplicantsByJobId(jobId);
            
            // 4. Send this list to the new JSP
            request.setAttribute("applicantList", applicantList);
            request.setAttribute("jobId", jobId); // Send the jobId too
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/view_applicants.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error loading applicants", e);
        }
    }
}