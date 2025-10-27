package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.StudentDAO;
import model.Student;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO;

    public void init() {
        studentDAO = new StudentDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Check if the user is an Admin (basic security check)
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("adminUser") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        // 2. Determine the action
        String action = request.getParameter("action");
        if (action == null) {
            action = "list"; // Default action for Admin view
        }

        try {
            switch (action) {
                case "delete":
                    // Redirect to dedicated servlet
                    response.sendRedirect(request.getContextPath() + "/DeleteServlet?type=student&id=" + request.getParameter("id"));
                    break;
                case "edit":
                    // Redirect to UpdateServlet to display the edit form
                    response.sendRedirect(request.getContextPath() + "/UpdateServlet?type=student&id=" + request.getParameter("id"));
                    break;
                case "add_form":
                    // NEW ACTION: Show the form for adding a student (manual or import)
                    showAddForm(request, response);
                    break;
                case "list":
                default:
                    listStudents(request, response);
                    break;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing the request: " + ex.getMessage());
            
            // Try to send them back to the list view even on failure
            try {
                listStudents(request, response);
            } catch (SQLException e) {
                // If listing fails too, just log it.
                e.printStackTrace();
            }
        }
    }
    
    // --- POST requests for updates are handled by specific servlets ---
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }

    // Method to handle forwarding to the student_add.jsp page
    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/student_add.jsp");
        dispatcher.forward(request, response);
    }


    // Method to fetch and display the list of all students for the Admin
    private void listStudents(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        
        // Fetch all students from the database
        List<Student> listStudents = studentDAO.getAllStudents(); 
        
        // Set the list as a request attribute
        request.setAttribute("listStudents", listStudents);
        
        // Forward to the Admin management view (student_list.jsp)
        RequestDispatcher dispatcher = request.getRequestDispatcher("/student_list.jsp");
        dispatcher.forward(request, response);
    }
}



