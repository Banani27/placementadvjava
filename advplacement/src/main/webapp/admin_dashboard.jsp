<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
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
                        }
                    }
                }
            }
        }
    </script>
    <style>
        /* Custom scrollbar for recent activities */
        .custom-scrollbar::-webkit-scrollbar {
            width: 8px;
            background-color: #f3f4f6; /* bg-gray-100 */
            border-radius: 4px;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
            background-color: #d1d5db; /* bg-gray-300 */
            border-radius: 4px;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb:hover {
            background-color: #9ca3af; /* bg-gray-400 */
        }
    </style>
</head>
<body class="bg-gray-50 font-sans antialiased text-gray-800">
    <div class="min-h-screen bg-gray-50 flex flex-col">
        <header class="bg-white shadow-sm border-b border-gray-200">
            <div class="max-w-7xl mx-auto py-4 px-4 sm:px-6 lg:px-8 flex justify-between items-center">
                <h1 class="text-2xl font-bold leading-tight text-gray-900">Admin Panel</h1>
                <div class="flex items-center space-x-4">
                    <c:if test="${not empty sessionScope.currentAdmin}">
                        <span class="text-gray-600">Welcome, <strong class="text-gray-800">${sessionScope.currentAdmin.name}</strong>!</span>
                    </c:if>
                    <a href="LogoutServlet" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500">
                        Logout
                    </a>
                </div>
            </div>
        </header>

        <main class="flex-1">
            <div class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                    <div class="bg-white shadow rounded-lg p-6 flex items-center space-x-4">
                        <div class="p-3 bg-blue-100 rounded-full">
                            <svg class="h-6 w-6 text-blue-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H2v-2a4 4 0 014-4h12.55M18 12a4 4 0 11-8 0 4 4 0 018 0z"></path></svg>
                        </div>
                        <div>
                            <p class="text-sm font-medium text-gray-500">Total Students</p>
                            <p class="text-2xl font-semibold text-gray-900">50k</p> <%-- Replace with dynamic data if available: ${totalStudents} --%>
                        </div>
                    </div>
                    <div class="bg-white shadow rounded-lg p-6 flex items-center space-x-4">
                        <div class="p-3 bg-green-100 rounded-full">
                            <svg class="h-6 w-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path></svg>
                        </div>
                        <div>
                            <p class="text-sm font-medium text-gray-500">Approved Companies</p>
                            <p class="text-2xl font-semibold text-gray-900">9000</p> <%-- Replace with dynamic data if available: ${approvedCompanies} --%>
                        </div>
                    </div>
                    <div class="bg-white shadow rounded-lg p-6 flex items-center space-x-4">
                        <div class="p-3 bg-yellow-100 rounded-full">
                            <svg class="h-6 w-6 text-yellow-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                        </div>
                        <div>
                            <p class="text-sm font-medium text-gray-500">Pending Approvals</p>
                            <p class="text-2xl font-semibold text-gray-900">800</p> <%-- Replace with dynamic data if available: ${pendingApprovals} --%>
                        </div>
                    </div>
                    <div class="bg-white shadow rounded-lg p-6 flex items-center space-x-4">
                        <div class="p-3 bg-purple-100 rounded-full">
                            <svg class="h-6 w-6 text-purple-600" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 13.255A23.931 23.931 0 0112 15c-3.183 0-6.22-1.208-8.455-3.245M12 15V9m-4.025 1.5l1.414 1.414M18.025 10.5l-1.414 1.414M12 12a2 2 0 100-4 2 2 0 000 4z"></path></svg>
                        </div>
                        <div>
                            <p class="text-sm font-medium text-gray-500">Active Jobs</p>
                            <p class="text-2xl font-semibold text-gray-900">500</p> <%-- Replace with dynamic data if available: ${activeJobs} --%>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-3 gap-6 mb-8">
                    <div class="bg-white shadow rounded-lg p-6">
                        <h5 class="text-lg font-semibold text-gray-900 mb-2">Manage Students</h5>
                        <p class="text-gray-600 text-sm mb-4">View, add, edit, or delete student profiles.</p>
                        <a href="StudentServlet?action=list" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                            Go to Student Management
                        </a>
                    </div>
                    <div class="bg-white shadow rounded-lg p-6">
                        <h5 class="text-lg font-semibold text-gray-900 mb-2">Manage Companies</h5>
                        <p class="text-gray-600 text-sm mb-4">Approve, view, or manage registered companies.</p>
                        <a href="CompanyServlet?action=list" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
                            Go to Company Management
                        </a>
                    </div>
                    <div class="bg-white shadow rounded-lg p-6">
                        <h5 class="text-lg font-semibold text-gray-900 mb-2">System Reports</h5>
                        <p class="text-gray-600 text-sm mb-4">View placement statistics and data analysis.</p>
                        <a href="#" class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-gray-600 hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-gray-500">
                            View Reports
                        </a>
                    </div>
                </div>

                <div class="bg-white shadow rounded-lg p-6">
                    <h5 class="text-lg font-semibold text-gray-900 mb-4">Recent Activities</h5>
                    <div class="space-y-4 max-h-60 overflow-y-auto custom-scrollbar">
                        <div class="flex items-start justify-between">
                            <div class="flex items-center">
                                <span class="block w-2 h-2 bg-blue-500 rounded-full mr-3 mt-1 flex-shrink-0"></span>
                                <div>
                                    <p class="text-sm font-medium text-gray-900">New company registration</p>
                                    <p class="text-xs text-gray-500">Company: TechCorp Solutions</p>
                                </div>
                            </div>
                            <span class="text-xs text-gray-400 flex-shrink-0">2 hours ago</span>
                        </div>
                        <div class="flex items-start justify-between">
                            <div class="flex items-center">
                                <span class="block w-2 h-2 bg-green-500 rounded-full mr-3 mt-1 flex-shrink-0"></span>
                                <div>
                                    <p class="text-sm font-medium text-gray-900">Job posting approved</p>
                                    <p class="text-xs text-gray-500">Company: DataFlow Analytics</p>
                                </div>
                            </div>
                            <span class="text-xs text-gray-400 flex-shrink-0">4 hours ago</span>
                        </div>
                        <div class="flex items-start justify-between">
                            <div class="flex items-center">
                                <span class="block w-2 h-2 bg-purple-500 rounded-full mr-3 mt-1 flex-shrink-0"></span>
                                <div>
                                    <p class="text-sm font-medium text-gray-900">Student profile updated</p>
                                    <p class="text-xs text-gray-500">Student: Rahul Sharma</p>
                                </div>
                            </div>
                            <span class="text-xs text-gray-400 flex-shrink-0">6 hours ago</span>
                        </div>
                        <div class="flex items-start justify-between">
                            <div class="flex items-center">
                                <span class="block w-2 h-2 bg-green-500 rounded-full mr-3 mt-1 flex-shrink-0"></span>
                                <div>
                                    <p class="text-sm font-medium text-gray-900">Company approved</p>
                                    <p class="text-xs text-gray-500">Company: CloudTech Innovations</p>
                                </div>
                            </div>
                            <span class="text-xs text-gray-400 flex-shrink-0">1 day ago</span>
                        </div>
                        <div class="flex items-start justify-between">
                            <div class="flex items-center">
                                <span class="block w-2 h-2 bg-yellow-500 rounded-full mr-3 mt-1 flex-shrink-0"></span>
                                <div>
                                    <p class="text-sm font-medium text-gray-900">New job pending approval</p>
                                    <p class="text-xs text-gray-500">Company: Global Solutions</p>
                                </div>
                            </div>
                            <span class="text-xs text-gray-400 flex-shrink-0">2 days ago</span>
                        </div>
                         <div class="flex items-start justify-between">
                            <div class="flex items-center">
                                <span class="block w-2 h-2 bg-blue-500 rounded-full mr-3 mt-1 flex-shrink-0"></span>
                                <div>
                                    <p class="text-sm font-medium text-gray-900">New student registered</p>
                                    <p class="text-xs text-gray-500">Student: Priya Singh</p>
                                </div>
                            </div>
                            <span class="text-xs text-gray-400 flex-shrink-0">3 days ago</span>
                        </div>
                    </div>
                </div>

            </div>
        </main>
    </div>
</body>
</html>