<template>
  <div>
    <section class="pt-24 pb-16 max-w-6xl mx-auto px-6">
      <div v-if="caseStudy">
        <div class="mb-8">
          <NuxtLink to="/work" class="text-blue-600 hover:text-blue-800 transition-colors mb-4 inline-block">
            &larr; Back to all work
          </NuxtLink>
          <h1 class="text-4xl font-light tracking-tight text-gray-900 mb-4">
            {{ caseStudy.title }}
          </h1>
          <div class="flex items-center space-x-3 mb-6">
            <span v-if="caseStudy.category" class="text-xs text-blue-600 bg-blue-100 px-3 py-1 rounded-full font-medium">{{ caseStudy.category }}</span>
            <span class="text-xs text-gray-500">{{ formatDate(caseStudy.publishedAt) }}</span>
          </div>
          <div v-if="caseStudy.excerpt" class="text-lg text-gray-600 mb-8 max-w-2xl">
            {{ caseStudy.excerpt }}
          </div>
        </div>
        <div class="prose prose-lg max-w-none">
          <SanityContent v-if="caseStudy.content" :blocks="caseStudy.content" />
        </div>
      </div>
      <div v-else-if="pending">
        <div class="text-center py-12">
          <div class="text-gray-500">Loading...</div>
        </div>
      </div>
      <div v-else>
        <div class="text-center py-12">
          <div class="text-gray-500">Case study not found</div>
          <NuxtLink to="/work" class="text-blue-600 hover:text-blue-800 transition-colors mt-4 inline-block">
            Back to all work
          </NuxtLink>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { useSanityContent } from '~/composables/useSanityContent'

const route = useRoute()
const { getCaseStudy } = useSanityContent()
const { data: caseStudy, pending, error } = await useAsyncData(
  `case-study-${route.params.slug}`,
  () => getCaseStudy(route.params.slug)
)

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
  title: caseStudy.value?.title ? `${caseStudy.value.title} - Alex Cosmas` : 'Work - Alex Cosmas',
  meta: [
    {
      name: 'description',
      content: caseStudy.value?.excerpt || 'Case study by Alex Cosmas'
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
