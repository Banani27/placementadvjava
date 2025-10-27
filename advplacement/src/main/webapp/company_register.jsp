<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" class="dark"> <head>
    <meta charset="UTF-8">
    <title>Company HR Registration</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        // Configuration for Tailwind CSS to match your theme
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        slate: {
                            800: '#1e293b',
                            900: '#0f172a',
                            700: '#334155',
                            600: '#475569',
                            500: '#64748b',
                            400: '#94a3b8',
                        }
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-slate-900 text-slate-300">

    <div class="max-w-lg mx-auto py-12 px-4">
        
        <h2 class="text-3xl font-bold text-center text-white mb-8">Company HR Registration</h2>

        <div>
            <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="bg-red-500/10 border border-red-700 text-red-300 px-4 py-3 rounded-lg mb-4" role="alert">
                    <%= request.getAttribute("errorMessage") %>
                </div>
            <% } %>
            
            <form action="CompanyRegistrationServlet" method="post" class="space-y-4">
                <div>
                    <label for="companyName" class="block text-sm font-medium text-slate-300 mb-1">Company Name</label>
                    <input type="text" class="block w-full bg-slate-800 border border-slate-700 rounded-md py-2 px-3 text-white focus:outline-none focus:ring-2 focus:ring-blue-500" id="companyName" name="name" required>
                </div>
                
                <div>
                    <label for="industry" class="block text-sm font-medium text-slate-300 mb-1">Industry / Sector</label>
                    <input type="text" class="block w-full bg-slate-800 border border-slate-700 rounded-md py-2 px-3 text-white focus:outline-none focus:ring-2 focus:ring-blue-500" id="industry" name="industry" required>
                </div>

                <div>
                    <label for="contactPerson" class="block text-sm font-medium text-slate-300 mb-1">HR Contact Name</label>
                    <input type="text" class="block w-full bg-slate-800 border border-slate-700 rounded-md py-2 px-3 text-white focus:outline-none focus:ring-2 focus:ring-blue-500" id="contactPerson" name="contactPerson" required>
                </div>
                
                <div>
                    <label for="hrEmail" class="block text-sm font-medium text-slate-300 mb-1">HR Email (Login ID)</label>
                    <input type="email" class="block w-full bg-slate-800 border border-slate-700 rounded-md py-2 px-3 text-white focus:outline-none focus:ring-2 focus:ring-blue-500" id="hrEmail" name="hrEmail" required>
                </div>
                
                <div>
                    <label for="password" class="block text-sm font-medium text-slate-300 mb-1">Password</label>
                    <input type="password" class="block w-full bg-slate-800 border border-slate-700 rounded-md py-2 px-3 text-white focus:outline-none focus:ring-2 focus:ring-blue-500" id="password" name="password" required>
                </div>
                
                <button type="submit" class="w-full bg-blue-600 py-2.5 px-4 border border-transparent rounded-md font-medium text-white hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 focus:ring-offset-slate-900 mt-2">Register Company</button>
            </form>
            
            <p class="mt-4 text-center text-sm">
                Already have an account? 
                <a href="index.jsp" class="font-medium text-blue-400 hover:text-blue-300">Login here</a>
            </p>
        </div>
    </div>
</body>
</html>