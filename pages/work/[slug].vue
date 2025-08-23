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
            <span v-if="caseStudy.client" class="text-xs text-blue-600 bg-blue-100 px-3 py-1 rounded-full font-medium">{{ caseStudy.client }}</span>
            <span v-if="caseStudy.role" class="text-xs text-gray-500">{{ caseStudy.role }}</span>
          </div>
          <div v-if="caseStudy.description" class="text-lg text-gray-600 mb-8 max-w-2xl">
            {{ caseStudy.description }}
          </div>
        </div>
        <div class="prose prose-lg max-w-none">
          <TinaContent v-if="caseStudy.body" :content="caseStudy.body" />
        </div>
      </div>
      <div v-else-if="loading">
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
import { useTinaContent } from '~/composables/useTinaContent'
import { ref } from 'vue'

const route = useRoute()
const { getCaseStudy } = useTinaContent()
const { data: caseStudyData, loading, error } = await getCaseStudy(route.params.slug)
const caseStudy = ref(caseStudyData)

// Set page metadata
useHead(() => ({
  title: caseStudy.value?.title ? `${caseStudy.value.title} - Alex Cosmas` : 'Work - Alex Cosmas',
  meta: [
    {
      name: 'description',
      content: caseStudy.value?.description || 'Case study by Alex Cosmas'
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
