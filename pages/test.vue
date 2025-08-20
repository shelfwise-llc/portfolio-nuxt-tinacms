<template>
  <main class="container mx-auto min-h-screen max-w-3xl p-8">
    <h1 class="text-4xl font-bold mb-8">Posts</h1>
    <ul class="flex flex-col gap-y-4">
      <li v-for="post in posts" :key="post._id" class="hover:underline">
        <NuxtLink :to="`/blog/${post.slug?.current}`">
          <h2 class="text-xl font-semibold">{{ post.title }}</h2>
          <p v-if="post.publishedAt">{{ new Date(post.publishedAt).toLocaleDateString() }}</p>
        </NuxtLink>
      </li>
    </ul>
  </main>
  
</template>

<script setup lang="ts">
import type { SanityDocument } from '@sanity/client'

const POSTS_QUERY = groq`*[_type == "post" && defined(slug.current)]|order(publishedAt desc)[0...12]{_id, title, slug, publishedAt}`

const { data: posts } = await useSanityQuery<SanityDocument[]>(POSTS_QUERY)
</script>

<template>
  <div class="p-8">
    <h1 class="text-3xl font-bold text-red-600">TEST PAGE WORKING!</h1>
    <p class="text-lg mt-4">If you can see this, Nuxt routing is working correctly.</p>
    <NuxtLink to="/" class="text-blue-600 hover:underline">Go back home</NuxtLink>
  </div>
</template> 