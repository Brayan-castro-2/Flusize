'use client';

import { useRef, useState, useEffect } from 'react';
import { Eraser, Pen } from 'lucide-react';

interface FirmaCanvasProps {
    onFirmaChange: (base64: string | null) => void;
    label?: string;
}

export function FirmaCanvas({ onFirmaChange, label = 'COMPRADOR' }: FirmaCanvasProps) {
    const canvasRef = useRef<HTMLCanvasElement>(null);
    const [isDrawing, setIsDrawing] = useState(false);
    const [hasFirma, setHasFirma] = useState(false);
    const lastPos = useRef<{ x: number; y: number } | null>(null);

    const getPos = (e: MouseEvent | TouchEvent, canvas: HTMLCanvasElement) => {
        const rect = canvas.getBoundingClientRect();
        const scaleX = canvas.width / rect.width;
        const scaleY = canvas.height / rect.height;
        if ('touches' in e) {
            return {
                x: (e.touches[0].clientX - rect.left) * scaleX,
                y: (e.touches[0].clientY - rect.top) * scaleY,
            };
        }
        return {
            x: (e.clientX - rect.left) * scaleX,
            y: (e.clientY - rect.top) * scaleY,
        };
    };

    const startDraw = (e: React.MouseEvent | React.TouchEvent) => {
        e.preventDefault();
        const canvas = canvasRef.current;
        if (!canvas) return;
        setIsDrawing(true);
        lastPos.current = getPos(e.nativeEvent as MouseEvent | TouchEvent, canvas);
    };

    const draw = (e: React.MouseEvent | React.TouchEvent) => {
        e.preventDefault();
        if (!isDrawing) return;
        const canvas = canvasRef.current;
        if (!canvas) return;
        const ctx = canvas.getContext('2d');
        if (!ctx) return;
        const pos = getPos(e.nativeEvent as MouseEvent | TouchEvent, canvas);
        ctx.beginPath();
        ctx.moveTo(lastPos.current!.x, lastPos.current!.y);
        ctx.lineTo(pos.x, pos.y);
        ctx.strokeStyle = '#1e293b';
        ctx.lineWidth = 2.5;
        ctx.lineCap = 'round';
        ctx.lineJoin = 'round';
        ctx.stroke();
        lastPos.current = pos;
        setHasFirma(true);
        onFirmaChange(canvas.toDataURL('image/png'));
    };

    const stopDraw = () => {
        setIsDrawing(false);
        lastPos.current = null;
    };

    const limpiar = () => {
        const canvas = canvasRef.current;
        if (!canvas) return;
        const ctx = canvas.getContext('2d');
        if (!ctx) return;
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        setHasFirma(false);
        onFirmaChange(null);
    };

    return (
        <div className="space-y-2">
            <div className="flex items-center justify-between">
                <p className="text-xs font-bold text-slate-600 uppercase tracking-widest flex items-center gap-1.5">
                    <Pen className="w-3.5 h-3.5" />
                    Firma del {label}
                </p>
                {hasFirma && (
                    <button
                        type="button"
                        onClick={limpiar}
                        className="flex items-center gap-1.5 text-xs text-red-500 hover:text-red-600 font-semibold bg-red-50 px-2.5 py-1 rounded-lg"
                    >
                        <Eraser className="w-3.5 h-3.5" />
                        Borrar
                    </button>
                )}
            </div>
            <div className="relative border-2 border-dashed border-slate-300 rounded-xl overflow-hidden bg-white">
                <canvas
                    ref={canvasRef}
                    width={600}
                    height={140}
                    className="w-full touch-none cursor-crosshair"
                    onMouseDown={startDraw}
                    onMouseMove={draw}
                    onMouseUp={stopDraw}
                    onMouseLeave={stopDraw}
                    onTouchStart={startDraw}
                    onTouchMove={draw}
                    onTouchEnd={stopDraw}
                />
                {!hasFirma && (
                    <div className="absolute inset-0 flex items-center justify-center pointer-events-none">
                        <p className="text-slate-300 text-sm font-medium select-none">Firme aquí</p>
                    </div>
                )}
            </div>
            <div className="border-t border-slate-400 mx-6 pt-1 text-center">
                <p className="text-xs text-slate-500 font-medium">{label}</p>
            </div>
        </div>
    );
}
