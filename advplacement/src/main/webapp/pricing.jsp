<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="dark"> <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pricing - PlacePro</title>
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
<body class="bg-slate-900 text-white">

    <header class="bg-slate-900 border-b border-slate-800 sticky top-0 z-50">
        <nav class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" aria-label="Top">
            <div class="w-full py-5 flex items-center justify-between">
                <div class="flex items-center">
                    <a href="index.jsp" class="flex items-center text-white text-xl font-bold">
                        <svg class="w-8 h-8 mr-2 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 14v3m4-3v3m4-3v3M3 21h18M3 10h18M3 7l9-4 9 4M4 10h16v11H4V10z"></path></svg>
                        PlacePro
                    </a>
                    
                    <div class="hidden ml-10 space-x-8 lg:block">
                        <a href="features" class="text-base font-medium text-slate-400 hover:text-white">Features</a>
                        <a href="how-it-works" class="text-base font-medium text-slate-400 hover:text-white">How It Works</a>
                        <a href="pricing" class="text-base font-medium text-blue-400" aria-current="page">Pricing</a>
               
                    </div>
                </div>

                <div class="ml-10 space-x-4">
                    <a href="index.jsp" class="inline-block text-base font-medium text-slate-400 hover:text-white">Login</a>
                    <a href="studentRegistration.jsp" class="inline-block bg-blue-600 py-2 px-4 border border-transparent rounded-md text-base font-medium text-white hover:bg-blue-700">Get Started</a>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <section class="py-20 px-4">
            <div class="max-w-7xl mx-auto">
                
                <div class="text-center mb-16">
                    <h2 class="text-4xl md:text-5xl font-bold text-white mb-4">Simple, Transparent Pricing</h2>
                    <p class="text-slate-400 text-lg">Choose the plan that's right for you.</p>
                </div>

                <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-5xl mx-auto">

                    <div class="p-8 rounded-2xl border flex flex-col bg-slate-800/50 border-slate-700/50">
                        <div class="flex-grow">
                            <h3 class="text-lg font-semibold text-slate-400 uppercase">Student</h3>
                            <p class="text-4xl font-bold text-white my-4">Free</p>
                            <p class="text-slate-400 mb-6">For students to find and apply for jobs.</p>
                            <ul class="space-y-3 text-slate-300">
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-blue-500 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                                    Profile Creation
                                </li>
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-blue-500 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                                    Search & Apply for Jobs
                                </li>
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-blue-500 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                                    Application Tracking
                                </li>
                            </ul>
                        </div>
                        <a href="index.jsp" class="mt-8 block w-full text-center bg-slate-700 py-3 px-6 rounded-lg text-white font-medium hover:bg-slate-600 transition">
                            Sign Up for Free
                        </a>
                    </div>

                    <div class="p-8 rounded-2xl border-2 flex flex-col bg-slate-800 border-blue-500 relative transform scale-105">
                        <span class="absolute top-0 right-8 -mt-3 bg-blue-500 text-white text-xs font-bold uppercase px-3 py-1 rounded-full">Most Popular</span>
                        <div class="flex-grow">
                            <h3 class="text-lg font-semibold text-blue-400 uppercase">Student Pro</h3>
                            <p class="text-4xl font-bold text-white my-4">Rs.10<span class="text-base font-normal text-slate-400">/mo</span></p>
                            <p class="text-slate-400 mb-6">Unlock powerful tools to land your dream job.</p>
                            <ul class="space-y-3 text-slate-300">
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-blue-500 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                                    All Basic Features
                                </li>
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-blue-500 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                                    AI Smart Matching
                                </li>
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-blue-500 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                                    Interview Prep Resources
                                </li>
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-blue-500 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                                    Skill Verification Badges
                                </li>
                            </ul>
                        </div>
                        <a href="index.jsp" class="mt-8 block w-full text-center bg-blue-600 py-3 px-6 rounded-lg text-white font-medium hover:bg-blue-700 transition">
                            Get Started
                        </a>
                    </div>

                    <div class="p-8 rounded-2xl border flex flex-col bg-slate-800/50 border-slate-700/50">
                        <div class="flex-grow">
                            <h3 class="text-lg font-semibold text-slate-400 uppercase">Institution</h3>
                            <p class="text-4xl font-bold text-white my-4">Custom</p>
                            <p class="text-slate-400 mb-6">For universities and colleges to manage placements.</p>
                            <ul class="space-y-3 text-slate-300">
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-blue-500 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                                    Admin Dashboard
                                </li>
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-blue-500 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                                    Company Management
                                </li>
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-blue-500 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
                                    Real-time Analytics
                                </li>
                                <li class="flex items-center">
                                    <svg class="w-5 h-5 text-blue-500 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7"></path></svg>
Details & Analytics
                                </li>
                            </ul>
                        </div>
                        <a href="contact" class="mt-8 block w-full text-center bg-slate-700 py-3 px-6 rounded-lg text-white font-medium hover:bg-slate-600 transition">
                            Contact Sales
                        </a>
                    </div>

                </div>
            </div>
        </section>
    </main>

    <footer class="bg-slate-900 border-t border-slate-800">
        <div class="max-w-7xl mx-auto py-8 px-4 sm:px-6 lg:px-8 text-center">
            <p class="text-base text-slate-500">&copy; 2025 PlacePro. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>