<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>How It Works - PlacePro</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white">

    <header class="bg-white border-b border-gray-200 sticky top-0 z-50">
        <nav class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" aria-label="Top">
            <div class="w-full py-5 flex items-center justify-between">
                <div class="flex items-center">
                    <a href="index.jsp" class="flex items-center text-gray-900 text-xl font-bold">
                        <svg class="w-8 h-8 mr-2 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 14v3m4-3v3m4-3v3M3 21h18M3 10h18M3 7l9-4 9 4M4 10h16v11H4V10z"></path></svg>
                        PlacePro
                    </a>
                    
                    <div class="hidden ml-10 space-x-8 lg:block">
                        <a href="features" class="text-base font-medium text-gray-500 hover:text-gray-900">Features</a>
                        <a href="how-it-works" class="text-base font-medium text-blue-600" aria-current="page">How It Works</a>
                        <a href="pricing" class="text-base font-medium text-gray-500 hover:text-gray-900">Pricing</a>
                    </div>
                </div>

                <div class="ml-10 space-x-4">
                    <a href="index.jsp" class="inline-block text-base font-medium text-gray-500 hover:text-gray-900">Login</a>
                    <a href="studentRegistration.jsp" class="inline-block bg-blue-600 py-2 px-4 border border-transparent rounded-md text-base font-medium text-white hover:bg-blue-700">Get Started</a>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <section class="py-20 px-4">
            <div class="max-w-7xl mx-auto">
                
                <div class="text-center mb-16">
                    <h2 class="text-4xl md:text-5xl font-bold text-gray-900 mb-4">How PlacePro Works</h2>
                    <p class="text-gray-600 text-lg max-w-2xl mx-auto">A seamless process connecting talented students with top companies, all managed effortlessly by your institution.</p>
                </div>

                <div class="max-w-4xl mx-auto space-y-16">

                    <div>
                        <h3 class="text-3xl font-bold text-gray-900 mb-8 text-center">For Students</h3>
                        <ol class="space-y-8">
                            <li class="flex items-start">
                                <div class="flex-shrink-0 w-12 h-12 bg-blue-600 text-white rounded-full flex items-center justify-center font-bold text-xl mr-6">1</div>
                                <div>
                                    <h4 class="text-xl font-bold text-gray-900 mb-2">Create Your Profile</h4>
                                    <p class="text-gray-600">Sign up and build a comprehensive profile showcasing your skills, projects, and achievements to stand out to recruiters.</p>
                                </div>
                            </li>
                            <li class="flex items-start">
                                <div class="flex-shrink-0 w-12 h-12 bg-blue-600 text-white rounded-full flex items-center justify-center font-bold text-xl mr-6">2</div>
                                <div>
                                    <h4 class="text-xl font-bold text-gray-900 mb-2">Discover & Apply</h4>
                                    <p class="text-gray-600">Browse job openings and internships. Use our smart filters and AI matching to find the perfect fit and apply with one click.</p>
                                </div>
                            </li>
                            <li class="flex items-start">
                                <div class="flex-shrink-0 w-12 h-12 bg-blue-600 text-white rounded-full flex items-center justify-center font-bold text-xl mr-6">3</div>
                                <div>
                                    <h4 class="text-xl font-bold text-gray-900 mb-2">Track & Get Hired</h4>
                                    <p class="text-gray-600">Manage all your applications in one dashboard. Track your status, prepare for interviews, and land your dream job.</p>
                                </div>
                            </li>
                        </ol>
                    </div>

                    <hr class="border-gray-200">

                    <div>
                        <h3 class="text-3xl font-bold text-gray-900 mb-8 text-center">For Companies</h3>
                        <ol class="space-y-8">
                            <li class="flex items-start">
                                <div class="flex-shrink-0 w-12 h-12 bg-blue-600 text-white rounded-full flex items-center justify-center font-bold text-xl mr-6">1</div>
                                <div>
                                    <h4 class="text-xl font-bold text-gray-900 mb-2">Post Job Openings</h4>
                                    <p class="text-gray-600">Easily create and post job descriptions, specifying the skills and qualifications you’re looking for to reach thousands of eligible candidates.</p>
                                </div>
                            </li>
                            <li class="flex items-start">
                                <div class="flex-shrink-0 w-12 h-12 bg-blue-600 text-white rounded-full flex items-center justify-center font-bold text-xl mr-6">2</div>
                                <div>
                                    <h4 class="text-xl font-bold text-gray-900 mb-2">Find Top Talent</h4>
                                    <p class="text-gray-600">Search our database of verified students. Use advanced filters to shortlist candidates who match your exact requirements.</p>
                                </div>
                            </li>
                            <li class="flex items-start">
                                <div class="flex-shrink-0 w-12 h-12 bg-blue-600 text-white rounded-full flex items-center justify-center font-bold text-xl mr-6">3</div>
                                <div>
                                    <h4 class="text-xl font-bold text-gray-900 mb-2">Manage & Hire</h4>
                                    <p class="text-gray-600">Review applications, schedule interviews, and manage your hiring pipeline from one centralized dashboard.</p>
                                </div>
                            </li>
                        </ol>
                    </div>

                    <hr class="border-gray-200">

                    <div>
                        <h3 class="text-3xl font-bold text-gray-900 mb-8 text-center">For Admins (Institutions)</h3>
                        <ol class="space-y-8">
                            <li class="flex items-start">
                                <div class="flex-shrink-0 w-12 h-12 bg-blue-600 text-white rounded-full flex items-center justify-center font-bold text-xl mr-6">1</div>
                                <div>
                                    <h4 class="text-xl font-bold text-gray-900 mb-2">Oversee Operations</h4>
                                    <p class="text-gray-600">Manage all student data, company registrations, and job postings. Ensure all information is verified and up-to-date.</p>
                                </div>
                            </li>
                            <li class="flex items-start">
                                <div class="flex-shrink-0 w-12 h-12 bg-blue-600 text-white rounded-full flex items-center justify-center font-bold text-xl mr-6">2</div>
                                <div>
                                    <h4 class="text-xl font-bold text-gray-900 mb-2">Track Analytics</h4>
                                    <p class="text-gray-600">Use the real-time analytics dashboard to track placement statistics, see which companies are hiring, and monitor student success rates.</p>
                                </div>
                            </li>
                        </ol>
                    </div>

                </div>
            </div>
        </section>
    </main>

    <footer class="bg-white border-t border-gray-200">
        <div class="max-w-7xl mx-auto py-8 px-4 sm:px-6 lg:px-8 text-center">
            <p class="text-base text-gray-500">&copy; 2025 PlacePro. All rights reserved.</p>
        </div>
    </footer>

</body>
</html>