<template>
  <div>
    <!-- Navigation -->
    <nav class="fixed top-0 left-0 right-0 z-50 bg-white/80 backdrop-blur-sm border-b border-gray-100">
      <div class="max-w-6xl mx-auto px-6 py-4 flex items-center justify-between">
        <NuxtLink to="/" class="text-lg font-medium tracking-tight hover:text-gray-600 transition-colors">
          ALEX COSMAS
        </NuxtLink>
        <div class="hidden md:flex items-center space-x-8 text-sm">
          <NuxtLink to="/work" class="text-gray-600 hover:text-gray-900 transition-colors">Work</NuxtLink>
          <NuxtLink to="/blog" class="text-gray-600 hover:text-gray-900 transition-colors">Blog</NuxtLink>
          <NuxtLink to="/about" class="text-gray-600 hover:text-gray-900 transition-colors">About</NuxtLink>
          <NuxtLink to="/now" class="text-gray-600 hover:text-gray-900 transition-colors">Now</NuxtLink>
          <NuxtLink to="/contact" class="gradient-button px-4 py-2 text-sm font-medium text-white rounded-full transition-all duration-300">
            Contact
          </NuxtLink>
        </div>
      </div>
    </nav>

    <!-- Main Content -->
    <main class="pt-16">
      <NuxtPage />
    </main>

    <!-- Footer -->
    <footer class="border-t border-gray-100 px-6 py-8 mt-20">
      <div class="max-w-6xl mx-auto flex flex-col sm:flex-row items-center justify-between text-sm text-gray-500">
        <div>© 2024 Alex Cosmas. All rights reserved.</div>
        <div class="flex items-center space-x-6 mt-4 sm:mt-0">
          <a href="#" class="hover:text-gray-900 transition-colors">Privacy</a>
          <a href="#" class="hover:text-gray-900 transition-colors">Terms</a>
        </div>
      </div>
    </footer>
  </div>
</template>

<style>
.gradient-button {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.gradient-button:hover {
  background: linear-gradient(135deg, #5a6fd8 0%, #6a4190 100%);
}
</style> 