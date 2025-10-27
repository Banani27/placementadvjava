<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Interviews</title>
    <script src="https://cdn.tailwindcss.com"></script>
    </head>
<body class="bg-gray-50 flex font-sans">

    <div class="flex-1">
        
        <main class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
            
            <h2 class="text-2xl font-semibold text-gray-900 mb-6">My Scheduled Interviews</h2>

            <div class="bg-white shadow-lg rounded-xl border border-gray-200 overflow-hidden">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Company</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Job Title</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Interview Date & Time</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Details / Location</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <c:choose>
                            <c:when test="${not empty requestScope.interviewList}">
                                <c:forEach var="interview" items="${requestScope.interviewList}">
                                    <tr>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${interview.companyName}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">${interview.jobTitle}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                                            <fmt:formatDate value="${interview.interviewDate}" pattern="dd MMM yyyy, hh:mm a"/>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">${interview.interviewDetails}</td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="4" class="px-6 py-4 text-center text-gray-500">
                                        You have no interviews scheduled yet.
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>

        </main>
    </div>
</body>
</html>