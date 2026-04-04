import { NextResponse } from 'next/server';
import { supabase } from '@/lib/supabase';

// Columns we need in contratos table
const neededCols = [
  'vehiculo_flota_id',
  'vehiculo_patente',
  'vehiculo_marca',
  'vehiculo_modelo',
  'vehiculo_color', 
  'vehiculo_anio',
  'vehiculo_motor',
  'cliente_nombre',
  'cliente_rut',
  'cliente_domicilio',
  'cliente_telefono',
  'precio_total',
  'pie_pagado',
  'saldo_pendiente',
  'precio_dia',
  'fecha_salida',
  'fecha_retorno',
  'dias',
  'notas',
  'firma_base64',
  'firmado_en',
  'ip_cliente',
  'creado_por',
  'estado',
  'tipo',
  'taller_id',
  'orden_id',
];

export async function GET() {
    const results: string[] = [];
    
    for (const col of neededCols) {
        const { error } = await supabase.from('contratos').select(col).limit(1);
        if (error?.code === '42703') {
            results.push(`MISSING: ${col}`);
        } else {
            results.push(`OK: ${col}`);
        }
    }
    
    return NextResponse.json({ results });
}

export async function POST() {
    const alterStatements = [
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS vehiculo_flota_id TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS vehiculo_patente TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS vehiculo_marca TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS vehiculo_modelo TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS vehiculo_color TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS vehiculo_anio TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS vehiculo_motor TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS cliente_nombre TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS cliente_rut TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS cliente_domicilio TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS cliente_telefono TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS precio_total NUMERIC DEFAULT 0`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS pie_pagado NUMERIC DEFAULT 0`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS saldo_pendiente NUMERIC DEFAULT 0`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS precio_dia NUMERIC DEFAULT 0`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS fecha_salida DATE`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS fecha_retorno DATE`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS dias INTEGER DEFAULT 0`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS notas TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS firma_base64 TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS firmado_en TIMESTAMPTZ`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS ip_cliente TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS creado_por TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS estado TEXT DEFAULT 'pendiente_firma'`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS tipo TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS taller_id TEXT`,
        `ALTER TABLE contratos ADD COLUMN IF NOT EXISTS orden_id TEXT`,
    ];
    
    const errors: string[] = [];
    for (const sql of alterStatements) {
        // We can't run DDL directly via supabase-js REST, so we just check what we need
        errors.push(sql);
    }
    
    return NextResponse.json({ needed: alterStatements, note: 'Run these in Supabase SQL editor' });
}
