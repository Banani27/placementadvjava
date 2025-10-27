<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Applicants</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Applicants for Job ID: ${jobId}</h2>

        <c:if test="${not empty applicantList}">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Student Name</th>
                        <th>Applied On</th>
                        <th>Current Status</th>
                        <th>Change Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="app" items="${applicantList}">
                        <tr>
                            <td>${app.studentName}</td>
                            <td><fmt:formatDate value="${app.applicationDate}" pattern="dd MMM yyyy"/></td>
                            <td>${app.status}</td>
                            <td>
                                <form action="UpdateStatusServlet" method="POST" class="d-flex">
                                    <input type="hidden" name="applicationId" value="${app.id}">
                                    <input type="hidden" name="jobId" value="${jobId}"> <select name="newStatus" class="form-select me-2">
                                        <option value="Applied" ${app.status == 'Applied' ? 'selected' : ''}>Applied</option>
                                        <option value="Interview Scheduled" ${app.status == 'Interview Scheduled' ? 'selected' : ''}>Interview Scheduled</option>
                                        <option value="Rejected" ${app.status == 'Rejected' ? 'selected' : ''}>Rejected</option>
                                    </select>
                                    <button type="submit" class="btn btn-primary btn-sm">Update</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        
        <c:if test="${empty applicantList}">
            <div class="alert alert-info">No applicants for this job yet.</div>
        </c:if>

        <a href="JobPostServlet?action=list" class="btn btn-secondary mt-3">Back to My Jobs</a>
    </div>
</body>
</html>