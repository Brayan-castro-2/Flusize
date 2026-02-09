'use client';

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { Button } from '@/components/ui/button';
import { Check, Zap, ArrowLeft, Crown, Rocket } from 'lucide-react';

const Logo = () => (
    <div className="flex items-center gap-2">
        <div className="relative w-8 h-8">
            <div className="absolute inset-0 bg-gradient-to-tr from-cyan-500 to-blue-600 rounded-tr-xl rounded-bl-xl transform skew-x-[-10deg]"></div>
            <div className="absolute top-1/2 left-0 w-5 h-1 bg-white transform -translate-y-1/2 skew-x-[-10deg] ml-1"></div>
            <div className="absolute bottom-2 left-1 w-3 h-1 bg-white skew-x-[-10deg]"></div>
        </div>
        <div className="flex flex-col leading-none">
            <span className="font-extrabold text-2xl tracking-wide text-white">FLUSIZE</span>
            <span className="text-[0.6rem] font-medium text-cyan-400 tracking-wider">ORDEN Y CONTROL</span>
        </div>
    </div>
);

interface Plan {
    name: string;
    price: string;
    period: string;
    description: string;
    features: string[];
    highlighted?: boolean;
    icon: any;
    color: string;
}

const plans: Plan[] = [
    {
        name: 'Básico',
        price: '$29.990',
        period: '/mes',
        description: 'Perfecto para talleres pequeños que están comenzando',
        icon: Zap,
        color: 'slate',
        features: [
            'Hasta 50 órdenes/mes',
            'Gestión de clientes y vehículos',
            'Calendario de citas básico',
            'Reportes mensuales',
            'Soporte por email',
            'Perfil en el mapa Flusize',
        ],
    },
    {
        name: 'Pro',
        price: '$59.990',
        period: '/mes',
        description: 'La opción más popular para talleres en crecimiento',
        icon: Crown,
        color: 'cyan',
        highlighted: true,
        features: [
            'Órdenes ilimitadas',
            'Gestión avanzada de inventario',
            'Calendario inteligente con recordatorios',
            'Reportes personalizados y analytics',
            'Soporte prioritario 24/7',
            'Perfil destacado en el mapa',
            'Integración con WhatsApp',
            'Sistema de fidelización de clientes',
        ],
    },
    {
        name: 'Enterprise',
        price: '$99.990',
        period: '/mes',
        description: 'Para talleres grandes con múltiples sucursales',
        icon: Rocket,
        color: 'blue',
        features: [
            'Todo lo de Pro +',
            'Multi-sucursal (hasta 5 talleres)',
            'API personalizada',
            'Gestión de empleados y roles',
            'Integración con sistemas contables',
            'Onboarding personalizado',
            'Account manager dedicado',
            'Reportes en tiempo real',
        ],
    },
];

export default function PlanesPage() {
    const router = useRouter();
    const [selectedPlan, setSelectedPlan] = useState<string | null>(null);

    const handleSelectPlan = (planName: string) => {
        setSelectedPlan(planName);
        // Simulate checkout
        setTimeout(() => {
            alert(`¡Excelente elección! Plan ${planName} seleccionado.\n\nEn la versión completa, aquí irías al checkout.\n\nPor ahora, te redirigiremos al login.`);
            router.push('/login');
        }, 500);
    };

    return (
        <main className="min-h-screen bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 relative overflow-hidden">
            {/* Background decorations */}
            <div className="absolute top-0 right-0 w-96 h-96 bg-cyan-500/10 rounded-full blur-3xl"></div>
            <div className="absolute bottom-0 left-0 w-96 h-96 bg-blue-600/10 rounded-full blur-3xl"></div>

            {/* Header */}
            <div className="relative z-10 border-b border-slate-700 bg-slate-900/50 backdrop-blur-sm">
                <div className="max-w-7xl mx-auto px-6 py-4 flex items-center justify-between">
                    <Logo />
                    <Link href="/login">
                        <button className="text-slate-400 hover:text-cyan-400 transition-colors text-sm font-medium">
                            Iniciar Sesión
                        </button>
                    </Link>
                </div>
            </div>

            <div className="relative z-10 max-w-7xl mx-auto px-6 py-12">
                {/* Back Button */}
                <Link href="/registro-taller">
                    <button className="flex items-center gap-2 text-slate-400 hover:text-cyan-400 transition-colors mb-8">
                        <ArrowLeft className="w-5 h-5" />
                        <span className="text-sm font-medium">Volver al registro</span>
                    </button>
                </Link>

                {/* Header */}
                <div className="text-center mb-16">
                    <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-cyan-500/10 text-cyan-400 border border-cyan-500/20 mb-4">
                        <Crown className="w-4 h-4" />
                        <span className="text-sm font-semibold">Planes Flusize</span>
                    </div>
                    <h1 className="text-5xl font-bold text-white mb-4">
                        Elige el plan perfecto para tu taller
                    </h1>
                    <p className="text-slate-400 text-xl max-w-3xl mx-auto">
                        Sin contratos a largo plazo. Cancela cuando quieras. Todos los planes incluyen 14 días de prueba gratis.
                    </p>
                </div>

                {/* Pricing Cards */}
                <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mb-12">
                    {plans.map((plan) => {
                        const Icon = plan.icon;
                        const isHighlighted = plan.highlighted;

                        return (
                            <div
                                key={plan.name}
                                className={`relative rounded-2xl p-8 border-2 transition-all ${isHighlighted
                                        ? 'border-cyan-500 bg-slate-800/80 shadow-2xl shadow-cyan-500/20 scale-105'
                                        : 'border-slate-700 bg-slate-800/50 hover:border-slate-600'
                                    }`}
                            >
                                {isHighlighted && (
                                    <div className="absolute -top-4 left-1/2 -translate-x-1/2 px-4 py-1 bg-gradient-to-r from-cyan-500 to-blue-600 rounded-full text-white text-xs font-bold">
                                        MÁS POPULAR
                                    </div>
                                )}

                                <div className="flex items-center gap-3 mb-4">
                                    <div className={`p-3 rounded-xl bg-${plan.color}-500/10 border border-${plan.color}-500/20`}>
                                        <Icon className={`w-6 h-6 text-${plan.color}-400`} />
                                    </div>
                                    <h3 className="text-2xl font-bold text-white">{plan.name}</h3>
                                </div>

                                <p className="text-slate-400 text-sm mb-6">{plan.description}</p>

                                <div className="mb-6">
                                    <div className="flex items-baseline gap-1">
                                        <span className="text-4xl font-bold text-white">{plan.price}</span>
                                        <span className="text-slate-400">{plan.period}</span>
                                    </div>
                                    <p className="text-xs text-slate-500 mt-1">+ IVA</p>
                                </div>

                                <Button
                                    onClick={() => handleSelectPlan(plan.name)}
                                    className={`w-full h-12 mb-6 font-semibold rounded-xl transition-all ${isHighlighted
                                            ? 'bg-gradient-to-r from-cyan-500 to-blue-600 hover:from-cyan-400 hover:to-blue-500 text-white shadow-lg shadow-cyan-500/25'
                                            : 'bg-slate-700 hover:bg-slate-600 text-white'
                                        }`}
                                >
                                    {selectedPlan === plan.name ? 'Procesando...' : 'Seleccionar Plan'}
                                </Button>

                                <div className="space-y-3">
                                    {plan.features.map((feature, idx) => (
                                        <div key={idx} className="flex items-start gap-3">
                                            <Check className="w-5 h-5 text-cyan-400 flex-shrink-0 mt-0.5" />
                                            <span className="text-sm text-slate-300">{feature}</span>
                                        </div>
                                    ))}
                                </div>
                            </div>
                        );
                    })}
                </div>

                {/* FAQ / Additional Info */}
                <div className="text-center bg-slate-800/50 backdrop-blur-md rounded-2xl p-8 border border-slate-700">
                    <h3 className="text-2xl font-bold text-white mb-4">¿Tienes dudas?</h3>
                    <p className="text-slate-400 mb-6">
                        Nuestro equipo está listo para ayudarte a elegir el mejor plan para tu taller.
                    </p>
                    <div className="flex items-center justify-center gap-4">
                        <Button variant="outline" className="border-slate-600 text-slate-300 hover:bg-slate-700">
                            Contactar Ventas
                        </Button>
                        <Button variant="outline" className="border-slate-600 text-slate-300 hover:bg-slate-700">
                            Ver Demo
                        </Button>
                    </div>
                </div>
            </div>
        </main>
    );
}
