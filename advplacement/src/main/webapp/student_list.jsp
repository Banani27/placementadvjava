<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Manage Students</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #ecf0f1; margin: 0; padding: 0; }
        .header { background-color: #2c3e50; color: white; padding: 20px; display: flex; justify-content: space-between; align-items: center; }
        .header a { color: #f39c12; text-decoration: none; font-weight: bold; }
        .container { padding: 30px 20px; max-width: 1200px; margin: auto; }
        h2 { color: #34495e; margin-bottom: 25px; }
        table { width: 100%; border-collapse: collapse; background: white; box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1); border-radius: 8px; overflow: hidden; }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #3498db; color: white; font-weight: 600; }
        tr:nth-child(even) { background-color: #f9f9f9; }
        .action-link { margin-right: 10px; color: #2980b9; text-decoration: none; }
        .action-link.delete { color: #e74c3c; }
    </style>
</head>
<body>
    <div class="header">
        <h1>Student Management</h1>
        <a href="${pageContext.request.contextPath}/admin_dashboard.jsp">← Back to Dashboard</a>
    </div>

    <div class="container">
        <h2>Registered Students (${listStudents.size()} found)</h2>
        
        <p><a href="StudentServlet?action=add_form" class="btn btn-primary mb-3">Add New Student(excel link)</a></p>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Roll No.</th>
                    <th>Name</th>
                    <th>Branch</th>
                    <th>CGPA</th>
                    <th>Email</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="student" items="${listStudents}">
                    <tr>
                        <td>${student.id}</td>
                        <td>${student.rollNo}</td>
                        <td>${student.name}</td>
                        <td>${student.branch}</td>
                        <td>${student.cgpa}</td>
                        <td>${student.email}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/UpdateServlet?type=student&id=${student.id}" class="action-link">Edit</a>
                            <a href="${pageContext.request.contextPath}/DeleteServlet?type=student&id=${student.id}" class="action-link delete" onclick="return confirm('Confirm deletion of student ${student.rollNo}?')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>