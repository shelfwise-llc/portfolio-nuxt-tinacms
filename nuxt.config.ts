// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  devtools: { enabled: true },
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
    url: process.env.NUXT_PUBLIC_SITE_URL || 'http://localhost:3000'
  },

  runtimeConfig: {
    public: {
      NUXT_PUBLIC_TINA_CLIENT_ID: process.env.NUXT_PUBLIC_TINA_CLIENT_ID
    },
    tina: {
      clientId: process.env.NUXT_PUBLIC_TINA_CLIENT_ID,
      token: process.env.NUXT_TINA_TOKEN,
    }
  },

  // Add transpile options for TinaCMS
  build: {
    transpile: ['tinacms']
  },

  vite: {
    optimizeDeps: {
      include: ['tinacms']
    },
    build: {
      rollupOptions: {
        external: ['tinacms']
      }
    },
    ssr: {
      noExternal: ['tinacms']
    }
  },

  nitro: {
    prerender: {
      routes: ['/robots.txt']
    },
    server: {
      port: process.env.PORT || 3000,
      host: '0.0.0.0'
    },
    esbuild: {
      options: {
        target: 'esnext'
      }
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
      ]
    }
  },

  typescript: {
    typeCheck: false
  }
})
