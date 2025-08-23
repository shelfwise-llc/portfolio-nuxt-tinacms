<template>
  <div>
    <section class="pt-24 pb-16 max-w-6xl mx-auto px-6">
      <div class="mb-12">
        <h1 class="text-4xl font-light tracking-tight text-gray-900 mb-4">Selected Work</h1>
        <p class="text-lg text-gray-600 mb-8 max-w-2xl">Case studies, experiments, and product design work spanning fintech, healthcare, and consumer applications</p>
        
        <!-- Filter Tabs -->
        <div class="flex flex-wrap gap-2 mb-12">
          <button 
            v-for="filter in filters" 
            :key="filter.value"
            @click="activeFilter = filter.value"
            :class="[
              'px-4 py-2 text-sm font-medium rounded-full transition-all duration-300',
              activeFilter === filter.value 
                ? 'bg-blue-600 text-white' 
                : 'bg-gray-100 text-gray-700 hover:bg-gray-200'
            ]"
          >
            {{ filter.label }}
          </button>
        </div>
      </div>

      <!-- Featured Case Study -->
      <div class="mb-20">
        <div class="relative bg-gradient-to-br from-blue-50 to-indigo-50 rounded-3xl overflow-hidden border border-blue-100">
          <div class="relative grid lg:grid-cols-2 gap-8 p-8 lg:p-12">
            <div class="flex flex-col justify-center">
              <div class="flex items-center space-x-3 mb-6">
                <span class="text-xs text-blue-600 bg-blue-100 px-3 py-1 rounded-full font-medium">Featured Case Study</span>
                <span class="text-xs text-gray-500">{{ featuredWork?.year || '2024' }}</span>
              </div>
              
              <h2 class="text-3xl font-semibold text-gray-900 mb-4 tracking-tight">{{ featuredWork?.title || 'Redesigning Payment Flows for 2M+ Users' }}</h2>
              <p class="text-gray-600 mb-6 text-lg leading-relaxed">{{ featuredWork?.description || 'How we reduced checkout abandonment by 34% and increased conversion rates through user research, iterative design, and A/B testing.' }}</p>
              
              <div class="flex flex-wrap gap-4 mb-8">
                <div class="flex items-center space-x-2 text-sm text-gray-600">
                  <span>👥</span>
                  <span>2.1M Users</span>
                </div>
                <div class="flex items-center space-x-2 text-sm text-gray-600">
                  <span>📈</span>
                  <span>34% Improvement</span>
                </div>
                <div class="flex items-center space-x-2 text-sm text-gray-600">
                  <span>⏱️</span>
                  <span>6 Months</span>
                </div>
              </div>
              
              <div class="flex items-center space-x-4">
                <NuxtLink :to="featuredWork?.link || '/work/payment-flows-redesign'" class="gradient-button px-6 py-3 text-sm font-medium text-white rounded-xl transition-all duration-300">
                  View Case Study
                </NuxtLink>
                <a href="#" class="text-sm font-medium text-gray-600 hover:text-gray-900 transition-colors flex items-center space-x-2">
                  <span>Live Product</span>
                  <span>↗</span>
                </a>
              </div>
            </div>
            
            <div class="relative">
              <div class="aspect-[4/3] bg-white rounded-2xl shadow-xl border border-gray-200 overflow-hidden">
                <div class="h-full bg-gradient-to-br from-gray-50 to-gray-100 flex items-center justify-center">
                  <div class="text-center">
                    <div class="w-16 h-16 bg-blue-100 rounded-2xl flex items-center justify-center mx-auto mb-4">
                      <span class="text-blue-600 text-2xl">💳</span>
                    </div>
                    <div class="text-gray-600 text-sm">Payment Flow Redesign</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Other Projects Grid -->
      <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
        <div v-for="project in filteredProjects" :key="project._sys.filename" class="bg-white rounded-2xl border border-gray-200 overflow-hidden hover:shadow-lg transition-all duration-300">
          <div class="aspect-[16/9] bg-gradient-to-br from-gray-50 to-gray-100 flex items-center justify-center">
            <div class="text-center">
              <div class="w-12 h-12 bg-gray-100 rounded-xl flex items-center justify-center mx-auto mb-3">
                <span class="text-gray-600 text-xl">{{ project.icon || '📝' }}</span>
              </div>
              <div class="text-gray-600 text-sm">{{ project.client || 'Case Study' }}</div>
            </div>
          </div>
          <div class="p-6">
            <div class="flex items-center space-x-2 mb-3">
              <span class="text-xs text-gray-500">{{ project.year || '2024' }}</span>
              <span class="text-xs text-blue-600 bg-blue-100 px-2 py-1 rounded-full">{{ project.role || 'Design' }}</span>
            </div>
            <h3 class="text-lg font-semibold text-gray-900 mb-2">{{ project.title }}</h3>
            <p class="text-gray-600 text-sm mb-4">{{ project.description || 'View this case study to learn more...' }}</p>
            <div class="flex items-center justify-between">
              <div class="flex items-center space-x-2 text-sm text-gray-600">
                <span>⏱️</span>
                <span>{{ project.duration || '3 months' }}</span>
              </div>
              <NuxtLink :to="project.link" class="text-sm font-medium text-blue-600 hover:text-blue-700 transition-colors">
                View Project →
              </NuxtLink>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { useTinaContent } from '~/composables/useTinaContent'
import { ref, computed } from 'vue'

const activeFilter = ref('all')

const filters = [
  { label: 'All Work', value: 'all' },
  { label: 'Case Studies', value: 'case-study' },
  { label: 'Experiments', value: 'experiment' },
  { label: 'Product Design', value: 'product' },
  { label: 'Research', value: 'research' }
]

// Fetch case studies from TinaCMS
const { getAllCaseStudies } = useTinaContent()
const { data: caseStudies, pending } = await useAsyncData('case-studies', () => getAllCaseStudies())

// Get featured case study (first one marked as featured or first in the list)
const featuredCaseStudy = computed(() => {
  if (caseStudies.value && caseStudies.value.length > 0) {
    const featured = caseStudies.value.find(study => study.featured)
    return featured || caseStudies.value[0]
  }
  return null
})

// Variables already declared above

// Transform TinaCMS case studies to the format needed for the UI
const projects = computed(() => {
  if (!caseStudies.value || caseStudies.value.length === 0) {
    // Fallback data if no case studies are found in TinaCMS
    return [
      {
        _sys: { filename: 'gen-z-banking' },
        title: 'Gen Z Banking Behaviors',
        description: 'Comprehensive research study exploring how Gen Z users interact with digital banking products.',
        role: 'Research',
        client: 'User Research',
        icon: '🔍',
        year: '2024',
        duration: '4 months',
        link: '/work/gen-z-banking',
        filter: 'research'
      },
      {
        _sys: { filename: 'interactive-data-viz' },
        title: 'Interactive Data Visualization',
        description: 'Creating engaging data visualizations for complex financial information.',
        role: 'Experiment',
        client: 'Data Viz',
        icon: '📊',
        year: '2024',
        duration: '2 months',
        link: '/work/interactive-data-viz',
        filter: 'experiment'
      },
      {
        _sys: { filename: 'healthcare-app' },
        title: 'Healthcare App Redesign',
        description: 'Redesigning a healthcare application for better patient engagement and accessibility.',
        role: 'Product Design',
        client: 'Healthcare',
        icon: '🏥',
        year: '2023',
        duration: '8 months',
        link: '/work/healthcare-app',
        filter: 'product'
      }
    ]
  }
  
  return caseStudies.value
    .filter(study => !study.featured) // Filter out featured case studies
    .map(study => ({
      ...study,
      link: `/work/${study._sys.filename}`,
      filter: study.role ? study.role.toLowerCase() : 'case-study'
    }))
})

// Get the featured case study
const featuredWork = computed(() => {
  if (featuredCaseStudy.value) {
    return {
      title: featuredCaseStudy.value.title,
      description: featuredCaseStudy.value.description || 'How we reduced checkout abandonment by 34% and increased conversion rates through user research, iterative design, and A/B testing.',
      year: featuredCaseStudy.value.year || '2024',
      link: `/work/${featuredCaseStudy.value.slug}`
    }
  }
  
  // Fallback if no featured case study is found
  return {
    title: 'Redesigning Payment Flows for 2M+ Users',
    description: 'How we reduced checkout abandonment by 34% and increased conversion rates through user research, iterative design, and A/B testing.',
    year: '2024',
    link: '/work/payment-flows-redesign'
  }
})

const filteredProjects = computed(() => {
  if (activeFilter.value === 'all') {
    return projects.value
  }
  return projects.value.filter(project => project.filter === activeFilter.value)
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