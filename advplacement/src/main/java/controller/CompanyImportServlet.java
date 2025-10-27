package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.CompanyDAO;
import model.Company;

/**
 * Handles the upload and parsing of a CSV file for batch insertion of Company records.
 */
@WebServlet("/CompanyImportServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class CompanyImportServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CompanyDAO companyDAO;

    public void init() {
        companyDAO = new CompanyDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Initial Security Check
        if (request.getSession(false) == null || request.getSession(false).getAttribute("adminUser") == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }

        Part filePart = request.getPart("excelFile"); // 'excelFile' is the name of the input field in company_add.jsp (now CSV)
        String message = "";
        
        if (filePart == null || filePart.getSize() == 0) {
            message = "Error: No file uploaded.";
            request.setAttribute("errorMessage", message);
            request.getRequestDispatcher("/company_add.jsp").forward(request, response);
            return;
        }

        try (InputStream fileContent = filePart.getInputStream()) {
            
            // Parse CSV instead of Excel
            List<Company> companies = parseCSVFile(fileContent);
            int importedCount = 0;
            
            if (!companies.isEmpty()) {
                // Use the new batch insertion method
                importedCount = companyDAO.batchInsertCompanies(companies);
            }
            
            if (importedCount > 0) {
                message = "Success! " + importedCount + " company records imported successfully.";
                request.setAttribute("successMessage", message);
            } else {
                message = "Import successful, but no valid records were found in the file or inserted. Check file format.";
                request.setAttribute("errorMessage", message);
            }

        } catch (SQLException e) {
            // Handle database errors (e.g., integrity constraint violations, duplicate keys)
            message = "Database Error during batch insert: " + e.getMessage();
            e.printStackTrace();
            request.setAttribute("errorMessage", message);
        } catch (Exception e) {
            // Handle file processing or general errors
            message = "File Processing Error: " + e.getMessage();
            e.printStackTrace();
            request.setAttribute("errorMessage", message);
        }

        // Redirect back to the Add form to show the status message
        request.getRequestDispatcher("/company_add.jsp").forward(request, response);
    }

    /**
     * Parses the CSV file content line by line.
     * Assumes column order: Name, Industry, HR_Email, Contact_Person, Password
     */
    private List<Company> parseCSVFile(InputStream inputStream) throws Exception {
        List<Company> companies = new ArrayList<>();
        
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
            String line;
            
            // 1. Skip header line
            if (reader.readLine() == null) return companies;

            // 2. Process data lines
            while ((line = reader.readLine()) != null) {
                // Split by comma. Be careful with complex fields containing commas!
                String[] fields = line.split(",", -1); 
                
                if (fields.length < 5) continue; // Skip incomplete lines

                // Map fields to variables
                String name = fields[0].trim();
                String industry = fields[1].trim();
                String hrEmail = fields[2].trim();
                String contactPerson = fields[3].trim();
                String password = fields[4].trim(); 

                // Simple validation: ensure crucial fields are present
                if (!name.isEmpty() && !hrEmail.isEmpty() && !password.isEmpty()) {
                    companies.add(new Company(name, industry, hrEmail, contactPerson, password));
                }
            }
        }
        return companies;
    }
}
