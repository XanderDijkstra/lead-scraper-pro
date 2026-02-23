import { ReactNode } from 'react';

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
    <html lang="en">
      <body className="antialiased">{children}</body>
    </html>
  );
}
