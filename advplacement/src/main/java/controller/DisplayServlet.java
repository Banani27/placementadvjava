package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.StudentDAO;
import dao.CompanyDAO;

@WebServlet("/DisplayServlet")
public class DisplayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentDAO studentDAO = new StudentDAO();
    private CompanyDAO companyDAO = new CompanyDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String type = request.getParameter("type"); // e.g., "students" or "companies"
        
        try {
            if ("students".equalsIgnoreCase(type)) {
                request.setAttribute("listData", studentDAO.getAllStudents());
                request.setAttribute("dataType", "Students");
                request.getRequestDispatcher("/display.jsp").forward(request, response);
                
            } else if ("companies".equalsIgnoreCase(type)) {
                request.setAttribute("listData", companyDAO.getAllCompanies());
                request.setAttribute("dataType", "Companies");
                request.getRequestDispatcher("/display.jsp").forward(request, response);
                
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid display type.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error retrieving data.");
        }
    }
}

