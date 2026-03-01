import type { Metadata, Viewport } from 'next'
import { Inter } from 'next/font/google'
export const dynamic = 'force-dynamic'
import './globals.css'
import 'leaflet/dist/leaflet.css'
import { Toaster } from 'sileo'
import { ClientProviders } from '@/components/client-providers'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: {
    template: '%s | flusize',
    default: 'flusize',
  },
  description: 'Gestiona órdenes, fideliza clientes con el Link Mágico y toma el control total de tu taller automotriz con Flusize.',
};

export const viewport: Viewport = {
  width: 'device-width',
  initialScale: 1,
  maximumScale: 1,
  userScalable: false,
  themeColor: '#3b82f6',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="es">
      <head>
        <link rel="manifest" href="/manifest.json" />
        <meta name="mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-capable" content="yes" />
        <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
        <meta name="apple-mobile-web-app-title" content="Flusize" />
      </head>
      <body className={inter.className}>
        <ClientProviders>
          {children}
          <Toaster />
        </ClientProviders>
      </body>
    </html>
  )
}
