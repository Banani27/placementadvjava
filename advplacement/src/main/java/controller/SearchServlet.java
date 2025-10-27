package controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// NOTE: This servlet needs DAO methods for custom searching (e.g., searchStudentsByName)

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Security Check
        if (request.getSession().getAttribute("adminId") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        String type = request.getParameter("type");
        String query = request.getParameter("query");

        if (type == null || query == null) {
            // Just display the search form if no parameters are given
            request.getRequestDispatcher("/search.jsp").forward(request, response);
            return;
        }

        List<?> results = Collections.emptyList();
        String title = "Search Results";

        try {
            if ("student".equalsIgnoreCase(type)) {
                // results = studentDAO.searchStudentsByName(query); 
                title = "Student Search Results";
            } else if ("company".equalsIgnoreCase(type)) {
                // results = companyDAO.searchCompaniesByName(query);
                title = "Company Search Results";
            }
            
            request.setAttribute("searchResults", results);
            request.setAttribute("searchTitle", title);
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Search failed: " + e.getMessage());
        }
        
        request.getRequestDispatcher("/search.jsp").forward(request, response);
    }
}

