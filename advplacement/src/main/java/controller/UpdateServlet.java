package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// NOTE: This servlet requires implementation of getStudentById/getCompanyById methods in DAOs
// and the corresponding update methods (updateStudent/updateCompany).

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Handles GET requests to display the edit form
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Security Check
        if (request.getSession().getAttribute("adminId") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String type = request.getParameter("type");
        String idParam = request.getParameter("id");
        
        // In a real application, you would fetch the existing record (Student/Company)
        // using the ID and set it as a request attribute.
        // For now, we only forward to a placeholder update form.
        
        if ("student".equalsIgnoreCase(type)) {
            // Student student = studentDAO.getStudentById(id);
            // request.setAttribute("record", student);
            request.getRequestDispatcher("/update.jsp").forward(request, response);
        } else if ("company".equalsIgnoreCase(type)) {
            // Company company = companyDAO.getCompanyById(id);
            // request.setAttribute("record", company);
            request.getRequestDispatcher("/update.jsp").forward(request, response);
        } else {
            response.sendRedirect("admin_dashboard.jsp");
        }
    }

    // Handles POST requests to save the update
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Security Check
        if (request.getSession().getAttribute("adminId") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String type = request.getParameter("type");
        
        // In a real application, you would extract all form fields,
        // create a Model object, and call studentDAO.updateStudent(student) 
        // or companyDAO.updateCompany(company).

        try {
            if ("student".equalsIgnoreCase(type)) {
                // ... update logic here ...
                response.sendRedirect("StudentServlet?action=list");
            } else if ("company".equalsIgnoreCase(type)) {
                // ... update logic here ...
                response.sendRedirect("CompanyServlet?action=list");
            } else {
                response.sendRedirect("admin_dashboard.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Update failed: " + e.getMessage());
            request.getRequestDispatcher("/update.jsp").forward(request, response);
        }
    }
}
