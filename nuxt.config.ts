// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: [
    '@nuxtjs/tailwindcss',
    '@nuxt/image',
    '@nuxtjs/robots',
    '@nuxtjs/sitemap',
  ],
  
  runtimeConfig: {
    tina: {
      clientId: process.env.NEXT_PUBLIC_TINA_CLIENT_ID,
      token: process.env.TINA_TOKEN,
    },
  },
  
  nitro: {
    prerender: {
      routes: ['/sitemap.xml', '/robots.txt']
    }
  },
  
  image: {
    provider: 'vercel',
    quality: 80,
  },
  
  app: {
    head: {
      title: 'Alex Cosmas - UX Designer & Developer',
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width, initial-scale=1' },
        { name: 'description', content: 'UX Designer and Developer creating meaningful digital experiences' }
      ],
    }
  }
})
