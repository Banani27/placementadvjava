<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Applications</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        gray: {
                            50: '#f9fafb',
                            100: '#f3f4f6',
                            200: '#e5e7eb',
                            300: '#d1d5db',
                            400: '#9ca3af',
                            500: '#6b7280',
                            600: '#4b5563',
                            700: '#374151',
                            800: '#1f2937',
                            900: '#111827',
                        },
                        'sidebar-dark': '#1f2937'
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-gray-50 flex font-sans">

    <aside class="w-64 bg-sidebar-dark text-gray-300 min-h-screen p-6 flex flex-col">
        <h1 class="text-2xl font-bold text-white mb-10">PlacePro</h1>
        <nav class="flex-grow space-y-2">
            <a href="StudentDashboardController" class="flex items-center space-x-3 px-4 py-3 hover:bg-gray-700 hover:text-white rounded-lg transition-colors">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" ...></svg>
                <span class="font-medium">Dashboard</span>
            </a>

            <a href="ApplicationListServlet" class="flex items-center space-x-3 px-4 py-3 bg-blue-600 text-white rounded-lg">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" ...></svg>
                <span>Applications</span>
            </a>
            <a href="InterviewServlet" class="flex items-center space-x-3 px-4 py-3 hover:bg-gray-700 hover:text-white rounded-lg transition-colors">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" ...></svg>
                <span>Interviews</span>
            </a>
            <a href="#" class="flex items-center space-x-3 px-4 py-3 hover:bg-gray-700 hover:text-white rounded-lg transition-colors">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" ...></svg>
                <span>Profile</span>
            </a>
            <a href="#" class="flex items-center space-x-3 px-4 py-3 hover:bg-gray-700 hover:text-white rounded-lg transition-colors">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" ...></svg>
                <span>Documents</span>
            </a>
        </nav>
    </aside>

    <div class="flex-1">
        
        <header class="bg-white shadow-sm border-b border-gray-200">
            <div class="max-w-7xl mx-auto py-5 px-4 sm:px-6 lg:px-8 flex justify-between items-center">
                <div>
                    <c:if test="${not empty sessionScope.currentStudent}">
                        <h1 class="text-2xl font-bold text-gray-900">Welcome, ${sessionScope.currentStudent.name}!</h1>
                        <p class="text-sm text-gray-500">Your CGPA: ${sessionScope.currentStudent.cgpa}</p>
                    </c:if>
                </div>
                <a href="LogoutServlet" class="inline-flex items-center px-4 py-2 ... bg-red-600 ...">
                    Logout
                </a>
            </div>
        </header>

        <main class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
            
            <h2 class="text-2xl font-semibold text-gray-900 mb-6">My Applications</h2>

            <div class="bg-white shadow-lg rounded-xl border border-gray-200 overflow-hidden">
                <table class="min-w-full divide-y divide-gray-200">
                    <thead class="bg-gray-50">
                        <tr>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Company</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Job Title</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date Applied</th>
                            <th scope="col" class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Status</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        
                        <c:choose>
                            <c:when test="${not empty applicationList}">
                                <c:forEach var="app" items="${applicationList}">
                                    <tr>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${app.companyName}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">${app.jobTitle}</td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-700">
                                            <fmt:formatDate value="${app.applicationDate}" pattern="dd MMM yyyy"/>
                                        </td>
                                        <td class="px-6 py-4 whitespace-nowrap text-sm font-medium">
                                            <c:choose>
                                                <c:when test="${app.status == 'Interview Scheduled'}">
                                                    <span class="px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-blue-100 text-blue-800">
                                                        ${app.status}
                                                    </span>
                                                </c:when>
                                                <c:when test="${app.status == 'Rejected'}">
                                                    <span class="px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-red-100 text-red-800">
                                                        ${app.status}
                                                    </span>
                                                </c:when>
                                                <c:otherwise>
                                                     <span class="px-3 py-1 inline-flex text-xs leading-5 font-semibold rounded-full bg-gray-100 text-gray-800">
                                                        ${app.status}
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="4" class="px-6 py-4 text-center text-gray-500">
                                        You have not applied for any jobs yet.
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