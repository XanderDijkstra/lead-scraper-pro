# Supabase Setup Guide for Lead Scraper Pro

## Quick Setup (5 minutes)

### Step 1: Create Supabase Project
1. Go to [https://supabase.com/dashboard](https://supabase.com/dashboard)
2. Click **"New Project"**
3. Choose your organization
4. Project name: `lead-scraper-pro`
5. Region: Choose closest to you (e.g., `West Europe (Amsterdam)`)
6. Database password: Generate a secure one
7. Click **"Create new project"**
8. Wait ~2 minutes for the project to be ready

### Step 2: Run Database Setup
1. In your Supabase dashboard, click **"SQL Editor"** (left sidebar)
2. Click **"New query"**
3. Copy the entire contents of `supabase-setup.sql` from this project
4. Paste into the SQL Editor
5. Click **"Run"**
6. You should see "Success. No rows returned"

### Step 3: Get API Credentials
1. In Supabase dashboard, click **Project Settings** (gear icon)
2. Click **API** in the left menu
3. Copy these values:
   - **Project URL**: `https://xxxxxxxxxxxx.supabase.co`
   - **anon public**: `eyJ...` (long string)

### Step 4: Configure Environment Variables
1. In your project folder, copy `.env.example` to `.env.local`:
   ```bash
   cp .env.example .env.local
   ```

2. Edit `.env.local` and paste your credentials:
   ```
   NEXT_PUBLIC_SUPABASE_URL=https://your-project-url.supabase.co
   NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key-here
   DATABASE_URL=postgresql://postgres:your-password@db.your-project-url.supabase.co:5432/postgres
   ```

### Step 5: Test the Connection
Run the development server:
```bash
npm run dev
```

Visit `http://localhost:3000/api/places` - you should see the Dutch places data.

---

## Alternative: Using Prisma Migrate

If you prefer using Prisma migrations instead of the SQL file:

1. Set up your `.env.local` with the `DATABASE_URL`
2. Run:
   ```bash
   npx prisma migrate dev --name init
   ```
3. Then seed the data:
   ```bash
   npx prisma db execute --file prisma/seed.sql
   ```

---

## Verification

Test these endpoints after setup:
- `http://localhost:3000/api/places` - Should return Dutch cities
- `http://localhost:3000/api/leads` - Should return empty array `[]`

---

## Troubleshooting

**Error: "relation does not exist"**
- Make sure you ran the SQL setup script
- Check that tables were created in Supabase Table Editor

**Error: "Invalid API key"**
- Double-check your `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- Make sure there's no extra whitespace

**CORS errors**
- In Supabase dashboard, go to **Authentication > URL Configuration**
- Add `http://localhost:3000` to allowed origins

---

## Next Steps

Once Supabase is set up:
1. Test the API endpoints
2. Build the frontend UI
3. Deploy to Vercel
