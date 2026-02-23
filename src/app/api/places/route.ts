import { NextRequest, NextResponse } from 'next/server';
import { prisma } from '@/lib/prisma';

export async function GET() {
  try {
    const places = await prisma.dutchPlace.findMany({
      orderBy: [
        { province: 'asc' },
        { name: 'asc' },
      ],
    });
    
    // Group by province
    const byProvince = places.reduce((acc, place) => {
      if (!acc[place.province]) {
        acc[place.province] = [];
      }
      acc[place.province].push(place);
      return acc;
    }, {} as Record<string, typeof places>);
    
    return NextResponse.json({ places, byProvince });
  } catch (error) {
    console.error('Error fetching places:', error);
    return NextResponse.json(
      { error: 'Failed to fetch places' },
      { status: 500 }
    );
  }
}
