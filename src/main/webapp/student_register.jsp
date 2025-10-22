<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Student Registration / Profile Setup</h2>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <% if (request.getAttribute("errorMessage") != null) { %>
                    <div class="alert alert-danger" role="alert">
                        <%= request.getAttribute("errorMessage") %>
                    </div>
                <% } else if (request.getAttribute("successMessage") != null) { %>
                    <div class="alert alert-success" role="alert">
                        <%= request.getAttribute("successMessage") %>
                    </div>
                <% } %>
                
                <form action="StudentRegistrationServlet" method="post">
                    <div class="mb-3">
                        <label for="studentName" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="studentName" name="name" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="rollNo" class="form-label">Roll Number</label>
                        <input type="text" class="form-control" id="rollNo" name="rollNo" required>
                    </div>

                    <div class="mb-3">
                        <label for="studentEmail" class="form-label">Email (Login ID)</label>
                        <input type="email" class="form-control" id="studentEmail" name="email" required>
                    </div>
                    
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="mb-3">
                        <label for="cgpa" class="form-label">CGPA/Percentage</label>
                        <input type="number" step="0.01" class="form-control" id="cgpa" name="cgpa" required>
                    </div>
                    <div class="mb-3">
                        <label for="branch" class="form-label">Branch/Major</label>
                        <input type="text" class="form-control" id="branch" name="branch" required>
                    </div>
                    <button type="submit" class="btn btn-success w-100">Complete Registration</button>
                </form>
                <p class="mt-3 text-center"><a href="index.jsp">Back to Login</a></p>
            </div>
        </div>
    </div>
</body>
</html>