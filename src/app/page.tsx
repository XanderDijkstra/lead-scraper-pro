export default function Home() {
  return (
    <div className="min-h-screen bg-gray-50">
      <header className="bg-white shadow-sm">
        <div className="max-w-7xl mx-auto px-4 py-6">
          <h1 className="text-3xl font-bold text-gray-900">Lead Scraper Pro</h1>
          <p className="mt-2 text-gray-600">
            Automated lead generation for Dutch contractors
          </p>
        </div>
      </header>

      <main className="max-w-7xl mx-auto px-4 py-8">
        <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
          {/* Stats Cards */}
          <div className="bg-white rounded-lg shadow p-6">
            <h3 className="text-sm font-medium text-gray-500">Total Leads</h3>
            <p className="mt-2 text-3xl font-bold text-blue-600">--</p>
          </div>

          <div className="bg-white rounded-lg shadow p-6">
            <h3 className="text-sm font-medium text-gray-500">Enriched</h3>
            <p className="mt-2 text-3xl font-bold text-green-600">--</p>
          </div>

          <div className="bg-white rounded-lg shadow p-6">
            <h3 className="text-sm font-medium text-gray-500">This Month</h3>
            <p className="mt-2 text-3xl font-bold text-purple-600">--</p>
          </div>
        </div>

        {/* Quick Actions */}
        <div className="mt-8 bg-white rounded-lg shadow">
          <div className="px-6 py-4 border-b border-gray-200">
            <h2 className="text-lg font-medium text-gray-900">Quick Actions</h2>
          </div>
          <div className="p-6 grid grid-cols-1 md:grid-cols-2 gap-4">
            <a
              href="/scrape"
              className="flex items-center p-4 bg-blue-50 rounded-lg hover:bg-blue-100 transition"
            >
              <div className="ml-4">
                <h3 className="font-medium text-blue-900">New Scrape</h3>
                <p className="text-sm text-blue-700">Scrape Google Maps for new leads</p>
              </div>
            </a>

            <a
              href="/leads"
              className="flex items-center p-4 bg-green-50 rounded-lg hover:bg-green-100 transition"
            >
              <div className="ml-4">
                <h3 className="font-medium text-green-900">View Leads</h3>
                <p className="text-sm text-green-700">Browse and manage your leads</p>
              </div>
            </a>
          </div>
        </div>

        {/* Setup Notice */}
        <div className="mt-8 bg-yellow-50 border border-yellow-200 rounded-lg p-4">
          <h3 className="font-medium text-yellow-900">⚠️ Setup Required</h3>
          <p className="mt-1 text-sm text-yellow-800">
            Before using this app, you need to:
          </p>
          <ul className="mt-2 text-sm text-yellow-800 list-disc list-inside">
            <li>Set up Supabase database</li>
            <li>Run database migrations</li>
            <li>Seed Dutch places data</li>
            <li>Configure environment variables</li>
          </ul>
        </div>
      </main>
    </div>
  );
}
