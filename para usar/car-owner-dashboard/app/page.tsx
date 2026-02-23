"use client"

import { DashboardHeader } from "@/components/dashboard-header"
import { MyGarage } from "@/components/my-garage"
import { FinancialSummary } from "@/components/financial-summary"
import { QuickActions } from "@/components/quick-actions"
import { RecentActivity } from "@/components/recent-activity"
import { VehicleTechSpecs } from "@/components/vehicle-tech-specs"
import { BottomNav } from "@/components/bottom-nav"

export default function DashboardPage() {
  return (
    <div className="min-h-screen bg-background">
      <main className="mx-auto max-w-2xl pb-24 md:pb-8">
        <DashboardHeader />
        <div className="flex flex-col gap-6">
          <MyGarage />
          <FinancialSummary />
          <QuickActions />
          <RecentActivity />
          <VehicleTechSpecs />
        </div>
      </main>
      <BottomNav />
    </div>
  )
}
