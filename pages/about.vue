<template>
  <div>
    <section class="pt-24 pb-16 max-w-6xl mx-auto px-6">
      <div v-if="page">
        <h1 class="text-4xl font-light tracking-tight text-gray-900 mb-4">
          {{ page.title }}
        </h1>
        <p class="text-lg text-gray-600 mb-8 max-w-2xl">I design and build digital tools, often working at the intersection of user needs, business goals, and technical constraints.</p>
        <div class="prose prose-lg max-w-none">
          <SanityContent v-if="page.content" :blocks="page.content" />
        </div>
      </div>
      <div v-else-if="pending">
        <div class="text-center py-12">
          <div class="text-gray-500">Loading...</div>
        </div>
      </div>
      <div v-else>
        <div class="text-center py-12">
          <div class="text-gray-500">No content found. Please create an "about" page in Sanity.</div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { useSanityContent } from '~/composables/useSanityContent'

const { getPage } = useSanityContent()
const { data: page, pending, error } = await useAsyncData('about-page', () => getPage('about'))

// Fallback content if no Sanity data is available yet
if (!page.value) {
  console.warn('About page not found in Sanity. Please create it in the Sanity Studio.')
}
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