<%@ page language="java" contentType="text:html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Company HR Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Company HR Registration</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } %>
                
                <form action="CompanyRegistrationServlet" method="post">
                    <div class="mb-3">
                        <label for="companyName" class="form-label">Company Name</label>
                        <input type="text" class="form-control" id="companyName" name="name" required>
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
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    
                    <button type="submit" class="btn btn-success w-100">Register Company</button>
                </form>
                <p class="mt-3 text-center"><a href="index.jsp">Back to Login</a></p>
            </div>
        </div>
    </div>
</body>
</html>