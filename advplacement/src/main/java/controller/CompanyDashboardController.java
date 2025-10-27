package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDAO;
import model.Student;

@WebServlet("/CompanyDashboardController")
public class CompanyDashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO = new StudentDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Check session
        if (request.getSession().getAttribute("companyUser") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        try {
            // 2. Fetch ALL Student details for the company (as requested)
            List<Student> listStudent = studentDAO.getAllStudents();
            request.setAttribute("listStudent", listStudent);
            
            // 3. Forward to the dashboard view
            request.getRequestDispatcher("/company_dashboard.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Could not load student list.");
            request.getRequestDispatcher("/company_dashboard.jsp").forward(request, response);
        }
    }
}

