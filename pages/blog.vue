<template>
  <div>
    <section class="pt-24 pb-16 max-w-4xl mx-auto px-6">
      <div class="mb-12">
        <h1 class="text-4xl font-light tracking-tight text-gray-900 mb-4">Blog</h1>
        <p class="text-lg text-gray-600 mb-8 max-w-2xl">Thoughts on design, technology, and creating meaningful digital experiences</p>
      </div>

      <!-- Featured Post -->
      <div v-if="loading" class="mb-16 text-center py-12">
        <div class="text-gray-500">Loading posts...</div>
      </div>
      
      <div v-else-if="featuredPost" class="mb-16">
        <div class="bg-gradient-to-br from-purple-50 to-pink-50 rounded-3xl overflow-hidden border border-purple-100">
          <div class="p-8 lg:p-12">
            <div class="flex items-center space-x-3 mb-6">
              <span class="text-xs text-purple-600 bg-purple-100 px-3 py-1 rounded-full font-medium">Featured Post</span>
              <span class="text-xs text-gray-500">{{ formatDate(featuredPost.date) }}</span>
            </div>
            
            <h2 class="text-3xl font-semibold text-gray-900 mb-4 tracking-tight">{{ featuredPost.title }}</h2>
            <p class="text-gray-600 mb-6 text-lg leading-relaxed">{{ featuredPost.description }}</p>
            
            <div class="flex items-center space-x-4 mb-8">
              <div class="flex items-center space-x-2 text-sm text-gray-600">
                <span>📖</span>
                <span>{{ featuredPost.readTime || '5 min read' }}</span>
              </div>
              <div class="flex items-center space-x-2 text-sm text-gray-600">
                <span>🏷️</span>
                <span>{{ featuredPost.tags?.[0] || 'Design' }}</span>
              </div>
            </div>
            
            <NuxtLink :to="featuredPost.link" class="gradient-button px-6 py-3 text-sm font-medium text-white rounded-xl transition-all duration-300 inline-block">
              Read Article
            </NuxtLink>
          </div>
        </div>
      </div>
      
      <div v-else-if="posts.length === 0" class="mb-16 text-center py-12">
        <div class="text-gray-500">No posts found. Create some in TinaCMS!</div>
      </div>

      <!-- Blog Posts Grid -->
      <div v-if="regularPosts.length > 0" class="grid md:grid-cols-2 gap-8">
        <article v-for="post in regularPosts" :key="post._sys.filename" class="bg-white rounded-2xl border border-gray-200 overflow-hidden hover:shadow-lg transition-all duration-300">
          <div class="aspect-[16/9] bg-gradient-to-br from-gray-50 to-gray-100 flex items-center justify-center">
            <div class="text-center">
              <div class="w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mx-auto mb-3">
                <span class="text-gray-600 text-xl">{{ post.icon || '📝' }}</span>
              </div>
              <div class="text-gray-600 text-sm">{{ post.tags?.[0] || 'Design' }}</div>
            </div>
          </div>
          <div class="p-6">
            <div class="flex items-center space-x-2 mb-3">
              <span class="text-xs text-gray-500">{{ formatDate(post.date) }}</span>
              <span class="text-xs text-blue-600 bg-blue-100 px-2 py-1 rounded-full">{{ post.tags?.[0] || 'Design' }}</span>
            </div>
            <h3 class="text-lg font-semibold text-gray-900 mb-2">{{ post.title }}</h3>
            <p class="text-gray-600 text-sm mb-4">{{ post.description || 'Read this article to learn more...' }}</p>
            <div class="flex items-center justify-between">
              <div class="flex items-center space-x-2 text-sm text-gray-600">
                <span>📖</span>
                <span>{{ post.readTime || '5 min read' }}</span>
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
import { useTinaContent } from '~/composables/useTinaContent'
import { ref, computed } from 'vue'

const { getAllPosts } = useTinaContent()
const { data: postsData, loading } = await getAllPosts()
const tinaPosts = ref(postsData)

// Format date for display
const formatDate = (dateString) => {
  if (!dateString) return ''
  const date = new Date(dateString)
  return new Intl.DateTimeFormat('en-US', {
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  }).format(date)
}

// Transform TinaCMS posts to the format needed for the UI
const posts = computed(() => {
  if (!tinaPosts.value || tinaPosts.value.length === 0) {
    return []
  }
  
  return tinaPosts.value.map(post => ({
    ...post,
    link: `/blog/${post._sys.filename}`
  }))
})

// Get the featured post (first post) and remove it from the regular posts list
const featuredPost = computed(() => {
  if (posts.value.length > 0) {
    return posts.value[0]
  }
  return null
})

// Get all non-featured posts
const regularPosts = computed(() => {
  if (posts.value.length <= 1) {
    return []
  }
  return posts.value.slice(1)
})
</script>

<style>
.gradient-button {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.gradient-button:hover {
  background: linear-gradient(135deg, #5a6fd8 0%, #6a4190 100%);
}
</style>