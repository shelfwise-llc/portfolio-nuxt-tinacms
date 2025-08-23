# Build stage
FROM node:20-alpine AS build

WORKDIR /app

# Enable pnpm via corepack
RUN corepack enable && corepack prepare pnpm@latest --activate

# Copy package files and install dependencies
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# Install missing tailwind typography dependency
RUN pnpm add @tailwindcss/typography -D

# Copy the rest of the application
COPY . .

# Build TinaCMS and then the application
RUN pnpm tinacms:build

# Production stage
FROM node:20-alpine AS production

WORKDIR /app

# Set environment variables
ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV PORT=3333

# Copy only the built application from the build stage
COPY --from=build /app/.output /app/.output
COPY --from=build /app/public /app/public

# Expose the port the app will run on
EXPOSE 3333

# Start the application
CMD ["node", ".output/server/index.mjs"]
