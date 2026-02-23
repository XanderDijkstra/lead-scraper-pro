#!/bin/bash

# Supabase Setup Script for Lead Scraper Pro
# This script helps you set up Supabase for the project

echo "=================================="
echo "Lead Scraper Pro - Supabase Setup"
echo "=================================="
echo ""

# Check if Supabase CLI is installed
if ! command -v supabase &> /dev/null; then
    echo "❌ Supabase CLI not found. Installing..."
    npm install -g supabase
fi

echo "✅ Supabase CLI is installed"
echo ""

echo "Step 1: Create a Supabase project"
echo "-----------------------------------"
echo "1. Go to https://supabase.com/dashboard"
echo "2. Click 'New Project'"
echo "3. Choose your organization"
echo "4. Enter project name: 'lead-scraper-pro'"
echo "5. Choose a region (closest to your users)"
echo "6. Set a secure database password"
echo "7. Click 'Create new project'"
echo ""

echo "Step 2: Get your API credentials"
echo "-----------------------------------"
echo "1. In your Supabase dashboard, go to Project Settings > API"
echo "2. Copy the 'Project URL'"
echo "3. Copy the 'anon public' key"
echo ""

echo "Step 3: Configure environment variables"
echo "-----------------------------------"
echo "Create a .env.local file with:"
echo ""
echo "NEXT_PUBLIC_SUPABASE_URL=your-project-url"
echo "NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key"
echo ""

echo "Step 4: Run database migrations"
echo "-----------------------------------"
echo "Run: npx prisma migrate dev --name init"
echo ""

echo "Step 5: Seed Dutch places data"
echo "-----------------------------------"
echo "Run: npx prisma db execute --file prisma/seed.sql"
echo ""

echo "=================================="
echo "Or use the Supabase CLI to link:"
echo "=================================="
echo ""
echo "supabase login"
echo "supabase link --project-ref your-project-ref"
echo "supabase db push"
echo ""
