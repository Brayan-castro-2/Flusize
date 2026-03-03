const fs = require('fs');
let code = fs.readFileSync('app/page.tsx', 'utf8');

// Prevenir que comentarios de bloque existentes rompan el gran comentario envolvente
code = code.replace(/\*\//g, '* /');

const newCode = `export default function TestPage() {
  return (
    <div className="flex flex-col min-h-screen items-center justify-center bg-black text-white p-4">
      <h1 className="text-5xl font-bold text-orange-500 mb-4">Flusize - Prueba de Despliegue 🚀</h1>
      <p className="text-xl text-gray-400">Si estás viendo esta pantalla, Vercel está compilando correctamente.</p>
    </div>
  );
}

/* --- CODIGO ORIGINAL RECUPERABLE ---
${code}
*/
`;

fs.writeFileSync('app/page.tsx', newCode);
console.log('✅ app/page.tsx actualizado con éxito');
