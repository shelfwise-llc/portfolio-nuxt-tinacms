<template>
  <div>
    <section class="pt-24 pb-16 max-w-6xl mx-auto px-6">
      <div v-if="data">
        <h1 class="text-4xl font-light tracking-tight text-gray-900 mb-4">
          {{ data.title }}
        </h1>
        <p class="text-lg text-gray-600 mb-8 max-w-2xl">I design and build digital tools, often working at the intersection of user needs, business goals, and technical constraints.</p>
        <div class="prose prose-lg max-w-none" v-html="data.body"></div>
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
    <h2>What do you do professionally?</h2>
    <p>Over the last eight years, I've worked across Africa, Europe, and APAC in fintech, compliance, logistics, and edtech — usually as the "glue" between teams, translating ideas into products people can actually use.</p>
    <p>Right now, I'm building a design consultancy to help early-stage founders rapidly prototype their ideas and to modernize legacy systems so they work better (and faster).</p>
    <p>I also write my own front-end code, and lately, I've been diving into Elixir — it's surprisingly fun, and powerful enough to get the job done without unnecessary complexity.</p>
    
    <h2>What makes you tick?</h2>
    <p>I'm happiest when I'm solving problems that feel tangled or overwhelming to others.</p>
    <p>I like bringing structure to the unstructured, turning scattered ideas into clear workflows, and designing tools that save time, reduce friction, and feel effortless to use.</p>
    <p>For me, the sweet spot is where big-picture thinking meets pixel-perfect detail.</p>
    
    <h2>My Strongest Skills</h2>
    <div class="grid md:grid-cols-3 gap-6 mb-8">
      <div class="bg-gray-50 p-6 rounded-xl">
        <h3 class="font-medium text-lg mb-3">System Thinking</h3>
        <p class="text-gray-600 text-sm">Understanding how different parts interact and creating holistic solutions that address the entire ecosystem.</p>
      </div>
      <div class="bg-gray-50 p-6 rounded-xl">
        <h3 class="font-medium text-lg mb-3">Product Thinking</h3>
        <p class="text-gray-600 text-sm">Balancing user needs, business goals, and technical feasibility to create products that deliver real value.</p>
      </div>
      <div class="bg-gray-50 p-6 rounded-xl">
        <h3 class="font-medium text-lg mb-3">Enterprise UX Design</h3>
        <p class="text-gray-600 text-sm">Designing complex systems for enterprise users, balancing functionality with usability.</p>
      </div>
    </div>
    
    <div class="grid md:grid-cols-2 gap-6 mb-8">
      <div class="bg-gray-50 p-6 rounded-xl">
        <h3 class="font-medium text-lg mb-3">Minimizing Design Debt</h3>
        <p class="text-gray-600 text-sm">Creating sustainable design solutions that remain maintainable and scalable over time.</p>
      </div>
      <div class="bg-gray-50 p-6 rounded-xl">
        <h3 class="font-medium text-lg mb-3">Design Systems</h3>
        <p class="text-gray-600 text-sm">Creating and maintaining comprehensive design systems that ensure consistency while allowing for flexibility.</p>
      </div>
    </div>
    
    <div class="bg-blue-50 p-6 rounded-xl mb-12">
      <h3 class="font-medium text-lg mb-3 text-blue-800">Want to know more about how I work?</h3>
      <p class="text-blue-700 mb-4">I've created a detailed guide about my working style, process, and what you can expect when collaborating with me.</p>
      <a href="/manual" class="inline-block px-5 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors">Read My Manual</a>
    </div>
    
    <h2>Skills</h2>
    <div class="grid md:grid-cols-2 gap-6 mb-8">
      <div class="bg-gray-50 p-6 rounded-xl">
        <h3 class="font-medium text-lg mb-3">Design</h3>
        <ul class="space-y-2 text-gray-600">
          <li>UX/UI Design</li>
          <li>Design Systems</li>
          <li>User Research</li>
          <li>Prototyping</li>
        </ul>
      </div>
      <div class="bg-gray-50 p-6 rounded-xl">
        <h3 class="font-medium text-lg mb-3">Development</h3>
        <ul class="space-y-2 text-gray-600">
          <li>Vue.js & Nuxt.js</li>
          <li>React</li>
          <li>TypeScript</li>
          <li>Elixir</li>
        </ul>
      </div>
    </div>
    
    <h2>What else?</h2>
    <p>I'm a lifelong learner — currently enjoying the puzzle-solving beauty of Elixir.</p>
    <p>Offline, I'm into wellness, especially meditation, and I find the same satisfaction in a clear mind as I do in a well-organized design system.</p>
    <p>I like building side projects that scratch my own itches; some make it into the world, others stay as experiments, but all of them teach me something new.</p>`
}
</script>

<style>
.prose h2 {
  @apply text-2xl font-medium mt-12 mb-4;
}

.prose p {
  @apply mb-4 leading-relaxed text-gray-600;
}

.prose ul {
  @apply mb-4 space-y-2;
}

.prose li {
  @apply leading-relaxed;
}
</style>