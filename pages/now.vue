<template>
  <div>
    <section class="pt-24 pb-16 max-w-4xl mx-auto px-6">
      <div class="mb-8">
        <h1 class="text-4xl font-light tracking-tight text-gray-900 mb-2">What I'm working on now</h1>
        <p class="text-gray-600">A live snapshot of my current projects, learning, and focus areas</p>
      </div>
      
      <!-- Status Indicator -->
      <div class="flex items-center space-x-4 p-4 bg-green-50 border border-green-200 rounded-xl mb-8">
        <div class="w-3 h-3 bg-green-400 rounded-full animate-pulse"></div>
        <span class="text-sm font-medium text-green-800">Currently available for new projects</span>
        <div class="ml-auto">
          <span class="text-xs text-green-600 bg-green-100 px-2 py-1 rounded-full">Open to freelance</span>
        </div>
      </div>

      <!-- Current Focus -->
      <div class="mb-12">
        <h2 class="text-2xl font-medium tracking-tight text-gray-900 mb-6">Primary Focus</h2>
        
        <div class="bg-gradient-to-br from-purple-50 to-pink-50 rounded-2xl p-8 border border-purple-100 relative overflow-hidden">
          <div class="relative">
            <div class="flex items-start justify-between mb-6">
              <div>
                <h3 class="text-xl font-semibold text-gray-900 mb-2">Fintech Platform Redesign</h3>
                <p class="text-gray-600 mb-4">Leading UX design for a digital banking platform serving 100k+ users</p>
              </div>
              <div class="flex items-center space-x-2 text-sm">
                <div class="w-2 h-2 bg-orange-400 rounded-full"></div>
                <span class="text-orange-600 font-medium">In Progress</span>
              </div>
            </div>
            
            <!-- Progress Bar -->
            <div class="mb-6">
              <div class="flex justify-between items-center mb-2">
                <span class="text-sm font-medium text-gray-700">Project Progress</span>
                <span class="text-sm text-gray-600">65%</span>
              </div>
              <div class="w-full bg-gray-200 rounded-full h-2">
                <div class="bg-gradient-to-r from-purple-500 to-pink-500 h-2 rounded-full transition-all duration-500" style="width: 65%"></div>
              </div>
            </div>
            
            <!-- Key Activities -->
            <div class="grid md:grid-cols-2 gap-4">
              <div class="flex items-center space-x-3">
                <div class="w-5 h-5 bg-green-100 rounded-full flex items-center justify-center">
                  <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" class="text-green-600">
                    <path d="M9 12l2 2 4-4"></path>
                  </svg>
                </div>
                <span class="text-sm font-medium text-gray-900">User Research & Analysis</span>
              </div>
              <div class="flex items-center space-x-3">
                <div class="w-5 h-5 bg-green-100 rounded-full flex items-center justify-center">
                  <svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" class="text-green-600">
                    <path d="M9 12l2 2 4-4"></path>
                  </svg>
                </div>
                <span class="text-sm font-medium text-gray-900">Wireframing & Prototyping</span>
              </div>
              <div class="flex items-center space-x-3">
                <div class="w-5 h-5 bg-orange-100 rounded-full flex items-center justify-center">
                  <div class="w-2 h-2 bg-orange-500 rounded-full animate-pulse"></div>
                </div>
                <span class="text-sm font-medium text-gray-900">User Testing & Iteration</span>
              </div>
              <div class="flex items-center space-x-3">
                <div class="w-5 h-5 bg-gray-100 rounded-full flex items-center justify-center">
                  <div class="w-2 h-2 bg-gray-400 rounded-full"></div>
                </div>
                <span class="text-sm font-medium text-gray-900">Final Design & Handoff</span>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Learning & Development -->
      <div class="mb-12">
        <h2 class="text-2xl font-medium tracking-tight text-gray-900 mb-6">Learning & Development</h2>
        
        <div class="grid md:grid-cols-2 gap-6">
          <div class="bg-white p-6 rounded-2xl border border-gray-200">
            <h3 class="text-lg font-semibold text-gray-900 mb-4">Currently Learning</h3>
            <ul class="space-y-3 text-gray-600">
              <li class="flex items-start space-x-3">
                <span class="text-blue-600">•</span>
                <span><strong>Advanced Vue.js 3</strong> - Composition API and performance optimization</span>
              </li>
              <li class="flex items-start space-x-3">
                <span class="text-blue-600">•</span>
                <span><strong>Design Systems</strong> - Building scalable component libraries</span>
              </li>
              <li class="flex items-start space-x-3">
                <span class="text-blue-600">•</span>
                <span><strong>Accessibility</strong> - WCAG 2.1 compliance and inclusive design</span>
              </li>
            </ul>
          </div>
          
          <div class="bg-white p-6 rounded-2xl border border-gray-200">
            <h3 class="text-lg font-semibold text-gray-900 mb-4">Reading</h3>
            <ul class="space-y-3 text-gray-600">
              <li class="flex items-start space-x-3">
                <span class="text-green-600">📖</span>
                <span>"The Design of Everyday Things" by Don Norman</span>
              </li>
              <li class="flex items-start space-x-3">
                <span class="text-green-600">📖</span>
                <span>"Atomic Design" by Brad Frost</span>
              </li>
              <li class="flex items-start space-x-3">
                <span class="text-green-600">📖</span>
                <span>"Don't Make Me Think" by Steve Krug</span>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <!-- Goals -->
      <div>
        <h2 class="text-2xl font-medium tracking-tight text-gray-900 mb-6">Goals for This Quarter</h2>
        
        <div class="grid md:grid-cols-2 gap-6">
          <div class="bg-white p-6 rounded-2xl border border-gray-200">
            <div class="flex items-center space-x-3 mb-3">
              <div class="w-8 h-8 bg-blue-100 rounded-full flex items-center justify-center">
                <span class="text-blue-600 font-medium">1</span>
              </div>
              <h3 class="font-medium text-gray-900">Complete Fintech Platform</h3>
            </div>
            <p class="text-gray-600 text-sm">Launch the redesigned banking experience</p>
          </div>
          
          <div class="bg-white p-6 rounded-2xl border border-gray-200">
            <div class="flex items-center space-x-3 mb-3">
              <div class="w-8 h-8 bg-purple-100 rounded-full flex items-center justify-center">
                <span class="text-purple-600 font-medium">2</span>
              </div>
              <h3 class="font-medium text-gray-900">Publish 3 Case Studies</h3>
            </div>
            <p class="text-gray-600 text-sm">Document recent project work</p>
          </div>
          
          <div class="bg-white p-6 rounded-2xl border border-gray-200">
            <div class="flex items-center space-x-3 mb-3">
              <div class="w-8 h-8 bg-green-100 rounded-full flex items-center justify-center">
                <span class="text-green-600 font-medium">3</span>
              </div>
              <h3 class="font-medium text-gray-900">Learn Advanced Nuxt.js</h3>
            </div>
            <p class="text-gray-600 text-sm">Master server-side rendering and optimization</p>
          </div>
          
          <div class="bg-white p-6 rounded-2xl border border-gray-200">
            <div class="flex items-center space-x-3 mb-3">
              <div class="w-8 h-8 bg-orange-100 rounded-full flex items-center justify-center">
                <span class="text-orange-600 font-medium">4</span>
              </div>
              <h3 class="font-medium text-gray-900">Network Expansion</h3>
            </div>
            <p class="text-gray-600 text-sm">Connect with more designers and developers</p>
          </div>
        </div>
      </div>

      <div class="mt-12 text-center text-sm text-gray-500">
        <em>Last updated: December 15, 2024</em>
      </div>
    </section>
  </div>
</template> 