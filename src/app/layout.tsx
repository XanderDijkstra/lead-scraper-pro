import type { ReactNode } from 'react';

export const metadata = {
  title: 'Lead Scraper Pro',
  description: 'Automated lead generation for Dutch contractors',
};

export default function RootLayout({
  children,
}: {
  children: ReactNode;
}) {
  return (
    <html lang="en" className="dark">
      <body className="antialiased min-h-screen bg-[#0f172a]">
        {children}
      </body>
    </html>
  );
}
