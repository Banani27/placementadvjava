package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.ApplicationDAO;
import model.ApplicationDetails;
import model.Student;

@WebServlet("/InterviewServlet")
public class InterviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ApplicationDAO applicationDAO;

    public void init() {
        applicationDAO = new ApplicationDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("currentStudent") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        Student student = (Student) session.getAttribute("currentStudent");
        
        try {
            // Get only the scheduled interviews
            List<ApplicationDetails> interviewList = applicationDAO.getInterviewsByStudent(student.getId());
            request.setAttribute("interviewList", interviewList);
            
            // Forward to the new JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("/interviews.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error retrieving interviews.", e);
        }
    }
}