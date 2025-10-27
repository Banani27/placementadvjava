package controller;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Import JobDAO and Job model
import dao.JobDAO;
import model.Job; 
// Import Student model (Assumed to exist in your model package)
import model.Student; 

@WebServlet("/StudentDashboardController")
public class StudentDashboardController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    // CORRECTION: Use JobDAO, not CompanyDAO
    private JobDAO jobDAO = new JobDAO(); 

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Check session (Security check using the name the JSP uses)
        Object studentObj = request.getSession().getAttribute("currentStudent");
        if (studentObj == null) {
            response.sendRedirect("index.jsp");
            return;
        }
        
        // Retrieve student CGPA for eligibility check
        Student currentStudent = (Student) studentObj;
        double studentCgpa = currentStudent.getCgpa();

        try {
            // 2. Fetch Eligible Jobs
            // CORRECTION: Call the new method to get jobs filtered by CGPA
            List<Job> jobList = jobDAO.getEligibleJobListings(studentCgpa);
            
            // 3. Set the job list using the name the JSP expects
            request.setAttribute("jobList", jobList);
            
            // 4. Forward to the dashboard view
            request.getRequestDispatcher("/student_dashboard.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            // CORRECTION: Log error and forward
            request.setAttribute("errorMessage", "Could not load job postings. Database error.");
            request.getRequestDispatcher("/student_dashboard.jsp").forward(request, response);
        }
    }
}