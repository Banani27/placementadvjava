<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="en">
<head>
<meta charset="UTF-8">
<title>Post New Job</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
<h2 class="text-center mb-4">Post a New Job Opening</h2>

<c:if test="${not empty errorMessage}">
    <div class="alert alert-danger">${errorMessage}</div>
</c:if>

<form action="JobPostServlet" method="post" class="border p-4 rounded shadow-lg bg-light">
    <input type="hidden" name="action" value="insert">
    
    <%-- 
      HERE IS THE CHANGE:
      We are now adding the companyId from the session as a hidden form field.
      This is the "normal" (and insecure) way you asked for.
    --%>
    <input type="hidden" name="companyId" value="${sessionScope.companyId}">

    <div class="mb-3">
        <label for="title" class="form-label fw-bold">Job Title</label>
        <input type="text" id="title" name="title" class="form-control" required placeholder="e.g., Software Development Engineer">
    </div>

    <div class="mb-3">
        <label for="description" class="form-label fw-bold">Job Description</label>
        <textarea id="description" name="description" rows="5" class="form-control" required placeholder="Detailed responsibilities and requirements..."></textarea>
    </div>

    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="requiredCgpa" class="form-label fw-bold">Required CGPA (out of 10)</label>
            <input type="number" id="requiredCgpa" name="requiredCgpa" step="0.01" min="0" max="10" class="form-control" required placeholder="e.g., 8.00">
        </div>

        <div class="col-md-6 mb-3">
            <label for="salaryPackage" class="form-label fw-bold">Salary Package (in LPA)</label>
            <input type="number" id="salaryPackage" name="salaryPackage" step="0.1" min="0" class="form-control" required placeholder="e.g., 12.5">
        </div>
    </div>
    

    <div class="text-center mt-4">
        <button type="submit" class="btn btn-primary btn-lg px-5 me-3">Post Job</button>
        <a href="company_jobs.jsp" class="btn btn-secondary btn-lg px-5">Cancel / View Jobs</a>
    </div>
</form>

<div class="text-center mt-5">
    <a href="company_dashboard.jsp" class="btn btn-outline-dark">← Back to Dashboard</a>
</div>


</div>
</body>
</html>