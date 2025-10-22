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
                    // Delete is handled by a separate DeleteServlet in a robust design, 
                    // but we include the logic here for simplicity if needed.
                    // For now, we redirect deletion requests to the dedicated servlet.
                    response.sendRedirect(request.getContextPath() + "/DeleteServlet?type=student&id=" + request.getParameter("id"));
                    break;
                case "edit":
                    // Redirect to UpdateServlet to display the edit form
                    response.sendRedirect(request.getContextPath() + "/UpdateServlet?type=student&id=" + request.getParameter("id"));
                    break;
                case "list":
                default:
                    listStudents(request, response);
                    break;
            }
        } catch (Exception ex) {
            // Log error and redirect to an error page or list view with a message
            ex.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing the request.");
            try {
				listStudents(request, response);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
    }
    
    // --- POST requests are handled by specific registration/update servlets ---
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
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

