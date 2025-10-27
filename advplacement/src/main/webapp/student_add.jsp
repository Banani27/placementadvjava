<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - Add Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .nav-link.active {
            font-weight: bold;
            border-bottom: 3px solid #0d6efd;
        }
        .error-message {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2>Add New Student Records</h2>
            <a href="StudentServlet?action=list" class="btn btn-secondary">Back to Management</a>
        </div>

        <c:if test="${not empty requestScope.errorMessage}">
            <div class="alert alert-danger" role="alert">
                ${requestScope.errorMessage}
            </div>
        </c:if>
        <c:if test="${not empty requestScope.successMessage}">
            <div class="alert alert-success" role="alert">
                ${requestScope.successMessage}
            </div>
        </c:if>

        <ul class="nav nav-tabs" id="studentAddTabs" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="manual-tab" data-bs-toggle="tab" data-bs-target="#manual" type="button" role="tab" aria-controls="manual" aria-selected="true">Manual Entry</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="import-tab" data-bs-toggle="tab" data-bs-target="#import" type="button" role="tab" aria-controls="import" aria-selected="false">Excel Import</button>
            </li>
        </ul>

        <div class="tab-content border border-top-0 p-4">
            
            <!-- Manual Entry Tab -->
            <div class="tab-pane fade show active" id="manual" role="tabpanel" aria-labelledby="manual-tab">
                <h4 class="mb-3">Add Single Student</h4>
                
                <!-- NOTE: This form posts to the registration servlet -->
                <form action="StudentRegistrationServlet" method="post">
                    
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>
                        <div class="col-md-6">
                            <label for="rollNo" class="form-label">Roll Number (Username)</label>
                            <input type="text" class="form-control" id="rollNo" name="rollNo" required>
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="col-md-6">
                            <label for="password" class="form-label">Default Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="col-md-6">
                            <label for="branch" class="form-label">Branch</label>
                            <input type="text" class="form-control" id="branch" name="branch" required>
                        </div>
                        <div class="col-md-6">
                            <label for="cgpa" class="form-label">CGPA (e.g., 8.5)</label>
                            <input type="number" step="0.01" class="form-control" id="cgpa" name="cgpa" min="0" max="10" required>
                        </div>
                    </div>
                    
                    <button type="submit" class="btn btn-primary mt-4 w-100">Add Student to Database</button>
                </form>
            </div>

            <!-- Excel Import Tab -->
            <div class="tab-pane fade" id="import" role="tabpanel" aria-labelledby="import-tab">
                <h4 class="mb-3">Import Multiple Students via Excel (.xlsx)</h4>
                <p class="text-muted">Upload an Excel file with columns in the following order: **Name, Roll_No, Branch, CGPA, Email, Password**.</p>
                
                <!-- NOTE: This form posts to the dedicated import servlet -->
                <form action="StudentImportServlet" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="excelFile" class="form-label">Select Excel File (.xlsx)</label>
                        <input class="form-control" type="file" id="excelFile" name="excelFile" accept=".xlsx" required>
                    </div>
                    
                    <button type="submit" class="btn btn-success mt-3 w-100">Upload and Import Students</button>
                </form>
            </div>
            
        </div>
    </div>
</body>
</html>