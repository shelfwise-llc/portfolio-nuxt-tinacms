<template>
  <div>
    <section class="pt-24 pb-16 max-w-4xl mx-auto px-6">
      <div v-if="page" class="prose prose-lg max-w-none">
        <h1 class="text-4xl md:text-5xl font-light tracking-tight leading-tight mb-6">
          {{ page.title }}
        </h1>
        <TinaContent v-if="page.body" :content="page.body" />
      </div>
      <div v-else-if="pending" class="text-center py-12">
        <div class="text-gray-500">Loading...</div>
      </div>
      <div v-else class="prose prose-lg max-w-none">
        <!-- Static fallback content -->
        <h1 class="text-4xl md:text-5xl font-light tracking-tight leading-tight mb-6">
          About Alex Cosmas
        </h1>
        <div v-html="fallbackContent"></div>
      </div>
    </section>
  </div>
</template>

<script setup>
import { useTinaContent } from '~/composables/useTinaContent'

const { getPage } = useTinaContent()
const { data: page, pending, error } = await useAsyncData('about-page', () => getPage('about'))

// Fallback content if no Tina data is available
const fallbackContent = `
  <p>I'm a designer, developer, and digital craftsperson creating meaningful digital experiences at the intersection of design and technology.</p>
  
  <h2>At a glance</h2>
  <ul>
    <li><strong>Full-stack Designer & Developer</strong> - 10+ years crafting digital experiences</li>
    <li><strong>Based in Amsterdam</strong> - Working with clients worldwide</li>
    <li><strong>Passionate about systems</strong> - Design systems, accessibility, and performance</li>
    <li><strong>Currently reading</strong> - "The Design of Everyday Things" by Don Norman</li>
  </ul>
  
  <h2>Experience</h2>
  <p>I specialize in creating user-centered digital experiences that combine beautiful design with robust functionality. My work spans across fintech, healthcare, and consumer applications, always with a focus on accessibility and performance.</p>
  
  <h2>Skills</h2>
  <ul>
    <li><strong>Design</strong>: UX/UI Design, Design Systems, User Research, Prototyping</li>
    <li><strong>Development</strong>: Vue.js, Nuxt.js, React, TypeScript, Node.js</li>
    <li><strong>Tools</strong>: Figma, Sketch, Adobe Creative Suite, VS Code</li>
    <li><strong>Process</strong>: Agile, Design Thinking, User-Centered Design</li>
  </ul>
  
  <h2>Philosophy</h2>
  <p>I believe that great digital experiences come from the perfect balance of form and function. Every pixel and line of code should serve a purpose, creating interfaces that are not just beautiful, but intuitive and accessible to everyone.</p>
`

if (!page.value) {
  console.warn('About page not found in Tina CMS. Using static fallback content.')
}
</script>

<style>
.prose h2 {
  font-size: 1.5rem;
  font-weight: 500;
  margin-top: 2rem;
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