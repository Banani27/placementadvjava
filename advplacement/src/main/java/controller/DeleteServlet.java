package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CompanyDAO;
import dao.StudentDAO;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO = new StudentDAO();
    private CompanyDAO companyDAO = new CompanyDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Security Check
        if (request.getSession().getAttribute("adminId") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String type = request.getParameter("type");
        String idParam = request.getParameter("id");
        
        if (type == null || idParam == null) {
            response.sendRedirect("admin_dashboard.jsp");
            return;
        }

        int id = 0;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("admin_dashboard.jsp");
            return;
        }

        boolean success = false;
        String redirectUrl = "admin_dashboard.jsp";

        try {
            if ("student".equalsIgnoreCase(type)) {
                success = studentDAO.deleteStudent(id);
                redirectUrl = "StudentServlet?action=list";
            } else if ("company".equalsIgnoreCase(type)) {
                success = companyDAO.deleteCompany(id);
                redirectUrl = "CompanyServlet?action=list";
            }
            
            if (success) {
                response.sendRedirect(redirectUrl);
            } else {
                request.setAttribute("errorMessage", "Deletion failed or record not found.");
                request.getRequestDispatcher("/admin_dashboard.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error during deletion: " + e.getMessage());
            request.getRequestDispatcher("/admin_dashboard.jsp").forward(request, response);
        }
    }
}
