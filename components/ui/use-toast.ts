
"use client"

import { toast as sonnerToast, Toaster } from "sonner"

type ToastProps = {
    title?: string
    description?: string
    action?: React.ReactNode
    variant?: "default" | "destructive"
}

function toast({ title, description, action, variant }: ToastProps) {
    if (variant === "destructive") {
        sonnerToast.error(title, {
            description,
            action,
        })
    } else {
        sonnerToast.success(title, {
            description,
            action,
        })
    }
}

function useToast() {
    return {
        toast,
        dismiss: (id?: string) => sonnerToast.dismiss(id),
    }
}

export { useToast, toast }
