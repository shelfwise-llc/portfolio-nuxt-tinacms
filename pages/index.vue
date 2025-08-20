<template>
  <div>
    <!-- Hero Section -->
    <section class="pt-24 pb-16 max-w-6xl mx-auto px-6">
      <div class="max-w-3xl">
        <h1 class="text-4xl md:text-5xl font-light tracking-tight leading-tight mb-6">
          Designer, developer, and digital craftsperson
        </h1>
        <p class="text-xl text-gray-600 leading-relaxed mb-8">
          I create meaningful digital experiences at the intersection of design and technology. Here's everything you need to know about my work, interests, and current projects.
        </p>
      </div>
    </section>

    <!-- Quick Summary -->
    <section class="py-16 bg-gray-50">
      <div class="max-w-4xl mx-auto px-6">
        <div class="grid md:grid-cols-2 gap-12 items-center">
          <div>
            <h2 class="text-2xl font-medium tracking-tight mb-6">At a glance</h2>
            <div class="space-y-4 text-gray-600">
              <div class="flex items-start space-x-3">
                <div class="w-5 h-5 mt-0.5 text-blue-600">💻</div>
                <div>
                  <div class="font-medium text-gray-900">Designer/Developer</div>
                  <div class="text-sm">More than a decade, (11years) crafting digital experiences</div>
                </div>
              </div>
              <div class="flex items-start space-x-3">
                <div class="w-5 h-5 mt-0.5 text-blue-600">📍</div>
                <div>
                  <div class="font-medium text-gray-900">Based in Nairobi</div>
                  <div class="text-sm">Working with clients/organizations worldwide</div>
                </div>
              </div>
              <div class="flex items-start space-x-3">
                <div class="w-5 h-5 mt-0.5 text-blue-600">❤️</div>
                <div>
                  <div class="font-medium text-gray-900">Passionate about systems</div>
                  <div class="text-sm">Workflows, user experience and process.</div>
                </div>
              </div>
              <div class="flex items-start space-x-3">
                <div class="w-5 h-5 mt-0.5 text-blue-600">📚</div>
                <div>
                  <div class="font-medium text-gray-900">Currently</div>
                  <div class="text-sm">🌞 9-5: Building Compliance & Goveranance solution for corporate: <br />🌙 6-2: Building a retail insights platform for the Emerging market.</div>
                </div>
              </div>
            </div>
          </div>
          <div class="relative">
            <div class="w-full h-64 bg-gradient-to-br from-blue-500 to-purple-600 rounded-2xl flex items-center justify-center">
              <div class="text-white text-center">
                <div class="text-4xl mb-2">👋</div>
                <div class="text-lg font-medium">Ready to create something amazing?</div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Grid Navigation -->
    <section class="py-16 max-w-6xl mx-auto px-6">
      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        
        <!-- Work -->
        <NuxtLink to="/work" class="group block h-64 bg-gray-50 rounded-2xl overflow-hidden hover:shadow-lg transition-all duration-300">
          <div class="h-full flex flex-col justify-between">
            <div class="p-6">
              <h3 class="text-lg font-medium mb-2 group-hover:text-blue-600 transition-colors">Work</h3>
              <div class="text-gray-600 text-sm">Design + code = ♡</div>
            </div>
            <div class="flex-1 bg-gradient-to-br from-blue-500 to-purple-600 relative overflow-hidden">
              <div class="absolute inset-0 bg-gradient-to-br from-blue-500/80 to-purple-600/80"></div>
            </div>
          </div>
        </NuxtLink>

        <!-- About Me -->
        <NuxtLink to="/about" class="group block h-64 bg-gray-50 rounded-2xl overflow-hidden hover:shadow-lg transition-all duration-300">
          <div class="h-full flex flex-col justify-between">
            <div class="p-6">
              <h3 class="text-lg font-medium mb-2 group-hover:text-blue-600 transition-colors">About me</h3>
              <div class="text-gray-600 text-sm">Personality & Experience</div>
            </div>
            <div class="flex-1 bg-gradient-to-br from-green-500 to-teal-600 relative overflow-hidden">
              <div class="absolute inset-0 bg-gradient-to-br from-green-500/80 to-teal-600/80"></div>
            </div>
          </div>
        </NuxtLink>

        <!-- What I'm doing now -->
        <NuxtLink to="/now" class="group block h-64 bg-gray-50 rounded-2xl overflow-hidden hover:shadow-lg transition-all duration-300">
          <div class="h-full flex flex-col justify-between">
            <div class="p-6">
              <h3 class="text-lg font-medium mb-2 group-hover:text-blue-600 transition-colors">Now</h3>
              <div class="text-gray-600 text-sm">What I'm doing now</div>
            </div>
            <div class="flex-1 bg-gradient-to-br from-orange-500 to-red-600 relative overflow-hidden">
              <div class="absolute inset-0 bg-gradient-to-br from-orange-500/80 to-red-600/80"></div>
            </div>
          </div>
        </NuxtLink>

        <!-- Blog -->
        <NuxtLink to="/blog" class="group block h-64 bg-gray-50 rounded-2xl overflow-hidden hover:shadow-lg transition-all duration-300">
          <div class="h-full flex flex-col justify-between">
            <div class="p-6">
              <h3 class="text-lg font-medium mb-2 group-hover:text-blue-600 transition-colors">Blog</h3>
              <div class="text-gray-600 text-sm">Thoughts I've shared</div>
            </div>
            <div class="flex-1 bg-gradient-to-br from-indigo-500 to-purple-600 relative overflow-hidden">
              <div class="absolute inset-0 bg-gradient-to-br from-indigo-500/80 to-purple-600/80"></div>
            </div>
          </div>
        </NuxtLink>

        <!-- Contact -->
        <NuxtLink to="/contact" class="group block h-64 bg-gray-50 rounded-2xl overflow-hidden hover:shadow-lg transition-all duration-300">
          <div class="h-full flex flex-col justify-between">
            <div class="p-6">
              <h3 class="text-lg font-medium mb-2 group-hover:text-blue-600 transition-colors">Contact</h3>
              <div class="text-gray-600 text-sm">Let's work together</div>
            </div>
            <div class="flex-1 bg-gradient-to-br from-slate-500 to-gray-700 relative overflow-hidden">
              <div class="absolute inset-0 bg-gradient-to-br from-slate-500/80 to-gray-700/80"></div>
            </div>
          </div>
        </NuxtLink>

      </div>
    </section>

    
  </div>
</template> 