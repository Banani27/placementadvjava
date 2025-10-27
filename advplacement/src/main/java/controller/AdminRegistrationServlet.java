package controller;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdminDAO;
import model.Admin;

@WebServlet("/AdminRegistrationServlet")
public class AdminRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO = new AdminDAO();
    
 // --- NEW: Handle GET requests to display the registration form ---
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/admin_register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Admin newAdmin = new Admin(username, password, name);
        
        try {
            adminDAO.insertAdmin(newAdmin);
            
            request.setAttribute("successMessage", "Admin registration successful! Please log in.");
            request.getRequestDispatcher("/admin_register.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            String message = "Registration failed. ";
            if (e.getMessage().contains("already exists")) {
                message += "Username already taken.";
            } else {
                message += "Database error: " + e.getMessage();
            }
            request.setAttribute("errorMessage", message);
            request.getRequestDispatcher("/admin_register.jsp").forward(request, response);
        }
    }
}
