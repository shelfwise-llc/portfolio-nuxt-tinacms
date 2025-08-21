# Build stage
FROM node:20-alpine AS build

WORKDIR /app

# Enable pnpm via corepack
RUN corepack enable && corepack prepare pnpm@latest --activate

# Copy package files and install dependencies
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# Copy the rest of the application
COPY . .

# Build the application
RUN pnpm build

# Production stage
FROM node:20-alpine AS production

WORKDIR /app

# Set environment variables
ENV NODE_ENV=production
ENV HOST=0.0.0.0
ENV PORT=3000

# Copy only the built application from the build stage
COPY --from=build /app/.output /app/.output
COPY --from=build /app/package.json /app/package.json

# Expose the port the app will run on
EXPOSE 3000

# Start the application
CMD ["node", ".output/server/index.mjs"]
