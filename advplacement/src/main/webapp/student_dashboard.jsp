<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard</title>
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
                        // Sidebar dark blue
                        'sidebar-dark': '#1f2937' // This is slate-800
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
            <a href="StudentDashboardController" class="flex items-center space-x-3 px-4 py-3 bg-blue-600 text-white rounded-lg">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6-4a1 1 0 001-1v-1a1 1 0 10-2 0v1a1 1 0 001 1z"></path></svg>
                <span class="font-medium">Dashboard</span>
            </a>
            <a href="ApplicationListServlet" class="flex items-center space-x-3 px-4 py-3 hover:bg-gray-700 hover:text-white rounded-lg transition-colors">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path></svg>
                <span>Applications</span>
            </a>
            <a href="InterviewServlet" class="flex items-center space-x-3 px-4 py-3 hover:bg-gray-700 hover:text-white rounded-lg transition-colors">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                <span>Interviews</span>
            </a>
            <a href="#" class="flex items-center space-x-3 px-4 py-3 hover:bg-gray-700 hover:text-white rounded-lg transition-colors">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                <span>Profile</span>
            </a>
            <a href="#" class="flex items-center space-x-3 px-4 py-3 hover:bg-gray-700 hover:text-white rounded-lg transition-colors">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 21h10a2 2 0 002-2V9.414a1 1 0 00-.293-.707l-5.414-5.414A1 1 0 0011.586 3H7a2 2 0 00-2 2v14a2 2 0 002 2z"></path></svg>
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
                
                <a href="LogoutServlet" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500">
                    Logout
                </a>
            </div>
        </header>

        <main class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
        
        <c:if test="${not empty sessionScope.successMessage}">
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded-lg relative mb-6" role="alert">
            <span class="block sm:inline">${sessionScope.successMessage}</span>
        </div>
        <c:remove var="successMessage" scope="session"/>
    </c:if>

    <c:if test="${not empty sessionScope.errorMessage}">
        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded-lg relative mb-6" role="alert">
            <span class="block sm:inline">${sessionScope.errorMessage}</span>
        </div>
        <c:remove var="errorMessage" scope="session"/>
    </c:if>
 
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                <div class="bg-white shadow-lg rounded-xl p-6 flex items-center space-x-4">
                    <div class="p-3 bg-blue-100 rounded-full"><svg class="h-6 w-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8"></path></svg></div>
                    <div>
                        <p class="text-sm font-medium text-gray-500">Applications Sent</p>
                        <p class="text-2xl font-semibold text-gray-900">12</p>
                    </div>
                </div>
                <div class="bg-white shadow-lg rounded-xl p-6 flex items-center space-x-4">
                    <div class="p-3 bg-green-100 rounded-full"><svg class="h-6 w-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg></div>
                    <div>
                        <p class="text-sm font-medium text-gray-500">Interview Invites</p>
                        <p class="text-2xl font-semibold text-gray-900">5</p>
                    </div>
                </div>
                <div class="bg-white shadow-lg rounded-xl p-6 flex items-center space-x-4">
                    <div class="p-3 bg-purple-100 rounded-full"><svg class="h-6 w-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path></svg></div>
                    <div>
                        <p class="text-sm font-medium text-gray-500">Profile Views</p>
                        <p class="text-2xl font-semibold text-gray-900">48</p>
                    </div>
                </div>
                <div class="bg-white shadow-lg rounded-xl p-6 flex items-center space-x-4">
                    <div class="p-3 bg-orange-100 rounded-full"><svg class="h-6 w-6 text-orange-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.871 4A17.926 17.926 0 0112 2c4.23 0 8.01 1.437 11.129 3.73M4.871 4A17.926 17.926 0 001 11.23C1 16.094 5.477 20 12 20s11-3.906 11-8.77A17.926 17.926 0 0019.129 4M4.871 4L12 11.231M19.129 4L12 11.231M12 2v9.231"></path></svg></div>
                    <div>
                        <p class="text-sm font-medium text-gray-500">Job Matches</p>
                        <p class="text-2xl font-semibold text-gray-900">23</p>
                    </div>
                </div>
            </div>

            <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">

                <div class="lg:col-span-2 space-y-4">
                    <h2 class="text-xl font-semibold text-gray-900">Available Job Postings (Based on Eligibility)</h2>

                    <c:choose>
                        <c:when test="${not empty requestScope.jobList}">
                            <c:forEach var="job" items="${requestScope.jobList}">
                                <div class="bg-white shadow-lg rounded-xl p-6 border border-gray-200 flex flex-col sm:flex-row sm:items-center sm:justify-between">
                                    <div class="mb-4 sm:mb-0">
                                        <h3 class="text-lg font-bold text-gray-900">${job.title}</h3>
                                        <p class="text-sm text-gray-600">Company ID: ${job.companyId}</p>
                                        
                                        <div class="flex space-x-4 mt-2 text-sm text-gray-500">
                                            <span>
                                                <fmt:formatNumber value="${job.salaryPackage}" type="number" maxFractionDigits="1" /> LPA
                                            </span>
                                            <span>Min CGPA: ${job.requiredCgpa}</span>
                                        </div>
                                    </div>
                                    <a href="ApplyJobServlet?jobId=${job.id}" class="flex-shrink-0 inline-block bg-blue-600 text-white px-6 py-2 rounded-lg font-medium shadow-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                                        Apply Now
                                    </a>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="bg-blue-50 border border-blue-200 text-blue-800 p-4 rounded-lg shadow">
                                No job postings available matching your criteria yet.
                            </div>
                        </c:otherwise>
                    </c:choose>
                    </div>

                <div class="lg:col-span-1 space-y-6">
                    <div class="bg-white shadow-lg rounded-xl p-6 border border-gray-200">
                        <div class="flex justify-between items-center mb-4">
                            <h3 class="text-lg font-semibold text-gray-900">Profile Completion</h3>
                            <span class="text-lg font-bold text-blue-600">75%</span>
                        </div>
                        <div class="w-full bg-gray-200 rounded-full h-2.5 mb-4">
                            <div class="bg-blue-600 h-2.5 rounded-full" style="width: 75%"></div>
                        </div>
                        <ul class="space-y-3 text-sm">
                            <li class="flex items-center text-gray-700">
                                <span class="w-5 h-5 bg-green-500 text-white rounded-full flex items-center justify-center mr-3 text-xs">&#10003;</span>
                                Basic Information
                            </li>
                            <li class="flex items-center text-gray-700">
                                <span class="w-5 h-5 bg-green-500 text-white rounded-full flex items-center justify-center mr-3 text-xs">&#10003;</span>
                                Education Details
                            </li>
                            <li class="flex items-center text-gray-700">
                                <span class="w-5 h-5 bg-green-500 text-white rounded-full flex items-center justify-center mr-3 text-xs">&#10003;</span>
                                Skills & Certifications
                            </li>
                            <li class="flex items-center text-gray-400">
                                <span class="w-5 h-5 bg-gray-200 border border-gray-300 rounded-full mr-3"></span>
                                Work Experience
                            </li>
                            <li class="flex items-center text-gray-400">
                                <span class="w-5 h-5 bg-gray-200 border border-gray-300 rounded-full mr-3"></span>
                                Portfolio/Projects
                            </li>
                        </ul>
                    </div>
                    
                    <div class="bg-blue-50 border border-blue-200 rounded-xl p-6 text-center shadow-lg">
                        <span class="text-3xl">💡</span>
                        <h4 class="text-lg font-semibold text-blue-800 mt-2 mb-2">Boost Your Visibility</h4>
                        <p class="text-sm text-blue-700">
                            Complete your profile to increase your chances of being discovered by recruiters.
                        </p>
                    </div>
                </div>

            </div>
        </main>
    </div>
</body>
</html>