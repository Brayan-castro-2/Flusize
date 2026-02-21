'use client';

import { useAuth } from '@/contexts/auth-context';
import { useRouter } from 'next/navigation';
import Image from 'next/image';
import { Avatar, AvatarFallback } from '@/components/ui/avatar';
import {
    DropdownMenu,
    DropdownMenuContent,
    DropdownMenuItem,
    DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';
import { LogOut, WifiOff } from 'lucide-react';
import { useState, useEffect } from 'react';

export function Header() {
    const { user, logout } = useAuth();
    const router = useRouter();
    const [isOffline, setIsOffline] = useState(false);

    useEffect(() => {
        // Detectar si estamos en modo offline revisando la consola
        const checkOfflineMode = () => {
            // Verificar si hay logs de modo offline en la consola
            const originalLog = console.log;
            const originalWarn = console.warn;

            console.log = function (...args) {
                if (args[0]?.includes?.('OFFLINE') || args[0]?.includes?.('offline')) {
                    setIsOffline(true);
                }
                originalLog.apply(console, args);
            };

            console.warn = function (...args) {
                if (args[0]?.includes?.('OFFLINE') || args[0]?.includes?.('offline')) {
                    setIsOffline(true);
                }
                originalWarn.apply(console, args);
            };
        };

        checkOfflineMode();

        // También verificar periódicamente
        const interval = setInterval(() => {
            // Si hay errores de red, activar modo offline
            if (!navigator.onLine) {
                setIsOffline(true);
            }
        }, 5000);

        return () => clearInterval(interval);
    }, []);

    const handleLogout = async () => {
        await logout();
        router.push('/login');
    };

    const getInitials = (name: string) => {
        return name
            .split(' ')
            .map((n) => n[0])
            .join('')
            .toUpperCase()
            .slice(0, 2);
    };

    return (
        <header className="fixed top-0 left-0 z-[50] h-20 bg-gradient-to-r from-blue-500 to-cyan-400 shadow-xl w-full">
            <div className="h-full px-6 flex items-center justify-between max-w-7xl mx-auto">
                {/* Logo FLUSIZE */}
                <div className="flex items-center gap-4">
                    {/* Indicador de modo offline */}
                    {isOffline && (
                        <div className="flex items-center gap-2 px-3 py-1.5 bg-amber-500/10 border border-amber-500/30 rounded-lg">
                            <WifiOff className="w-4 h-4 text-amber-400" />
                            <span className="text-xs font-medium text-amber-400 hidden sm:inline">Modo Demo</span>
                        </div>
                    )}

                    {/* FLUSIZE Logo */}
                    <div className="flex items-center gap-2">
                        <div className="relative w-10 h-10">
                            <div className="absolute inset-0 bg-white rounded-tr-xl rounded-bl-xl transform skew-x-[-10deg]"></div>
                            <div className="absolute top-1/2 left-0 w-6 h-1 bg-blue-600 transform -translate-y-1/2 skew-x-[-10deg] ml-1"></div>
                            <div className="absolute bottom-2 left-1 w-4 h-1 bg-blue-600 skew-x-[-10deg]"></div>
                        </div>
                        <div className="flex flex-col leading-none">
                            <span className="font-extrabold text-2xl tracking-wide text-white">FLUSIZE</span>
                            <span className="text-[0.6rem] font-medium text-blue-100 tracking-wider uppercase">Orden y Control</span>
                        </div>
                    </div>
                </div>

                {/* User Menu */}
                {user && (
                    <DropdownMenu>
                        <DropdownMenuTrigger asChild>
                            <button className="flex items-center gap-3 px-3 py-2 rounded-xl bg-white/10 hover:bg-white/20 border border-white/20 transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-white/50 touch-target backdrop-blur-sm">
                                <Avatar className="h-8 w-8 ring-2 ring-white/30">
                                    <AvatarFallback className="bg-white text-blue-600 text-sm font-semibold">
                                        {getInitials(user.name)}
                                    </AvatarFallback>
                                </Avatar>
                                <div className="text-left hidden sm:block pr-1">
                                    <p className="text-sm font-medium text-white leading-tight">{user.name}</p>
                                    <p className="text-[10px] text-blue-100 capitalize">{user.role}</p>
                                </div>
                            </button>
                        </DropdownMenuTrigger>
                        <DropdownMenuContent align="end" className="w-56 bg-white border-gray-200 shadow-xl">
                            <div className="px-3 py-2 border-b border-gray-200">
                                <p className="text-sm font-medium text-gray-900">{user.name}</p>
                                <p className="text-xs text-gray-500">{user.email}</p>
                            </div>
                            <DropdownMenuItem
                                onClick={handleLogout}
                                className="text-red-600 focus:bg-red-50 focus:text-red-700 cursor-pointer"
                            >
                                <LogOut className="mr-3 h-4 w-4" />
                                Cerrar Sesión
                            </DropdownMenuItem>
                        </DropdownMenuContent>
                    </DropdownMenu>
                )}
            </div>
        </header>
    );
}
