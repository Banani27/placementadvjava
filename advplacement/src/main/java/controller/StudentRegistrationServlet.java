package controller;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDAO;
import model.Student;

@WebServlet("/StudentRegistrationServlet")
public class StudentRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO = new StudentDAO();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/student_register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String rollNo = request.getParameter("rollNo");
        String branch = request.getParameter("branch");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        double cgpa = 0.0;
        try {
            cgpa = Double.parseDouble(request.getParameter("cgpa"));
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid CGPA format.");
            request.getRequestDispatcher("/student_register.jsp").forward(request, response);
            return;
        }

        Student newStudent = new Student(name, rollNo, branch, cgpa, email, password);
        
        try {
            studentDAO.insertStudent(newStudent);
            
            request.setAttribute("successMessage", "Registration successful! You can now log in.");
            request.getRequestDispatcher("/student_register.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            String message = "Registration failed. ";
            if (e.getMessage().contains("already exists")) {
                message += "Roll Number or Email already exists.";
            } else {
                message += "Database error: " + e.getMessage();
            }
            request.setAttribute("errorMessage", message);
            request.getRequestDispatcher("/student_register.jsp").forward(request, response);
        }
    }
}
