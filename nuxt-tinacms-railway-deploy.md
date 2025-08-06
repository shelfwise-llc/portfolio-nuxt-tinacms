
✅ Nuxt + TinaCMS + Bun Deployment Checklist for Railway
🔧 1. Environment Variables

Set these in Railway:
Key	Description
NUXT_PUBLIC_TINA_CLIENT_ID	Tina Cloud Project Client ID
NUXT_TINA_TOKEN	Tina Cloud Personal Token

🧠 2. nuxt.config.ts

export default defineNuxtConfig({
  runtimeConfig: {
    public: {
      NUXT_PUBLIC_TINA_CLIENT_ID: process.env.NUXT_PUBLIC_TINA_CLIENT_ID
    },
    tina: {
      token: process.env.NUXT_TINA_TOKEN
    }
  },
  nitro: {
    prerender: {
      routes: ['/sitemap.xml', '/robots.txt']
    },
    server: {
      port: process.env.PORT || 3000,
      host: '0.0.0.0'
    }
  }
})

📦 3. package.json Scripts

"scripts": {
  "build": "tinacms build && nuxt build",
  "dev": "tinacms dev -c \"nuxt dev\"",
  "start": "node .output/server/index.mjs",
  "postinstall": "nuxt prepare"
}

🐳 4. Dockerfile

FROM oven/bun:1.1.13

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python-is-python3 \
    make \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

COPY package.json bun.lockb* ./
RUN bun install --no-frozen-lockfile

COPY . .

ARG NUXT_PUBLIC_TINA_CLIENT_ID
ARG NUXT_TINA_TOKEN
ENV NUXT_PUBLIC_TINA_CLIENT_ID=${NUXT_PUBLIC_TINA_CLIENT_ID}
ENV NUXT_TINA_TOKEN=${NUXT_TINA_TOKEN}

RUN if [ -n "$NUXT_PUBLIC_TINA_CLIENT_ID" ] && [ -n "$NUXT_TINA_TOKEN" ]; then \
    echo "Building TinaCMS with provided credentials" && \
    bun run tinacms build; \
    else \
    echo "Skipping TinaCMS build - credentials not provided"; \
    fi

RUN bun run build

ENV NODE_ENV=production
ENV PORT=3000
ENV HOST=0.0.0.0

EXPOSE 3000
CMD ["bun", "run", "start"]

📂 5. .dockerignore

!.tina/
!.tina/**
!.bun/

🛠 6. railway.toml

[build]
builder = "dockerfile"
dockerfile = "Dockerfile"

[deploy]
healthcheckPath = "/"
healthcheckTimeout = 100
restartPolicyType = "ON_FAILURE"
restartPolicyMaxRetries = 10

[variables]
NODE_ENV = "production"
PORT = "3000"

🚀 Final Command

railway up

Watch logs for:

    ✅ tinacms build success

    ✅ nuxt build success

    ✅ bun run start working on port 3000
