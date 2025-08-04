# Alex Cosmas Portfolio

A modern portfolio website built with Nuxt.js and TinaCMS, featuring a clean design and easy content management.

## 🚀 Features

- **Modern Design**: Clean, responsive design with Tailwind CSS
- **Content Management**: Easy content editing with TinaCMS
- **Performance**: Optimized with Nuxt.js and ISR
- **SEO**: Built-in SEO optimization
- **Accessibility**: WCAG compliant design
- **Draft Mode**: Save drafts without publishing
- **Preview URLs**: Share previews before publishing

## 🛠️ Tech Stack

- **Framework**: Nuxt.js 4
- **CMS**: TinaCMS
- **Styling**: Tailwind CSS
- **Deployment**: Vercel/Netlify ready
- **Package Manager**: pnpm

## 📁 Project Structure

```
portfolio/
├── content/                 # Content files
│   ├── posts/              # Blog posts
│   ├── case-studies/       # Case studies
│   └── pages/              # Static pages
├── pages/                  # Nuxt.js pages
├── tina/                   # TinaCMS configuration
├── public/                 # Static assets
└── app.vue                 # Main app layout
```

## 🚀 Getting Started

### Prerequisites

- Node.js 18+
- pnpm (recommended) or npm

### Installation

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd portfolio
   ```

2. **Install dependencies**
   ```bash
   pnpm install
   ```

3. **Set up environment variables**
   ```bash
   cp .env.local.example .env.local
   # Edit .env.local with your TinaCMS credentials
   ```

4. **Start development server**
   ```bash
   pnpm dev
   ```

5. **Access the application**
   - **Website**: http://localhost:3000
   - **TinaCMS Admin**: http://localhost:4001

## 📝 Content Management

### Adding New Content

1. **Blog Posts**
   - Go to http://localhost:4001
   - Navigate to "Blog Posts"
   - Click "Add New"
   - Fill in the form and save

2. **Case Studies**
   - Navigate to "Case Studies"
   - Add new case study with detailed content
   - Include images and rich text

3. **Pages**
   - Navigate to "Pages"
   - Edit about, now, or other static pages

### Content Structure

#### Blog Posts
```markdown
---
title: "Your Post Title"
date: "2024-01-01"
description: "Brief description"
tags: ["design", "ux"]
---

# Your content here
```

#### Case Studies
```markdown
---
title: "Project Title"
client: "Client Name"
duration: 6
role: "UX Designer"
description: "Brief description"
---

# Case study content
```

## 🎨 Customization

### Styling
- Edit Tailwind classes in components
- Modify color scheme in `tailwind.config.js`
- Update typography in CSS

### Layout
- Modify `app.vue` for global layout
- Edit individual pages in `pages/`
- Add new routes as needed

### TinaCMS Schema
- Edit `tina/config.ts` to modify content structure
- Add new fields or collections as needed

## 🚀 Deployment

### Vercel (Recommended)

1. **Connect to Vercel**
   ```bash
   npx vercel
   ```

2. **Set environment variables**
   - Add TinaCMS credentials in Vercel dashboard

3. **Deploy**
   ```bash
   git push
   ```

### Netlify

1. **Connect to Netlify**
   - Connect your GitHub repository
   - Set build command: `pnpm build`
   - Set publish directory: `.output/public`

2. **Set environment variables**
   - Add TinaCMS credentials in Netlify dashboard

## 🔧 Development

### Available Scripts

- `pnpm dev` - Start development server
- `pnpm build` - Build for production
- `pnpm preview` - Preview production build

### TinaCMS Commands

- `pnpm tinacms dev` - Start TinaCMS development server
- `pnpm tinacms build` - Build TinaCMS for production

## 📚 Content Guidelines

### Writing Blog Posts
- Use clear, engaging titles
- Include relevant tags
- Add meta descriptions
- Use proper markdown formatting

### Creating Case Studies
- Start with the problem
- Include research and process
- Show results and metrics
- Add key learnings

### Images
- Use high-quality images
- Optimize for web
- Include alt text
- Store in `public/images/`

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License.

## 🆘 Support

For issues or questions:
- Check the [TinaCMS documentation](https://tina.io/docs)
- Review [Nuxt.js documentation](https://nuxt.com/docs)
- Open an issue in this repository

---

Built with ❤️ using Nuxt.js and TinaCMS
