'use client';

import { useState, useEffect } from 'react';
import { actualizarPerfil, type PerfilDB } from '@/lib/storage-adapter';
import { useAuth } from '@/contexts/auth-context';
import { usePerfiles } from '@/hooks/use-perfiles';
import { useQueryClient } from '@tanstack/react-query';
import { crearUsuarioAdminAction } from './actions';
import { toast } from 'sonner';

import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Button } from '@/components/ui/button';
import { Badge } from '@/components/ui/badge';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
} from '@/components/ui/dialog';
import {
    Select,
    SelectContent,
    SelectItem,
    SelectTrigger,
    SelectValue,
} from '@/components/ui/select';
import {
    Users,
    Search,
    UserPlus,
    Shield,
    Wrench,
    CheckCircle,
    XCircle,
    ChevronRight,
    Loader2
} from 'lucide-react';
import Link from 'next/link';

export default function UsuariosPage() {
    const { data: usuarios = [], isLoading, refetch } = usePerfiles();
    const queryClient = useQueryClient();
    const [searchTerm, setSearchTerm] = useState('');
    const [isCreating, setIsCreating] = useState(false);

    const [createDialogOpen, setCreateDialogOpen] = useState(false);
    const [createError, setCreateError] = useState('');

    // New user form
    const [newEmail, setNewEmail] = useState('');
    const [newPassword, setNewPassword] = useState('');
    const [newName, setNewName] = useState('');
    const [newRole, setNewRole] = useState<'mecanico' | 'taller_admin' | 'superadmin'>('mecanico');
    const { user: currentUser } = useAuth();

    // Roles disponibles según el nivel del admin que crea
    // FASE 28: superadmin puede crear su mismo nivel (socios/dueños)
    const isSuperAdmin = currentUser?.role === 'superadmin';
    const rolesDisponibles = isSuperAdmin
        ? [
            { value: 'mecanico', label: '🔧 Mecánico' },
            { value: 'taller_admin', label: '📋 Admin (Jefe de Taller)' },
            { value: 'superadmin', label: '👑 Dueño (Superadmin)' },
        ]
        : [
            { value: 'mecanico', label: '🔧 Mecánico' },
        ];

    const handleToggleActive = async (usuario: PerfilDB) => {
        try {
            const updated = await actualizarPerfil(usuario.id, { activo: !usuario.activo });
            if (updated) {
                toast.success(`Usuario ${usuario.activo ? 'bloqueado' : 'activado'} correctamente`);
                await queryClient.invalidateQueries({ queryKey: ['perfiles'] });
            } else {
                toast.error('No se pudo actualizar el estado del usuario');
            }
        } catch (error) {
            toast.error('Error al actualizar el usuario');
            console.error(error);
        }
    };

    const handleCreateUser = async () => {
        if (!newEmail || !newPassword || !newName) {
            setCreateError('Completa todos los campos');
            return;
        }

        if (newPassword.length < 6) {
            setCreateError('La contraseña debe tener al menos 6 caracteres');
            return;
        }

        setIsCreating(true);
        setCreateError('');

        if (!currentUser?.tallerId) {
            setCreateError('No tienes un taller asignado para crear usuarios.');
            setIsCreating(false);
            return;
        }

        const result = await crearUsuarioAdminAction({
            email: newEmail,
            password: newPassword,
            nombreCompleto: newName,
            rol: newRole,
            tallerId: currentUser.tallerId
        });

        if (result.success) {
            setCreateDialogOpen(false);
            setNewEmail('');
            setNewPassword('');
            setNewName('');
            setNewRole('mecanico');
            await queryClient.invalidateQueries({ queryKey: ['perfiles'] });
        } else {
            setCreateError(result.error || 'Error al crear usuario');
        }

        setIsCreating(false);
    };

    const filteredUsuarios = usuarios.filter((u: PerfilDB) =>
        (u.nombre_completo || '').toLowerCase().includes(searchTerm.toLowerCase())
    );

    return (
        <div className="space-y-6">
            {/* Header */}
            <div className="flex items-center gap-3">
                <div className="w-10 h-10 bg-[#0066FF] rounded-xl flex items-center justify-center">
                    <Users className="w-5 h-5 text-gray-800" />
                </div>
                <div>
                    <h1 className="text-xl md:text-2xl font-bold text-gray-800">Usuarios</h1>
                    <p className="text-sm text-gray-600">Gestión de mecánicos y administradores</p>
                </div>

                <div className="ml-auto">
                    <Dialog open={createDialogOpen} onOpenChange={setCreateDialogOpen}>
                        <DialogTrigger asChild>
                            <Button className="bg-[#0066FF] hover:bg-[#0052CC] text-white">
                                <UserPlus className="w-4 h-4 mr-2" />
                                Crear Usuario
                            </Button>
                        </DialogTrigger>
                        <DialogContent className="sm:max-w-[425px]">
                            <DialogHeader>
                                <DialogTitle>Nuevo Usuario</DialogTitle>
                            </DialogHeader>
                            <div className="space-y-4 py-4">
                                {createError && (
                                    <div className="p-3 bg-red-50 text-red-600 text-sm rounded-lg border border-red-200">
                                        {createError}
                                    </div>
                                )}
                                <div className="space-y-2">
                                    <Label htmlFor="name">Nombre Completo</Label>
                                    <Input
                                        id="name"
                                        placeholder="Ej: Juan Pérez"
                                        value={newName}
                                        onChange={(e) => setNewName(e.target.value)}
                                    />
                                </div>
                                <div className="space-y-2">
                                    <Label htmlFor="email">Email</Label>
                                    <Input
                                        id="email"
                                        type="email"
                                        placeholder="usuario@taller.com"
                                        value={newEmail}
                                        onChange={(e) => setNewEmail(e.target.value)}
                                    />
                                </div>
                                <div className="space-y-2">
                                    <Label htmlFor="password">Contraseña</Label>
                                    <Input
                                        id="password"
                                        type="password"
                                        placeholder="Mínimo 6 caracteres"
                                        value={newPassword}
                                        onChange={(e) => setNewPassword(e.target.value)}
                                    />
                                </div>
                                <div className="space-y-2">
                                    <Label htmlFor="role">Rol del Usuario</Label>
                                    <Select value={newRole} onValueChange={(val: any) => setNewRole(val)}>
                                        <SelectTrigger id="role" className="w-full">
                                            <SelectValue placeholder="Seleccionar Rol" />
                                        </SelectTrigger>
                                        <SelectContent>
                                            {rolesDisponibles.map(r => (
                                                <SelectItem key={r.value} value={r.value}>{r.label}</SelectItem>
                                            ))}
                                        </SelectContent>
                                    </Select>
                                </div>
                                <Button
                                    className="w-full bg-[#0066FF] hover:bg-[#0052CC]"
                                    onClick={handleCreateUser}
                                    disabled={isCreating}
                                >
                                    {isCreating ? (
                                        <>
                                            <Loader2 className="w-4 h-4 mr-2 animate-spin" />
                                            Creando...
                                        </>
                                    ) : 'Crear Usuario'}
                                </Button>
                            </div>
                        </DialogContent>
                    </Dialog>
                </div>
            </div>

            {/* Search */}
            <div className="relative">
                <Search className="absolute left-3 top-1/2 -translate-y-1/2 w-4 h-4 text-gray-600" />
                <Input
                    placeholder="Buscar usuario..."
                    value={searchTerm}
                    onChange={(e) => setSearchTerm(e.target.value)}
                    className="pl-10 bg-white border-gray-200 text-gray-800 placeholder:text-gray-500 rounded-xl h-12"
                />
            </div>

            {/* Users List */}
            <div className="space-y-3">
                {isLoading ? (
                    <div className="flex items-center justify-center py-10">
                        <Loader2 className="w-8 h-8 animate-spin text-[#0066FF]" />
                    </div>
                ) : (
                    filteredUsuarios.map((usuario: PerfilDB) => (
                        <Card key={usuario.id} className="bg-white border-gray-200">
                            <CardContent className="p-4">
                                <div className="flex items-center gap-4">
                                    {/* Avatar con Iniciales */}
                                    <div className={`w-12 h-12 rounded-xl flex items-center justify-center text-lg font-bold text-white shadow-sm relative shrink-0 ${usuario.rol === 'superadmin' ? 'bg-gradient-to-br from-orange-500 to-red-600' :
                                        usuario.rol === 'taller_admin' ? 'bg-gradient-to-br from-blue-500 to-blue-700' :
                                            'bg-gradient-to-br from-slate-600 to-slate-800'
                                        }`}>
                                        {(usuario.nombre_completo || 'U').charAt(0).toUpperCase()}
                                        {usuario.rol === 'taller_admin' && (
                                            <div className="absolute -top-1 -right-1 bg-white rounded-full p-1 shadow-sm border border-blue-100">
                                                <Shield className="w-2.5 h-2.5 text-blue-600" />
                                            </div>
                                        )}
                                        {usuario.rol === 'superadmin' && (
                                            <div className="absolute -top-1 -right-1 bg-white rounded-full p-1 shadow-sm border border-orange-100">
                                                <Shield className="w-2.5 h-2.5 text-orange-600" />
                                            </div>
                                        )}
                                    </div>

                                    {/* Info */}
                                    <div className="flex-1 min-w-0">
                                        <p className="text-gray-800 font-medium truncate">{usuario.nombre_completo}</p>
                                        <div className="flex items-center gap-2 mt-1">
                                            <Badge variant="outline" className={`text-xs ${usuario.rol === 'superadmin' ? 'border-[#FF4D00]/50 text-[#FF4D00] bg-[#FF4D00]/5' :
                                                usuario.rol === 'taller_admin' ? 'border-[#0066FF]/30 text-[#0066FF]' :
                                                    'border-gray-600 text-gray-600'
                                                }`}>
                                                {usuario.rol === 'superadmin' ? 'Dueño (Superadmin)' :
                                                    usuario.rol === 'taller_admin' ? 'Administrador' : 'Mecánico'}
                                            </Badge>
                                            {usuario.activo ? (
                                                <Badge className="bg-green-500/20 text-green-400 border-green-500/30 text-xs">
                                                    <CheckCircle className="w-3 h-3 mr-1" />
                                                    Activo
                                                </Badge>
                                            ) : (
                                                <Badge className="bg-red-500/20 text-red-400 border-red-500/30 text-xs">
                                                    <XCircle className="w-3 h-3 mr-1" />
                                                    Bloqueado
                                                </Badge>
                                            )}
                                        </div>
                                    </div>

                                    {/* Actions */}
                                    <div className="flex items-center gap-2">
                                        <Button
                                            variant="ghost"
                                            size="sm"
                                            onClick={() => handleToggleActive(usuario)}
                                            className={`text-xs ${usuario.activo
                                                ? 'text-red-400 hover:text-red-300 hover:bg-red-500/10'
                                                : 'text-green-400 hover:text-green-300 hover:bg-green-500/10'
                                                }`}
                                        >
                                            {usuario.activo ? 'Bloquear' : 'Activar'}
                                        </Button>
                                        <Link href={`/admin/usuarios/${usuario.id}`}>
                                            <Button variant="ghost" size="icon" className="text-gray-600 hover:text-gray-800">
                                                <ChevronRight className="w-5 h-5" />
                                            </Button>
                                        </Link>
                                    </div>
                                </div>
                            </CardContent>
                        </Card>
                    ))
                )}

                {(!isLoading && filteredUsuarios.length === 0) && (
                    <Card className="bg-white border-gray-200">
                        <CardContent className="py-12 text-center">
                            <Users className="w-12 h-12 mx-auto mb-3 text-gray-600" />
                            <p className="text-gray-600">No se encontraron usuarios</p>
                        </CardContent>
                    </Card>
                )}
            </div>
        </div>
    );
}
