# Use Bun as base
FROM oven/bun:1.1.13

WORKDIR /app

# Copy deps first
COPY package.json bun.lockb ./
RUN bun install --frozen-lockfile

# Copy source
COPY . .

# Build TinaCMS + Nuxt
RUN bun run tinacms build
RUN bun run build

ENV NODE_ENV=production
ENV PORT=3000

EXPOSE 3000
CMD ["bun", "run", "start"]
