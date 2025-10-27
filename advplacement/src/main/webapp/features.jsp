<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="dark"> <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Features - PlacePro</title>
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
                        <a href="features" class="text-base font-medium text-blue-400" aria-current="page">Features</a>
                        <a href="how-it-works" class="text-base font-medium text-slate-400 hover:text-white">How It Works</a>
                        <a href="pricing" class="text-base font-medium text-slate-400 hover:text-white">Pricing</a>
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
                    <h2 class="text-4xl md:text-5xl font-bold text-white mb-4">Why Choose PlacePro?</h2>
                    <p class="text-slate-400 text-lg">Everything you need to succeed in your placement journey</p>
                </div>
                <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <div class="p-8 rounded-2xl border transition-all duration-300 cursor-pointer group bg-slate-800/50 border-slate-700/50 hover:border-slate-600/50 hover:bg-gradient-to-br hover:from-blue-500/20 hover:to-cyan-500/20 hover:transform hover:-translate-y-2">
                        <div class="w-12 h-12 rounded-lg bg-gradient-to-br from-blue-500 to-cyan-500 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-6 h-6 text-white"><polyline points="16 18 22 12 16 6"></polyline><polyline points="8 6 2 12 8 18"></polyline></svg>
                        </div>
                        <h3 class="text-xl font-bold text-white mb-2">Smart Matching</h3>
                        <p class="text-slate-400">AI-powered job recommendations based on your skills and preferences</p>
                    </div>
                    <div class="p-8 rounded-2xl border transition-all duration-300 cursor-pointer group bg-slate-800/50 border-slate-700/50 hover:border-slate-600/50 hover:bg-gradient-to-br hover:from-blue-500/20 hover:to-cyan-500/20 hover:transform hover:-translate-y-2">
                        <div class="w-12 h-12 rounded-lg bg-gradient-to-br from-blue-500 to-cyan-500 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-6 h-6 text-white"><polyline points="23 6 13.5 15.5 8.5 10.5 1 18"></polyline><polyline points="17 6 23 6 23 12"></polyline></svg>
                        </div>
                        <h3 class="text-xl font-bold text-white mb-2">Real-time Analytics</h3>
                        <p class="text-slate-400">Track your progress with detailed insights and performance metrics</p>
                    </div>
                    <div class="p-8 rounded-2xl border transition-all duration-300 cursor-pointer group bg-slate-800/50 border-slate-700/50 hover:border-slate-600/50 hover:bg-gradient-to-br hover:from-blue-500/20 hover:to-cyan-500/20 hover:transform hover:-translate-y-2">
                        <div class="w-12 h-12 rounded-lg bg-gradient-to-br from-blue-500 to-cyan-500 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-6 h-6 text-white"><path d="M16 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="8.5" cy="7" r="4"></circle><path d="M20 21v-2a4 4 0 0 0-4-4h-2"></path><circle cx="17.5" cy="11" r="4"></circle></svg>
                        </div>
                        <h3 class="text-xl font-bold text-white mb-2">Network Building</h3>
                        <p class="text-slate-400">Connect with industry professionals and expand your opportunities</p>
                    </div>
                    <div class="p-8 rounded-2xl border transition-all duration-300 cursor-pointer group bg-slate-800/50 border-slate-700/50 hover:border-slate-600/50 hover:bg-gradient-to-br hover:from-blue-500/20 hover:to-cyan-500/20 hover:transform hover:-translate-y-2">
                        <div class="w-12 h-12 rounded-lg bg-gradient-to-br from-blue-500 to-cyan-500 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-6 h-6 text-white"><circle cx="12" cy="8" r="7"></circle><polyline points="8.21 13.89 7 23 12 17 17 23 15.79 13.88"></polyline></svg>
                        </div>
                        <h3 class="text-xl font-bold text-white mb-2">Skill Verification</h3>
                        <p class="text-slate-400">Showcase verified skills and certifications to employers</p>
                    </div>
                    <div class="p-8 rounded-2xl border transition-all duration-300 cursor-pointer group bg-slate-800/50 border-slate-700/50 hover:border-slate-600/50 hover:bg-gradient-to-br hover:from-blue-500/20 hover:to-cyan-500/20 hover:transform hover:-translate-y-2">
                        <div class="w-12 h-12 rounded-lg bg-gradient-to-br from-blue-500 to-cyan-500 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-6 h-6 text-white"><polygon points="13 2 3 14 12 14 11 22 21 10 12 10 13 2"></polygon></svg>
                        </div>
                        <h3 class="text-xl font-bold text-white mb-2">Interview Prep</h3>
                        <p class="text-slate-400">Access resources and tools to prepare for your interviews</p>
                    </div>
                    <div class="p-8 rounded-2xl border transition-all duration-300 cursor-pointer group bg-slate-800/50 border-slate-700/50 hover:border-slate-600/50 hover:bg-gradient-to-br hover:from-blue-500/20 hover:to-cyan-500/20 hover:transform hover:-translate-y-2">
                        <div class="w-12 h-12 rounded-lg bg-gradient-to-br from-blue-500 to-cyan-500 flex items-center justify-center mb-4 group-hover:scale-110 transition-transform">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="w-6 h-6 text-white"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path></svg>
                        </div>
                        <h3 class="text-xl font-bold text-white mb-2">Career Guidance</h3>
                        <p class="text-slate-400">Expert mentors provide personalized career counseling</p>
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