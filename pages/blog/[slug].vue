<template>
  <div>
    <section class="pt-24 pb-16 max-w-6xl mx-auto px-6">
      <div v-if="post">
        <div class="mb-8">
          <NuxtLink to="/blog" class="text-blue-600 hover:text-blue-800 transition-colors mb-4 inline-block">
            &larr; Back to all posts
          </NuxtLink>
          <h1 class="text-4xl font-light tracking-tight text-gray-900 mb-4">
            {{ post.title }}
          </h1>
          <div class="text-gray-500 mb-6">
            {{ formatDate(post.date) }}
          </div>
          <div v-if="post.description" class="text-lg text-gray-600 mb-8 max-w-2xl">
            {{ post.description }}
          </div>
        </div>
        <div class="prose prose-lg max-w-none">
          <TinaContent v-if="post.body" :content="post.body" />
        </div>
      </div>
      <div v-else-if="loading">
        <div class="text-center py-12">
          <div class="text-gray-500">Loading...</div>
        </div>
      </div>
      <div v-else>
        <div class="text-center py-12">
          <div class="text-gray-500">Post not found</div>
          <NuxtLink to="/blog" class="text-blue-600 hover:text-blue-800 transition-colors mt-4 inline-block">
            Back to all posts
          </NuxtLink>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { useTinaContent } from '~/composables/useTinaContent'
import { ref } from 'vue'

const route = useRoute()
const { getPost } = useTinaContent()
const { data: postData, loading, error } = await getPost(route.params.slug)
const post = ref(postData)

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

// Set page metadata
useHead(() => ({
  title: post.value?.title ? `${post.value.title} - Alex Cosmas` : 'Blog - Alex Cosmas',
  meta: [
    {
      name: 'description',
      content: post.value?.description || 'Blog post by Alex Cosmas'
    }
  ]
}))
</script>

<style>
.prose h2 {
  font-size: 1.5rem;
  font-weight: 500;
  margin-top: 3rem;
  margin-bottom: 1rem;
}

.prose p {
  margin-bottom: 1rem;
  line-height: 1.625;
  color: rgb(75 85 99);
}

.prose a {
  color: rgb(37 99 235);
  transition-property: color;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-duration: 150ms;
}

.prose a:hover {
  color: rgb(30 64 175);
}

.prose ul {
  margin-bottom: 1rem;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.prose li {
  line-height: 1.625;
  color: rgb(75 85 99);
}
</style>
