<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - Student Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>Student Management</h2>
        <a href="StudentServlet?action=showAddForm" class="btn btn-primary mb-3">Add New Student</a>
        <a href="admin_dashboard.jsp" class="btn btn-secondary mb-3">Back to Dashboard</a>
        
        <c:if test="${not empty requestScope.message}">
            <div class="alert alert-success">${requestScope.message}</div>
        </c:if>

        <c:choose>
            <c:when test="${not empty requestScope.studentList}">
                <table class="table table-bordered table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Branch</th>
                            <th>CGPA</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="student" items="${requestScope.studentList}">
                            <tr>
                                <td>${student.id}</td>
                                <td>${student.name}</td>
                                <td>${student.email}</td>
                                <td>${student.branch}</td>
                                <td>${student.cgpa}</td>
                                <td>
                                    <a href="StudentServlet?action=edit&id=${student.id}" class="btn btn-sm btn-warning">Edit</a>
                                    <a href="StudentServlet?action=delete&id=${student.id}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this student?');">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="alert alert-info">No students found in the system.</div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>