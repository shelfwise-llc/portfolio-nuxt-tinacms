#!/bin/bash

# railway_deploy.sh - Nuxt.js + TinaCMS deployment script for Railway
# Optimized for Bun runtime and TinaCMS Cloud integration

set -e  # Exit on error

echo "🚀 Portfolio Nuxt.js + TinaCMS Railway Deployment"
echo "==============================================="

# Check if Railway CLI is installed
if ! command -v railway &> /dev/null; then
    echo "❌ Railway CLI is not installed. Please install it first."
    echo "npm i -g @railway/cli"
    exit 1
fi

# Check if we're logged in to Railway
railway whoami || {
    echo "❌ Not logged in to Railway. Please run 'railway login' first."
    exit 1
}

echo "✅ Railway CLI is available and logged in"

# Link to the correct project
echo "🔗 Linking to Railway project..."
railway link --project kind-acceptance --environment production --service portfolio-nuxt-tinacms

# Docker is recommended for Nuxt.js + TinaCMS to avoid build issues
echo ""
echo "📋 Recommended deployment method: Docker-based deployment"
echo "This ensures TinaCMS builds correctly and avoids connection issues"
echo ""
echo "Select deployment method:"
echo "1) Docker-based deployment (recommended for TinaCMS)"
echo "2) Direct source deployment (may have TinaCMS build issues)"
echo "3) GitHub-based deployment (requires manual setup)"
read -p "Enter your choice (1-3) [1]: " deployment_choice

# Default to Docker deployment if no choice is made
deployment_choice=${deployment_choice:-1}

case $deployment_choice in
    1)
        echo "🚀 Starting Docker-based deployment..."

        # Check if Docker is installed
        if ! command -v docker &> /dev/null; then
            echo "❌ Docker is not installed. Please install it first."
            exit 1
        fi

        # Ask for TinaCMS credentials
        echo "📝 Do you want to provide TinaCMS credentials for the build?"
        read -p "Enter y/n [n]: " provide_tina_creds
        provide_tina_creds=${provide_tina_creds:-n}
        
        TINA_BUILD_ARGS=""
        if [[ "$provide_tina_creds" == "y" ]]; then
            read -p "Enter your TinaCMS Client ID: " tina_client_id
            read -p "Enter your TinaCMS Token: " tina_token
            
            # Set as Railway variables
            echo "Setting TinaCMS credentials as Railway variables..."
            railway variables --set "NUXT_PUBLIC_TINA_CLIENT_ID=$tina_client_id" \
                           --set "NUXT_TINA_TOKEN=$tina_token"
                           
            # Add to Docker build args
            TINA_BUILD_ARGS="--build-arg NUXT_PUBLIC_TINA_CLIENT_ID=$tina_client_id --build-arg NUXT_TINA_TOKEN=$tina_token"
        fi

        # Build Docker image
        echo "🔨 Building Docker image..."
        docker build $TINA_BUILD_ARGS -t portfolio-nuxt-tinacms:latest .
        
        # Set required Nuxt environment variables
        echo "📝 Setting Nuxt-specific environment variables..."
        railway variables --set "NODE_ENV=production" \
                         --set "PORT=3000" \
                         --set "HOST=0.0.0.0"
        
        # Deploy using Railway
        echo "🚂 Deploying to Railway using Docker..."
        railway up --detach
        ;;
    2)
        echo "🚀 Starting direct source deployment..."
        
        # Set required Nuxt environment variables
        echo "📝 Setting Nuxt-specific environment variables..."
        railway variables --set "NODE_ENV=production" \
                         --set "PORT=3000" \
                         --set "HOST=0.0.0.0"
        
        # Ask for TinaCMS credentials
        echo "📝 Do you want to provide TinaCMS credentials for the build?"
        read -p "Enter y/n [n]: " provide_tina_creds
        provide_tina_creds=${provide_tina_creds:-n}
        
        if [[ "$provide_tina_creds" == "y" ]]; then
            read -p "Enter your TinaCMS Client ID: " tina_client_id
            read -p "Enter your TinaCMS Token: " tina_token
            
            # Set as Railway variables
            echo "Setting TinaCMS credentials as Railway variables..."
            railway variables --set "NUXT_PUBLIC_TINA_CLIENT_ID=$tina_client_id" \
                           --set "NUXT_TINA_TOKEN=$tina_token"
        else
            echo "⚠️ Warning: Without TinaCMS credentials, the build may fail"
        fi
        
        # Deploy the application
        echo "🚀 Deploying Nuxt application to Railway..."
        railway up --detach
        ;;
    3)
        echo "🚀 Starting GitHub-based deployment..."

        # Set up GitHub repository as the deployment source
        echo "🔗 Setting up GitHub repository as deployment source..."
        echo "Note: This method requires manual configuration in the Railway dashboard."
        echo "Please go to https://railway.app and connect your GitHub repository using the Railway dashboard."
        
        # Set required Nuxt environment variables
        echo "📝 Setting Nuxt-specific environment variables..."
        railway variables --set "NODE_ENV=production" \
                         --set "PORT=3000" \
                         --set "HOST=0.0.0.0"
        
        # Ask for TinaCMS credentials
        echo "📝 Do you want to provide TinaCMS credentials for the build?"
        read -p "Enter y/n [n]: " provide_tina_creds
        provide_tina_creds=${provide_tina_creds:-n}
        
        if [[ "$provide_tina_creds" == "y" ]]; then
            read -p "Enter your TinaCMS Client ID: " tina_client_id
            read -p "Enter your TinaCMS Token: " tina_token
            
            # Set as Railway variables
            echo "Setting TinaCMS credentials as Railway variables..."
            railway variables --set "NUXT_PUBLIC_TINA_CLIENT_ID=$tina_client_id" \
                           --set "NUXT_TINA_TOKEN=$tina_token"
        else
            echo "⚠️ Warning: Without TinaCMS credentials, the build may fail"
        fi
        
        # Trigger deployment
        echo "🚂 Triggering deployment from GitHub repository..."
        railway up --detach
        ;;
    *)
        echo "❌ Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "✅ Deployment initiated!"
echo ""
echo "🔍 Checking deployment status..."
echo "Watch for these success indicators in the logs:"
echo "  ✅ tinacms build success"
echo "  ✅ nuxt build success"
echo "  ✅ bun run start working on port 3000"
echo ""
echo "📊 View deployment status: railway status"
echo "�� View deployment logs: railway logs"
echo "🌐 Open deployed app: railway open"
