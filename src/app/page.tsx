export default function Home() {
  return (
    <div className="min-h-screen animated-bg flex">
      {/* Sidebar */}
      <aside className="w-72 sidebar-glass fixed h-full">
        <div className="p-8">
          <div className="flex items-center gap-4">
            <div className="w-12 h-12 rounded-2xl bg-gradient-to-br from-violet-500 to-fuchsia-500 flex items-center justify-center shadow-lg shadow-violet-500/30">
              <svg className="w-7 h-7 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13 10V3L4 14h7v7l9-11h-7z" />
              </svg>
            </div>
            <div>
              <h1 className="text-2xl font-bold gradient-text">Lead Scraper</h1>
              <p className="text-xs text-gray-500">Pro Edition</p>
            </div>
          </div>
        </div>

        <nav className="px-6 space-y-2">
          <a href="/" className="flex items-center gap-4 px-5 py-4 rounded-2xl bg-white/5 border border-white/10 text-white">
            <div className="w-10 h-10 rounded-xl bg-gradient-to-br from-violet-500/20 to-fuchsia-500/20 flex items-center justify-center">
              <svg className="w-5 h-5 text-violet-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2V6zM14 6a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2V6zM4 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2H6a2 2 0 01-2-2v-2zM14 16a2 2 0 012-2h2a2 2 0 012 2v2a2 2 0 01-2 2h-2a2 2 0 01-2-2v-2z" />
              </svg>
            </div>
            <span className="font-medium">Dashboard</span>
          </a>

          <a href="/scrape" className="flex items-center gap-4 px-5 py-4 rounded-2xl text-gray-400 hover:bg-white/5 hover:text-white transition-all">
            <div className="w-10 h-10 rounded-xl bg-gray-800 flex items-center justify-center">
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
              </svg>
            </div>
            <span>New Scrape</span>
          </a>

          <a href="/leads" className="flex items-center gap-4 px-5 py-4 rounded-2xl text-gray-400 hover:bg-white/5 hover:text-white transition-all">
            <div className="w-10 h-10 rounded-xl bg-gray-800 flex items-center justify-center">
              <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
            </div>
            <span>My Leads</span>
          </a>
        </nav>
      </aside>

      {/* Main Content */}
      <main className="flex-1 ml-72 p-10">
        {/* Header */}
        <div className="mb-10">
          <h2 className="text-4xl font-bold gradient-text mb-2">Dashboard</h2>
          <p className="text-gray-400">Automated lead generation for Dutch contractors</p>
        </div>

        {/* Stats Grid - Tic-tac-toe style */}
        <div className="grid grid-cols-3 gap-6 mb-10">
          <div className="stat-cell">
            <div className="flex items-center justify-between mb-4">
              <div className="w-3 h-3 rounded-full bg-violet-500 shadow-lg shadow-violet-500/50"></div>
              <span className="text-xs text-gray-500 uppercase tracking-wider">Total</span>
            </div>
            <p className="text-5xl font-bold text-white">--</p>
            <p className="text-sm text-gray-500 mt-2">Leads collected</p>
          </div>

          <div className="stat-cell">
            <div className="flex items-center justify-between mb-4">
              <div className="w-3 h-3 rounded-full bg-emerald-500 shadow-lg shadow-emerald-500/50"></div>
              <span className="text-xs text-gray-500 uppercase tracking-wider">Enriched</span>
            </div>
            <p className="text-5xl font-bold text-white">--</p>
            <p className="text-sm text-gray-500 mt-2">With contact info</p>
          </div>

          <div className="stat-cell">
            <div className="flex items-center justify-between mb-4">
              <div className="w-3 h-3 rounded-full bg-orange-500 shadow-lg shadow-orange-500/50"></div>
              <span className="text-xs text-gray-500 uppercase tracking-wider">This Month</span>
            </div>
            <p className="text-5xl font-bold text-white">--</p>
            <p className="text-sm text-gray-500 mt-2">New leads</p>
          </div>
        </div>

        {/* Action Cards */}
        <div className="glass-card p-8">
          <h3 className="text-xl font-semibold text-white mb-6">Quick Actions</h3>
          
          <div className="grid grid-cols-2 gap-6">
            <a href="/scrape" className="group">
              <div className="glass-card p-6 h-full flex items-center gap-5 transition-all duration-300 group-hover:scale-[1.02]">
                <div className="w-16 h-16 rounded-2xl bg-gradient-to-br from-violet-500 to-fuchsia-500 flex items-center justify-center shadow-lg shadow-violet-500/30">
                  <svg className="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                  </svg>
                </div>
                <div>
                  <h4 className="text-lg font-semibold text-white mb-1">New Scrape</h4>
                  <p className="text-sm text-gray-400">Search Google Maps for contractors</p>
                </div>
              </div>
            </a>

            <a href="/leads" className="group">
              <div className="glass-card p-6 h-full flex items-center gap-5 transition-all duration-300 group-hover:scale-[1.02]">
                <div className="w-16 h-16 rounded-2xl bg-gradient-to-br from-cyan-500 to-blue-500 flex items-center justify-center shadow-lg shadow-cyan-500/30">
                  <svg className="w-8 h-8 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
                  </svg>
                </div>
                <div>
                  <h4 className="text-lg font-semibold text-white mb-1">View Leads</h4>
                  <p className="text-sm text-gray-400">Browse and export your leads</p>
                </div>
              </div>
            </a>
          </div>
        </div>

        {/* Setup Notice */}
        <div className="mt-8 glass-card p-6 border-l-4 border-l-amber-500">
          <div className="flex items-start gap-4">
            <div className="w-10 h-10 rounded-xl bg-amber-500/20 flex items-center justify-center flex-shrink-0">
              <svg className="w-5 h-5 text-amber-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
              </svg>
            </div>
            <div>
              <h4 className="font-semibold text-amber-200 mb-1">Setup Required</h4>
              <p className="text-sm text-gray-400">Configure Supabase database and environment variables to start scraping.</p>
            </div>
          </div>
        </div>
      </main>
    </div>
  );
}
