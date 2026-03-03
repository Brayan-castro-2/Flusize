const fs = require('fs');
const path = require('path');

const CHUNK_SIZE = 50; // Procesar de 50 en 50 para evitar Vercel/Node Timeouts
const RETARDO_MS = 2000; // 2 segundos entre cada lote

// Delay helper
const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

async function inyectarLoteMasivo() {
    const filePath = "C:\\Users\\FLUSIZE\\Downloads\\Flusize-main\\Flusize-main\\steelmonkey_masivo_completo.json";
    console.log(`Leyendo archivo masivo: ${filePath}`);

    if (!fs.existsSync(filePath)) {
        console.error("❌ El archivo no existe en la ruta especificada.");
        return;
    }

    const rawData = fs.readFileSync(filePath, 'utf8');
    let payload;

    try {
        payload = JSON.parse(rawData);
        console.log(`✅ Archivo parseado. Registros totales a procesar: ${payload.length}`);
    } catch (error) {
        console.error("❌ Error parseando JSON:", error);
        return;
    }

    let totalesExitosos = 0;
    let totalesErrores = 0;

    // Calcular la cantidad de pedazos (chunks)
    const numeroDeChunks = Math.ceil(payload.length / CHUNK_SIZE);

    console.log(`🚀 Iniciando Inyección en ${numeroDeChunks} lotes de ${CHUNK_SIZE} registros...\n`);

    for (let i = 0; i < numeroDeChunks; i++) {
        const inicio = i * CHUNK_SIZE;
        const fin = inicio + CHUNK_SIZE;
        const lote = payload.slice(inicio, fin);

        console.log(`--- [Lote ${i + 1}/${numeroDeChunks}] Procesando del índice ${inicio} al ${fin - 1} (${lote.length} registros) ---`);

        try {
            const response = await fetch("http://localhost:3000/api/import-steelmonkey?secret=titan2026-import", {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(lote)
            });

            const body = await response.json();

            if (response.ok) {
                console.log(`🟢 Lote ${i + 1} OK.`);
                totalesExitosos += body.procesados || 0;
                totalesErrores += (body.errores && body.errores.length) || 0;
            } else {
                console.error(`🔴 Lote ${i + 1} FALLÓ (Status ${response.status}):`, body.error || 'Sin detalles');
                totalesErrores += lote.length; // Asumimos todo el lote como error si explota
            }
        } catch (err) {
            console.error(`❌ Error de red crítico en Lote ${i + 1}:`, err.message);
            totalesErrores += lote.length;
        }

        // Si no es el último lote, hacemos una pausa para no abrumar a Supabase
        if (i < numeroDeChunks - 1) {
            console.log(`⏳ Esperando ${(RETARDO_MS / 1000).toFixed(1)}s antes del siguiente lote...`);
            await sleep(RETARDO_MS);
        }
    }

    console.log("\n==================================");
    console.log("🎉 IMPORTACIÓN MASIVA FINALIZADA");
    console.log(`✅ Registros Insertados/Procesados Exitosamente: ${totalesExitosos}`);
    console.log(`❌ Registros fallidos: ${totalesErrores}`);
    console.log("==================================");
}

inyectarLoteMasivo();
