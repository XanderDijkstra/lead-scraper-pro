export const metadata = {
  title: 'Lead Scraper Pro',
  description: 'Automated lead generation for Dutch contractors',
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en">
      <body className="antialiased">{children}</body>
    </html>
  );
}
