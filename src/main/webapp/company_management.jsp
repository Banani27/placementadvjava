<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Company Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Company Management</h2>
        <a href="CompanyServlet?action=showAddForm" class="btn btn-primary mb-3">Add New Company</a>
        <a href="admin_dashboard.jsp" class="btn btn-secondary mb-3">Back to Dashboard</a>

        <c:if test="${not empty requestScope.message}">
            <div class="alert alert-success">${requestScope.message}</div>
        </c:if>

        <c:choose>
            <c:when test="${not empty requestScope.companyList}">
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>HR Email</th>
                            <th>Address</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="company" items="${requestScope.companyList}">
                            <tr>
                                <td>${company.id}</td>
                                <td>${company.name}</td>
                                <td>${company.hrEmail}</td>
                                <td>${company.address}</td>
                                <td>
                                    <a href="CompanyServlet?action=edit&id=${company.id}" class="btn btn-sm btn-warning">Edit</a>
                                    <a href="CompanyServlet?action=delete&id=${company.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this company?');">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="alert alert-info">No companies found in the system.</div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
