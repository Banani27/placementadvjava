package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import dao.ApplicationDAO;
import model.Application; // Use your existing Application model
import model.Student;

@WebServlet("/ApplicationListServlet")
public class ApplicationListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ApplicationDAO applicationDAO;

    public void init() {
        applicationDAO = new ApplicationDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // 1. Check if student is logged in (using the correct session attribute)
        HttpSession session = request.getSession(false);
        Student student = (session != null) ? (Student) session.getAttribute("currentStudent") : null;

        if (student == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        try {
            // 2. Get the list of applications using your existing DAO method
            List<Application> applicationList = applicationDAO.getApplicationsByStudentId(student.getId());
            
            // 3. Set the list as an attribute for the JSP
            request.setAttribute("applicationList", applicationList);
            
            // 4. Forward to the new JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher("/applications.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            // Handle database errors
            throw new ServletException("Database error retrieving applications.", e);
        }
    }
}