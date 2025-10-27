<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PlacePro - Placement Management</title>
    <!-- Importing Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <style>
        /* Use Inter font family for better aesthetics */
        body { 
            font-family: 'Inter', sans-serif; 
            background-color: #f8fafc; /* bg-slate-50 */
        }
        
        /* Hero Background Style (from screenshot) */
        .hero-bg {
            /* A fallback color */
            background-color: #374151;
            /* In a real app, you'd use: background-image: url('path/to/hero-image.jpg'); */
            /* This gradient mimics the dark overlay */
            background-image: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4));
            background-size: cover;
            background-position: center;
        }

        /* Custom styles for the login form (FROM YOUR FILE) */
        .login-container {
            width: 100%;
            max-width: 420px; /* Max width */
            padding: 2.5rem; 
            border-radius: 1rem; 
            background-color: #1f2937; /* bg-slate-800 */
            border: 1px solid #374151; /* border-slate-700/50 */
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
</head>
<body class="bg-gray-50">

    <!-- 
      ============================================================
      HEADER / NAVIGATION (from Screenshot 1)
      ============================================================
    -->
    <header class="bg-white shadow-sm sticky top-0 z-50">
        <nav class="container mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between items-center h-16">
                <!-- Logo -->
                <div class="flex-shrink-0 flex items-center">
                    <svg class="h-8 w-8 text-blue-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                      <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 21h16.5M4.5 3h15M5.25 3v18m13.5-18v18M9 6.75h6.75M9 11.25h6.75M9 15.75h6.75M9 20.25h6.75" />
                    </svg>
                    <span class="ml-2 text-2xl font-bold text-gray-900">PlacePro</span>
                </div>
                
                <!-- Navigation Links (hidden on mobile) -->
                <div class="hidden md:flex md:items-center md:space-x-8">
                    <a href="features" class="text-gray-600 hover:text-blue-600 font-medium">Features</a>
                    <a href="how-it-works" class="text-gray-600 hover:text-blue-600 font-medium">How It Works</a>
                    <a href="pricing.jsp" class="text-gray-600 hover:text-blue-600 font-medium">Pricing</a>
             
                </div>
                
                <!-- Login & Get Started Buttons -->
                <div class="flex items-center space-x-4">
                    <!-- This button triggers the modal -->
                    <button id="login-btn" type="button" class="text-gray-600 hover:text-blue-600 font-medium px-4 py-2 rounded-md">
                        Login
                    </button>
                    <a href="#" class="hidden sm:inline-block bg-blue-600 hover:bg-blue-700 text-white font-medium px-5 py-2 rounded-lg shadow">
                        Get Started
                    </a>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <!-- 
          ============================================================
          HERO SECTION (from Screenshot 1)
          ============================================================
        -->
        <section class="hero-bg relative pt-16 pb-24 md:pt-24 md:pb-32">
            <!-- Using a semi-transparent overlay to mimic the image's dark tint -->
            <div class="absolute inset-0 bg-black opacity-30"></div>
            
            <div class="container mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
                <div class="flex flex-wrap -mx-4">
                    <!-- Left Side: Text Content -->
                    <div class="w-full lg:w-3/5 px-4">
                        <h1 class="text-4xl md:text-6xl font-extrabold text-white leading-tight mb-6">
                            Connect Talent with <span class="text-blue-300">Opportunity</span>
                        </h1>
                        <p class="text-lg md:text-xl text-gray-200 mb-8 max-w-2xl">
                            The most comprehensive placement management platform for educational institutions, students, and companies. Streamline your recruitment process with AI-powered matching and automated workflows.
                        </p>
                        <div class="flex flex-wrap gap-4 mb-16">
                            <a href="#" class="bg-white text-gray-900 font-medium px-8 py-3 rounded-lg shadow-lg hover:bg-gray-100 transition duration-300">
                                Get Started
                            </a>
                            <a href="https://youtu.be/m7VcIH_N9ZY?si=bQygMlOw_HVVHasK" class="bg-transparent border-2 border-white text-white font-medium px-8 py-3 rounded-lg hover:bg-white hover:text-gray-900 transition duration-300 flex items-center">
                                <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14.752 11.168l-3.197-2.132A1 1 0 0010 9.87v4.263a1 1 0 001.555.832l3.197-2.132a1 1 0 000-1.664z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path></svg>
                                Watch Demo
                            </a>
                        </div>
                        
                        <!-- Stats -->
                        <div class="flex space-x-8 md:space-x-12">
                            <div>
                                <p class="text-4xl font-bold text-white">10K+</p>
                                <p class="text-gray-300">Students Placed</p>
                            </div>
                            <div>
                                <p class="text-4xl font-bold text-white">500+</p>
                                <p class="text-gray-300">Partner Companies</p>
                            </div>
                            <div>
                                <p class="text-4xl font-bold text-white">95%</p>
                                <p class="text-gray-300">Success Rate</p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Right Side: Role Cards (from screenshot) -->
                    <div class="w-full lg:w-2/5 px-4 mt-12 lg:mt-0 flex items-center justify-center">
                        <div class="bg-white bg-opacity-20 backdrop-blur-lg rounded-2xl p-6 md:p-8 shadow-2xl w-full max-w-md">
                            <a href="#" class="flex items-center bg-white p-4 rounded-xl mb-4 shadow-md hover:shadow-lg transition duration-300">
                                <span class="flex-shrink-0 bg-blue-100 text-blue-600 rounded-full p-3">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path></svg>
                                </span>
                                <div class="ml-4">
                                    <h3 class="text-lg font-semibold text-gray-900">For Students</h3>
                                    <p class="text-gray-600">Find your dream job</p>
                                </div>
                            </a>
                            <a href="#" class="flex items-center bg-white p-4 rounded-xl mb-4 shadow-md hover:shadow-lg transition duration-300">
                                <span class="flex-shrink-0 bg-green-100 text-green-600 rounded-full p-3">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path></svg>
                                </span>
                                <div class="ml-4">
                                    <h3 class="text-lg font-semibold text-gray-900">For Companies</h3>
                                    <p class="text-gray-600">Hire top talent</p>
                                </div>
                            </a>
                            <a href="#" class="flex items-center bg-white p-4 rounded-xl shadow-md hover:shadow-lg transition duration-300">
                                <span class="flex-shrink-0 bg-purple-100 text-purple-600 rounded-full p-3">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path></svg>
                                </span>
                                <div class="ml-4">
                                    <h3 class="text-lg font-semibold text-gray-900">For Admins</h3>
                                    <p class="text-gray-600">Manage placements</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 
          ============================================================
          FEATURES SECTION (from Screenshot 2)
          ============================================================
        -->
        <section class="py-16 md:py-24 bg-gray-50">
            <div class="container mx-auto px-4 sm:px-6 lg:px-8">
                <div class="text-center max-w-3xl mx-auto">
                    <h2 class="text-3xl md:text-4xl font-extrabold text-gray-900 mb-4">
                        Powerful Features for Modern Placement Management
                    </h2>
                    <p class="text-lg text-gray-600">
                        Everything you need to streamline your placement process, from application to offer acceptance.
                    </p>
                </div>
                
                <!-- Features Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 mt-16">
                    <!-- Feature Cards... -->
                    <div class="bg-white p-8 rounded-2xl shadow-lg hover:shadow-xl transition-shadow duration-300">
                        <span class="flex-shrink-0 bg-blue-100 text-blue-600 rounded-full p-4 inline-flex">
                            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.75 17.25l.038-.038m0-4.722l.038-.038M5.625 15l.038-.038M21 12a9 9 0 11-18 0 9 9 0 0118 0zM9 9.75h.008v.008H9v-.008zm5.025.008h.008v.008h-.008v-.008zm-5.008 5.033h.008v.008H9.017v-.008z"></path></svg>
                        </span>
                        <h3 class="text-2xl font-semibold text-gray-900 mt-6 mb-3">Smart Matching</h3>
                        <p class="text-gray-600">
                            AI-powered algorithm matches students with relevant job opportunities based on skills, preferences, and academic performance.
                        </p>
                    </div>
                    <div class="bg-white p-8 rounded-2xl shadow-lg hover:shadow-xl transition-shadow duration-300">
                        <span class="flex-shrink-0 bg-green-100 text-green-600 rounded-full p-4 inline-flex">
                            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path></svg>
                        </span>
                        <h3 class="text-2xl font-semibold text-gray-900 mt-6 mb-3">Interview Scheduling</h3>
                        <p class="text-gray-600">
                            Automated interview scheduling system with calendar integration and real-time notifications for all parties.
                        </p>
                    </div>
                    <div class="bg-white p-8 rounded-2xl shadow-lg hover:shadow-xl transition-shadow duration-300">
                        <span class="flex-shrink-0 bg-purple-100 text-purple-600 rounded-full p-4 inline-flex">
                            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 17v-2m3 2v-4m3 4v-6m2 10H7a2 2 0 01-2-2V5a2 2 0 012-2h11a2 2 0 012 2v11a2 2 0 01-2 2z"></path></svg>
                        </span>
                        <h3 class="text-2xl font-semibold text-gray-900 mt-6 mb-3">Comprehensive Dashboards</h3>
                        <p class="text-gray-600">
                            Role-specific dashboards for students, companies, and administrators with real-time analytics and insights.
                        </p>
                    </div>
                    <!-- Other feature cards... -->
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
                        <p style="margin: 0; font-size: 1.2em; font-weight: bold;">Sarah Verma</p>
                        <p style="margin: 0; font-size: 0.9em; color: #b0b0d0;">TechCorp</p>
                    </div>
                </div>
                <p style="margin: 0; font-size: 1.4em; font-weight: bold; color: #55c2da;">25LPA</p>
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
                <p style="margin: 0; font-size: 1.4em; font-weight: bold; color: #55c2da;">40LPA</p>
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
        
        
    </main>

    <!-- 
      ============================================================
      FOOTER (from Screenshot 3)
      ============================================================
    -->
    <footer class="bg-gray-900 text-gray-300">
        <div class="container mx-auto px-4 sm:px-6 lg:px-8 py-16">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
                <!-- Column 1: Logo and Social -->
                <div>
                    <div class="flex items-center mb-4">
                        <svg class="h-8 w-8 text-blue-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
                          <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 21h16.5M4.5 3h15M5.25 3v18m13.5-18v18M9 6.75h6.75M9 11.25h6.75M9 15.75h6.75M9 20.25h6.75" />
                        </svg>
                        <span class="ml-2 text-2xl font-bold text-white">PlacePro</span>
                    </div>
                    <p class="text-gray-400 mb-6 max-w-xs">
                        Streamlining placement processes for educational institutions, students, and companies. Building bridges between talent and opportunity.
                    </p>
                    <!-- Social icons... -->
                </div>
                
                <!-- Column 2: Quick Links -->
                <div>
                    <h4 class="text-xl font-semibold text-white mb-4">Quick Links</h4>
                    <ul class="space-y-2">
                        <li><a href="features.jsp" class="hover:text-white">Features</a></li>
                        <li><a href="how-it-works.jsp" class="hover:text-white">How It Works</a></li>
                        <li><a href="pricing.jsp" class="hover:text-white">Pricing</a></li>
                    </ul>
                </div>
                
                <!-- Column 3: Contact Info -->
                <div>
                    <h4 class="text-xl font-semibold text-white mb-4">Contact Info</h4>
                    <ul class="space-y-2">
                        <li class="flex items-center">
                            <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path></svg>
                            support@placepro.com
                        </li>
                        <li class="flex items-center">
                            <svg class="w-5 h-5 mr-3" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path></svg>
                            +1 (555) 123-4567
                        </li>
                    </ul>
                </div>
            </div>
            
            <!-- Bottom Bar -->
            <div class="border-t border-gray-700 mt-12 pt-8 flex flex-col md:flex-row justify-between items-center">
                <p class="text-gray-400">&copy; 2025 PlacePro. All rights reserved.</p>
                <div class="flex space-x-6 mt-4 md:mt-0">
                    <a href="#" class="hover:text-white">Privacy Policy</a>
                    <a href="#" class="hover:text-white">Terms of Service</a>
                </div>
            </div>
        </div>
    </footer>


    <!-- 
      ============================================================
      LOGIN MODAL (Brings back modal, uses correct form)
      ============================================================
    -->
    <div id="login-modal" class="fixed inset-0 bg-black bg-opacity-75 flex items-center justify-center p-4 z-[100] hidden">
        
        <!-- Modal Content -->
        <div class="login-container relative">
            <!-- Close Button -->
            <button id="close-modal-btn" class="absolute top-4 right-5 text-gray-400 hover:text-white">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
            </button>
            
            <h2> Login</h2>

            <!-- JSTL Message Display -->
            <c:if test="${not empty requestScope.errorMessage}">
                <div class="p-3 mb-4 rounded-lg bg-red-800 text-red-200 border border-red-500 text-sm">
                    <p>${requestScope.errorMessage}</p>
                </div>
            </c:if>
            <c:if test="${not empty requestScope.successMessage}">
                <div class="p-3 mb-4 rounded-lg bg-green-800 text-green-200 border border-green-500 text-sm">
                    <p>${requestScope.successMessage}</p>
                </div>
            </c:if>
            
            <!-- Form uses IDs from your script -->
            <form id="loginForm" method="post">
                
                <label for="role">Select Role:</label>
                <select id="role" name="role">
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
                    <a href="student_register.jsp">Student Register</a> | 
                    <a href="company_register.jsp">Company Register</a> |
                    <a href="admin_register.jsp">Admin Register</a>
                </p>
            </div>
        </div>
    </div>

    <!-- 
      ============================================================
      ENHANCED JAVASCRIPT (Combines both scripts)
      ============================================================
    -->
    <script>
        /**
         * This function updates the login form based on the selected role.
         * It changes the form's submission URL (action), the label for the
         * username field, and the placeholder text for BOTH inputs.
         */
        function updateLoginForm() {
            // Get all the elements we need to change
            const roleSelect = document.getElementById('role');
            const loginForm = document.getElementById('loginForm');
            const usernameLabel = document.getElementById('usernameLabel');
            const usernameInput = document.getElementById('username');
            const passwordInput = document.getElementById('password'); // Get password input

            // Ensure all elements exist before proceeding
            if (!roleSelect || !loginForm || !usernameLabel || !usernameInput || !passwordInput) {
                console.error("Login form elements not found. Skipping update.");
                return;
            }

            const selectedRole = roleSelect.value;

            if (selectedRole === 'admin') {
                loginForm.action = "AdminLoginServlet";
                usernameLabel.textContent = "Username:";
                usernameInput.placeholder = "useremail"; // Your requested placeholder
                passwordInput.placeholder = "admin password"; // New placeholder
            } else if (selectedRole === 'student') {
                loginForm.action = "StudentLoginServlet";
                usernameLabel.textContent = "Roll Number:";
                usernameInput.placeholder = "Enter your roll number";
                passwordInput.placeholder = "student password"; // New placeholder
            } else if (selectedRole === 'company') {
                loginForm.action = "CompanyLoginServlet";
                usernameLabel.textContent = "HR Email:";
                usernameInput.placeholder = "hremail"; // Your requested placeholder
                passwordInput.placeholder = "hr password"; // New placeholder
            }
        }

        // Run everything after the page loads
        document.addEventListener('DOMContentLoaded', () => {
            // Get modal-related elements
            const loginBtn = document.getElementById('login-btn');
            const modal = document.getElementById('login-modal');
            const closeModalBtn = document.getElementById('close-modal-btn');
            
            // Get form-related element
            const roleSelect = document.getElementById('role');

            // --- Modal Logic ---
            if (loginBtn && modal && closeModalBtn) {
                const openModal = () => modal.classList.remove('hidden');
                const closeModal = () => modal.classList.add('hidden');

                loginBtn.addEventListener('click', openModal);
                closeModalBtn.addEventListener('click', closeModal);
                
                modal.addEventListener('click', (e) => {
                    if (e.target === modal) {
                        closeModal();
                    }
                });
            }

            // --- Form Logic ---
            if (roleSelect) {
                // Attach the update function to the dropdown's change event
                roleSelect.addEventListener('change', updateLoginForm);
                
                // Run the function once on load to set the initial state
                updateLoginForm();
            }
        });
    </script>

</body>
</html>

