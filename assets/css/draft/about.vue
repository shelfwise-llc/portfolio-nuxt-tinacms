<template>
  <div>
    <section class="pt-24 pb-16 max-w-4xl mx-auto px-6">
      <div v-if="data" class="prose prose-lg max-w-none">
        <h1 class="text-4xl md:text-5xl font-light tracking-tight leading-tight mb-6">
          {{ data.title }}
        </h1>
        <div v-html="data.body"></div>
      </div>
      <div v-else class="text-center py-12">
        <div class="text-gray-500">Loading...</div>
      </div>
    </section>
  </div>
</template>

<script setup>
// This would be replaced with actual TinaCMS data fetching
const data = {
  title: "About Alex Cosmas",
  body: `
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
}
</script>

<style>
.prose h2 {
  @apply text-2xl font-medium mt-8 mb-4;
}

.prose p {
  @apply mb-4 leading-relaxed;
}

.prose ul {
  @apply mb-4 space-y-2;
}

.prose li {
  @apply leading-relaxed;
}
</style> 