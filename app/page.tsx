'use client';

import React, { useRef, useState, useEffect, useMemo } from 'react';
import { motion, useScroll, useTransform, useInView } from 'framer-motion';
import Link from 'next/link';
import FomoMap from '@/components/landing/FomoMap';
import {
  ArrowRight,
  Search,
  MapPin,
  Zap,
  MessageCircle,
  Wrench,
  ShieldCheck,
  CheckCircle2,
  Car,
  Clock,
  Banknote,
  Sparkles,
  AlertTriangle,
  X,
  Droplets,
  Disc,
  LifeBuoy,
  MessageSquare,
  ChevronRight
} from 'lucide-react';

// --- MAIN PAGE COMPONENT ---
export default function LandingPage() {
  const { scrollYProgress } = useScroll();
  const scaleX = useTransform(scrollYProgress, [0, 1], [0, 1]);

  return (
    <div className="bg-slate-50 min-h-screen font-sans overflow-x-hidden text-slate-900">
      {/* Scroll Progress Bar */}
      <motion.div
        className="fixed top-0 left-0 right-0 h-1 bg-gradient-to-r from-cyan-500 to-blue-600 origin-left z-50 rounded-r-full"
        style={{ scaleX }}
      />

      {/* Background Mesh (Subtle Light Mode) */}
      <div className="fixed inset-0 -z-10 pointer-events-none overflow-hidden">
        <div className="absolute top-[-10%] right-[-10%] w-[500px] h-[500px] rounded-full bg-cyan-100/50 blur-[120px]" />
        <div className="absolute bottom-[-10%] left-[-10%] w-[600px] h-[600px] rounded-full bg-blue-100/40 blur-[150px]" />
      </div>


      <main>
        <HeroSection />
        <StorySection />
        <SectionB2BMagicLink />
        <SectionB2CGarage />
        <PricingSection />
      </main>

      <Footer />
    </div>
  );
}

// --- NAVBAR ---
const Navbar = () => {
  return (
    <nav className="fixed w-full z-40 bg-white/70 backdrop-blur-xl border-b border-white/50 shadow-sm transition-all duration-300">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center h-20">
          <div className="flex items-center gap-2 cursor-pointer">
            <img src="/logo_flusize.png" alt="Flusize" className="h-8 w-8 object-contain" />
            <span className="font-extrabold text-xl tracking-tight text-slate-800">FLUSIZE</span>
          </div>

          <div className="hidden md:flex items-center gap-4">
            <Link href="/login">
              <button className="px-5 py-2.5 rounded-full font-bold text-sm text-slate-700 hover:text-slate-900 hover:bg-slate-100 transition-colors">
                Soy Taller
              </button>
            </Link>
            <Link href="/conductores/mapa">
              <button className="px-6 py-2.5 rounded-full font-bold text-sm bg-slate-900 text-white shadow-lg shadow-slate-900/20 hover:scale-105 transition-transform">
                Soy Conductor
              </button>
            </Link>
          </div>
        </div>
      </div>
    </nav>
  );
};

// --- NEURAL BACKGROUND (Removed in favor of Video Background) ---
// const NeuralBackground = () => { ... }

// --- HERO SECTION ---
const HeroSection = () => {
  return (
    <section className="relative pt-40 pb-32 flex flex-col items-center justify-center min-h-screen overflow-hidden">
      {/* Cinematic Video Background */}
      <video
        autoPlay
        loop
        muted
        playsInline
        preload="metadata"
        className="absolute inset-0 w-full h-full object-cover z-0"
      >
        <source src="/hero-bg.mp4" type="video/mp4" />
      </video>

      {/* Dark Overlay for Contrast */}
      <div className="absolute inset-0 bg-black/60 z-0 pointer-events-none" />

      {/* Gradient Transition to next section - raised z-index to cover text bottom */}
      <div className="absolute bottom-0 left-0 right-0 h-40 bg-gradient-to-t from-slate-50 to-transparent z-10 pointer-events-none" />

      <div className="max-w-4xl mx-auto px-4 text-center z-10 flex flex-col items-center">

        <motion.div
          className="relative z-10 flex flex-col items-center"
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.5, duration: 1 }}
        >
          {/* Neon Badge & Branding */}
          <div className="flex flex-col items-center mb-6">
            <div className="mb-8">
              <span className="font-black text-5xl tracking-[0.2em] text-white drop-shadow-[0_0_20px_rgba(255,255,255,0.4)]">FLUSIZE</span>
            </div>
            <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-black/40 backdrop-blur-md border border-cyan-400/30 text-cyan-300 shadow-[0_0_15px_rgba(34,211,238,0.2)]">
              <Zap className="h-4 w-4" />
              <span className="text-sm font-bold tracking-wide">La Nueva Era Automotriz</span>
            </div>
          </div>

          <h1 className="text-5xl md:text-8xl font-black text-white tracking-tight leading-[1.1] mb-6 drop-shadow-2xl uppercase">
            ECOSISTEMA <br />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-blue-400 drop-shadow-sm">
              AUTOMOTRIZ INTELIGENTE
            </span>
          </h1>

          <p className="text-xl text-slate-200 mb-10 max-w-3xl mx-auto leading-relaxed drop-shadow-lg font-medium">
            <strong>Confianza total</strong> para el conductor. <strong>Control absoluto</strong> para el negocio. Digitaliza tu taller al 100%, simplifica la vida de tus mecánicos y garantiza <strong>transparencia absoluta</strong>. Conecta cada servicio con <strong>tracking en tiempo real</strong> y evidencia fotográfica, creando el nexo perfecto entre la calidad de tu trabajo y la tranquilidad del cliente.
          </p>

          <div className="flex flex-col sm:flex-row gap-5 justify-center items-center">
            <Link
              href="/login"
              className="w-full sm:w-auto"
            >
              <button className="w-full px-8 py-4 bg-white/10 backdrop-blur-md text-white border-2 border-white/20 hover:border-white/50 hover:bg-white/20 rounded-2xl font-bold shadow-xl transition-all flex items-center justify-center gap-2 text-lg group">
                <Wrench className="h-5 w-5 text-slate-300 group-hover:text-white transition-colors" /> Registrar Taller
              </button>
            </Link>
            <Link href="/conductores/mapa" className="w-full sm:w-auto">
              <button className="w-full px-8 py-4 bg-white/10 backdrop-blur-md text-white border-2 border-white/20 hover:border-white/50 hover:bg-white/20 rounded-2xl font-bold shadow-xl transition-all flex items-center justify-center gap-2 text-lg group">
                <Car className="h-5 w-5 text-slate-300 group-hover:text-white transition-colors" /> Soy Conductor
              </button>
            </Link>

            <EmergencyButton />
          </div>
        </motion.div>
      </div>
    </section >
  );
};

const EmergencyButton = () => {
  const [isOpen, setIsOpen] = useState(false);

  const categories = [
    { name: 'Neumáticos / Vulca', icon: Disc, color: 'text-orange-500', bg: 'bg-orange-50', filter: 'Neumáticos' },
    { name: 'Frenos', icon: AlertTriangle, color: 'text-red-500', bg: 'bg-red-50', filter: 'Frenos' },
    { name: 'Aceite / Fluidos', icon: Droplets, color: 'text-blue-500', bg: 'bg-blue-50', filter: 'Mantención' },
    { name: 'Motor / Mecánica', icon: LifeBuoy, color: 'text-purple-500', bg: 'bg-purple-50', filter: 'Motor' },
  ];

  return (
    <>
      <button
        onClick={() => setIsOpen(true)}
        className="w-full sm:w-auto px-8 py-4 bg-red-600 text-white rounded-2xl font-black shadow-[0_0_30px_rgba(220,38,38,0.5)] transition-all flex items-center justify-center gap-2 text-lg animate-pulse hover:scale-105 hover:bg-red-700 active:scale-95 border-2 border-red-400 group relative overflow-hidden"
      >
        <span className="absolute inset-0 bg-gradient-to-r from-red-400/0 via-red-400/30 to-red-400/0 -translate-x-full group-hover:translate-x-full transition-transform duration-700" />
        <AlertTriangle className="h-6 w-6" />
        🆘 TENGO UNA EMERGENCIA
      </button>

      {isOpen && (
        <div className="fixed inset-0 z-[100] flex items-center justify-center p-4 bg-black/80 backdrop-blur-xl">
          <motion.div
            initial={{ opacity: 0, scale: 0.9, y: 20 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            className="bg-white rounded-[2.5rem] w-full max-w-2xl overflow-hidden shadow-2xl border border-slate-200"
          >
            <div className="p-8 pb-4 flex justify-between items-center bg-slate-50 border-b border-slate-100">
              <div>
                <h2 className="text-2xl font-black text-slate-900 tracking-tight">CENTRO DE EMERGENCIAS</h2>
                <p className="text-slate-500 font-bold uppercase tracking-widest text-[10px]">Asistencia Flusize inmediata</p>
              </div>
              <button
                onClick={() => setIsOpen(false)}
                className="p-3 bg-white rounded-xl shadow-sm border border-slate-200 hover:bg-slate-50 transition-colors"
              >
                <X className="w-6 h-6 text-slate-500" />
              </button>
            </div>

            <div className="p-8 grid grid-cols-1 md:grid-cols-2 gap-4">
              {categories.map((cat, i) => (
                <Link
                  key={i}
                  href={`/conductores/mapa?filter=${encodeURIComponent(cat.filter)}&emergency=true`}
                  className="flex items-center gap-4 p-6 rounded-3xl bg-white border border-slate-100 hover:border-blue-500 hover:shadow-xl hover:shadow-blue-500/10 transition-all group"
                >
                  <div className={`w-14 h-14 rounded-2xl ${cat.bg} flex items-center justify-center group-hover:scale-110 transition-transform`}>
                    <cat.icon className={`w-8 h-8 ${cat.color}`} />
                  </div>
                  <div className="text-left">
                    <p className="font-extrabold text-slate-900">{cat.name}</p>
                    <p className="text-xs text-slate-500 font-bold">Buscar taller cercano</p>
                  </div>
                </Link>
              ))}
            </div>

            <div className="p-8 bg-blue-600 text-white text-center">
              <p className="text-sm font-bold tracking-tight">ESTÁS RESPALDADO. LOCALIZANDO TALLERES DISPONIBLES EN TU ZONA...</p>
            </div>
          </motion.div>
        </div>
      )}
    </>
  );
};

// --- STORY SECTION ---
const StorySection = () => {
  return (
    <section className="py-32 bg-slate-950 relative overflow-hidden border-y border-white/5">
      <div className="absolute inset-0 opacity-20 pointer-events-none">
        <div className="absolute top-0 left-1/4 w-96 h-96 bg-blue-600/30 rounded-full blur-[120px]" />
        <div className="absolute bottom-0 right-1/4 w-96 h-96 bg-cyan-600/20 rounded-full blur-[120px]" />
      </div>

      <div className="max-w-5xl mx-auto px-4 relative z-10">
        <div className="text-center mb-16">
          <span className="text-blue-500 font-black tracking-[0.3em] text-[10px] uppercase">El origen de Flusize</span>
        </div>

        <motion.div
          initial={{ opacity: 0, y: 30 }}
          whileInView={{ opacity: 1, y: 0 }}
          viewport={{ once: true }}
          transition={{ duration: 1 }}
        >
          <h2 className="text-4xl md:text-6xl font-black text-white tracking-tight leading-[1.1] mb-12 text-center">
            De un susto a <br />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-cyan-400">una revolución</span>
          </h2>

          <div className="grid md:grid-cols-2 gap-16 items-center">
            <p className="text-xl md:text-2xl text-slate-300 leading-relaxed font-medium text-left">
              Flusize no nació en una oficina, nació en la carretera el día que nos quedamos sin frenos. Nos enfrentamos a la incertidumbre: talleres sin registros, diagnósticos a ciegas y la falta total de seguridad.
            </p>
            <p className="text-xl md:text-2xl text-slate-300 leading-relaxed font-medium text-left">
              Decidimos que ningún conductor volvería a pasar por eso. Creamos Flusize para que la transparencia sea el nuevo estándar. Tu seguridad no es negociable.
            </p>
          </div>

          <div className="mt-20 flex justify-center">
            <div className="px-8 py-3 rounded-full bg-white/5 border border-white/10 text-white/40 text-xs font-bold tracking-[0.2em] uppercase">
              Flusize 1.0 • El respaldo del siglo XXI
            </div>
          </div>
        </motion.div>
      </div>
    </section>
  );
};

// --- SECTION 1: MAGIC LINK (B2B) ---
const SectionB2BMagicLink = () => {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <section ref={ref} className="py-24 bg-slate-950 relative overflow-hidden border-y border-white/5">
      {/* Background Glow */}
      <div className="absolute inset-0 opacity-20 pointer-events-none">
        <div className="absolute top-0 right-1/4 w-96 h-96 bg-blue-600/20 rounded-full blur-[120px]" />
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">

          <motion.div
            initial={{ opacity: 0, x: -50 }}
            animate={isInView ? { opacity: 1, x: 0 } : { opacity: 0, x: -50 }}
            transition={{ duration: 0.8, ease: "easeOut" }}
          >
            <h2 className="text-4xl md:text-6xl font-extrabold text-white tracking-tight leading-tight mb-8 uppercase">
              TUS MANOS EN EL MOTOR. <br />
              <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-cyan-400">
                SU CONFIANZA EN EL CELULAR.
              </span> <br />
              CIERRA PRESUPUESTOS EN SEGUNDOS.
            </h2>
            <p className="text-lg md:text-xl text-slate-300 mb-10 leading-relaxed font-medium">
              En la nueva era digital, la desconfianza detiene tus elevadores y cada minuto de espera es dinero que no vuelve. Rompe el ciclo y <span className="text-cyan-400 font-bold italic text-nowrap">deja que tu taller fluya</span>: entrega evidencias fotográficas inmutables que eliminan las dudas y aceleran las aprobaciones directamente en el WhatsApp del cliente. Posiciónate como un líder tecnológico, aumenta la rotación de vehículos y blinda tu reputación con honestidad respaldada por datos. Con Flusize, la transparencia es el motor de tu rentabilidad.
            </p>
            <ul className="space-y-6">
              {[
                { title: "Aprobación Instantánea", desc: "El cliente ve la falla en su pantalla y autoriza el presupuesto con un toque. Sin vueltas." },
                { title: "Elevadores Siempre en Marcha", desc: "Elimina los tiempos muertos esperando respuestas. Si fluye la información, fluye el trabajo." },
                { title: "Sello de Honestidad Digital", desc: "Un historial fotográfico que protege tu taller de reclamos y fideliza a tus clientes para siempre." }
              ].map((item, i) => (
                <li key={i} className="flex gap-4 group">
                  <div className="flex-shrink-0 w-8 h-8 rounded-lg bg-blue-500/10 border border-blue-500/20 flex items-center justify-center group-hover:bg-blue-500/20 group-hover:border-blue-500/40 transition-all">
                    <CheckCircle2 className="w-5 h-5 text-blue-500 drop-shadow-[0_0_8px_rgba(59,130,246,0.5)]" />
                  </div>
                  <div>
                    <h4 className="text-white font-bold text-lg mb-1">{item.title}</h4>
                    <p className="text-slate-400 leading-relaxed">{item.desc}</p>
                  </div>
                </li>
              ))}
            </ul>
          </motion.div>

          {/* Abstract Visualization */}
          <motion.div
            className="relative h-[450px] w-full rounded-[3rem] bg-slate-900 border border-white/10 shadow-2xl flex items-center justify-center overflow-hidden"
            initial={{ opacity: 0, scale: 0.9 }}
            animate={isInView ? { opacity: 1, scale: 1 } : { opacity: 0, scale: 0.9 }}
            transition={{ duration: 0.8, delay: 0.2 }}
          >
            <div className="absolute inset-0 bg-[radial-gradient(circle_at_50%_50%,_rgba(59,130,246,0.1),_transparent_70%)]" />

            {/* Nodes Animation */}
            <div className="flex flex-col gap-8 items-center relative z-10 w-full px-10">

              <motion.div
                className="w-full max-w-sm bg-slate-800/80 backdrop-blur-md p-5 rounded-3xl shadow-xl border border-white/5 flex items-center gap-5"
                animate={{ y: [0, -8, 0] }}
                transition={{ duration: 4, repeat: Infinity, ease: "easeInOut" }}
              >
                <div className="w-14 h-14 rounded-2xl bg-blue-500/20 flex items-center justify-center border border-blue-500/30">
                  <Wrench className="w-7 h-7 text-blue-400" />
                </div>
                <div>
                  <p className="font-black text-white text-base">Evidencia Enviada</p>
                  <p className="text-xs text-blue-400 font-bold tracking-widest uppercase">Reparación en progreso</p>
                </div>
              </motion.div>

              {/* Connecting Line */}
              <div className="h-16 w-1 bg-gradient-to-b from-blue-500/50 to-cyan-500/50 relative rounded-full overflow-hidden">
                <motion.div
                  className="absolute top-0 left-0 w-full h-1/2 bg-gradient-to-b from-transparent via-white to-transparent"
                  animate={{ top: ["-100%", "200%"] }}
                  transition={{ duration: 2, repeat: Infinity, ease: "linear" }}
                />
              </div>

              <motion.div
                className="w-full max-w-sm bg-slate-800/80 backdrop-blur-md p-5 rounded-3xl shadow-2xl border border-cyan-500/30 flex items-center justify-between"
                animate={{ y: [0, 8, 0] }}
                transition={{ duration: 4, repeat: Infinity, ease: "easeInOut", delay: 1 }}
              >
                <div className="flex items-center gap-5">
                  <div className="w-14 h-14 rounded-2xl bg-cyan-500/20 flex items-center justify-center border border-cyan-500/30">
                    <ShieldCheck className="w-7 h-7 text-cyan-400" />
                  </div>
                  <div>
                    <p className="font-black text-white text-base">Aprobación Recibida</p>
                    <p className="text-xs text-cyan-400 font-bold tracking-widest uppercase">Cliente Autorizó</p>
                  </div>
                </div>
                <div className="bg-green-500/20 p-3 rounded-2xl border border-green-500/30">
                  <MessageCircle className="w-6 h-6 text-green-400" />
                </div>
              </motion.div>

            </div>
          </motion.div>

        </div>
      </div>
    </section>
  );
};

// --- SECTION 2: MAP FOMO (B2B) ---
const SectionB2BFOMO = () => {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <section ref={ref} className="py-24 bg-slate-900 border-y border-slate-800 relative overflow-hidden">
      {/* Background removed as requested by user to keep focus on the map */}

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center max-w-3xl mx-auto mb-16">
          <motion.div
            initial={{ opacity: 0, y: 30 }}
            animate={isInView ? { opacity: 1, y: 0 } : { opacity: 0, y: 30 }}
            transition={{ duration: 0.8 }}
          >
            <h2 className="text-3xl md:text-5xl font-black text-white tracking-tight leading-tight mb-6">
              Tu competencia ya está recibiendo <span className="text-cyan-400">clientes desde nuestro mapa.</span> ¿Y tú?
            </h2>
            <p className="text-lg text-slate-400 leading-relaxed">
              Al registrarte, tu taller aparece en el mapa público. Miles de conductores buscan servicios especializados diariamente y cotizan mediante un clic a WhatsApp.
            </p>
          </motion.div>
        </div>

        {/* Floating Map UI Abstraction */}
        <div className="relative h-[500px] w-full max-w-5xl mx-auto mt-10">
          <motion.div
            className="absolute inset-0 rounded-[2rem] bg-slate-800 border border-slate-700 shadow-2xl overflow-hidden flex items-center justify-center p-8"
            initial={{ opacity: 0, y: 50 }}
            animate={isInView ? { opacity: 1, y: 0 } : { opacity: 0, y: 50 }}
            transition={{ duration: 0.8, delay: 0.3 }}
          >
            {/* True Map Background (Southern Chile) */}
            <FomoMap />

            {/* Floating Pins */}
            {[
              { color: "bg-cyan-500", top: "35%", left: "47%", delay: 0.5, name: "AutoCenter" },
              { color: "bg-emerald-500", top: "45%", left: "48%", delay: 1.1, name: "Mecánica Pro" },
              { color: "bg-blue-500", top: "54%", left: "48%", delay: 0.8, name: "Frenos Express" },
            ].map((pin, i) => (
              <motion.div
                key={i}
                className="absolute flex flex-col items-center"
                style={{ top: pin.top, left: pin.left }}
                initial={{ opacity: 0, scale: 0, y: 20 }}
                animate={isInView ? { opacity: 1, scale: 1, y: 0 } : { opacity: 0, scale: 0, y: 20 }}
                transition={{ duration: 0.5, delay: pin.delay, type: "spring" }}
              >
                <div className="bg-slate-900 text-white text-xs font-bold px-3 py-1.5 rounded-xl shadow-lg mb-2 border border-slate-700 flex items-center gap-2">
                  <span className={`w-2 h-2 rounded-full ${pin.color} animate-pulse`}></span>
                  {pin.name}
                </div>
                <MapPin className={`w-8 h-8 ${pin.color.replace('bg-', 'text-')} fill-current`} />
              </motion.div>
            ))}
          </motion.div>
        </div>
      </div>
    </section>
  );
};

// --- SECTION 3: MY GARAGE (B2C) ---
const SectionB2CGarage = () => {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  const milestones = [
    { title: 'Cambio de Aceite', time: 'Hace 10 meses', icon: Droplets, color: 'text-blue-500', bg: 'bg-blue-500/10' },
    { title: 'Cambio de Frenos', time: 'Hace 6 meses', icon: Disc, color: 'text-red-500', bg: 'bg-red-500/10' },
    { title: 'Mantención', time: 'Hace 1 año', icon: CheckCircle2, color: 'text-green-500', bg: 'bg-green-500/10' },
    { title: 'Suspensión y Tren Delantero', time: 'Hace 1 año', icon: Wrench, color: 'text-purple-500', bg: 'bg-purple-500/10' },
  ];

  return (
    <section ref={ref} className="py-32 bg-slate-900 relative overflow-hidden">
      {/* Abstract Background Elements */}
      <div className="absolute inset-0 opacity-10 pointer-events-none">
        <div className="absolute top-1/4 left-0 w-80 h-80 bg-cyan-500/30 rounded-full blur-[100px]" />
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-24 items-center">

          {/* Visual: Phone Mockup Abstraction */}
          <motion.div
            className="relative w-full max-w-[340px] mx-auto h-[620px] bg-slate-800 rounded-[3.5rem] border-[10px] border-slate-700 shadow-[0_0_60px_rgba(0,0,0,0.5)] p-6 overflow-hidden flex flex-col"
            initial={{ opacity: 0, rotateY: 30, x: -50 }}
            animate={isInView ? { opacity: 1, rotateY: 0, x: 0 } : { opacity: 0, rotateY: 30, x: -50 }}
            transition={{ duration: 1, type: "spring" }}
          >
            {/* Status bar mock */}
            <div className="w-full flex justify-between items-center mb-8 px-4">
              <span className="text-white text-xs font-black">12:00</span>
              <div className="flex gap-1.5">
                <div className="w-3.5 h-3.5 rounded-full bg-white/40"></div>
                <div className="w-5 h-3.5 rounded-sm bg-white/40"></div>
              </div>
            </div>

            <div className="bg-slate-700/40 rounded-3xl p-5 mb-6 border border-white/5 backdrop-blur-sm">
              <h4 className="text-white font-black text-xl mb-1">Tu Vehículo</h4>
              <p className="text-cyan-400 text-sm font-bold tracking-widest uppercase">Historial Digital</p>
            </div>

            <div className="flex-1 bg-white rounded-[2.5rem] p-6 shadow-inner overflow-hidden">
              <h4 className="font-black text-slate-900 text-base mb-6 border-b border-slate-100 pb-2">Hitos Recientes</h4>

              <div className="space-y-5">
                {milestones.map((item, i) => (
                  <motion.div
                    key={i}
                    className="flex items-center gap-4 group"
                    initial={{ opacity: 0, x: 20 }}
                    animate={isInView ? { opacity: 1, x: 0 } : { opacity: 0, x: 20 }}
                    transition={{ delay: 0.5 + (i * 0.15) }}
                  >
                    <div className={`w-10 h-10 rounded-xl ${item.bg} flex items-center justify-center flex-shrink-0 group-hover:scale-110 transition-transform`}>
                      <item.icon className={`w-5 h-5 ${item.color}`} />
                    </div>
                    <div className="flex-1 border-b border-slate-50 pb-2">
                      <p className="font-bold text-slate-800 text-xs leading-tight">{item.title}</p>
                      <p className="text-[10px] text-slate-400 font-medium mt-0.5">{item.time}</p>
                    </div>
                  </motion.div>
                ))}
              </div>
            </div>

            <div className="mt-6 px-4">
              <div className="w-full h-1.5 bg-slate-700/50 rounded-full overflow-hidden">
                <motion.div
                  className="h-full bg-cyan-500"
                  initial={{ width: 0 }}
                  animate={isInView ? { width: "100%" } : { width: 0 }}
                  transition={{ duration: 2, delay: 1 }}
                />
              </div>
            </div>
          </motion.div>

          {/* Content side */}
          <motion.div
            initial={{ opacity: 0, x: 50 }}
            animate={isInView ? { opacity: 1, x: 0 } : { opacity: 0, x: 50 }}
            transition={{ duration: 0.8, ease: "easeOut" }}
          >
            <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-slate-800 border border-slate-700 text-slate-300 mb-8 shadow-sm">
              <Car className="h-4 w-4" />
              <span className="text-sm font-bold tracking-wide">Para el Conductor</span>
            </div>

            <h2 className="text-5xl md:text-8xl font-black text-white tracking-tight leading-[0.9] mb-8 uppercase">
              TU CONTROL <br />
              <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-cyan-400">HISTÓRICO.</span>
            </h2>

            <p className="text-xl md:text-2xl text-slate-400 mb-8 leading-relaxed font-medium">
              Sabemos lo importante que es tu auto para ti. Despídete de la incertidumbre al dejarlo en el taller.
              <Link href="/mi-garage">
                <span className="text-cyan-400 font-black cursor-pointer hover:underline mx-2 transition-all">Mi Garage</span>
              </Link>
              es tu conexión directa: accede a evidencia fotográfica, diagnósticos claros y un historial inmutable.
            </p>

            <p className="text-lg md:text-xl text-slate-300 mb-10 leading-relaxed font-bold italic opacity-80 border-l-4 border-cyan-500 pl-6">
              &quot;Toma el mando de la información. Con Flusize, cada servicio queda registrado con evidencia inmutable. Tu historial es la garantía de valor de tu vehículo.&quot;
            </p>

            <Link href="/mi-garage">
              <button className="px-10 py-5 bg-cyan-600 text-white rounded-2xl font-black hover:scale-105 transition-all flex items-center justify-center gap-3 shadow-2xl shadow-cyan-600/20 text-lg group uppercase tracking-tight">
                Acceder a mi historial
                <ArrowRight className="w-5 h-5 group-hover:translate-x-2 transition-transform" />
              </button>
            </Link>
          </motion.div>

        </div>
      </div>
    </section>
  );
};

// --- PRICING SECTION ---
const DigitalTrustSeal = ({ className }: { className?: string }) => (
  <motion.div
    initial={{ opacity: 0, scale: 0.9 }}
    whileInView={{ opacity: 1, scale: 1 }}
    className={`inline-flex items-center gap-3 px-6 py-3 bg-white/5 backdrop-blur-xl border border-blue-500/20 rounded-2xl shadow-xl shadow-blue-500/5 group relative overflow-hidden ${className}`}
  >
    <div className="absolute inset-0 bg-gradient-to-r from-transparent via-blue-400/10 to-transparent -translate-x-full group-hover:translate-x-full transition-transform duration-1000" />
    <div className="w-10 h-10 bg-blue-600 rounded-xl flex items-center justify-center shadow-lg shadow-blue-600/20 shrink-0">
      <ShieldCheck className="w-6 h-6 text-white" />
    </div>
    <div className="flex flex-col text-left">
      <span className="text-[10px] font-black uppercase tracking-[0.2em] text-blue-500 leading-none mb-1">Certificado de Confianza</span>
      <span className="text-sm font-black text-slate-900 tracking-tight leading-none">Sello Digital Flusize</span>
    </div>
  </motion.div>
);

const PricingSection = () => {
  const plans = [
    {
      name: 'Plan Digital',
      price: '$0',
      period: '/mes',
      promoPrice: '$9.900',
      description: 'Activa tu taller hoy y digitaliza tu presencia. Oferta promocional de 6 meses por lanzamiento (Costo regular $9.900 CLP).',
      features: [
        'Perfil público en el Mapa Flusize',
        'Perfil Link-in-Bio para redes',
        'Botón de contacto WhatsApp',
        'Sello de Confianza Digital'
      ],
      promoBanner: "PROMO LANZAMIENTO: ACTIVACIÓN 6 MESES",
      buttonText: 'Activar mi Taller ahora',
      waLink: "https://wa.me/56975243510?text=Hola,%20quiero%20activar%20mi%20promo%20de%20lanzamiento%20del%20Plan%20Digital",
    },
    {
      name: 'Plan Pro',
      price: '$19.900',
      period: '/mes',
      description: 'El software que ordena tu éxito.',
      features: [
        'Incluye Plan Digital',
        'Dashboard de Gestión Pro. (Control operativo de mecánicos y flujo diario)',
        'Agenda digital de citas',
        'Órdenes con evidencia fotográfica',
        'Tracking en tiempo real para clientes',
      ],
      buttonText: 'Registrar mi Taller ahora',
      waLink: "https://wa.me/56975243510?text=Hola,%20quiero%20registrar%20mi%20taller%20con%20el%20Plan%20Pro",
    },
    {
      name: 'Plan Premium',
      price: '$34.900',
      period: '/mes',
      description: 'Potencia máxima para tu taller.',
      features: [
        'Incluye Plan Pro',
        'Dashboard Estratégico Premium. (Métricas avanzadas, rentabilidad e inventario inteligente)',
        'Reportes financieros estratégicos',
        'Soporte técnico prioritario'
      ],
      buttonText: 'Registrar mi Taller ahora',
      waLink: "https://wa.me/56975243510?text=Hola,%20necesito%20el%20Plan%20Premium%20para%20mi%20centro%20automotriz",
    },
    {
      name: 'Plan Size',
      price: 'A Medida',
      period: '',
      description: 'Diseñamos la plataforma digital al tamaño de tu ambición.',
      features: [
        'Dashboard de Control Operativo para redes masivas',
        'Control total de flotas',
        'Arquitectura única y personalizada',
        'Integraciones vía API',
        'Gerente de cuenta dedicado'
      ],
      enterprise: true,
      buttonText: 'Hablar con un consultor',
      waLink: "https://wa.me/56975243510?text=Hola%20Matías,%20quiero%20información%20sobre%20el%20Plan%20Size/Premium%20de%20Flusize.",
    }
  ];

  return (
    <section id="planes" className="py-32 bg-slate-50 relative overflow-hidden text-slate-900 border-t border-slate-100">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center max-w-3xl mx-auto mb-20">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            whileInView={{ opacity: 1, y: 0 }}
            viewport={{ once: true }}
            transition={{ duration: 0.6 }}
          >
            <h2 className="text-4xl md:text-5xl font-black tracking-tight mb-4">
              El motor de tu <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-cyan-500">crecimiento digital</span>
            </h2>
            <p className="text-lg text-slate-500 font-medium whitespace-pre-line">
              No es solo una suscripción, es el nuevo estándar de la industria.
              Al vincular tu taller a Flusize, tú ganas eficiencia operativa y visibilidad; tus clientes ganan la transparencia que siempre buscaron. Un ecosistema donde todos ganan.
            </p>
          </motion.div>
        </div>

        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6 items-stretch max-w-7xl mx-auto">
          {plans.map((plan, index) => (
            <motion.div
              key={plan.name}
              initial={{ opacity: 0, y: 30 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, margin: "-100px" }}
              transition={{ duration: 0.6, delay: index * 0.15 }}
              className={`relative flex flex-col p-7 rounded-[2.5rem] transition-all duration-300 transform hover:-translate-y-2 ${plan.enterprise
                ? 'bg-gradient-to-br from-blue-700 via-blue-900 to-slate-900 text-white shadow-[0_0_50px_rgba(37,99,235,0.3)] scale-105 z-10 border border-blue-400/30'
                : 'bg-white border border-slate-200 shadow-xl shadow-slate-200/50 hover:border-blue-400 z-0'
                }`}
            >

              <div className="mb-6">
                {plan.promoBanner && (
                  <div className="bg-blue-600 text-[9px] font-black text-white px-3 py-1 rounded-full w-fit mb-3 uppercase tracking-widest shadow-lg shadow-blue-500/20">
                    {plan.promoBanner}
                  </div>
                )}
                <h3 className={`text-xl font-black tracking-tight mb-1 ${plan.enterprise ? 'text-white' : 'text-slate-800'}`}>{plan.name}</h3>
                <div className="flex items-baseline gap-2 mb-4">
                  {plan.promoPrice && (
                    <span className="text-sm font-bold text-slate-400 line-through">{plan.promoPrice}</span>
                  )}
                  <span className={`text-3xl font-black ${plan.enterprise ? 'text-white' : 'text-slate-900'}`}>{plan.price}</span>
                  <span className={`text-sm font-bold ${plan.enterprise ? 'text-slate-400' : 'text-slate-500'}`}>{plan.period}</span>
                </div>
                <p className={`text-xs font-semibold leading-relaxed min-h-[60px] ${plan.enterprise ? 'text-slate-400' : 'text-slate-500'}`}>{plan.description}</p>
              </div>

              <ul className="space-y-4 mb-8 flex-1">
                {plan.features.map((feature, i) => (
                  <li key={i} className="flex items-start gap-3">
                    <CheckCircle2 className={`w-4 h-4 shrink-0 mt-0.5 text-blue-600`} />
                    <span className={`text-[13px] font-bold leading-snug ${plan.enterprise ? 'text-blue-100' : 'text-slate-700'}`}>{feature}</span>
                  </li>
                ))}
              </ul>
              <a
                href={plan.waLink}
                target="_blank"
                rel="noopener noreferrer"
                className={`w-full py-4 px-4 rounded-2xl font-black text-xs uppercase tracking-widest flex items-center justify-center transition-all shadow-[0_0_20px_rgba(37,99,235,0.2)] hover:shadow-[0_0_30px_rgba(37,99,235,0.4)] bg-blue-600 text-white hover:bg-blue-700 hover:scale-[1.05]`}
              >
                {plan.buttonText}
              </a>
            </motion.div>
          ))}
        </div>

        <div className="mt-24 text-center">
          <DigitalTrustSeal className="bg-slate-50 border-slate-200" />
          <p className="mt-6 text-[11px] font-black text-slate-400 uppercase tracking-[0.3em] flex items-center justify-center gap-2">
            <Sparkles className="w-4 h-4 text-blue-500" />
            Empoderando la transformación digital automotriz
          </p>
        </div>
      </div>
    </section >
  );
};

// --- FOOTER ---
const Footer = () => (
  <footer className="bg-slate-950 text-slate-400 py-20 border-t border-white/5 relative overflow-hidden">
    {/* Minimalist Grid Pattern */}
    <div className="absolute inset-0 opacity-[0.03] pointer-events-none bg-[url('https://www.transparenttextures.com/patterns/carbon-fibre.png')]" />

    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12 mb-16">

        <div className="space-y-6">
          <div className="flex items-center gap-2">
            <img src="/logo_flusize.png" alt="Flusize" className="h-8 w-8 object-contain" />
            <span className="font-black tracking-tighter text-white text-2xl">FLUSIZE</span>
          </div>
          <p className="text-sm font-bold leading-relaxed text-slate-500 max-w-xs">
            Diseñado para digitalizar el mundo automotriz. El nuevo estándar de confianza y eficiencia.
          </p>
        </div>

        <div className="space-y-4">
          <h4 className="text-white font-black text-xs uppercase tracking-[0.2em] mb-6">Plataforma</h4>
          <ul className="space-y-3 text-sm font-bold">
            <li><Link href="/login" className="hover:text-blue-400 transition-colors">Acceso Taller</Link></li>
            <li><Link href="/conductores/mapa" className="hover:text-blue-400 transition-colors">Para Conductores</Link></li>
            <li><Link href="/#planes" className="hover:text-blue-400 transition-colors">Planes y Precios</Link></li>
          </ul>
        </div>

        <div className="space-y-6">
          <h4 className="text-white font-black text-xs uppercase tracking-[0.2em] mb-6">Contacto Directo</h4>
          <div className="grid grid-cols-1 gap-3">
            <a
              href="https://wa.me/56975243510?text=Hola%20Matías,%20necesito%20consultoría%20sobre%20Flusize"
              target="_blank"
              rel="noopener noreferrer"
              className="flex items-center justify-between p-4 bg-white/5 border border-white/10 rounded-2xl hover:bg-white/10 hover:border-blue-500/50 transition-all group"
            >
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 bg-blue-600/20 rounded-xl flex items-center justify-center border border-blue-500/20 group-hover:bg-blue-600 group-hover:border-blue-600 transition-all">
                  <MessageSquare className="w-5 h-5 text-blue-400 group-hover:text-white transition-colors" />
                </div>
                <div>
                  <p className="text-white font-black text-xs uppercase tracking-wider mb-0.5">Ventas & Alianzas</p>
                  <p className="text-[10px] font-bold text-slate-500 group-hover:text-slate-300 transition-colors">Hablar con Matías</p>
                </div>
              </div>
              <ChevronRight className="w-4 h-4 text-slate-600 group-hover:text-white group-hover:translate-x-1 transition-all" />
            </a>

            <a
              href="https://wa.me/56979430387?text=Hola%20Brayan,%20necesito%20soporte%20técnico%20con%20Flusize"
              target="_blank"
              rel="noopener noreferrer"
              className="flex items-center justify-between p-4 bg-white/5 border border-white/10 rounded-2xl hover:bg-white/10 hover:border-blue-500/50 transition-all group"
            >
              <div className="flex items-center gap-3">
                <div className="w-10 h-10 bg-slate-800 rounded-xl flex items-center justify-center border border-white/5 group-hover:bg-blue-600 group-hover:border-blue-600 transition-all">
                  <Wrench className="w-5 h-5 text-slate-400 group-hover:text-white transition-colors" />
                </div>
                <div>
                  <p className="text-white font-black text-xs uppercase tracking-wider mb-0.5">Soporte Técnico</p>
                  <p className="text-[10px] font-bold text-slate-500 group-hover:text-slate-300 transition-colors">Hablar con Brayan</p>
                </div>
              </div>
              <ChevronRight className="w-4 h-4 text-slate-600 group-hover:text-white group-hover:translate-x-1 transition-all" />
            </a>
          </div>
          <div className="pt-4 border-t border-white/5">
            <DigitalTrustSeal className="bg-transparent border-white/10 !shadow-none !px-0" />
          </div>
        </div>

        <div className="space-y-4 text-right md:text-left">
          <h4 className="text-white font-black text-xs uppercase tracking-[0.2em] mb-6">Legal</h4>
          <ul className="space-y-3 text-sm font-bold text-slate-500">
            <li><a href="#" className="hover:text-blue-400 transition-colors">Términos de Servicio</a></li>
            <li><a href="#" className="hover:text-blue-400 transition-colors">Privacidad</a></li>
          </ul>
        </div>
      </div>

      <div className="pt-8 border-t border-white/5 flex flex-col md:flex-row justify-between items-center gap-6">
        <div className="text-xs font-bold tracking-widest text-slate-600 uppercase">
          © 2026 Flusize. Todos los derechos reservados.
        </div>
        <div className="flex gap-6">
          <div className="w-8 h-8 rounded-full bg-slate-900 border border-white/5 flex items-center justify-center hover:border-blue-500/50 transition-colors cursor-pointer group">
            <span className="text-xs font-black group-hover:text-blue-400">in</span>
          </div>
          <div className="w-8 h-8 rounded-full bg-slate-900 border border-white/5 flex items-center justify-center hover:border-blue-500/50 transition-colors cursor-pointer group">
            <span className="text-xs font-black group-hover:text-blue-400">ig</span>
          </div>
        </div>
      </div>
    </div>
  </footer>
);

