import { NextResponse } from 'next/server';
import { supabase } from '@/lib/supabase';

export async function GET() {
    // try to query kilometraje
    const { data, error } = await supabase.from('ordenes').select('vehiculo_kilometraje').limit(1);
    
    if (error && error.code === '42703') {
        const sql = `ALTER TABLE ordenes ADD COLUMN IF NOT EXISTS vehiculo_kilometraje TEXT;`;
        return NextResponse.json({ message: 'column does not exist', error });
    }
    
    return NextResponse.json({ message: 'query ran', data, error });
}
