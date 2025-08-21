<template>
  <div class="sanity-content">
    <PortableText :value="blocks" />
  </div>
</template>

<script setup lang="ts">
import { PortableText } from '@portabletext/vue'
import type { PortableTextBlock } from '@portabletext/types'

defineProps<{
  blocks: PortableTextBlock[]
}>()
</script>

<style scoped>
.sanity-content :deep(ul) {
  margin-bottom: 1.5rem;
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.sanity-content :deep(li) {
  line-height: 1.625;
  color: rgb(75 85 99);
}

.sanity-content :deep(a) {
  color: rgb(37 99 235);
  transition-property: color;
  transition-timing-function: cubic-bezier(0.4, 0, 0.2, 1);
  transition-duration: 150ms;
}

.sanity-content :deep(a:hover) {
  color: rgb(30 64 175);
}
</style>
