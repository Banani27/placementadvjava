<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- CORRECTION 1: ADD JSTL TAGLIB DECLARATION 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Student Dashboard</h1>
        
        <c:if test="${not empty sessionScope.currentStudent}">
            <h4 class="text-center">Welcome, ${sessionScope.currentStudent.name}!</h4>
            <p class="text-center">Your CGPA: ${sessionScope.currentStudent.cgpa}</p>
        </c:if>
        
        <hr>
        <h3>Available Job Postings (Based on Eligibility)</h3>
        
        <c:choose>
            <c:when test="${not empty requestScope.jobList}">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Company ID</th> <%-- Temporarily show ID as company name needs another DAO call --%>
                            <th>Role/Title</th>
                            <th>Package (LPA)</th>
                            <th>Min. CGPA</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="job" items="${requestScope.jobList}">
                            <tr>
                                <td>${job.companyId}</td> <%-- CORRECTION 2: Use companyId --%>
                                <td>${job.title}</td>      <%-- CORRECTION 3: Use title (not role) --%>
                                <td>${job.salaryPackage}</td> <%-- CORRECTION 4: Use salaryPackage (not package) --%>
                                <td>${job.requiredCgpa}</td>  <%-- CORRECTION 5: Use requiredCgpa (not minCgpa) --%>
                                <td><a href="ApplyServlet?jobId=${job.id}" class="btn btn-sm btn-success">Apply</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="alert alert-info">No job postings available matching your criteria yet.</div>
            </c:otherwise>
        </c:choose>
        
        <div class="text-center mt-5">
            <a href="LogoutServlet" class="btn btn-danger">Logout</a>
        </div>
    </div>
</body>
</html>