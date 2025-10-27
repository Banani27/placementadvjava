<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Posted Jobs</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
<h2 class="text-center mb-4">My Job Openings</h2>

<c:if test="${not empty sessionScope.successMessage}">
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <strong>Success!</strong> ${sessionScope.successMessage}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <c:remove var="successMessage" scope="session"/>
</c:if>

<div class="text-start mb-4">
    <a href="job_post.jsp" class="btn btn-success me-2">+ Post New Job</a>
    <a href="company_dashboard.jsp" class="btn btn-outline-primary">← Back to Dashboard</a>
</div>

<c:choose>
    <c:when test="${not empty companyJobs}">
        <div class="table-responsive">
            <table class="table table-striped table-hover table-bordered align-middle">
                <thead class="table-dark text-center">
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Req. CGPA</th>
                        <th>Salary (LPA)</th>
                        <th>Posted On</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="job" items="${companyJobs}">
                        <tr>
                            <td>${job.id}</td>
                            <td><a href="#">${job.title}</a></td>
                            <td>${job.description}</td>
                            <td class="text-center fw-bold">${job.requiredCgpa}</td>
                            <td class="text-center">
                                <fmt:formatNumber value="${job.salaryPackage}" type="number" maxFractionDigits="2"/> 
                            </td>
                            <td>
                                <fmt:formatDate value="${job.postingDate}" pattern="dd MMM yyyy"/>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:when>

    <c:otherwise>
        <div class="alert alert-info text-center mt-5 p-4 border rounded shadow-sm">
            <p class="fs-5 mb-0">You have no active job postings.</p>
            <p>Click the button above to post your first job!</p>
        </div>
    </c:otherwise>
</c:choose>

<!-- Needed for Bootstrap Alert Dismiss functionality -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


</div>
</body>
</html>