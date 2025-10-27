package controller;

import java.io.IOException;
import java.io.InputStream;
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

import dao.StudentDAO;
import model.Student;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10,      // 10MB
maxRequestSize = 1024 * 1024 * 50)   // 50MB
@WebServlet("/StudentImportServlet")
public class StudentImportServlet extends HttpServlet {
private static final long serialVersionUID = 1L;

// NOTE: Replace with the fully qualified imports once you set up the DAOs and Models
// import com.pms.dao.StudentDAO;
// import com.pms.model.Student;

protected void doPost(HttpServletRequest request, HttpServletResponse response) 
throws ServletException, IOException {

// 1. Initial Security and Setup Check
if (request.getSession(false) == null || request.getSession().getAttribute("adminUser") == null) {
response.sendRedirect(request.getContextPath() + "/index.jsp");
return;
}

String successMessage = null;
String errorMessage = null;

try {
// Get the file part from the request (name='excelFile' from student_add.jsp)
Part filePart = request.getPart("excelFile");
String fileName = filePart.getSubmittedFileName();

if (fileName == null || fileName.isEmpty() || !fileName.endsWith(".xlsx")) {
errorMessage = "Invalid file selected. Please upload a .xlsx file.";
} else {

// 2. Process the file stream
InputStream fileContent = filePart.getInputStream();

// --- INTEGRATION POINT: Replace this dummy logic with Apache POI code ---

// DUMMY IMPLEMENTATION: Simulate reading 2 students
List<Student> studentsToInsert = new ArrayList<>();
studentsToInsert.add(new Student("Test Student 1", "R1001", "CSE", 8.5, "s1@pms.com", "pass123"));
studentsToInsert.add(new Student("Test Student 2", "R1002", "ECE", 7.9, "s2@pms.com", "pass123"));

// IMPORTANT: REAL IMPLEMENTATION REQUIRES APACHE POI LIBRARY HERE
/*
try (Workbook workbook = new XSSFWorkbook(fileContent)) {
   Sheet sheet = workbook.getSheetAt(0);
   for (Row row : sheet) {
       if (row.getRowNum() == 0) continue; // Skip header row

       // Get cell values based on expected column order
       String name = row.getCell(0).getStringCellValue();
       String rollNo = row.getCell(1).getStringCellValue();
       String branch = row.getCell(2).getStringCellValue();
       double cgpa = row.getCell(3).getNumericCellValue(); 
       String email = row.getCell(4).getStringCellValue();
       String password = row.getCell(5).getStringCellValue();
       
       studentsToInsert.add(new com.pms.model.Student(name, rollNo, branch, cgpa, email, password));
   }
}
*/
// --- END INTEGRATION POINT ---

// 3. Insert into database using batch operation
if (!studentsToInsert.isEmpty()) {
   StudentDAO studentDAO = new StudentDAO();
   int count = studentDAO.batchInsertStudents(studentsToInsert);
   successMessage = "Successfully imported " + count + " student records.";
} else {
   errorMessage = "The Excel file contained no valid student data.";
}
}
} catch (SQLException e) {
e.printStackTrace();
errorMessage = "Database Error during import: " + e.getMessage();
} catch (Exception e) {
e.printStackTrace();
errorMessage = "File Processing Error: " + e.getMessage();
}

// 4. Redirect/Forward back to the add form with status messages
if (errorMessage != null) {
request.setAttribute("errorMessage", errorMessage);
} else {
request.setAttribute("successMessage", successMessage);
}

// Forward back to the form so Admin can see the status
request.getRequestDispatcher("/student_add.jsp").forward(request, response);
}
}
