import { NextResponse } from 'next/server'
import { createServerClient, type CookieOptions } from '@supabase/ssr'
import { cookies } from 'next/headers'

export async function GET(request: Request) {
    const requestUrl = new URL(request.url)
    const code = requestUrl.searchParams.get('code')
    const next = requestUrl.searchParams.get('next') ?? '/'

    if (code) {
        const cookieStore = cookies()

        const supabase = createServerClient(
            process.env.NEXT_PUBLIC_SUPABASE_URL!,
            process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
            {
                cookies: {
                    get(name: string) {
                        return cookieStore.get(name)?.value
                    },
                    set(name: string, value: string, options: CookieOptions) {
                        cookieStore.set({ name, value, ...options })
                    },
                    remove(name: string, options: CookieOptions) {
                        cookieStore.delete({ name, ...options })
                    },
                },
            }
        )

        const { error } = await supabase.auth.exchangeCodeForSession(code)

        if (!error) {
            // La redirección real y el control de roles lo hará el middleware.ts, 
            // así que simplemente lo enviamos a / (o a auth/verify) y el middleware decidirá.
            // O directo a admin si Next = /, el middleware igual parará la bola.
            return NextResponse.redirect(`${requestUrl.origin}/validando-sesion`)
        }
    }

    // Fallback si falla
    return NextResponse.redirect(`${requestUrl.origin}/login?error=InvalidLink`)
}
