'use client';

import { useState } from 'react';
import { actualizarPlanTallerAction } from './actions';
import { Loader2, Check } from 'lucide-react';
import { sileo } from 'sileo';

interface PlanSelectorProps {
    tallerId: string;
    currentPlan: string;
}

const PLANES = ['Gratis', 'Pro Tracking', 'Full Ecosistema'];

export function PlanSelector({ tallerId, currentPlan }: PlanSelectorProps) {
    const [loading, setLoading] = useState(false);
    const [plan, setPlan] = useState(currentPlan || 'Gratis');
    const [success, setSuccess] = useState(false);

    async function handlePlanChange(nuevoPlan: string) {
        if (nuevoPlan === plan) return;

        setLoading(true);
        setSuccess(false);
        try {
            const res = await actualizarPlanTallerAction(tallerId, nuevoPlan);
            if (res.error) {
                (sileo as any).error(res.error);
            } else {
                setPlan(nuevoPlan);
                setSuccess(true);
                // Ocultar check verde después de 2s
                setTimeout(() => setSuccess(false), 2000);
            }
        } catch (e) {
            (sileo as any).error('Error al actualizar plan');
        } finally {
            setLoading(false);
        }
    }

    return (
        <div className="flex items-center gap-2">
            <select
                disabled={loading}
                value={plan}
                onChange={(e) => handlePlanChange(e.target.value)}
                className={`text-xs font-bold py-1 pl-2 pr-8 border rounded-lg appearance-none bg-no-repeat bg-[right_0.5rem_center] bg-[length:1em_1em] transition-all
                    ${plan === 'Gratis' ? 'bg-slate-50 text-slate-600 border-slate-200' :
                        plan === 'Pro Tracking' ? 'bg-blue-50 text-blue-700 border-blue-200' :
                            'bg-emerald-50 text-emerald-700 border-emerald-200'}
                    disabled:opacity-50 cursor-pointer outline-none focus:ring-2 focus:ring-blue-500/20`}
                style={{ backgroundImage: `url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='currentColor'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='Length19 9l-7 7-7-7'%3E%3C/path%3E%3C/svg%3E")` }}
            >
                {PLANES.map(p => (
                    <option key={p} value={p}>{p}</option>
                ))}
            </select>

            {loading && <Loader2 className="w-3 h-3 animate-spin text-blue-600" />}
            {success && <Check className="w-3 h-3 text-emerald-600 animate-in fade-in zoom-in" />}
        </div>
    );
}
