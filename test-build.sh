#!/bin/bash
set -e

echo "🔍 Testing TinaCMS and Nuxt build process..."
echo "----------------------------------------"

# Check for required environment variables
echo "📋 Checking environment variables..."
if [ -z "$NUXT_PUBLIC_TINA_CLIENT_ID" ]; then
  echo "⚠️  Warning: NUXT_PUBLIC_TINA_CLIENT_ID is not set"
fi

if [ -z "$NUXT_TINA_TOKEN" ]; then
  echo "⚠️  Warning: NUXT_TINA_TOKEN is not set"
fi

# Install dependencies if needed
if [ ! -d "node_modules" ]; then
  echo "📦 Installing dependencies..."
  npm install
fi

# Run Nuxt build
echo "🏗️ Building Nuxt application..."
npm run build

echo "✅ Build completed successfully!"
echo "----------------------------------------"
echo "To start the application locally, run: npm run dev"
echo "To test the production build, run: npm run preview"
