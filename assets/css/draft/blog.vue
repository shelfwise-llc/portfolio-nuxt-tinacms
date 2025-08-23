<template>
  <div>
    <section class="pt-24 pb-16 max-w-4xl mx-auto px-6">
      <div class="mb-12">
        <h1 class="text-4xl font-light tracking-tight text-gray-900 mb-4">Blog</h1>
        <p class="text-lg text-gray-600 mb-8 max-w-2xl">Thoughts on design, technology, and creating meaningful digital experiences</p>
      </div>

      <!-- Featured Post -->
      <div class="mb-16">
        <div class="bg-gradient-to-br from-purple-50 to-pink-50 rounded-3xl overflow-hidden border border-purple-100">
          <div class="p-8 lg:p-12">
            <div class="flex items-center space-x-3 mb-6">
              <span class="text-xs text-purple-600 bg-purple-100 px-3 py-1 rounded-full font-medium">Featured Post</span>
              <span class="text-xs text-gray-500">March 15, 2024</span>
            </div>
            
            <h2 class="text-3xl font-semibold text-gray-900 mb-4 tracking-tight">The Future of Design Systems: Building for Scale and Consistency</h2>
            <p class="text-gray-600 mb-6 text-lg leading-relaxed">As digital products become more complex, design systems have evolved from simple style guides to comprehensive ecosystems that power entire organizations.</p>
            
            <div class="flex items-center space-x-4 mb-8">
              <div class="flex items-center space-x-2 text-sm text-gray-600">
                <span>📖</span>
                <span>8 min read</span>
              </div>
              <div class="flex items-center space-x-2 text-sm text-gray-600">
                <span>🏷️</span>
                <span>Design, Systems</span>
              </div>
            </div>
            
            <NuxtLink to="/blog/design-systems-future" class="gradient-button px-6 py-3 text-sm font-medium text-white rounded-xl transition-all duration-300 inline-block">
              Read Article
            </NuxtLink>
          </div>
        </div>
      </div>

      <!-- Blog Posts Grid -->
      <div class="grid md:grid-cols-2 gap-8">
        <article v-for="post in posts" :key="post.id" class="bg-white rounded-2xl border border-gray-200 overflow-hidden hover:shadow-lg transition-all duration-300">
          <div class="aspect-[16/9] bg-gradient-to-br from-gray-50 to-gray-100 flex items-center justify-center">
            <div class="text-center">
              <div class="w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mx-auto mb-3">
                <span class="text-gray-600 text-xl">{{ post.icon }}</span>
              </div>
              <div class="text-gray-600 text-sm">{{ post.category }}</div>
            </div>
          </div>
          <div class="p-6">
            <div class="flex items-center space-x-2 mb-3">
              <span class="text-xs text-gray-500">{{ post.date }}</span>
              <span class="text-xs text-blue-600 bg-blue-100 px-2 py-1 rounded-full">{{ post.category }}</span>
            </div>
            <h3 class="text-lg font-semibold text-gray-900 mb-2">{{ post.title }}</h3>
            <p class="text-gray-600 text-sm mb-4">{{ post.excerpt }}</p>
            <div class="flex items-center justify-between">
              <div class="flex items-center space-x-2 text-sm text-gray-600">
                <span>📖</span>
                <span>{{ post.readTime }}</span>
              </div>
              <NuxtLink :to="post.link" class="text-sm font-medium text-blue-600 hover:text-blue-700 transition-colors">
                Read More →
              </NuxtLink>
            </div>
          </div>
        </article>
      </div>

      <!-- Newsletter Signup -->
      <div class="mt-20 bg-gradient-to-br from-blue-50 to-indigo-50 rounded-2xl p-8 border border-blue-100">
        <div class="text-center">
          <h3 class="text-2xl font-medium text-gray-900 mb-4">Stay Updated</h3>
          <p class="text-gray-600 mb-6 max-w-md mx-auto">Get notified when I publish new articles about design, technology, and digital experiences.</p>
          <div class="flex flex-col sm:flex-row gap-4 max-w-md mx-auto">
            <input 
              type="email" 
              placeholder="Enter your email" 
              class="flex-1 px-4 py-3 border border-gray-300 rounded-xl focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
            >
            <button class="gradient-button px-6 py-3 text-sm font-medium text-white rounded-xl transition-all duration-300">
              Subscribe
            </button>
          </div>
          <p class="text-xs text-gray-500 mt-4">No spam, unsubscribe at any time.</p>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
const posts = [
  {
    id: 1,
    title: 'The Future of Design Systems',
    excerpt: 'How design systems are evolving to power entire organizations and enable better collaboration.',
    category: 'Design',
    icon: '🎨',
    date: 'March 15, 2024',
    readTime: '8 min read',
    link: '/blog/design-systems-future'
  },
  {
    id: 2,
    title: 'User Research Methods That Actually Work',
    excerpt: 'Practical techniques for conducting effective user research that leads to better design decisions.',
    category: 'Research',
    icon: '🔍',
    date: 'February 28, 2024',
    readTime: '12 min read',
    link: '/blog/user-research-methods'
  },
  {
    id: 3,
    title: 'Building Accessible Web Applications',
    excerpt: 'A comprehensive guide to creating web applications that work for everyone, regardless of ability.',
    category: 'Development',
    icon: '♿',
    date: 'February 15, 2024',
    readTime: '15 min read',
    link: '/blog/accessible-web-apps'
  },
  {
    id: 4,
    title: 'The Psychology of Color in UX Design',
    excerpt: 'Understanding how color choices impact user perception and behavior in digital interfaces.',
    category: 'Design',
    icon: '🌈',
    date: 'January 30, 2024',
    readTime: '10 min read',
    link: '/blog/color-psychology-ux'
  }
]
</script>

<style>
.gradient-button {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.gradient-button:hover {
  background: linear-gradient(135deg, #5a6fd8 0%, #6a4190 100%);
}
</style> 