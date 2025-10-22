package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.StudentDAO;
import model.Student;
@WebServlet("/StudentLoginServlet")
public class StudentLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO = new StudentDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String rollNo = request.getParameter("username"); // Using rollNo as username
        String password = request.getParameter("password");

        try {
            // 1. Validate login using the DAO
            Student student = studentDAO.validateLogin(rollNo, password);
            
            if (student != null) {
                // 2. SUCCESS: Store key data in session
                HttpSession session = request.getSession();
                
                // CRITICAL FIX: Store the Student object as 'currentStudent'
                session.setAttribute("currentStudent", student); 
                
                // The other attributes are redundant but harmless:
                session.setAttribute("currentStudent", student); 
                session.setAttribute("studentName", student.getName());
                session.setAttribute("studentRollNo", rollNo);
                
                // 3. Redirect to the dashboard controller
                response.sendRedirect(request.getContextPath() + "/StudentDashboardController");
            } else {
                // FAILURE
                request.setAttribute("errorMessage", "Invalid Roll Number or Password.");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred during student login.");
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}
