'use client';

import { useTheme } from 'next-themes';
import { useEffect, useState } from 'react';
import { Sun, Moon } from 'lucide-react';

export function ThemeToggle() {
    const { theme, setTheme } = useTheme();
    const [mounted, setMounted] = useState(false);

    // Avoid hydration mismatch — only render after client mount
    useEffect(() => { setMounted(true); }, []);

    if (!mounted) return <div className="w-9 h-9" />;

    const isDark = theme === 'dark';

    return (
        <button
            onClick={() => setTheme(isDark ? 'light' : 'dark')}
            className={`
                flex items-center justify-center w-9 h-9 rounded-xl border transition-all duration-200
                focus:outline-none focus:ring-2 focus:ring-white/50
                ${isDark
                    ? 'bg-yellow-400/10 border-yellow-400/30 hover:bg-yellow-400/20 text-yellow-300'
                    : 'bg-white/10 border-white/20 hover:bg-white/20 text-white'
                }
            `}
            aria-label={isDark ? 'Cambiar a modo claro' : 'Cambiar a modo oscuro'}
            title={isDark ? 'Modo Claro' : 'Modo Oscuro'}
        >
            {isDark
                ? <Sun className="w-4 h-4" />
                : <Moon className="w-4 h-4" />
            }
        </button>
    );
}
