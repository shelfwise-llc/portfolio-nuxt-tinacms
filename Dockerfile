FROM node:20-bullseye

WORKDIR /app

ENV NODE_ENV=production
ENV PORT=3333
ENV HOST=0.0.0.0

# Enable pnpm via corepack
RUN corepack enable && corepack prepare pnpm@latest --activate

# Install deps using pnpm lockfile
COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

# Copy source and build
COPY . .
RUN pnpm build

EXPOSE 3333
CMD ["node", ".output/server/index.mjs"]
