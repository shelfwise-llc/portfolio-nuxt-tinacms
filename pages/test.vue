<template>
  <div>
    <!-- Posts section -->
    <main class="container mx-auto min-h-screen max-w-3xl p-8">
      <h1 class="text-4xl font-bold mb-8">Posts</h1>
      <ul class="flex flex-col gap-y-4">
        <li v-for="post in posts" :key="post.slug" class="hover:underline">
          <NuxtLink :to="`/blog/${post.slug}`">
            <h2 class="text-xl font-semibold">{{ post.title }}</h2>
            <p v-if="post.date">{{ new Date(post.date).toLocaleDateString() }}</p>
          </NuxtLink>
        </li>
      </ul>
    </main>
    
    <!-- Test section -->
    <div class="p-8">
      <h1 class="text-3xl font-bold text-red-600">TEST PAGE WORKING!</h1>
      <p class="text-lg mt-4">If you can see this, Nuxt routing is working correctly.</p>
      <NuxtLink to="/" class="text-blue-600 hover:underline">Go back home</NuxtLink>
    </div>
  </div>
</template>

<script setup lang="ts">
import { useTinaContent } from '~/composables/useTinaContent'

const { getAllPosts } = useTinaContent()
const { data: posts } = await useAsyncData('test-posts', () => getAllPosts())
</script>