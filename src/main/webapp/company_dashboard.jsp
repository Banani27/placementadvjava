<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Company Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Company Dashboard</h1>
        
        <c:if test="${not empty sessionScope.currentCompany}">
            <h4 class="text-center">Welcome, ${sessionScope.currentCompany.name} HR!</h4>
        </c:if>
        
        <hr>
        <h3>Eligible Students for Your Openings</h3>
        
        <c:choose>
            <c:when test="${not empty requestScope.eligibleStudents}">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Student Name</th>
                            <th>Branch</th>
                            <th>CGPA</th>
                            <th>Email</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="student" items="${requestScope.eligibleStudents}">
                            <tr>
                                <td>${student.name}</td>
                                <td>${student.branch}</td>
                                <td>${student.cgpa}</td>
                                <td>${student.email}</td>
                                <td><a href="InviteServlet?studentId=${student.id}" class="btn btn-sm btn-primary">Invite for Interview</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="alert alert-info">No students currently meet the eligibility criteria for your listed jobs.</div>
            </c:otherwise>
        </c:choose>
        
        <h3 class="mt-5">Manage Job Openings</h3>
        <a href="JobPostServlet?action=add" class="btn btn-success">Post New Job</a>
        <a href="JobPostServlet?action=list" class="btn btn-secondary">View My Jobs</a>
        
        <div class="text-center mt-5">
            <a href="LogoutServlet" class="btn btn-danger">Logout</a>
        </div>
    </div>
</body>
</html>