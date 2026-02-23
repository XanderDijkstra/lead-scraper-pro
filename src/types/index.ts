// Types for Lead Scraper Pro

export interface Lead {
  id: string;
  source: 'google_maps' | 'website' | 'manual';
  status: 'new' | 'enriched' | 'contacted' | 'qualified' | 'converted';
  
  // Basic Info
  companyName: string;
  slug: string;
  
  // Location
  city: string;
  province: string;
  postalCode?: string;
  street?: string;
  fullAddress?: string;
  
  // Contact
  phone?: string;
  email?: string;
  website?: string;
  
  // Google Maps Data
  googleMapsUrl?: string;
  googleRating?: number;
  reviewCount?: number;
  placeId?: string;
  
  // Enrichment Data
  kvkNumber?: string;
  btwNumber?: string;
  yearEstablished?: number;
  employeeCount?: string;
  
  // Scraped Website Data
  services: string[];
  hasPortfolio: boolean;
  hasReviews: boolean;
  technologies: string[];
  
  // Social Media
  facebookUrl?: string;
  instagramUrl?: string;
  linkedinUrl?: string;
  
  // Metadata
  scrapedAt: string;
  enrichedAt?: string;
  lastCheckedAt?: string;
  
  // Relations
  notes?: Note[];
  tags?: Tag[];
}

export interface ScrapeRun {
  id: string;
  startedAt: string;
  completedAt?: string;
  city: string;
  businessType: string;
  radius: number;
  leadsFound: number;
  leadsEnriched: number;
  errors?: Record<string, unknown>;
}

export interface DutchPlace {
  id: string;
  name: string;
  slug: string;
  type: 'city' | 'town' | 'village';
  province: string;
  municipality: string;
  population?: number;
  lat?: number;
  lng?: number;
}

export interface Note {
  id: string;
  content: string;
  createdAt: string;
  leadId: string;
}

export interface Tag {
  id: string;
  name: string;
}

export interface ScrapeParams {
  city: string;
  businessType: string;
  radius?: number;
  limit?: number;
}

export interface EnrichmentResult {
  success: boolean;
  data?: Partial<Lead>;
  error?: string;
}
