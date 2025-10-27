<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Company Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #eef2f7; }
        h2 { background-color: #203864; color: white; padding: 15px; }
        .table th { background-color: #1e2833; color: white; }
    </style>
</head>
<body>
    <h2>Company Management</h2>

    <div class="container mt-4">
        <h4>Registered Companies 
          
        </h4>

        <a href="CompanyServlet?action=showAddForm" class="text-primary">
            Add New Company (excel link)
        </a>

        <div class="mt-3">
            <table class="table table-bordered table-striped align-middle">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Industry</th>
                        <th>HR Email</th>
                        <th>Contact Person</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty listCompanies}">
                            <c:forEach var="company" items="${listCompanies}">
                                <tr>
                                    <td>${company.id}</td>
                                    <td>${company.name}</td>
                                    <td>${company.industry}</td>
                                    <td>${company.hrEmail}</td>
                                    <td>${company.contactPerson}</td>
                                    <td>
                                        <a href="CompanyServlet?action=edit&id=${company.id}" class="text-primary">Edit</a> |
                                        <a href="CompanyServlet?action=delete&id=${company.id}" class="text-danger"
                                           onclick="return confirm('Are you sure you want to delete this company?');">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr><td colspan="6" class="text-center text-muted">No companies found.</td></tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
