#!/bin/bash

# test_and_deploy.sh - Script to test locally and deploy to Railway
# This script helps you test your Nuxt.js + TinaCMS application locally with Docker
# and then deploy it to Railway if the local test is successful

set -e  # Exit on error

# Colors for better readability
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}🚀 Nuxt + TinaCMS Test & Deploy Script${NC}"
echo "=================================================="

# Function to check if a command exists
command_exists() {
  command -v "$1" >/dev/null 2>&1
}

# Check for required tools
echo -e "${YELLOW}Checking required tools...${NC}"
if ! command_exists yarn; then
  echo -e "${RED}❌ Yarn is not installed. Please install Yarn first.${NC}"
  echo "Visit https://yarnpkg.com/getting-started/install for installation instructions."
  exit 1
fi

if ! command_exists docker; then
  echo -e "${RED}❌ Docker is not installed. Please install Docker first.${NC}"
  echo "Visit https://docs.docker.com/get-docker/ for installation instructions."
  exit 1
fi

if ! command_exists railway; then
  echo -e "${YELLOW}⚠️ Railway CLI is not installed. You won't be able to deploy to Railway.${NC}"
  echo "To install Railway CLI, run: npm i -g @railway/cli"
  RAILWAY_INSTALLED=false
else
  RAILWAY_INSTALLED=true
fi

# Check for asdf and compatible Python version for node-gyp
if command_exists asdf; then
  echo -e "${GREEN}✅ asdf detected, checking for Python 3.11${NC}"

  # Check if Python 3.11 is installed via asdf
  if asdf list python | grep -q "3\.11"; then
    # Set Python 3.11 as local version for this project
    echo -e "${GREEN}✅ Python 3.11 found in asdf, setting as local version${NC}"
    asdf local python 3.11 2>/dev/null || true
    export PYTHON=$(asdf which python 2>/dev/null)
  else
    echo -e "${YELLOW}⚠️ Python 3.11 not found in asdf. Consider installing it:${NC}"
    echo -e "${YELLOW}   asdf plugin add python (if needed)${NC}"
    echo -e "${YELLOW}   asdf install python 3.11.9${NC}"
    echo -e "${YELLOW}   asdf local python 3.11.9${NC}"

    # Try to find any Python version via asdf
    export PYTHON=$(asdf which python 2>/dev/null)
  fi
else
  # Fall back to system Python detection
  echo -e "${YELLOW}⚠️ asdf not detected, falling back to system Python${NC}"
  PYTHON_FOR_GYP=""
  for py_version in python3.11 python3.10 python3.9 python3.8 python3; do
    if command_exists $py_version; then
      PYTHON_FOR_GYP=$(which $py_version)
      echo -e "${GREEN}✅ Found compatible Python for node-gyp: $PYTHON_FOR_GYP${NC}"
      break
    fi
  done

  if [ -z "$PYTHON_FOR_GYP" ]; then
    echo -e "${YELLOW}⚠️ No compatible Python found for node-gyp. Native modules may fail to build.${NC}"
    echo -e "${YELLOW}Consider installing Python 3.11: sudo apt install python3.11${NC}"
  else
    export PYTHON=$PYTHON_FOR_GYP
  fi
fi

# Set environment variables for native module builds
export YARN_INSTALL_ARGS="--frozen-lockfile"

echo -e "${GREEN}✅ Environment configured for native module builds:${NC}"
echo -e "${GREEN}   PYTHON=$PYTHON${NC}"
echo -e "${GREEN}   YARN_INSTALL_ARGS=$YARN_INSTALL_ARGS${NC}"

# Clean up lock files
echo -e "${YELLOW}Cleaning up lock files...${NC}"
rm -f yarn.lock package-lock.json pnpm-lock.yaml

# Load environment variables from .env file
if [ -f .env ]; then
  echo -e "${GREEN}✅ Loading environment variables from .env file${NC}"
  export $(cat .env | grep -v '^#' | xargs)
else
  echo -e "${YELLOW}⚠️ No .env file found${NC}"
fi

# Check if TinaCMS credentials are set
if [ -z "$NUXT_PUBLIC_TINA_CLIENT_ID" ] || [ -z "$NUXT_TINA_TOKEN" ]; then
  echo -e "${YELLOW}⚠️ TinaCMS credentials not found in environment variables${NC}"

  # Prompt for TinaCMS credentials if not set
  read -p "Enter your NUXT_PUBLIC_TINA_CLIENT_ID: " NUXT_PUBLIC_TINA_CLIENT_ID
  read -p "Enter your NUXT_TINA_TOKEN: " NUXT_TINA_TOKEN

  # Save to .env file
  echo "NUXT_PUBLIC_TINA_CLIENT_ID=$NUXT_PUBLIC_TINA_CLIENT_ID" > .env
  echo "NUXT_TINA_TOKEN=$NUXT_TINA_TOKEN" >> .env

  # Export for current session
  export NUXT_PUBLIC_TINA_CLIENT_ID
  export NUXT_TINA_TOKEN
fi

# Menu for actions
echo -e "${GREEN}Choose an action:${NC}"
echo "1. Test locally with Yarn (dev mode)"
echo "2. Test locally with Docker (production-like)"
echo "3. Clean build and prebuild native modules"
echo "4. Deploy to Railway"
echo "5. Exit"

read -p "Enter your choice (1-5): " choice

case $choice in
  1)
    echo -e "${GREEN}🧪 Testing locally with Yarn (dev mode)${NC}"
    echo "Installing dependencies..."
    rm -rf node_modules yarn.lock

    echo "Attempting to install with better-sqlite3 native module support..."
    if [ -n "$PYTHON_FOR_GYP" ]; then
      echo "Using Python: $PYTHON_FOR_GYP for node-gyp"
    fi

    # Try with copyfile backend first
    echo "Installing with --frozen-lockfile..."
    if yarn install --frozen-lockfile; then
      echo -e "${GREEN}✅ Dependencies installed successfully${NC}"
    else
      echo -e "${YELLOW}⚠️ First install attempt failed, trying fallback method...${NC}"

      # Fallback to npm for better-sqlite3 only
      echo "Installing better-sqlite3 with npm..."
      npm install better-sqlite3 --build-from-source=false

      # Then continue with yarn for the rest
      echo "Installing remaining dependencies with yarn..."
      yarn install --frozen-lockfile
    fi

    echo "Starting dev server..."
    yarn run dev
    ;;

  2)
    echo -e "${GREEN}🧪 Testing locally with Docker (production-like)${NC}"
    echo "Building Docker image..."
    echo -e "${GREEN}✅ This is the recommended way to test with native modules${NC}"
    echo -e "${GREEN}✅ Docker provides a consistent environment matching Railway${NC}"

    docker build -t nuxt-tinacms-app \
      --build-arg NUXT_PUBLIC_TINA_CLIENT_ID=$NUXT_PUBLIC_TINA_CLIENT_ID \
      --build-arg NUXT_TINA_TOKEN=$NUXT_TINA_TOKEN \
      .

    echo "Running Docker container..."
    docker run -p 3000:3000 \
      -e NUXT_PUBLIC_TINA_CLIENT_ID=$NUXT_PUBLIC_TINA_CLIENT_ID \
      -e NUXT_TINA_TOKEN=$NUXT_TINA_TOKEN \
      nuxt-tinacms-app
    ;;

  3)
    echo -e "${GREEN}🧪 Clean build and prebuild native modules${NC}"
    echo "Cleaning environment..."
    rm -rf node_modules yarn.lock .yarn

    echo "Installing dependencies with native module support..."

    # Try with copyfile backend first
    if ! yarn install --frozen-lockfile; then
      echo -e "${YELLOW}⚠️ Yarn install failed, trying alternative approach for native modules...${NC}"

      # Try npm for better-sqlite3
      echo "Installing better-sqlite3 with npm..."
      if command_exists npm; then
        npm install better-sqlite3 --build-from-source=false
      else
        echo -e "${YELLOW}⚠️ npm not found, installing it temporarily...${NC}"
        curl -fsSL https://npmjs.org/install.sh | sh
        npm install better-sqlite3 --build-from-source=false
      fi

      # Then continue with yarn for the rest
      echo "Installing remaining dependencies with yarn..."
      yarn install --frozen-lockfile
    fi

    echo "Building TinaCMS..."
    if ! yarn run tinacms build; then
      echo -e "${YELLOW}⚠️ TinaCMS build failed, but continuing...${NC}"
    fi

    echo "Building Nuxt..."
    if ! yarn run build; then
      echo -e "${RED}❌ Nuxt build failed${NC}"
      exit 1
    fi

    echo -e "${GREEN}✅ Prebuild complete! You can now deploy to Railway or run locally.${NC}"
    ;;

  4)
    echo -e "${GREEN}🚀 Deploying to Railway${NC}"
    if [ "$RAILWAY_INSTALLED" = false ]; then
      echo -e "${RED}❌ Railway CLI is not installed. Please install it first.${NC}"
      echo "To install Railway CLI, run: npm i -g @railway/cli"
      exit 1
    fi

    echo "Checking Railway login status..."
    railway whoami || railway login

    echo "Deploying to Railway..."
    railway up
    ;;

  5)
    echo -e "${GREEN}Exiting...${NC}"
    exit 0
    ;;

  *)
    echo -e "${RED}Invalid choice. Exiting...${NC}"
    exit 1
    ;;
esac
