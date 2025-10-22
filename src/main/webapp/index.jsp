<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PlacePro - Placement Management Login</title>
    
    <!-- Load Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Use Inter font family for better aesthetics -->
    <style>
        body { font-family: 'Inter', sans-serif; }

        /* Custom styles for the login form to fit the dark theme */
        .login-container {
            max-width: 400px;
            margin: 0 auto;
            padding: 2.5rem; 
            border-radius: 1rem; 
            background-color: #1f2937; /* bg-slate-800 */
            border: 1px solid #374151; /* border-slate-700/50 */
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }
        .login-container h2 {
            font-size: 1.75rem;
            font-weight: 700;
            color: #ffffff;
            margin-bottom: 1.5rem;
            text-align: center;
        }
        .login-container label {
            display: block;
            margin-top: 1rem;
            margin-bottom: 0.25rem;
            color: #94a3b8; 
            font-size: 0.875rem;
            font-weight: 500;
        }
        .login-container input, 
        .login-container select {
            width: 100%;
            padding: 0.75rem;
            border-radius: 0.5rem;
            border: 1px solid #374151;
            background-color: #111827; /* bg-slate-900 */
            color: #ffffff;
            font-size: 1rem;
            transition: border-color 0.2s;
        }
        .login-container input:focus, 
        .login-container select:focus {
            outline: none;
            border-color: #3b82f6; /* blue-500 */
        }
        .login-container button {
            margin-top: 1.5rem;
            width: 100%;
            padding: 0.75rem;
            border-radius: 0.5rem;
            border: none;
            font-weight: 700;
            color: #ffffff;
            cursor: pointer;
            background-image: linear-gradient(to right, #3b82f6, #06b6d4); 
            transition: opacity 0.2s;
        }
        .login-container button:hover {
            opacity: 0.9;
        }
        .register-links {
            margin-top: 1.5rem;
            text-align: center;
            color: #94a3b8; 
            font-size: 0.875rem;
        }
        .register-links a {
            color: #38bdf8; 
            text-decoration: none;
            transition: color 0.2s;
        }
        .register-links a:hover {
            color: #ffffff;
        }
    </style>

    <!-- Original JavaScript for form action update -->
    <script>
        function updateAction() {
            const role = document.getElementById('role').value;
            const form = document.getElementById('loginForm');
            const usernameLabel = document.getElementById('usernameLabel');
            
            if (role === 'admin') {
                form.action = "AdminLoginServlet";
                usernameLabel.textContent = "Username:";
            } else if (role === 'student') {
                form.action = "StudentLoginServlet";
                usernameLabel.textContent = "Roll Number:";
            } else if (role === 'company') {
                form.action = "CompanyLoginServlet";
                usernameLabel.textContent = "HR Email:";
            }
        }
    </script>
</head>

<body onload="updateAction()">
    
    <div class="min-h-screen bg-gradient-to-b from-slate-900 via-slate-800 to-slate-900">
        
        <!-- Navigation -->

        
        <!-- Hero Section -->
        <section class="pt-32 pb-20 px-4 relative overflow-hidden">
            <div class="absolute top-20 left-10 w-72 h-72 bg-blue-500/20 rounded-full blur-3xl"></div>
            <div class="absolute bottom-0 right-10 w-96 h-96 bg-cyan-500/20 rounded-full blur-3xl"></div>
            <div class="max-w-7xl mx-auto relative z-10">
                <div class="grid lg:grid-cols-2 gap-12 items-center">
                    
                    <!-- Left Content (Marketing Message) -->
                    <div class="space-y-6">
                        <div class="inline-block px-4 py-2 rounded-full bg-blue-500/10 border border-blue-500/20">
                            <p class="text-blue-300 text-sm font-medium">✨ Transform Your Career</p>
                        </div>
                        <h1 class="text-5xl md:text-6xl font-bold text-white leading-tight">
                            Your Path to Success Starts Here
                        </h1>
                        <p class="text-xl text-slate-400">
                            Connect with top companies, showcase your skills, and land your dream job. PlacePro makes placement management seamless and transparent.
                        </p>
                        
                        <!-- Login/Registration Message Display (JSTL Integration) -->
                        <div class="pt-4">
                            <c:if test="${not empty requestScope.errorMessage}">
                                <div class="p-3 mb-4 rounded-lg bg-red-800 text-red-200 border border-red-500">
                                    <p>${requestScope.errorMessage}</p>
                                </div>
                            </c:if>
                            <c:if test="${not empty requestScope.successMessage}">
                                <div class="p-3 mb-4 rounded-lg bg-green-800 text-green-200 border border-green-500">
                                    <p>${requestScope.successMessage}</p>
                                </div>
                            </c:if>
                        </div>

                        <!-- Stats -->
                        <div class="grid grid-cols-3 gap-4 pt-8">
                            <div>
                                <p class="text-2xl font-bold text-cyan-400">500+</p>
                                <p class="text-slate-400 text-sm">Companies</p>
                            </div>
                            <div>
                                <p class="text-2xl font-bold text-cyan-400">10K+</p>
                                <p class="text-slate-400 text-sm">Placements</p>
                            </div>
                            <div>
                                <p class="text-2xl font-bold text-cyan-400">95%</p>
                                <p class="text-slate-400 text-sm">Success Rate</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Right Visual - YOUR LOGIN FORM INTEGRATED HERE -->
                    <div class="flex items-center justify-center pt-10 lg:pt-0">
                        <div class="login-container">
                            <h2>Placement Management Login</h2>
                            
                            <form id="loginForm" method="post">
                                
                                <label for="role">Select Role:</label>
                                <select id="role" name="role" onchange="updateAction()">
                                    <option value="student">Student</option>
                                    <option value="company">Company HR</option>
                                    <option value="admin">Admin</option>
                                </select>
                                
                                <label for="username" id="usernameLabel">Roll Number:</label>
                                <input type="text" id="username" name="username" required>

                                <label for="password">Password:</label>
                                <input type="password" id="password" name="password" required>
                                
                                <button type="submit">Log In</button>
                            </form>

                            <div class="register-links">
                                <p>New User? 
                                    <!-- Links corrected to point to JSP files -->
                                    <a href="student_register.jsp">Student Register</a> | 
                                    <a href="company_register.jsp">Company Register</a> |
                                    <a href="admin_register.jsp">Admin Register</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
        
        
        <!-- Features Section -->
        <section class="py-20 px-4">
            <div class="max-w-7xl mx-auto">
                <div class="text-center mb-16">
                    <h2 class="text-4xl md:text-5xl font-bold text-white mb-4">Why Choose PlacePro?</h2>
                    <p class="text-slate-400 text-lg">Everything you need to succeed in your placement journey</p>
                </div>
                <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <!-- Feature Cards (Converted from map) -->
                    <!-- Feature 1: Smart Matching -->
                    <div class="p-8 rounded-2xl border transition-all duration-300 cursor-pointer group bg-slate-800/50 border-slate-700/50 hover:border-slate-600/50 hover:bg-gradient-to-br hover:from-blue-500/20 hover:to-cyan-500/20 hover:transform hover:-translate-y-2">
                        <div class="w-12 h-12 rounded-lg bg-gradient-to-br from-blue-500 to-cyan-500 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                            <!-- Code Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-6 h-6 text-white"><polyline points="16 18 22 12 16 6"></polyline><polyline points="8 6 2 12 8 18"></polyline></svg>
                        </div>
                        <h3 class="text-xl font-bold text-white mb-2">Smart Matching</h3>
                        <p class="text-slate-400">AI-powered job recommendations based on your skills and preferences</p>
                    </div>
                    <!-- Feature 2: Real-time Analytics -->
                    <div class="p-8 rounded-2xl border transition-all duration-300 cursor-pointer group bg-slate-800/50 border-slate-700/50 hover:border-slate-600/50 hover:bg-gradient-to-br hover:from-blue-500/20 hover:to-cyan-500/20 hover:transform hover:-translate-y-2">
                        <div class="w-12 h-12 rounded-lg bg-gradient-to-br from-blue-500 to-cyan-500 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                            <!-- TrendingUp Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-6 h-6 text-white"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>
                        </div>
                        <h3 class="text-xl font-bold text-white mb-2">Real-time Analytics</h3>
                        <p class="text-slate-400">Track your progress with detailed insights and performance metrics</p>
                    </div>
                    <!-- Feature 3: Network Building -->
                    <div class="p-8 rounded-2xl border transition-all duration-300 cursor-pointer group bg-slate-800/50 border-slate-700/50 hover:border-slate-600/50 hover:bg-gradient-to-br hover:from-blue-500/20 hover:to-cyan-500/20 hover:transform hover:-translate-y-2">
                        <div class="w-12 h-12 rounded-lg bg-gradient-to-br from-blue-500 to-cyan-500 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                            <!-- Users Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-6 h-6 text-white"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><path d="M20 21v-2a4 4 0 0 0-4-4h-2"></path><circle cx="17.5" cy="11" r="4"></circle></svg>
                        </div>
                        <h3 class="text-xl font-bold text-white mb-2">Network Building</h3>
                        <p class="text-slate-400">Connect with industry professionals and expand your opportunities</p>
                    </div>
                    <!-- Feature 4: Skill Verification -->
                    <div class="p-8 rounded-2xl border transition-all duration-300 cursor-pointer group bg-slate-800/50 border-slate-700/50 hover:border-slate-600/50 hover:bg-gradient-to-br hover:from-blue-500/20 hover:to-cyan-500/20 hover:transform hover:-translate-y-2">
                        <div class="w-12 h-12 rounded-lg bg-gradient-to-br from-blue-500 to-cyan-500 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                            <!-- Award Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-6 h-6 text-white"><path d="M12 15a6 6 0 0 0-6 6"></path><path d="M12 15a6 6 0 0 1 6 6"></path><path d="M12 15L12 3L5 11L19 11Z"></path></svg>
                        </div>
                        <h3 class="text-xl font-bold text-white mb-2">Skill Verification</h3>
                        <p class="text-slate-400">Showcase verified skills and certifications to employers</p>
                    </div>
                    <!-- Feature 5: Interview Prep -->
                    <div class="p-8 rounded-2xl border transition-all duration-300 cursor-pointer group bg-slate-800/50 border-slate-700/50 hover:border-slate-600/50 hover:bg-gradient-to-br hover:from-blue-500/20 hover:to-cyan-500/20 hover:transform hover:-translate-y-2">
                        <div class="w-12 h-12 rounded-lg bg-gradient-to-br from-blue-500 to-cyan-500 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                            <!-- Zap Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-6 h-6 text-white"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon></svg>
                        </div>
                        <h3 class="text-xl font-bold text-white mb-2">Interview Prep</h3>
                        <p class="text-slate-400">Access resources and tools to prepare for your interviews</p>
                    </div>
                    <!-- Feature 6: Career Guidance -->
                    <div class="p-8 rounded-2xl border transition-all duration-300 cursor-pointer group bg-slate-800/50 border-slate-700/50 hover:border-slate-600/50 hover:bg-gradient-to-br hover:from-blue-500/20 hover:to-cyan-500/20 hover:transform hover:-translate-y-2">
                        <div class="w-12 h-12 rounded-lg bg-gradient-to-br from-blue-500 to-cyan-500 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                            <!-- BookOpen Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-6 h-6 text-white"><path d="M2 12c.5.5 1 1 2 1s1.5-.5 2-1c.5-.5 1-1 2-1s1.5.5 2 1c.5.5 1 1 2 1s1.5-.5 2-1c.5-.5 1-1 2-1s1.5.5 2 1c.5.5 1 1 2 1"></path><path d="M2 19c.5.5 1 1 2 1s1.5-.5 2-1c.5-.5 1-1 2-1s1.5.5 2 1c.5.5 1 1 2 1s1.5-.5 2-1c.5-.5 1-1 2-1s1.5.5 2 1c.5.5 1 1 2 1"></path><path d="M10 21V3"></path><path d="M14 21V3"></path><path d="M4 12H20"></path><path d="M4 19H20"></path></svg>
                        </div>
                        <h3 class="text-xl font-bold text-white mb-2">Career Guidance</h3>
                        <p class="text-slate-400">Expert mentors provide personalized career counseling</p>
                    </div>
                </div>
            </div>
        </section>
        
       <!-- Success Stories -->
        <section style="background-color: #1a1a2e; color: #ffffff; font-family: Arial, sans-serif; margin: 0; padding: 20px;">
<div style="max-width: 800px; margin: 0 auto; padding: 20px;">
        
        <header style="text-align: center; margin-bottom: 40px;">
            <h1 style="font-size: 2.5em; margin-bottom: 5px;">Success Stories</h1>
            <p style="font-size: 1.1em; color: #b0b0d0;">Real stories from our placed students</p>
        </header>

        <div style="background-color: #24243e; padding: 20px; border-radius: 10px; margin-bottom: 20px; display: flex; flex-direction: column; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
            <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 15px;">
                <div style="display: flex; align-items: center;">
                    <div style="width: 40px; height: 40px; border-radius: 50%; background-color: #55c2da; display: flex; justify-content: center; align-items: center; font-size: 1.2em; font-weight: bold; margin-right: 15px; color: #ffffff;">S</div>
                    <div>
                        <p style="margin: 0; font-size: 1.2em; font-weight: bold;">Sarah Chen</p>
                        <p style="margin: 0; font-size: 0.9em; color: #b0b0d0;">TechCorp</p>
                    </div>
                </div>
                <p style="margin: 0; font-size: 1.4em; font-weight: bold; color: #55c2da;">$120K</p>
            </div>

            <div style="display: flex; justify-content: space-between; align-items: center;">
                <p style="margin: 0; font-size: 1.1em; color: #ffffff;">Senior Developer</p>
                <div style="color: #ffc107; font-size: 1.4em;">
                    <span>&#9733;</span>
                    <span>&#9733;</span>
                    <span>&#9733;</span>
                    <span>&#9733;</span>
                    <span style="color: #4a4a6e;">&#9733;</span> </div>
            </div>
        </div>
        
        <div style="background-color: #24243e; padding: 20px; border-radius: 10px; margin-bottom: 20px; display: flex; flex-direction: column; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
            <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 15px;">
                <div style="display: flex; align-items: center;">
                    <div style="width: 40px; height: 40px; border-radius: 50%; background-color: #f7931e; display: flex; justify-content: center; align-items: center; font-size: 1.2em; font-weight: bold; margin-right: 15px; color: #ffffff;">R</div>
                    <div>
                        <p style="margin: 0; font-size: 1.2em; font-weight: bold;">Raj Patel</p>
                        <p style="margin: 0; font-size: 0.9em; color: #b0b0d0;">InnovateLabs</p>
                    </div>
                </div>
                <p style="margin: 0; font-size: 1.4em; font-weight: bold; color: #55c2da;">$135K</p>
            </div>

            <div style="display: flex; justify-content: space-between; align-items: center;">
                <p style="margin: 0; font-size: 1.1em; color: #ffffff;">Product Manager</p>
                <div style="color: #ffc107; font-size: 1.4em;">
                    <span>&#9733;</span>
                    <span>&#9733;</span>
                    <span>&#9733;</span>
                    <span>&#9733;</span>
                    <span>&#9733;</span>
                </div>
            </div>
        </div>

    </div>
</section>
        
        <!-- CTA Section -->
<!-- Companies Section -->
<section class="py-20 px-4 bg-slate-800/50">
    <div class="max-w-7xl mx-auto">
        <div class="text-center mb-16">
            <h2 class="text-4xl font-bold text-white mb-4">Trusted by Industry Leaders</h2>
            <p class="text-slate-400 text-lg">Join students placed at top companies worldwide</p>
        </div>
        
        <!-- The layout uses a responsive grid: 2 columns on medium screens, 4 on large screens -->
        <div class="grid grid-cols-2 lg:grid-cols-4 gap-8">
            
            <!-- Company 1 -->
            <div class="h-24 rounded-lg border border-slate-700/50 bg-slate-900/50 flex items-center justify-center 
                        hover:border-slate-600 transition-all group cursor-pointer hover:shadow-xl hover:shadow-slate-900/50">
                <div class="text-center">
                    <p class="font-bold text-slate-300 group-hover:text-white transition-colors text-xl">TechCorp</p>
                    <p class="text-xs text-slate-500 mt-1">250+ Placements</p>
                </div>
            </div>
            
            <!-- Company 2 -->
            <div class="h-24 rounded-lg border border-slate-700/50 bg-slate-900/50 flex items-center justify-center 
                        hover:border-slate-600 transition-all group cursor-pointer hover:shadow-xl hover:shadow-slate-900/50">
                <div class="text-center">
                    <p class="font-bold text-slate-300 group-hover:text-white transition-colors text-xl">InnovateLabs</p>
                    <p class="text-xs text-slate-500 mt-1">250+ Placements</p>
                </div>
            </div>
            
            <!-- Company 3 -->
            <div class="h-24 rounded-lg border border-slate-700/50 bg-slate-900/50 flex items-center justify-center 
                        hover:border-slate-600 transition-all group cursor-pointer hover:shadow-xl hover:shadow-slate-900/50">
                <div class="text-center">
                    <p class="font-bold text-slate-300 group-hover:text-white transition-colors text-xl">FutureSoft</p>
                    <p class="text-xs text-slate-500 mt-1">250+ Placements</p>
                </div>
            </div>
            
            <!-- Company 4 -->
            <div class="h-24 rounded-lg border border-slate-700/50 bg-slate-900/50 flex items-center justify-center 
                        hover:border-slate-600 transition-all group cursor-pointer hover:shadow-xl hover:shadow-slate-900/50">
                <div class="text-center">
                    <p class="font-bold text-slate-300 group-hover:text-white transition-colors text-xl">CloudDynamics</p>
                    <p class="text-xs text-slate-500 mt-1">250+ Placements</p>
                </div>
            </div>
            
            <!-- Company 5 -->
            <div class="h-24 rounded-lg border border-slate-700/50 bg-slate-900/50 flex items-center justify-center 
                        hover:border-slate-600 transition-all group cursor-pointer hover:shadow-xl hover:shadow-slate-900/50">
                <div class="text-center">
                    <p class="font-bold text-slate-300 group-hover:text-white transition-colors text-xl">DataSystems</p>
                    <p class="text-xs text-slate-500 mt-1">250+ Placements</p>
                </div>
            </div>
            
            <!-- Company 6 -->
            <div class="h-24 rounded-lg border border-slate-700/50 bg-slate-900/50 flex items-center justify-center 
                        hover:border-slate-600 transition-all group cursor-pointer hover:shadow-xl hover:shadow-slate-900/50">
                <div class="text-center">
                    <p class="font-bold text-slate-300 group-hover:text-white transition-colors text-xl">WebVision</p>
                    <p class="text-xs text-slate-500 mt-1">250+ Placements</p>
                </div>
            </div>
            
            <!-- Company 7 -->
            <div class="h-24 rounded-lg border border-slate-700/50 bg-slate-900/50 flex items-center justify-center 
                        hover:border-slate-600 transition-all group cursor-pointer hover:shadow-xl hover:shadow-slate-900/50">
                <div class="text-center">
                    <p class="font-bold text-slate-300 group-hover:text-white transition-colors text-xl">SecureNet</p>
                    <p class="text-xs text-slate-500 mt-1">250+ Placements</p>
                </div>
            </div>
            
            <!-- Company 8 -->
            <div class="h-24 rounded-lg border border-slate-700/50 bg-slate-900/50 flex items-center justify-center 
                        hover:border-slate-600 transition-all group cursor-pointer hover:shadow-xl hover:shadow-slate-900/50">
                <div class="text-center">
                    <p class="font-bold text-slate-300 group-hover:text-white transition-colors text-xl">SmartAI</p>
                    <p class="text-xs text-slate-500 mt-1">250+ Placements</p>
                </div>
            </div>
            
        </div>
    </div>
</section>
        
        <!-- Footer -->
        <footer class="border-t border-slate-700/50 py-12 px-4">
            <div class="max-w-7xl mx-auto">
                <div class="grid md:grid-cols-4 gap-8 mb-8">
                    <!-- Logo Column -->
                    <div>
                        <div class="flex items-center gap-2 mb-4">
                            <!-- Briefcase Icon -->
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-6 h-6 text-cyan-400"><rect x="2" y="7" width="20" height="14" rx="2" ry="2"></rect><path d="M16 21V5a2 2 0 0 0-2-2h-4a2 2 0 0 0-2 2v16"></path></svg>
                            <span class="font-bold text-white">PlacePro</span>
                        </div>
                        <p class="text-slate-400">Your gateway to success</p>
                    </div>
                    
                    <!-- Link Columns (Converted from map) -->
                    <!-- Column 1: Product -->
                    <div>
                        <h4 class="font-bold text-white mb-4">Product</h4>
                        <ul class="space-y-2">
                            <li><a href="#" class="text-slate-400 hover:text-white transition-colors">Features</a></li>
                            <li><a href="#" class="text-slate-400 hover:text-white transition-colors">Pricing</a></li>
                            <li><a href="#" class="text-slate-400 hover:text-white transition-colors">Security</a></li>
                        </ul>
                    </div>
                    <!-- Column 2: Company -->
                    <div>
                        <h4 class="font-bold text-white mb-4">Company</h4>
                        <ul class="space-y-2">
                            <li><a href="#" class="text-slate-400 hover:text-white transition-colors">About</a></li>
                            <li><a href="#" class="text-slate-400 hover:text-white transition-colors">Blog</a></li>
                            <li><a href="#" class="text-slate-400 hover:text-white transition-colors">Careers</a></li>
                        </ul>
                    </div>
                    <!-- Column 3: Support -->
                    <div>
                        <h4 class="font-bold text-white mb-4">Support</h4>
                        <ul class="space-y-2">
                            <li><a href="#" class="text-slate-400 hover:text-white transition-colors">Help Center</a></li>
                            <li><a href="#" class="text-slate-400 hover:text-white transition-colors">Contact</a></li>
                            <li><a href="#" class="text-slate-400 hover:text-white transition-colors">FAQs</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="border-t border-slate-700/50 pt-8 text-center text-slate-400">
                    <p>&copy; 2024 PlacePro. All rights reserved.</p>
                </div>
            </div>
        </footer>
    </div>
</body>
</html>
