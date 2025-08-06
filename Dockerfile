# Multi-stage build for Nuxt.js + TinaCMS with proper native module handling
# Using Node.js for build stage to handle native modules better

# Build stage
FROM node:20-bullseye

WORKDIR /app

# Debug: Confirm Node and yarn versions
RUN echo "Using Node version:" && node --version
RUN echo "Using yarn version:" && yarn --version

# Install native module dependencies for better-sqlite3
RUN apt-get update && apt-get install -y --no-install-recommends \
  python3 \
  python3-dev \
  make \
  gcc \
  g++ \
  sqlite3 \
  && rm -rf /var/lib/apt/lists/*

# Copy package files
COPY package.json yarn.lock* ./

# Install dependencies with yarn (excellent native module support)
RUN yarn install --frozen-lockfile

# Copy app source
COPY . .

# Set environment vars (TinaCMS)
ARG NUXT_PUBLIC_TINA_CLIENT_ID
ARG NUXT_TINA_TOKEN
ENV NUXT_PUBLIC_TINA_CLIENT_ID=${NUXT_PUBLIC_TINA_CLIENT_ID}
ENV NUXT_TINA_TOKEN=${NUXT_TINA_TOKEN}

# Run TinaCMS build only if env vars are present
RUN if [ -n "$NUXT_PUBLIC_TINA_CLIENT_ID" ] && [ -n "$NUXT_TINA_TOKEN" ]; then \
    echo "Running TinaCMS build..." && \
    yarn run tinacms build; \
    else \
    echo "Skipping TinaCMS build"; \
    fi

# Build Nuxt
RUN yarn run build

ENV NODE_ENV=production
ENV PORT=3000
ENV HOST=0.0.0.0

EXPOSE 3000
CMD ["node", "node_modules/.bin/nuxt", "start"]
