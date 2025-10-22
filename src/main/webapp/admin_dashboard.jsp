<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Admin Dashboard</h1>
        
        <c:if test="${not empty sessionScope.currentAdmin}">
            <h4 class="text-center">Welcome, ${sessionScope.currentAdmin.name}!</h4>
        </c:if>
        
        <div class="row mt-4">
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Manage Students</h5>
                        <p class="card-text">View, add, edit, or delete student profiles.</p>
                        <a href="StudentServlet?action=list" class="btn btn-primary">Go to Student Management</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">Manage Companies</h5>
                        <p class="card-text">Approve, view, or manage registered companies.</p>
                        <a href="CompanyServlet?action=list" class="btn btn-info">Go to Company Management</a>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card text-center">
                    <div class="card-body">
                        <h5 class="card-title">System Reports</h5>
                        <p class="card-text">View placement statistics and data analysis.</p>
                        <a href="#" class="btn btn-secondary">View Reports</a>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="text-center mt-5">
            <a href="LogoutServlet" class="btn btn-danger">Logout</a>
        </div>
    </div>
</body>
</html>