package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AdminDAO;
import model.Admin;


@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO = new AdminDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Admin admin = adminDAO.validateLogin(username, password);

            if (admin != null) {
                HttpSession session = request.getSession();
                session.setAttribute("adminUser", admin.getUsername());
                session.setAttribute("adminId", admin.getId());
                
                // CORRECTION: Use getContextPath() for proper server-relative path
                response.sendRedirect(request.getContextPath() + "/admin_dashboard.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid Admin Username or Password.");
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace(); 
            request.setAttribute("errorMessage", "An internal error occurred during login: " + e.getMessage());
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }
}