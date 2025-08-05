# Multi-stage Dockerfile for Nuxt 4 + pnpm

# --- Build Stage ---
FROM node:18-alpine AS build
WORKDIR /app
# Install pnpm via corepack
RUN corepack enable
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile
COPY . .
RUN pnpm build

# --- Production Stage ---
FROM node:18-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production \
    PORT=3000 \
    HOST=0.0.0.0
COPY --from=build /app/.output ./.output
EXPOSE 3000
CMD ["node", ".output/server/index.mjs"]
