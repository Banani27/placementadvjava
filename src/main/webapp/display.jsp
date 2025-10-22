<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${requestScope.pageTitle} | PMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2>${requestScope.pageTitle}</h2>
        
        <a href="${requestScope.backLink}" class="btn btn-secondary mb-3">Back</a>

        <c:if test="${not empty requestScope.message}">
            <div class="alert alert-success">${requestScope.message}</div>
        </c:if>

        <c:choose>
            <c:when test="${not empty requestScope.itemList}">
                <table class="table table-striped">
                    <thead class="table-info">
                        <tr>
                            <c:forEach var="header" items="${requestScope.headers}">
                                <th>${header}</th>
                            </c:forEach>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${requestScope.itemList}">
                            <tr>
                                <td>${item.id}</td>
                                <td>${item.name}</td>
                                <td>...</td>
                                <td><a href="SpecificServlet?action=view&id=${item.id}" class="btn btn-sm btn-primary">Details</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="alert alert-info">No items to display for ${requestScope.pageTitle}.</div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>