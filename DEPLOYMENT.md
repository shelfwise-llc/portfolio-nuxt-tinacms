# Deployment Guide for Portfolio with Coolify on Contabo

This guide explains how to deploy your portfolio website using Coolify on a Contabo VPS.

## Prerequisites

1. A Contabo VPS (any plan with at least 4GB RAM recommended)
2. Domain name pointing to your Contabo VPS
3. SSH access to your Contabo server
4. TinaCMS account with Client ID and Token

## Step 1: Set Up Contabo VPS

1. Log in to your Contabo VPS via SSH:
   ```bash
   ssh root@your-contabo-ip
   ```

2. Update your system:
   ```bash
   apt update && apt upgrade -y
   ```

3. Install Docker and Docker Compose:
   ```bash
   apt install docker.io docker-compose -y
   ```

## Step 2: Install Coolify

1. Install Coolify using the official one-line installer:
   ```bash
   wget -q https://get.coolify.io -O install.sh && bash ./install.sh
   ```

2. Follow the installation prompts:
   - Choose a secure password for Coolify
   - Enter your domain (e.g., coolify.yourdomain.com)
   - Select whether to install Traefik (recommended for handling SSL)

3. Once installed, access the Coolify dashboard at `https://coolify.yourdomain.com`

## Step 3: Configure Coolify for Deployment

1. Log in to your Coolify dashboard
2. Add a new project:
   - Click "New Resource" → "Application"
   - Select "Git Repository"
   - Connect your GitHub account and select `shelfwise-llc/portfolio-nuxt-tinacms`

3. Configure deployment settings:
   - Deployment Method: Docker Compose
   - Docker Compose File: `docker-compose.yml`
   - Build Command: Leave empty (handled in Dockerfile)

4. Set environment variables:
   - `NUXT_PUBLIC_TINA_CLIENT_ID`: Your TinaCMS client ID
   - `NUXT_TINA_TOKEN`: Your TinaCMS token
   - `NUXT_PUBLIC_SITE_URL`: Your production URL (e.g., https://yourdomain.com)

5. Configure domain settings:
   - Add your domain name
   - Enable HTTPS (Let's Encrypt)

6. Save and deploy

## Step 4: Continuous Deployment

1. Set up webhooks for automatic deployment:
   - In Coolify: Go to your application → Settings → Webhooks
   - Copy the webhook URL
   - In GitHub: Go to your repository → Settings → Webhooks → Add webhook
   - Paste the URL and select "Push events"

## Local Development

To run the project locally:

1. Clone the repository:
   ```bash
   git clone git@github.com:shelfwise-llc/portfolio-nuxt-tinacms.git
   cd portfolio-nuxt-tinacms
   ```

2. Create a `.env` file with your TinaCMS credentials:
   ```bash
   cp .env.example .env
   # Edit .env with your TinaCMS credentials
   ```

3. Install dependencies:
   ```bash
   pnpm install
   ```

4. Start the development server:
   ```bash
   pnpm tinacms:dev
   ```

5. Access:
   - Website: http://localhost:3333
   - TinaCMS Admin: http://localhost:4001

## Troubleshooting

### Common Issues

1. **Build fails in Coolify**:
   - Check the build logs in Coolify dashboard
   - Ensure all environment variables are set correctly

2. **TinaCMS not loading content**:
   - Verify your TinaCMS credentials are correct
   - Check browser console for errors

3. **Docker container crashes**:
   - Check container logs in Coolify
   - Ensure your server has enough resources (RAM/CPU)

### Getting Help

If you encounter issues, check:
- Coolify documentation: https://coolify.io/docs
- TinaCMS documentation: https://tina.io/docs
- Contabo knowledge base: https://contabo.com/blog/category/tutorial/
