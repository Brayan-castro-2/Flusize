import { TrackingHeader } from "@/components/order-tracking-design/tracking-header"
import { StatusTimeline } from "@/components/order-tracking-design/status-timeline"
import { LiveActionCard } from "@/components/order-tracking-design/live-action-card"
import { UpsellCard } from "@/components/order-tracking-design/upsell-card"
import { WorkshopFooter } from "@/components/order-tracking-design/workshop-footer"

export default function OrderTrackingDesignPage() {
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
