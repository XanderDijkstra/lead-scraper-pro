# Lead Scraper Pro

Automated lead generation for Dutch contractors with multi-layer enrichment.

## Features

- 🔍 **Google Maps Scraping** - Find contractors by city/type
- 🌐 **Website Enrichment** - Extract emails, services, tech stack
- 📊 **KVK Lookup** - Dutch business registry data
- ✉️ **Email Verification** - Validate deliverability
- 🗺️ **Dutch Places DB** - 50+ cities across all provinces
- 📤 **Export** - CSV/JSON for CRM import

## Tech Stack

- Next.js 14 + TypeScript
- Tailwind CSS + shadcn/ui
- Supabase + Prisma
- Puppeteer/Playwright

## Setup

1. **Install dependencies**
   ```bash
   npm install
   ```

2. **Set up environment variables**
   ```bash
   cp .env.example .env.local
   # Edit .env.local with your credentials
   ```

3. **Set up Supabase**
   - Create project at supabase.com
   - Copy URL and anon key to .env.local

4. **Run database migrations**
   ```bash
   npx prisma migrate dev
   ```

5. **Seed Dutch places data**
   ```bash
   npx prisma db seed
   ```

6. **Run development server**
   ```bash
   npm run dev
   ```

## Deployment

### Vercel

1. Push to GitHub
2. Import to Vercel
3. Add environment variables
4. Deploy

### Database (Supabase)

1. Create project
2. Run migrations
3. Seed data

## Usage

1. Go to `/scrape` to start a new scrape
2. Select city and business type
3. Wait for enrichment
4. Export leads to CSV

## License

MIT
