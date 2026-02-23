import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';

// Simple scraper endpoint - will be enhanced with actual browser automation
export async function POST(request: NextRequest) {
  try {
    const body = await request.json();
    const { city, businessType, radius = 10 } = body;
    
    if (!city || !businessType) {
      return NextResponse.json(
        { error: 'City and businessType are required' },
        { status: 400 }
      );
    }
    
    // Create scrape run record
    const scrapeRun = await prisma.scrapeRun.create({
      data: {
        city,
        businessType,
        radius,
      },
    });
    
    // TODO: Implement actual browser-based scraping here
    // For now, return the scrape run ID so frontend can poll for results
    
    return NextResponse.json({ 
      scrapeRun,
      message: 'Scrape started. This is a placeholder - actual scraping to be implemented.' 
    });
  } catch (error) {
    console.error('Error starting scrape:', error);
    return NextResponse.json(
      { error: 'Failed to start scrape' },
      { status: 500 }
    );
  }
}

export async function GET(request: NextRequest) {
  try {
    const { searchParams } = new URL(request.url);
    const id = searchParams.get('id');
    
    if (id) {
      const scrapeRun = await prisma.scrapeRun.findUnique({
        where: { id },
        include: { leads: true },
      });
      
      if (!scrapeRun) {
        return NextResponse.json(
          { error: 'Scrape run not found' },
          { status: 404 }
        );
      }
      
      return NextResponse.json({ scrapeRun });
    }
    
    // List all scrape runs
    const scrapeRuns = await prisma.scrapeRun.findMany({
      orderBy: { startedAt: 'desc' },
      take: 20,
    });
    
    return NextResponse.json({ scrapeRuns });
  } catch (error) {
    console.error('Error fetching scrape runs:', error);
    return NextResponse.json(
      { error: 'Failed to fetch scrape runs' },
      { status: 500 }
    );
  }
}
