import { NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';

export async function GET() {
  try {
    const places = await prisma.dutchPlace.findMany({
      orderBy: [
        { province: 'asc' },
        { name: 'asc' },
      ],
    });
    
    // Group by province - explicit types for TypeScript strict mode
    const byProvince: Record<string, typeof places> = {};
    for (const place of places) {
      if (!byProvince[place.province]) {
        byProvince[place.province] = [];
      }
      byProvince[place.province].push(place);
    }
    
    return NextResponse.json({ places, byProvince });
  } catch (error) {
    console.error('Error fetching places:', error);
    return NextResponse.json(
      { error: 'Failed to fetch places' },
      { status: 500 }
    );
  }
}
