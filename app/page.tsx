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
  Banknote
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

          <h1 className="text-5xl md:text-7xl font-black text-white tracking-tight leading-[1.1] mb-6 drop-shadow-xl">
            El Sistema Operativo del <br />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-blue-400 drop-shadow-sm">
              Taller del Futuro
            </span>
          </h1>

          <p className="text-xl text-slate-300 mb-10 max-w-2xl mx-auto leading-relaxed drop-shadow-md font-medium">
            Conectamos tu taller con el cliente en tiempo real. Adiós a las llamadas infinitas. Bienvenido a la digitalización absoluta y satisfacción garantizada.
          </p>

          <div className="flex flex-col sm:flex-row gap-5 justify-center items-center">
            <Link
              href="/login"
              className="group relative w-full sm:w-auto overflow-hidden rounded-full p-[2px] focus:outline-none focus:ring-2 focus:ring-blue-400 focus:ring-offset-2 focus:ring-offset-slate-900"
            >
              <span className="absolute inset-[-1000%] animate-[spin_2s_linear_infinite] bg-[conic-gradient(from_90deg_at_50%_50%,#E2CBFF_0%,#3E3B44_50%,#E2CBFF_100%)]" />
              <span className="inline-flex h-full w-full cursor-pointer items-center justify-center rounded-full bg-blue-500 px-8 py-4 text-sm font-bold text-white shadow-[0_0_20px_rgba(59,130,246,0.5)] transition-all duration-300 group-hover:bg-blue-400">
                <Wrench className="w-5 h-5 mr-2 group-hover:rotate-12 transition-transform" />
                Soy un Taller
              </span>
            </Link>
            <Link href="/conductores/mapa" className="w-full sm:w-auto">
              <button className="w-full px-8 py-4 bg-white/10 backdrop-blur-md text-white border-2 border-white/20 hover:border-white/50 hover:bg-white/20 rounded-2xl font-bold shadow-xl transition-all flex items-center justify-center gap-2 text-lg group">
                <Car className="h-5 w-5 text-slate-300 group-hover:text-white transition-colors" /> Soy Conductor
              </button>
            </Link>
          </div>
        </motion.div>
      </div>
    </section >
  );
};

// --- SECTION 1: MAGIC LINK (B2B) ---
const SectionB2BMagicLink = () => {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  return (
    <section ref={ref} className="py-24 bg-white relative overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">

          <motion.div
            initial={{ opacity: 0, x: -50 }}
            animate={isInView ? { opacity: 1, x: 0 } : { opacity: 0, x: -50 }}
            transition={{ duration: 0.8, ease: "easeOut" }}
          >
            <h2 className="text-3xl md:text-5xl font-black text-slate-900 tracking-tight leading-tight mb-6">
              Elimina las llamadas preguntando <span className="text-blue-600 underline decoration-blue-200 underline-offset-4">¿está listo mi auto?</span>
            </h2>
            <p className="text-lg text-slate-500 mb-8 leading-relaxed">
              Envía un <strong>Link Mágico</strong> por WhatsApp. Tu cliente ve el avance en tiempo real, desde el diagnóstico hasta la entrega, con la cotización transparente siempre a mano.
            </p>
            <ul className="space-y-4">
              {[
                "Línea de tiempo en vivo automática",
                "Transparencia que genera confianza absoluta",
                "Zero fricción logística para tu equipo"
              ].map((item, i) => (
                <li key={i} className="flex items-center gap-3 text-slate-700 font-medium">
                  <div className="w-6 h-6 rounded-full bg-cyan-100 flex items-center justify-center">
                    <CheckCircle2 className="w-4 h-4 text-cyan-600" />
                  </div>
                  {item}
                </li>
              ))}
            </ul>
          </motion.div>

          {/* Abstract Visualization */}
          <motion.div
            className="relative h-[400px] w-full rounded-[2rem] bg-slate-50 border border-slate-100 shadow-2xl flex items-center justify-center overflow-hidden"
            initial={{ opacity: 0, scale: 0.9 }}
            animate={isInView ? { opacity: 1, scale: 1 } : { opacity: 0, scale: 0.9 }}
            transition={{ duration: 0.8, delay: 0.2 }}
          >
            <div className="absolute inset-0 bg-[radial-gradient(circle_at_50%_50%,_rgba(6,182,212,0.1),_transparent_70%)]" />

            {/* Nodes Animation */}
            <div className="flex flex-col gap-6 items-center relative z-10 w-full px-10">

              <motion.div
                className="w-full max-w-sm bg-white p-4 rounded-2xl shadow-sm border border-slate-100 flex items-center gap-4"
                animate={{ y: [0, -5, 0] }}
                transition={{ duration: 4, repeat: Infinity, ease: "easeInOut" }}
              >
                <div className="w-12 h-12 rounded-xl bg-blue-100 flex items-center justify-center">
                  <Wrench className="w-6 h-6 text-blue-600" />
                </div>
                <div>
                  <p className="font-bold text-slate-800 text-sm">Estado actualizado</p>
                  <p className="text-xs text-slate-400">Taller Flusize</p>
                </div>
              </motion.div>

              {/* Connecting Line */}
              <div className="h-10 w-0.5 bg-gradient-to-b from-blue-200 to-cyan-200 relative">
                <motion.div
                  className="absolute top-0 left-[-3px] w-2 h-2 rounded-full bg-cyan-500"
                  animate={{ top: ["0%", "100%"] }}
                  transition={{ duration: 1.5, repeat: Infinity, ease: "linear" }}
                />
              </div>

              <motion.div
                className="w-full max-w-sm bg-white p-4 rounded-2xl shadow-lg border border-cyan-100 flex items-center justify-between"
                animate={{ y: [0, 5, 0] }}
                transition={{ duration: 4, repeat: Infinity, ease: "easeInOut", delay: 1 }}
              >
                <div className="flex items-center gap-4">
                  <div className="w-12 h-12 rounded-xl bg-cyan-100 flex items-center justify-center">
                    <ShieldCheck className="w-6 h-6 text-cyan-600" />
                  </div>
                  <div>
                    <p className="font-bold text-slate-800 text-sm">Link Mágico Recibido</p>
                    <p className="text-xs text-slate-400">"El auto está en reparación"</p>
                  </div>
                </div>
                <div className="bg-green-100/50 p-2 rounded-lg">
                  <MessageCircle className="w-5 h-5 text-green-500" />
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

  return (
    <section ref={ref} className="py-24 bg-slate-50 relative overflow-hidden">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center flex-row-reverse">

          {/* Visual: Phone Mockup Abstraction */}
          <motion.div
            className="relative w-full max-w-[320px] mx-auto h-[600px] bg-slate-900 rounded-[3rem] border-[8px] border-slate-200 shadow-2xl p-6 overflow-hidden flex flex-col"
            initial={{ opacity: 0, rotateY: 30, x: -50 }}
            animate={isInView ? { opacity: 1, rotateY: 0, x: 0 } : { opacity: 0, rotateY: 30, x: -50 }}
            transition={{ duration: 1, type: "spring" }}
          >
            {/* Status bar mock */}
            <div className="w-full flex justify-between items-center mb-6 px-2">
              <span className="text-white text-xs font-bold">9:41</span>
              <div className="flex gap-1">
                <div className="w-3 h-3 rounded-full bg-white"></div>
                <div className="w-4 h-3 rounded-sm bg-white"></div>
              </div>
            </div>

            <div className="bg-slate-800 rounded-2xl p-4 mb-4">
              <h4 className="text-white font-bold text-lg">Toyota Hilux 2022</h4>
              <p className="text-cyan-400 text-sm font-medium">Patente: KF-VG-45</p>
            </div>

            <div className="bg-slate-800 rounded-2xl p-4 mb-4 flex gap-4">
              <div className="bg-cyan-500/20 p-3 rounded-xl">
                <Banknote className="w-6 h-6 text-cyan-400" />
              </div>
              <div>
                <p className="text-slate-400 text-xs">Inversión anual</p>
                <p className="text-white font-bold text-xl">$450.000</p>
              </div>
            </div>

            <div className="flex-1 bg-white rounded-t-3xl mt-4 p-5">
              <h4 className="font-bold text-slate-900 text-sm mb-4">Historial de Ordenes</h4>

              {[1, 2, 3].map((val, i) => (
                <motion.div
                  key={val}
                  className="border-b border-slate-100 pb-3 mb-3"
                  initial={{ opacity: 0, x: 20 }}
                  animate={isInView ? { opacity: 1, x: 0 } : { opacity: 0, x: 20 }}
                  transition={{ delay: 0.8 + (i * 0.2) }}
                >
                  <div className="flex justify-between items-center">
                    <p className="font-bold text-slate-800 text-sm">Cambio de Aceite</p>
                    <span className="text-xs font-bold bg-green-100 text-green-700 px-2 rounded-full">Listo</span>
                  </div>
                  <p className="text-xs text-slate-400 mt-1">Hace {val} mes{val > 1 ? 'es' : ''}</p>
                </motion.div>
              ))}
            </div>
          </motion.div>

          <motion.div
            initial={{ opacity: 0, x: 50 }}
            animate={isInView ? { opacity: 1, x: 0 } : { opacity: 0, x: 50 }}
            transition={{ duration: 0.8, ease: "easeOut" }}
          >
            <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-slate-200/50 border border-slate-200/80 text-slate-700 mb-6 shadow-sm">
              <Car className="h-4 w-4" />
              <span className="text-sm font-bold tracking-wide">Para el Conductor</span>
            </div>
            <h2 className="text-3xl md:text-5xl font-black text-slate-900 tracking-tight leading-tight mb-6">
              La tranquilidad de tener el <span className="text-blue-600">historial en tu bolsillo.</span>
            </h2>
            <p className="text-lg text-slate-500 mb-8 leading-relaxed">
              <strong>Mi Garage</strong> consolida todo lo que pasa con tus vehículos. Todas las reparaciones, inversiones, fechas y recambios bajo control, inmutable y disponible en cualquier momento de manera gratuita.
            </p>

            <Link href="/conductores/mapa">
              <button className="px-8 py-4 bg-slate-900 text-white rounded-2xl font-bold hover:scale-105 transition-all flex items-center justify-center gap-2 shadow-xl shadow-slate-900/20">
                Buscar mi historial automotriz <ArrowRight className="w-5 h-5" />
              </button>
            </Link>
          </motion.div>

        </div>
      </div>
    </section>
  );
};

// --- PRICING SECTION ---
const PricingSection = () => {
  const plans = [
    {
      name: 'Plan Presencia',
      description: 'Tu vitrina digital en el mundo automotriz.',
      features: [
        'Perfil público en el Mapa Flusize.',
        'Perfil Link-in-Bio para tus redes.',
        'Botón de contacto directo a tu WhatsApp.',
        'Integración con todas tus redes sociales.'
      ],
      popular: false,
      waLink: "https://wa.me/56975243510?text=Hola,%20quiero%20estar%20en%20el%20Mapa%20de%20Flusize%20(Plan%20Presencia)",
    },
    {
      name: 'Plan Pro Tracking',
      description: 'Transparencia que multiplica tus ventas y fideliza.',
      features: [
        'Todo lo del Plan Presencia.',
        'Transparencia Total: Link Mágico de seguimiento.',
        'Historial de órdenes (hasta 15 días).',
        'Agregar y eliminar mecánicos de tu equipo.',
        'Envío de boletas/comprobantes al cliente.'
      ],
      popular: true,
      waLink: "https://wa.me/56975243510?text=Hola,%20quiero%20el%20Plan%20Pro%20Tracking%20con%20el%20Link%20Mágico",
    },
    {
      name: 'Plan SaaS Completo',
      description: 'El sistema operativo total para escalar tu taller.',
      features: [
        'Todo lo del Plan Pro Tracking.',
        'Historial de órdenes ilimitado.',
        'Panel SaaS completo (Gestión avanzada).',
        'Reportes financieros y de inversión B2B.',
        'Soporte técnico prioritario.'
      ],
      popular: false,
      waLink: "https://wa.me/56975243510?text=Hola,%20necesito%20el%20SaaS%20Completo%20de%20Flusize%20para%20mi%20taller",
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
              Planes diseñados para tu <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-cyan-500">crecimiento</span>
            </h2>
            <p className="text-lg text-slate-500 font-medium">
              Elige el plan que mejor se adapte a las necesidades de tu centro automotriz y comienza a digitalizar tu operación hoy mismo.
            </p>
          </motion.div>
        </div>

        <div className="grid md:grid-cols-3 gap-8 items-center max-w-6xl mx-auto">
          {plans.map((plan, index) => (
            <motion.div
              key={plan.name}
              initial={{ opacity: 0, y: 30 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true, margin: "-100px" }}
              transition={{ duration: 0.6, delay: index * 0.15 }}
              className={`relative flex flex-col p-8 rounded-[2rem] bg-white transition-all duration-300 ${plan.popular
                ? 'border-2 border-blue-600 shadow-2xl shadow-blue-500/10 md:-translate-y-4 z-10'
                : 'border border-slate-200 shadow-xl shadow-slate-200/50 hover:border-slate-300 z-0'
                }`}
            >
              {plan.popular && (
                <div className="absolute -top-4 left-0 right-0 flex justify-center">
                  <span className="bg-gradient-to-r from-blue-600 to-cyan-500 text-white text-xs font-bold px-4 py-1.5 rounded-full uppercase tracking-widest shadow-md">
                    Más Popular
                  </span>
                </div>
              )}

              <div className="mb-8">
                <h3 className="text-2xl font-black text-slate-800 tracking-tight mb-3">{plan.name}</h3>
                <p className="text-sm text-slate-500 font-medium leading-relaxed min-h-[40px]">{plan.description}</p>
              </div>

              <ul className="space-y-4 mb-10 flex-1">
                {plan.features.map((feature, i) => (
                  <li key={i} className="flex items-start gap-3">
                    <CheckCircle2 className={`w-5 h-5 shrink-0 ${plan.popular ? 'text-blue-500' : 'text-slate-400'}`} />
                    <span className={`text-sm font-medium leading-snug ${plan.popular ? 'text-slate-700' : 'text-slate-600'}`}>{feature}</span>
                  </li>
                ))}
              </ul>

              <a
                href={plan.waLink}
                target="_blank"
                rel="noopener noreferrer"
                className={`w-full py-4 px-4 rounded-xl font-bold flex items-center justify-center transition-all ${plan.popular
                  ? 'bg-gradient-to-r from-blue-600 to-cyan-500 text-white shadow-lg hover:shadow-xl hover:from-blue-700 hover:to-cyan-600 hover:scale-[1.02]'
                  : 'bg-slate-100 text-slate-700 hover:bg-slate-200 hover:scale-[1.02]'
                  }`}
              >
                Contactar a Ventas
              </a>
            </motion.div>
          ))}
        </div>
      </div>
    </section>
  );
};

// --- FOOTER ---
const Footer = () => (
  <footer className="bg-white text-slate-500 py-16 border-t border-slate-100">
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col md:flex-row justify-between items-center gap-6">

      <div className="flex items-center gap-2 opacity-50">
        <img src="/logo_flusize.png" alt="Flusize" className="h-6 w-6 object-contain grayscale" />
        <span className="font-extrabold tracking-tight text-slate-800">FLUSIZE</span>
      </div>

      <div className="flex gap-6 text-sm font-medium">
        <Link href="/login" className="hover:text-cyan-600 transition-colors">Taller</Link>
        <Link href="/conductores/mapa" className="hover:text-cyan-600 transition-colors">Conductores</Link>
        <a href="#" className="hover:text-cyan-600 transition-colors">Términos</a>
      </div>

      <div className="text-sm">
        © {new Date().getFullYear()} Flusize. El OS del Taller.
      </div>
    </div>
  </footer>
);
