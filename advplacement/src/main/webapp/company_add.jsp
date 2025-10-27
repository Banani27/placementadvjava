<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Add New Company</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        .nav-link.active {
            font-weight: bold;
            border-bottom: 3px solid #0d6efd;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Add New Company</h2>
        <a href="CompanyServlet?action=list" class="btn btn-secondary mb-3">Back to Company Management</a>

        <c:if test="${not empty requestScope.errorMessage}">
            <div class="alert alert-danger">${requestScope.errorMessage}</div>
        </c:if>
        <c:if test="${not empty requestScope.successMessage}">
            <div class="alert alert-success">${requestScope.successMessage}</div>
        </c:if>

        <ul class="nav nav-tabs" id="companyTabs" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="manual-tab" data-bs-toggle="tab" data-bs-target="#manual-entry" type="button" role="tab" aria-controls="manual-entry" aria-selected="true">Manual Entry</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="import-tab" data-bs-toggle="tab" data-bs-target="#excel-import" type="button" role="tab" aria-controls="excel-import" aria-selected="false">CSV Import</button>
            </li>
        </ul>

        <div class="tab-content pt-3" id="companyTabsContent">
            
            <!-- Manual Entry Tab -->
            <div class="tab-pane fade show active" id="manual-entry" role="tabpanel" aria-labelledby="manual-tab">
                <h4 class="mb-3">Add Single Company</h4>
                
                <!-- NOTE: Posts to CompanyRegistrationServlet -->
                <form action="CompanyRegistrationServlet" method="post">
                    <div class="mb-3">
                        <label for="name" class="form-label">Company Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="industry" class="form-label">Industry / Sector</label>
                        <input type="text" class="form-control" id="industry" name="industry" required>
                    </div>

                    <div class="mb-3">
                        <label for="contactPerson" class="form-label">HR Contact Name</label>
                        <input type="text" class="form-control" id="contactPerson" name="contactPerson" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="hrEmail" class="form-label">HR Email (Login ID)</label>
                        <input type="email" class="form-control" id="hrEmail" name="hrEmail" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="password" class="form-label">Default Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Add Company Manually</button>
                </form>
            </div>

            <!-- CSV Import Tab -->
            <div class="tab-pane fade" id="excel-import" role="tabpanel" aria-labelledby="import-tab">
                <h4 class="mb-3">Import Multiple Companies via CSV</h4>
                <p class="text-muted">Upload a **CSV** file with columns in the following order: **Name, Industry, HR_Email, Contact_Person, Password**.</p>
                
                <!-- NOTE: Posts to CompanyImportServlet -->
                <form action="CompanyImportServlet" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="excelFile" class="form-label">Select CSV File</label>
                        <input class="form-control" type="file" id="excelFile" name="excelFile" accept=".csv, text/csv" required>
                    </div>
                    <button type="submit" class="btn btn-success">Upload and Import Companies</button>
                </form>
            </div>
        </div>
    </div>
    
</body>
</html>