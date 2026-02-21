'use client';

import { useState } from 'react';
import { createClientComponentClient } from '@supabase/auth-helpers-nextjs';
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Building2, User, Mail, ShieldAlert, CheckCircle2, Loader2 } from 'lucide-react';

export default function AdminSysPage() {
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [isAuthenticated, setIsAuthenticated] = useState(false);
    const [loading, setLoading] = useState(false);

    // Form data for new workshop
    const [tallerName, setTallerName] = useState('');
    const [adminEmail, setAdminEmail] = useState('');
    const [tallerAddress, setTallerAddress] = useState('');
    const [status, setStatus] = useState<{ type: 'success' | 'error' | null, message: string }>({ type: null, message: '' });
    const [createdCredentials, setCreatedCredentials] = useState<{ email: string, password: string } | null>(null);

    const handleLogin = (e: React.FormEvent) => {
        e.preventDefault();
        // Hardcoded security as requested for MVP
        if (email === 'brayan@flusize.cl' && password === 'admin123') { // Simple check for demo
            setIsAuthenticated(true);
        } else {
            setStatus({ type: 'error', message: 'Credenciales inválidas' });
        }
    };

    const handleCreateTaller = async (e: React.FormEvent) => {
        e.preventDefault();
        setLoading(true);
        setStatus({ type: null, message: '' });
        setCreatedCredentials(null);

        try {
            const res = await fetch('/api/admin-sys/create-taller', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    nombre: tallerName,
                    direccion: tallerAddress,
                    emailAdmin: adminEmail
                })
            });

            const data = await res.json();

            if (!res.ok) throw new Error(data.error || 'Error al crear taller');

            setStatus({ type: 'success', message: 'Taller y Administrador creados exitosamente' });
            setCreatedCredentials({
                email: adminEmail,
                password: data.password // Temporary password returned from API
            });

            // Reset form
            setTallerName('');
            setAdminEmail('');
            setTallerAddress('');

        } catch (error: any) {
            setStatus({ type: 'error', message: error.message });
        } finally {
            setLoading(false);
        }
    };

    if (!isAuthenticated) {
        return (
            <div className="min-h-screen bg-slate-950 flex items-center justify-center p-4">
                <Card className="w-full max-w-md bg-slate-900 border-slate-800 text-slate-100">
                    <CardHeader>
                        <CardTitle className="flex items-center gap-2 text-red-500">
                            <ShieldAlert className="w-6 h-6" />
                            Acceso Restringido
                        </CardTitle>
                        <CardDescription className="text-slate-400">
                            Panel de Super Administrador del Sistema
                        </CardDescription>
                    </CardHeader>
                    <CardContent>
                        <form onSubmit={handleLogin} className="space-y-4">
                            <div className="space-y-2">
                                <Label>Email Super Admin</Label>
                                <Input
                                    type="email"
                                    value={email}
                                    onChange={(e) => setEmail(e.target.value)}
                                    className="bg-slate-800 border-slate-700"
                                />
                            </div>
                            <div className="space-y-2">
                                <Label>Contraseña</Label>
                                <Input
                                    type="password"
                                    value={password}
                                    onChange={(e) => setPassword(e.target.value)}
                                    className="bg-slate-800 border-slate-700"
                                />
                            </div>
                            {status.type === 'error' && (
                                <p className="text-red-400 text-sm">{status.message}</p>
                            )}
                            <Button type="submit" className="w-full bg-red-600 hover:bg-red-700">
                                Acceder
                            </Button>
                        </form>
                    </CardContent>
                </Card>
            </div>
        );
    }

    return (
        <div className="min-h-screen bg-slate-950 p-6 text-slate-100">
            <div className="max-w-4xl mx-auto space-y-8">
                <header>
                    <h1 className="text-3xl font-bold text-white mb-2">Panel Super Admin</h1>
                    <p className="text-slate-400">Gestión global de talleres y usuarios</p>
                </header>

                <div className="grid md:grid-cols-2 gap-6">
                    {/* Crear Taller Form */}
                    <Card className="bg-slate-900 border-slate-800 text-slate-100">
                        <CardHeader>
                            <CardTitle className="flex items-center gap-2">
                                <Building2 className="w-5 h-5 text-blue-400" />
                                Alta de Nuevo Taller
                            </CardTitle>
                            <CardDescription className="text-slate-400">
                                Crea un taller y su usuario administrador automáticamente
                            </CardDescription>
                        </CardHeader>
                        <CardContent>
                            <form onSubmit={handleCreateTaller} className="space-y-4">
                                <div className="space-y-2">
                                    <Label>Nombre del Taller</Label>
                                    <Input
                                        value={tallerName}
                                        onChange={(e) => setTallerName(e.target.value)}
                                        placeholder="Ej: Taller Mecánico Pro"
                                        className="bg-slate-800 border-slate-700"
                                        required
                                    />
                                </div>
                                <div className="space-y-2">
                                    <Label>Email del Dueño/Admin</Label>
                                    <Input
                                        type="email"
                                        value={adminEmail}
                                        onChange={(e) => setAdminEmail(e.target.value)}
                                        placeholder="dueno@taller.com"
                                        className="bg-slate-800 border-slate-700"
                                        required
                                    />
                                </div>
                                <div className="space-y-2">
                                    <Label>Dirección</Label>
                                    <Input
                                        value={tallerAddress}
                                        onChange={(e) => setTallerAddress(e.target.value)}
                                        placeholder="Av. Siempre Viva 123"
                                        className="bg-slate-800 border-slate-700"
                                        required
                                    />
                                </div>

                                {status.message && (
                                    <div className={`p-3 rounded-md text-sm ${status.type === 'success' ? 'bg-green-900/50 text-green-200' : 'bg-red-900/50 text-red-200'
                                        }`}>
                                        {status.message}
                                    </div>
                                )}

                                <Button
                                    type="submit"
                                    className="w-full bg-blue-600 hover:bg-blue-700"
                                    disabled={loading}
                                >
                                    {loading ? (
                                        <>
                                            <Loader2 className="w-4 h-4 mr-2 animate-spin" />
                                            Creando Taller...
                                        </>
                                    ) : (
                                        'Crear Taller y Admin'
                                    )}
                                </Button>
                            </form>
                        </CardContent>
                    </Card>

                    {/* Success State / Credentials */}
                    {createdCredentials && (
                        <Card className="bg-green-950/30 border-green-900 text-green-100">
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2 text-green-400">
                                    <CheckCircle2 className="w-6 h-6" />
                                    ¡Taller Creado!
                                </CardTitle>
                            </CardHeader>
                            <CardContent className="space-y-4">
                                <p className="text-sm text-green-200/80">
                                    Envía estas credenciales al mecánico por WhatsApp inmediatamente:
                                </p>
                                <div className="bg-black/40 p-4 rounded-lg space-y-2 font-mono border border-green-900">
                                    <div className="flex justify-between">
                                        <span className="text-slate-400">URL:</span>
                                        <span className="font-bold flex-1 text-right">flusize.cl/login</span>
                                    </div>
                                    <div className="flex justify-between">
                                        <span className="text-slate-400">Usuario:</span>
                                        <span className="font-bold flex-1 text-right">{createdCredentials.email}</span>
                                    </div>
                                    <div className="flex justify-between">
                                        <span className="text-slate-400">Password:</span>
                                        <span className="font-bold flex-1 text-right">{createdCredentials.password}</span>
                                    </div>
                                </div>
                                <Button
                                    onClick={() => {
                                        const text = `Hola! Tu taller ya está activo en Flusize.\n\nAccede aquí: https://flusize.cl/login\nUsuario: ${createdCredentials.email}\nClave: ${createdCredentials.password}`;
                                        window.open(`https://wa.me/?text=${encodeURIComponent(text)}`, '_blank');
                                    }}
                                    className="w-full bg-green-600 hover:bg-green-700"
                                >
                                    Enviar por WhatsApp
                                </Button>
                            </CardContent>
                        </Card>
                    )}
                </div>
            </div>
        </div>
    );
}
