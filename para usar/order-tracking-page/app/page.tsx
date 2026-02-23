import { TrackingHeader } from "@/components/tracking/tracking-header"
import { StatusTimeline } from "@/components/tracking/status-timeline"
import { LiveActionCard } from "@/components/tracking/live-action-card"
import { UpsellCard } from "@/components/tracking/upsell-card"
import { WorkshopFooter } from "@/components/tracking/workshop-footer"

export default function OrderTrackingPage() {
  return (
    <main className="min-h-screen bg-background">
      <div className="mx-auto max-w-md">
        <TrackingHeader />

        <div className="h-px bg-border mx-4" role="separator" />

        <div className="py-4">
          <StatusTimeline />
        </div>

        <div className="h-px bg-border mx-4" role="separator" />

        <div className="py-4">
          <LiveActionCard />
        </div>

        <div className="py-2">
          <UpsellCard />
        </div>

        <div className="py-4">
          <WorkshopFooter />
        </div>
      </div>
    </main>
  )
}
