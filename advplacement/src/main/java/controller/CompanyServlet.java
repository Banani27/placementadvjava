package controller;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.CompanyDAO;
import model.Company;
@WebServlet("/CompanyServlet")
public class CompanyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CompanyDAO companyDAO;

    public void init() {
        companyDAO = new CompanyDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        try {
            switch (action) {
                case "list":
                    listCompanies(request, response);
                    break;
                case "delete":
                    deleteCompany(request, response);
                    break;
                case "showAddForm":
                    showAddForm(request, response);
                    break;
                default:
                    listCompanies(request, response);
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void listCompanies(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Company> listCompanies = companyDAO.getAllCompanies();
        request.setAttribute("listCompanies", listCompanies);
        request.getRequestDispatcher("/company_list.jsp").forward(request, response);
    }

    private void deleteCompany(HttpServletRequest request, HttpServletResponse response)
            throws IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        companyDAO.deleteCompany(id);
        response.sendRedirect("CompanyServlet?action=list");
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/company_add.jsp").forward(request, response);
    }
}

