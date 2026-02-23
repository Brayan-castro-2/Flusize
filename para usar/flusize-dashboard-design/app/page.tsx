import { SidebarNav } from "@/components/dashboard/sidebar-nav"
import { DashboardHeader } from "@/components/dashboard/dashboard-header"
import { MetricCards } from "@/components/dashboard/metric-cards"
import { GrowthChart } from "@/components/dashboard/growth-chart"
import { TenantTable } from "@/components/dashboard/tenant-table"
import { ActivityFeed } from "@/components/dashboard/activity-feed"

export default function Page() {
  return (
    <div className="flex h-screen overflow-hidden">
      <SidebarNav />
      <div className="flex flex-1 flex-col overflow-hidden">
        <DashboardHeader />
        <main className="flex-1 overflow-y-auto">
          <div className="mx-auto max-w-7xl p-6">
            <div className="flex flex-col gap-6">
              {/* North Star Metrics */}
              <MetricCards />

              {/* Growth Chart + Activity Feed */}
              <div className="grid grid-cols-1 gap-6 lg:grid-cols-5">
                <div className="lg:col-span-3">
                  <GrowthChart />
                </div>
                <div className="lg:col-span-2">
                  <ActivityFeed />
                </div>
              </div>

              {/* Tenant Management */}
              <TenantTable />
            </div>
          </div>
        </main>
      </div>
    </div>
  )
}
