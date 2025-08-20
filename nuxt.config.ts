// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  modules: [
    '@nuxtjs/tailwindcss',
    '@nuxt/image',
    '@nuxtjs/robots',
    '@nuxtjs/sitemap',
  ],

  css: [
    '~/assets/css/main.css',
  ],

  site: {
    url: process.env.NUXT_PUBLIC_SITE_URL || 'http://localhost:3333'
  },


  nitro: {
    prerender: {
      routes: ['/robots.txt']
    },
    server: {
      port: process.env.PORT || 3333,
      host: '0.0.0.0'
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
