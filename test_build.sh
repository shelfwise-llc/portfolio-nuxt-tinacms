#!/bin/bash

# test_build.sh - Script to test Nuxt.js + TinaCMS build process locally
# This helps identify where the Railway deployment is failing

set -e  # Exit on error

echo "🧪 Testing Nuxt.js + TinaCMS build process locally"
echo "=================================================="

# Set TinaCMS credentials from .env file if it exists
if [ -f .env ]; then
  echo "📄 Loading credentials from .env file"
  source .env
fi

# Check if credentials are set
if [ -z "$NEXT_PUBLIC_TINA_CLIENT_ID" ] || [ -z "$TINA_TOKEN" ]; then
  echo "❌ TinaCMS credentials not found in environment variables"
  echo "Please set NEXT_PUBLIC_TINA_CLIENT_ID and TINA_TOKEN"
  exit 1
fi

# Map to Nuxt environment variable names
export NUXT_PUBLIC_TINA_CLIENT_ID=$NEXT_PUBLIC_TINA_CLIENT_ID
export NUXT_TINA_TOKEN=$TINA_TOKEN

echo "✅ Using TinaCMS credentials:"
echo "  NUXT_PUBLIC_TINA_CLIENT_ID: ${NUXT_PUBLIC_TINA_CLIENT_ID:0:5}..."
echo "  NUXT_TINA_TOKEN: ${NUXT_TINA_TOKEN:0:5}..."

# Clean install
echo "🧹 Cleaning node_modules and installing dependencies"
rm -rf node_modules || true
bun install

# Test TinaCMS build
echo "🔨 Testing TinaCMS build"
bun run tinacms build

# Test Nuxt build
echo "🔨 Testing Nuxt build"
bun run build

echo "✅ Build process completed successfully!"
echo "This confirms that your build should work on Railway."
