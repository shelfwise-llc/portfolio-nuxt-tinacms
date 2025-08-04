#!/bin/bash

echo "🚀 Starting deployment..."

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: package.json not found. Make sure you're in the portfolio directory."
    exit 1
fi

# Install dependencies if needed
echo "📦 Installing dependencies..."
pnpm install

# Build TinaCMS
echo "🏗️ Building TinaCMS..."
pnpm tinacms build

# Build Nuxt
echo "🏗️ Building Nuxt..."
pnpm build

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ Build completed successfully!"
    echo ""
    echo "🎉 Your portfolio is ready for deployment!"
    echo ""
    echo "Next steps:"
    echo "1. Push to GitHub: git push origin main"
    echo "2. Deploy to Vercel: npx vercel --prod"
    echo "3. Or deploy to Netlify: Connect your GitHub repo"
    echo ""
    echo "📝 Don't forget to:"
    echo "- Set up TinaCMS credentials in your hosting platform"
    echo "- Configure your custom domain"
    echo "- Set up environment variables"
else
    echo "❌ Build failed. Please check the errors above."
    exit 1
fi 