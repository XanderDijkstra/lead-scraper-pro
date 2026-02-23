-- Lead Scraper Pro - Database Setup
-- Run this in Supabase SQL Editor

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Create Lead table
CREATE TABLE IF NOT EXISTS "Lead" (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  source TEXT NOT NULL DEFAULT 'google_maps',
  status TEXT NOT NULL DEFAULT 'new',
  "companyName" TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  city TEXT NOT NULL,
  province TEXT NOT NULL,
  "postalCode" TEXT,
  street TEXT,
  "fullAddress" TEXT,
  phone TEXT,
  email TEXT,
  website TEXT,
  "googleMapsUrl" TEXT,
  "googleRating" FLOAT,
  "reviewCount" INT,
  "placeId" TEXT,
  "kvkNumber" TEXT,
  "btwNumber" TEXT,
  "yearEstablished" INT,
  "employeeCount" TEXT,
  services TEXT[] DEFAULT '{}',
  "hasPortfolio" BOOLEAN DEFAULT false,
  "hasReviews" BOOLEAN DEFAULT false,
  technologies TEXT[] DEFAULT '{}',
  "facebookUrl" TEXT,
  "instagramUrl" TEXT,
  "linkedinUrl" TEXT,
  "scrapedAt" TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  "enrichedAt" TIMESTAMP WITH TIME ZONE,
  "lastCheckedAt" TIMESTAMP WITH TIME ZONE
);

-- Create indexes for Lead table
CREATE INDEX IF NOT EXISTS "Lead_city_idx" ON "Lead"(city);
CREATE INDEX IF NOT EXISTS "Lead_status_idx" ON "Lead"(status);
CREATE INDEX IF NOT EXISTS "Lead_source_idx" ON "Lead"(source);

-- Create ScrapeRun table
CREATE TABLE IF NOT EXISTS "ScrapeRun" (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  "startedAt" TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  "completedAt" TIMESTAMP WITH TIME ZONE,
  city TEXT NOT NULL,
  "businessType" TEXT NOT NULL,
  radius INT DEFAULT 10,
  "leadsFound" INT DEFAULT 0,
  "leadsEnriched" INT DEFAULT 0,
  errors JSONB
);

-- Create DutchPlace table
CREATE TABLE IF NOT EXISTS "DutchPlace" (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  type TEXT NOT NULL,
  province TEXT NOT NULL,
  municipality TEXT NOT NULL,
  population INT,
  lat FLOAT,
  lng FLOAT
);

-- Create indexes for DutchPlace
CREATE INDEX IF NOT EXISTS "DutchPlace_province_idx" ON "DutchPlace"(province);
CREATE INDEX IF NOT EXISTS "DutchPlace_municipality_idx" ON "DutchPlace"(municipality);

-- Create Note table
CREATE TABLE IF NOT EXISTS "Note" (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  content TEXT NOT NULL,
  "createdAt" TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  "leadId" UUID NOT NULL REFERENCES "Lead"(id) ON DELETE CASCADE
);

-- Create Tag table
CREATE TABLE IF NOT EXISTS "Tag" (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name TEXT UNIQUE NOT NULL
);

-- Create junction table for Lead-Tag many-to-many relationship
CREATE TABLE IF NOT EXISTS "_LeadToTag" (
  "A" UUID NOT NULL REFERENCES "Lead"(id) ON DELETE CASCADE,
  "B" UUID NOT NULL REFERENCES "Tag"(id) ON DELETE CASCADE,
  PRIMARY KEY ("A", "B")
);

-- Create junction table for Lead-ScrapeRun many-to-many relationship
CREATE TABLE IF NOT EXISTS "_LeadToScrapeRun" (
  "A" UUID NOT NULL REFERENCES "Lead"(id) ON DELETE CASCADE,
  "B" UUID NOT NULL REFERENCES "ScrapeRun"(id) ON DELETE CASCADE,
  PRIMARY KEY ("A", "B")
);

-- Insert Dutch Places Data
INSERT INTO "DutchPlace" (id, name, slug, type, province, municipality, population) VALUES
-- Noord-Holland
(uuid_generate_v4(), 'Amsterdam', 'amsterdam', 'city', 'Noord-Holland', 'Amsterdam', 872680),
(uuid_generate_v4(), 'Haarlem', 'haarlem', 'city', 'Noord-Holland', 'Haarlem', 162543),
(uuid_generate_v4(), 'Zaanstad', 'zaanstad', 'city', 'Noord-Holland', 'Zaanstad', 156789),
(uuid_generate_v4(), 'Haarlemmermeer', 'haarlemmermeer', 'city', 'Noord-Holland', 'Haarlemmermeer', 154235),
(uuid_generate_v4(), 'Alkmaar', 'alkmaar', 'city', 'Noord-Holland', 'Alkmaar', 108558),
(uuid_generate_v4(), 'Purmerend', 'purmerend', 'city', 'Noord-Holland', 'Purmerend', 80896),
(uuid_generate_v4(), 'Hilversum', 'hilversum', 'city', 'Noord-Holland', 'Hilversum', 90510),
(uuid_generate_v4(), 'Amstelveen', 'amstelveen', 'city', 'Noord-Holland', 'Amstelveen', 90385),
(uuid_generate_v4(), 'Hoorn', 'hoorn', 'city', 'Noord-Holland', 'Hoorn', 73614),
(uuid_generate_v4(), 'Zaandam', 'zaandam', 'town', 'Noord-Holland', 'Zaanstad', 78000),

-- Zuid-Holland
(uuid_generate_v4(), 'Rotterdam', 'rotterdam', 'city', 'Zuid-Holland', 'Rotterdam', 644618),
(uuid_generate_v4(), 'Den Haag', 'den-haag', 'city', 'Zuid-Holland', 'Den Haag', 545838),
(uuid_generate_v4(), 'Zoetermeer', 'zoetermeer', 'city', 'Zuid-Holland', 'Zoetermeer', 125267),
(uuid_generate_v4(), 'Delft', 'delft', 'city', 'Zuid-Holland', 'Delft', 103588),
(uuid_generate_v4(), 'Leiden', 'leiden', 'city', 'Zuid-Holland', 'Leiden', 124899),
(uuid_generate_v4(), 'Dordrecht', 'dordrecht', 'city', 'Zuid-Holland', 'Dordrecht', 119115),
(uuid_generate_v4(), 'Alphen aan den Rijn', 'alphen-aan-den-rijn', 'city', 'Zuid-Holland', 'Alphen aan den Rijn', 111986),
(uuid_generate_v4(), 'Westland', 'westland', 'city', 'Zuid-Holland', 'Westland', 110986),
(uuid_generate_v4(), 'Spijkenisse', 'spijkenisse', 'town', 'Zuid-Holland', 'Nissewaard', 72000),
(uuid_generate_v4(), 'Schiedam', 'schiedam', 'city', 'Zuid-Holland', 'Schiedam', 80123),

-- Utrecht
(uuid_generate_v4(), 'Utrecht', 'utrecht', 'city', 'Utrecht', 'Utrecht', 357179),
(uuid_generate_v4(), 'Amersfoort', 'amersfoort', 'city', 'Utrecht', 'Amersfoort', 157279),
(uuid_generate_v4(), 'Nieuwegein', 'nieuwegein', 'city', 'Utrecht', 'Nieuwegein', 62982),
(uuid_generate_v4(), 'Veenendaal', 'veenendaal', 'city', 'Utrecht', 'Veenendaal', 65812),
(uuid_generate_v4(), 'Zeist', 'zeist', 'city', 'Utrecht', 'Zeist', 65123),
(uuid_generate_v4(), 'Houten', 'houten', 'city', 'Utrecht', 'Houten', 50123),

-- Noord-Brabant
(uuid_generate_v4(), 'Eindhoven', 'eindhoven', 'city', 'Noord-Brabant', 'Eindhoven', 238326),
(uuid_generate_v4(), 'Tilburg', 'tilburg', 'city', 'Noord-Brabant', 'Tilburg', 199613),
(uuid_generate_v4(), 'Breda', 'breda', 'city', 'Noord-Brabant', 'Breda', 184126),
(uuid_generate_v4(), 's-Hertogenbosch', 's-hertogenbosch', 'city', 'Noord-Brabant', 's-Hertogenbosch', 155849),
(uuid_generate_v4(), 'Helmond', 'helmond', 'city', 'Noord-Brabant', 'Helmond', 92910),
(uuid_generate_v4(), 'Oss', 'oss', 'city', 'Noord-Brabant', 'Oss', 92391),
(uuid_generate_v4(), 'Roosendaal', 'roosendaal', 'city', 'Noord-Brabant', 'Roosendaal', 77123),

-- Gelderland
(uuid_generate_v4(), 'Nijmegen', 'nijmegen', 'city', 'Gelderland', 'Nijmegen', 177818),
(uuid_generate_v4(), 'Apeldoorn', 'apeldoorn', 'city', 'Gelderland', 'Apeldoorn', 164781),
(uuid_generate_v4(), 'Arnhem', 'arnhem', 'city', 'Gelderland', 'Arnhem', 164424),
(uuid_generate_v4(), 'Ede', 'ede', 'city', 'Gelderland', 'Ede', 118123),
(uuid_generate_v4(), 'Doetinchem', 'doetinchem', 'city', 'Gelderland', 'Doetinchem', 58123),

-- Overijssel
(uuid_generate_v4(), 'Enschede', 'enschede', 'city', 'Overijssel', 'Enschede', 160398),
(uuid_generate_v4(), 'Zwolle', 'zwolle', 'city', 'Overijssel', 'Zwolle', 129840),
(uuid_generate_v4(), 'Deventer', 'deventer', 'city', 'Overijssel', 'Deventer', 101123),
(uuid_generate_v4(), 'Hengelo', 'hengelo', 'city', 'Overijssel', 'Hengelo', 81123),
(uuid_generate_v4(), 'Almelo', 'almelo', 'city', 'Overijssel', 'Almelo', 73123),

-- Groningen
(uuid_generate_v4(), 'Groningen', 'groningen', 'city', 'Groningen', 'Groningen', 233273),
(uuid_generate_v4(), 'Assen', 'assen', 'city', 'Groningen', 'Assen', 68123),

-- Limburg
(uuid_generate_v4(), 'Maastricht', 'maastricht', 'city', 'Limburg', 'Maastricht', 121565),
(uuid_generate_v4(), 'Venlo', 'venlo', 'city', 'Limburg', 'Venlo', 101889),
(uuid_generate_v4(), 'Sittard-Geleen', 'sittard-geleen', 'city', 'Limburg', 'Sittard-Geleen', 92123),
(uuid_generate_v4(), 'Heerlen', 'heerlen', 'city', 'Limburg', 'Heerlen', 87123),

-- Friesland
(uuid_generate_v4(), 'Leeuwarden', 'leeuwarden', 'city', 'Friesland', 'Leeuwarden', 124481),
(uuid_generate_v4(), 'Drachten', 'drachten', 'town', 'Friesland', 'Smallingerland', 55123),

-- Drenthe
(uuid_generate_v4(), 'Emmen', 'emmen', 'city', 'Drenthe', 'Emmen', 107024),
(uuid_generate_v4(), 'Hoogeveen', 'hoogeveen', 'city', 'Drenthe', 'Hoogeveen', 55123),

-- Zeeland
(uuid_generate_v4(), 'Middelburg', 'middelburg', 'city', 'Zeeland', 'Middelburg', 49123),
(uuid_generate_v4(), 'Vlissingen', 'vlissingen', 'city', 'Zeeland', 'Vlissingen', 44123),

-- Flevoland
(uuid_generate_v4(), 'Almere', 'almere', 'city', 'Flevoland', 'Almere', 214715),
(uuid_generate_v4(), 'Lelystad', 'lelystad', 'city', 'Flevoland', 'Lelystad', 81123);

-- Enable Row Level Security (RLS)
ALTER TABLE "Lead" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "ScrapeRun" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "DutchPlace" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "Note" ENABLE ROW LEVEL SECURITY;
ALTER TABLE "Tag" ENABLE ROW LEVEL SECURITY;

-- Create RLS policies for public access (you may want to restrict this in production)
CREATE POLICY "Allow public read access" ON "Lead" FOR SELECT USING (true);
CREATE POLICY "Allow public insert access" ON "Lead" FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public update access" ON "Lead" FOR UPDATE USING (true);

CREATE POLICY "Allow public read access" ON "ScrapeRun" FOR SELECT USING (true);
CREATE POLICY "Allow public insert access" ON "ScrapeRun" FOR INSERT WITH CHECK (true);
CREATE POLICY "Allow public update access" ON "ScrapeRun" FOR UPDATE USING (true);

CREATE POLICY "Allow public read access" ON "DutchPlace" FOR SELECT USING (true);

CREATE POLICY "Allow public read access" ON "Note" FOR SELECT USING (true);
CREATE POLICY "Allow public insert access" ON "Note" FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow public read access" ON "Tag" FOR SELECT USING (true);
CREATE POLICY "Allow public insert access" ON "Tag" FOR INSERT WITH CHECK (true);
