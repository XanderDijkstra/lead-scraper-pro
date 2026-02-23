# Lead Scraper Pro - Architecture Plan

## Overview
A comprehensive lead generation tool for Dutch contractors with multi-layer enrichment, built for browser deployment.

---

## Tech Stack

### Frontend
- **Next.js 14** (App Router) - React framework
- **Tailwind CSS** - Styling
- **shadcn/ui** - UI components
- **React Query** - Data fetching/caching

### Backend
- **Next.js API Routes** - Serverless functions
- **Supabase** - Database + Auth
- **Prisma** - ORM

### Scraping Engine
- **Puppeteer/Playwright** - Browser automation
- **browser-use** - AI-powered browser control
- **Cheerio** - HTML parsing

### Deployment
- **Vercel** - Hosting (frontend + API)
- **GitHub** - Source control
- **Supabase** - Database hosting

---

## Database Schema

```prisma
// Lead model
model Lead {
  id              String   @id @default(uuid())
  source          String   // google_maps, website, manual
  status          String   // new, enriched, contacted, qualified, converted
  
  // Basic Info
  companyName     String
  slug            String   @unique
  
  // Location
  city            String
  province        String
  postalCode      String?
  street          String?
  fullAddress     String?
  
  // Contact
  phone           String?
  email           String?
  website         String?
  
  // Google Maps Data
  googleMapsUrl   String?
  googleRating    Float?
  reviewCount     Int?
  placeId         String?
  
  // Enrichment Data
  kvkNumber       String?  // Dutch chamber of commerce
  btwNumber       String?  // VAT number
  yearEstablished Int?
  employeeCount   String?
  
  // Scraped Website Data
  services        String[] // Array of services found
  hasPortfolio    Boolean  @default(false)
  hasReviews      Boolean  @default(false)
  technologies    String[] // WordPress, Wix, etc.
  
  // Social Media
  facebookUrl     String?
  instagramUrl    String?
  linkedinUrl     String?
  
  // Metadata
  scrapedAt       DateTime @default(now())
  enrichedAt      DateTime?
  lastCheckedAt   DateTime?
  
  // Relations
  scrapes         ScrapeRun[]
  notes           Note[]
  tags            Tag[]
  
  @@index([city])
  @@index([status])
  @@index([source])
}

// Scrape Run tracking
model ScrapeRun {
  id          String   @id @default(uuid())
  startedAt   DateTime @default(now())
  completedAt DateTime?
  
  // Search Parameters
  city        String
  businessType String   // aannemers, loodgieters, etc.
  radius      Int      // km
  
  // Results
  leadsFound  Int      @default(0)
  leadsEnriched Int    @default(0)
  errors      Json?    // Store any errors
  
  // Relations
  leads       Lead[]
}

// Dutch Places Database
model DutchPlace {
  id          String @id @default(uuid())
  name        String
  slug        String @unique
  type        String // city, town, village
  province    String
  municipality String
  population  Int?
  lat         Float?
  lng         Float?
  
  @@index([province])
  @@index([municipality])
}

// Notes on leads
model Note {
  id        String   @id @default(uuid())
  content   String
  createdAt DateTime @default(now())
  leadId    String
  lead      Lead     @relation(fields: [leadId], references: [id])
}

// Tags for organization
model Tag {
  id    String @id @default(uuid())
  name  String @unique
  leads Lead[]
}
```

---

## Core Features

### 1. Google Maps Scraper
```typescript
// Scrape flow
1. Navigate to Google Maps
2. Search: "{businessType} in {city}"
3. Extract listings from results page
4. For each listing:
   - Click to open detail view
   - Extract: name, phone, website, rating, reviews, address
   - Save to database
5. Navigate to next page
6. Repeat until limit reached
```

**Data Extracted:**
- Business name
- Phone number
- Website URL
- Google rating & review count
- Full address (street, city, postal)
- Opening hours
- Photos
- Place ID

### 2. Website Scraper (Enrichment Layer 1)
```typescript
// For each lead with website
1. Visit website
2. Extract:
   - Email from contact page
   - Services listed
   - Portfolio/gallery presence
   - Testimonials/reviews presence
   - CMS detection (WordPress, Wix, etc.)
   - Social media links
3. Update lead record
```

**Data Extracted:**
- Email addresses (from contact page, footer)
- Services offered
- Portfolio presence
- Client testimonials
- Technology stack
- Social media URLs

### 3. KVK/BTW Lookup (Enrichment Layer 2)
```typescript
// Dutch business registry lookup
1. Search KVK (Chamber of Commerce)
2. Extract:
   - KVK number
   - Legal name
   - Year established
   - Employee count
   - BTW (VAT) number
```

### 4. Email Verification (Enrichment Layer 3)
```typescript
// Verify extracted emails
1. Syntax check
2. Domain check
3. SMTP verification (optional)
4. Mark as verified/bounced
```

---

## Enrichment Pipeline

```
Raw Lead (Google Maps)
    ↓
Layer 1: Website Scrape
    - Find email if missing
    - Extract services
    - Detect tech stack
    ↓
Layer 2: KVK Lookup
    - Get KVK number
    - Year established
    - Employee count
    ↓
Layer 3: Email Verification
    - Validate email deliverability
    ↓
Enriched Lead → Export/CRM Push
```

---

## User Interface

### Dashboard
- Stats: Total leads, enriched, contacted
- Recent scrapes
- Quick search

### Scrape Interface
```
[Business Type Dropdown]  [City/Province Dropdown]  [Radius]
[aannemers]              [Rotterdam]               [10km]

[START SCRAPE BUTTON]
```

### Leads Table
- Filter by: city, status, source, tags
- Sort by: rating, review count, date scraped
- Bulk actions: export, tag, mark status
- Quick view: sidebar with lead details

### Lead Detail View
```
┌─────────────────────────────────────┐
│ Company Name                        │
│ ★ 4.5 (23 reviews)                  │
├─────────────────────────────────────┤
│ 📍 Address                          │
│ 📞 Phone                            │
│ ✉️ Email (verified)                 │
│ 🌐 Website                          │
├─────────────────────────────────────┤
│ Services: [tag] [tag] [tag]         │
│ Tech: WordPress                     │
├─────────────────────────────────────┤
│ [View on Maps] [Visit Website]      │
│ [Add Note] [Change Status]          │
└─────────────────────────────────────┘
```

---

## API Endpoints

```typescript
// Scraping
POST /api/scrape/start
GET  /api/scrape/:id/status
GET  /api/scrape/:id/results

// Leads
GET    /api/leads
GET    /api/leads/:id
PATCH  /api/leads/:id
DELETE /api/leads/:id
POST   /api/leads/:id/enrich

// Export
POST /api/export/csv
POST /api/export/json

// Places
GET /api/places
GET /api/places/provinces
GET /api/places/cities?province=...
```

---

## Deployment Plan

### Phase 1: MVP (Week 1)
- [ ] Next.js + Supabase setup
- [ ] Database schema
- [ ] Basic Google Maps scraper
- [ ] Simple dashboard
- [ ] Deploy to Vercel

### Phase 2: Enrichment (Week 2)
- [ ] Website scraper
- [ ] Email extraction
- [ ] Lead detail view
- [ ] Export functionality

### Phase 3: Polish (Week 3)
- [ ] KVK lookup
- [ ] Email verification
- [ ] Bulk operations
- [ ] Advanced filters

### Phase 4: Scale (Week 4)
- [ ] Queue system for large scrapes
- [ ] Rate limiting
- [ ] Proxy rotation
- [ ] Scheduled scrapes

---

## Skills Needed

Based on search, install these:

| Skill | Purpose |
|-------|---------|
| `vercel-labs/agent-skills@vercel-react-best-practices` | React/Next.js patterns |
| `vercel-labs/agent-skills@vercel-composition-patterns` | Component architecture |
| `supabase/agent-skills@supabase-postgres-best-practices` | Database design |
| `wshobson/agents@nextjs-app-router-patterns` | App Router patterns |
| `sickn33/antigravity-awesome-skills@nextjs-supabase-auth` | Auth setup |
| `jamditis/claude-skills-journalism@web-scraping` | Scraping patterns |

---

## Dutch Places Integration

Import all Dutch municipalities:
- 12 provinces
- 344 municipalities
- ~2500 cities/towns

Data source: CBS (Statistics Netherlands) or manual CSV

```csv
name,type,province,municipality,population
Amsterdam,city,Noord-Holland,Amsterdam,872680
Rotterdam,city,Zuid-Holland,Rotterdam,644618
...
```

---

## Next Steps

1. **Install skills** listed above
2. **Initialize project** with Next.js + Supabase
3. **Set up database** with Prisma schema
4. **Build Google Maps scraper** using browser-use
5. **Create dashboard UI**
6. **Deploy to Vercel**

Ready to start building?
