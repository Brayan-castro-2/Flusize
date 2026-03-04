import type { Metadata, Viewport } from 'next'
import { Inter } from 'next/font/google'
export const dynamic = 'force-dynamic'
import './globals.css'
import 'leaflet/dist/leaflet.css'
import { Toaster } from 'sileo'
import { ClientProviders } from '@/components/client-providers'
import { Analytics } from "@vercel/analytics/next"

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: {
    template: '%s | flusize',
    default: 'flusize',
  },
  description: 'Gestiona órdenes, fideliza clientes con el Link Mágico y toma el control total de tu taller automotriz con Flusize.',
  manifest: '/manifest.json',
  icons: {
    icon: [
      { url: '/favicon.png', sizes: '32x32', type: 'image/png' },
      { url: '/logo-celular-192x192.png', sizes: '192x192', type: 'image/png' },
      { url: '/logo-celular-512x512.png', sizes: '512x512', type: 'image/png' },
    ],
    apple: [
      { url: '/apple-touch-icon.png', sizes: '180x180', type: 'image/png' },
    ],
  },
  openGraph: {
    title: 'Flusize - Control Automotriz',
    description: 'Gestiona órdenes, fideliza clientes y toma el control total de tu taller automotriz.',
    images: [
      {
        url: '/logo-celular.png',
        width: 400,
        height: 400,
        alt: 'Flusize Logo',
      },
    ],
    type: 'website',
  },
  twitter: {
    card: 'summary',
    title: 'Flusize - Control Automotriz',
    description: 'Gestiona órdenes, fideliza clientes y toma el control total de tu taller automotriz.',
    images: ['/logo-celular.png'],
  }
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
        {/* SEO Googlebot Directives */}
        <link rel="icon" href="/logo-celular.png" sizes="any" />
        <link rel="apple-touch-icon" href="/logo-celular.png" />
        <meta property="og:image" content="/logo-celular.png" />
        <meta name="twitter:image" content="/logo-celular.png" />
      </head>
      <body className={inter.className}>
        <ClientProviders>
          {/* Script para desestancar Service Workers antiguos que redirigían mal los assets */}
          <script
            dangerouslySetInnerHTML={{
              __html: `
                if ('serviceWorker' in navigator) {
                  navigator.serviceWorker.getRegistrations().then(function(registrations) {
                    for(let registration of registrations) {
                      registration.unregister();
                    }
                  });
                }
              `
            }}
          />
          {children}
          <Toaster />
          <Analytics />
        </ClientProviders>
      </body>
    </html>
  )
}
