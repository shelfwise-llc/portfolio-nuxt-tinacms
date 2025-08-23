<template>
  <div class="tina-content">
    <div v-if="content" v-html="content"></div>
    <slot v-else></slot>
  </div>
</template>

<script setup lang="ts">
defineProps<{
  content?: string
}>()
</script>

<style scoped>
.tina-content :deep(ul) {
  margin-bottom: 1.5rem;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.tina-content :deep(li) {
  line-height: 1.625;
  color: rgb(75 85 99);
}

.tina-content :deep(a) {
  color: rgb(37 99 235);
  transition-property: color;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-duration: 150ms;
}

.tina-content :deep(a:hover) {
  color: rgb(30 64 175);
}
</style>
