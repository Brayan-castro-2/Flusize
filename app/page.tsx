'use client';

import React, { useRef, useState, useEffect, useMemo } from 'react';
import { motion, useScroll, useTransform, useInView, AnimatePresence } from 'framer-motion';
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
  ChevronRight,
  Truck,
  Building,
  FileSignature,
  Activity
} from 'lucide-react';

// --- MAIN PAGE COMPONENT ---
export default function LandingPage() {
  const { scrollYProgress } = useScroll();
  const scaleX = useTransform(scrollYProgress, [0, 1], [0, 1]);
  const [isEmergencyOpen, setIsEmergencyOpen] = useState(false);
  const [isLoginSheetOpen, setIsLoginSheetOpen] = useState(false);
  const [activeTab, setActiveTab] = useState<'conductor' | 'taller'>('conductor');

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

      <Navbar onLoginClick={() => setIsLoginSheetOpen(true)} />

      <main>
        <HeroSection onEmergencyClick={() => setIsEmergencyOpen(true)} />
        <SectionBentoDual />
        <StorySection />
        <SectionInteractiveShowcase activeTab={activeTab} setActiveTab={setActiveTab} />
        {activeTab === 'taller' ? (
          <PricingSection />
        ) : (
          <DriverBenefitsSection />
        )}
      </main>

      <Footer />

      {/* Global Emergency Modal */}
      <EmergencyModal isOpen={isEmergencyOpen} onClose={() => setIsEmergencyOpen(false)} />
      
      {/* Login Bottom Sheet Simulator */}
      <LoginBottomSheet isOpen={isLoginSheetOpen} onClose={() => setIsLoginSheetOpen(false)} />
    </div>
  );
}




// --- LOGIN BOTTOM SHEET ---
const LoginBottomSheet = ({ isOpen, onClose }: { isOpen: boolean, onClose: () => void }) => {
  return (
    <>
      <div 
        className={`fixed inset-0 z-[200] bg-black/60 backdrop-blur-sm transition-opacity duration-300 ${isOpen ? 'opacity-100' : 'opacity-0 pointer-events-none'}`} 
        onClick={onClose}
      />
      <div 
        className={`fixed bottom-0 left-0 w-full bg-white z-[201] rounded-t-[2.5rem] p-6 pb-12 transform transition-transform duration-300 shadow-[0_-20px_40px_rgba(0,0,0,0.2)] flex flex-col md:w-[400px] md:left-1/2 md:-translate-x-1/2 md:bottom-auto md:top-1/2 md:-translate-y-1/2 md:rounded-3xl ${isOpen ? 'translate-y-0 md:scale-100 md:opacity-100' : 'translate-y-full md:scale-95 md:opacity-0 md:pointer-events-none'}`}
      >
        <div className="w-12 h-1.5 bg-slate-200 rounded-full mx-auto mb-8 md:hidden cursor-pointer" onClick={onClose} />
        <div className="flex justify-between items-start mb-6">
          <div>
            <h3 className="text-2xl font-black text-slate-900 tracking-tight">Bienvenido</h3>
            <p className="text-slate-500 font-medium mt-1">Elige cómo quieres ingresar a Flusize.</p>
          </div>
          <button onClick={onClose} className="p-2 bg-slate-100 text-slate-500 hover:text-slate-900 rounded-full transition-colors hidden md:block active:scale-95">
            <X className="w-5 h-5" />
          </button>
        </div>
        
        <div className="space-y-3">
          <Link href="/login" className="flex items-center gap-4 w-full p-4 bg-white border-2 border-slate-100 hover:border-blue-500 rounded-2xl transition-all active:scale-95 group">
            <div className="w-12 h-12 bg-blue-50 rounded-xl flex items-center justify-center group-hover:bg-blue-600 transition-colors">
              <Car className="w-6 h-6 text-blue-600 group-hover:text-white transition-colors" />
            </div>
            <div className="flex-1 text-left">
              <h4 className="font-bold text-slate-900 text-lg">Soy Conductor</h4>
              <p className="text-xs text-slate-500 font-medium">Gestiona el ADN de tu vehículo</p>
            </div>
            <ChevronRight className="w-5 h-5 text-slate-300 group-hover:text-blue-500" />
          </Link>
          
          <Link href="/login?tab=taller" className="flex items-center gap-4 w-full p-4 bg-white border-2 border-slate-100 hover:border-cyan-500 rounded-2xl transition-all active:scale-95 group">
            <div className="w-12 h-12 bg-cyan-50 rounded-xl flex items-center justify-center group-hover:bg-cyan-500 transition-colors">
              <Building className="w-6 h-6 text-cyan-600 group-hover:text-white transition-colors" />
            </div>
            <div className="flex-1 text-left">
              <h4 className="font-bold text-slate-900 text-lg">Soy Taller</h4>
              <p className="text-xs text-slate-500 font-medium">Entrar al panel de administración</p>
            </div>
            <ChevronRight className="w-5 h-5 text-slate-300 group-hover:text-cyan-500" />
          </Link>
        </div>
      </div>
    </>
  );
}

// --- NEURAL BACKGROUND (Removed in favor of Video Background) ---
// const NeuralBackground = () => { ... }

// --- NAVBAR ---
const Navbar = ({ onLoginClick }: { onLoginClick?: () => void }) => {
  const [scrolled, setScrolled] = useState(false);

  useEffect(() => {
    const handleScroll = () => {
      setScrolled(window.scrollY > 50);
    };
    window.addEventListener('scroll', handleScroll);
    return () => window.removeEventListener('scroll', handleScroll);
  }, []);

  return (
    <nav className={`fixed top-0 left-0 right-0 z-[100] transition-all duration-300 ${scrolled ? 'bg-slate-950/80 backdrop-blur-md border-b border-white/10 py-4' : 'bg-transparent py-6'}`}>
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between">
          <Link href="/" className="flex items-center gap-2 group">
            <span className="font-black tracking-tighter text-white text-2xl group-hover:text-cyan-400 transition-colors">FLUSIZE</span>
          </Link>
          
          <div className="flex items-center gap-4 sm:gap-6">
            <Link href="/conductores/mapa" className="hidden sm:flex items-center gap-2 text-slate-300 hover:text-cyan-400 transition-colors font-bold text-sm bg-slate-900/50 px-4 py-2 rounded-full border border-slate-700/50 hover:border-cyan-500/50">
              <MapPin className="w-4 h-4" />
              <span>Mapa de Servicios</span>
            </Link>
            <button onClick={onLoginClick} className="text-slate-300 hover:text-white transition-colors font-bold text-sm px-2 active:scale-95">
              Ingresar
            </button>
            <Link href="/conductores/mapa" className="sm:hidden flex items-center justify-center bg-blue-600/20 text-blue-400 border border-blue-500/30 hover:bg-blue-600 hover:text-white p-2.5 rounded-xl transition-all">
              <MapPin className="w-5 h-5" />
            </Link>
          </div>
        </div>
      </div>
    </nav>
  );
};

// --- HERO SECTION ---
const HeroSection = ({ onEmergencyClick }: { onEmergencyClick: () => void }) => {
  return (
    <section className="relative pt-40 pb-32 flex flex-col items-center justify-center min-h-screen overflow-hidden">
      {/* Cinematic Video Background */}
      <video
        autoPlay
        loop
        muted
        playsInline
        poster="/hero-bg-poster.jpg"
        preload="metadata"
        className="absolute inset-0 w-full h-full object-cover z-0"
      >
        <source src="/hero-bg.mp4" type="video/mp4" />
      </video>

      {/* Dark Overlay for Contrast */}
      <div className="absolute inset-0 bg-slate-950/70 z-0 pointer-events-none" />

      {/* Gradient Transition to next section */}
      <div className="absolute bottom-0 left-0 right-0 h-40 bg-gradient-to-t from-slate-950 to-transparent z-10 pointer-events-none" />

      <div className="max-w-5xl mx-auto px-4 text-center z-10 flex flex-col items-center pt-4 pb-4">
        <motion.div
          className="relative z-10 flex flex-col items-center w-full"
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2, duration: 1 }}
        >
          {/* Neon Badge & Branding */}
          <div className="flex flex-col items-center mb-8">
            <div className="mb-6">
              <span className="font-black text-5xl tracking-[0.2em] text-white drop-shadow-[0_0_20px_rgba(255,255,255,0.4)]">FLUSIZE</span>
            </div>
            <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-slate-900/60 backdrop-blur-md border border-cyan-500/30 text-cyan-400 shadow-[0_0_15px_rgba(34,211,238,0.2)]">
              <Zap className="h-4 w-4" />
              <span className="text-sm font-bold tracking-wide">El Ecosistema B2B & B2C</span>
            </div>
          </div>

          <h1 className="text-3xl sm:text-4xl md:text-6xl lg:text-7xl font-black text-white tracking-tight leading-[1.1] mb-4 md:mb-8 drop-shadow-2xl">
            TODA LA VIDA DE TU VEHÍCULO, <br className="hidden md:block" />
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-cyan-400 drop-shadow-sm">
              EN LA PALMA DE TU MANO.
            </span>
          </h1>

          <p className="text-base md:text-2xl text-slate-300 mb-6 md:mb-12 max-w-4xl mx-auto leading-relaxed drop-shadow-lg font-medium">
            El ecosistema premium que conecta a los mejores talleres y rent-a-cars con sus clientes. <strong className="text-white">Transparencia</strong>, <strong className="text-white">historial</strong> y <strong className="text-white">control total</strong>.
          </p>

          <div className="flex flex-col sm:flex-row items-center justify-center gap-3 w-full max-w-2xl mx-auto">
            <Link href="/mi-garage" className="w-full sm:w-1/2">
              <button className="w-full px-6 py-4 bg-blue-600 hover:bg-blue-500 text-white rounded-2xl font-black shadow-[0_0_40px_rgba(37,99,235,0.4)] transition-all flex items-center justify-center gap-3 text-base hover:scale-105 active:scale-95 border border-blue-400/50 uppercase tracking-tight">
                <span className="text-xl">🚗</span> Entrar a mi Garage
              </button>
            </Link>
            
            <button 
              onClick={() => {
                document.getElementById('planes')?.scrollIntoView({ behavior: 'smooth' });
              }}
              className="w-full sm:w-1/2 px-6 py-4 bg-slate-900/50 backdrop-blur-md text-slate-200 border-2 border-slate-600 hover:border-slate-400 hover:bg-slate-800/80 hover:text-white rounded-2xl font-bold transition-all flex items-center justify-center gap-3 text-base active:scale-95"
            >
              <span className="text-xl">⚙️</span> Soy Taller
            </button>
          </div>
          
          <div className="mt-4 md:mt-8 w-full max-w-md mx-auto flex justify-center">
            <EmergencyButton onClick={onEmergencyClick} />
          </div>
        </motion.div>
      </div>
    </section>
  );
};


const EmergencyButton = ({ onClick }: { onClick: () => void }) => {
  return (
    <button
      onClick={onClick}
      className="w-full sm:w-auto px-8 py-4 bg-red-600 text-white rounded-2xl font-black shadow-[0_0_30px_rgba(220,38,38,0.5)] transition-all flex items-center justify-center gap-2 text-lg animate-pulse hover:scale-105 hover:bg-red-700 active:scale-95 border-2 border-red-400 group relative overflow-hidden"
    >
      <span className="absolute inset-0 bg-gradient-to-r from-red-400/0 via-red-400/30 to-red-400/0 -translate-x-full group-hover:translate-x-full transition-transform duration-700" />
      <AlertTriangle className="h-6 w-6" />
      🆘 TENGO UNA EMERGENCIA
    </button>
  );
};

const EmergencyModal = ({ isOpen, onClose }: { isOpen: boolean, onClose: () => void }) => {
  useEffect(() => {
    if (isOpen) {
      document.body.style.overflow = 'hidden';
      document.documentElement.style.overflow = 'hidden';
    } else {
      document.body.style.overflow = '';
      document.documentElement.style.overflow = '';
    }
    return () => {
      document.body.style.overflow = '';
      document.documentElement.style.overflow = '';
    };
  }, [isOpen]);

  const categories = [
    { name: 'Neumáticos / Vulca', icon: Disc, color: 'text-orange-500', bg: 'bg-orange-50', filter: 'Neumáticos', desc: 'Encuentra un taller cercano' },
    { name: 'Frenos', icon: AlertTriangle, color: 'text-red-500', bg: 'bg-red-50', filter: 'Frenos', desc: 'Encuentra un taller cercano' },
    { name: 'Aceite / Fluidos', icon: Droplets, color: 'text-blue-500', bg: 'bg-blue-50', filter: 'Mantención', desc: 'Encuentra un taller cercano' },
    { name: 'Motor / Mecánica', icon: LifeBuoy, color: 'text-purple-500', bg: 'bg-purple-50', filter: 'Motor', desc: 'Encuentra un taller cercano' },
    { name: 'Rent a Car', icon: Car, color: 'text-teal-500', bg: 'bg-teal-50', filter: 'Rent a Car', desc: 'Encuentra un vehículo de reemplazo' },
    { name: 'Grúas', icon: Truck, color: 'text-yellow-600', bg: 'bg-yellow-50', filter: 'Grúas', desc: 'Solicita una grúa de rescate rápido' },
    { name: 'Pintura / Desabolladura', icon: Wrench, color: 'text-pink-500', bg: 'bg-pink-50', filter: 'Desabolladura', desc: 'Encuentra expertos en carrocería' },
    { name: 'Automotoras', icon: Building, color: 'text-indigo-500', bg: 'bg-indigo-50', filter: 'Automotoras', desc: 'Descubre vehículos en venta' },
  ];

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 z-[9999] flex items-center justify-center p-4 bg-black/60 backdrop-blur-sm">
      <motion.div
        initial={{ opacity: 0, scale: 0.9, y: 20 }}
        animate={{ opacity: 1, scale: 1, y: 0 }}
        className="bg-white relative z-10 rounded-[2.5rem] w-full max-w-2xl overflow-hidden shadow-2xl border border-slate-200"
      >
        <div className="p-8 pb-4 flex justify-between items-center bg-slate-50 border-b border-slate-100">
          <div>
            <h2 className="text-2xl font-black text-slate-900 tracking-tight">CENTRO DE EMERGENCIAS</h2>
            <p className="text-slate-500 font-bold uppercase tracking-widest text-[10px]">Asistencia Flusize inmediata</p>
          </div>
          <button
            onClick={onClose}
            className="p-3 bg-white rounded-xl shadow-sm border border-slate-200 hover:bg-slate-50 transition-colors"
          >
            <X className="w-6 h-6 text-slate-500" />
          </button>
        </div>

        <div className="p-8 grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 overflow-y-auto max-h-[60vh] custom-scrollbar">
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
                <p className="text-xs text-slate-500 font-bold">{cat.desc}</p>
              </div>
            </Link>
          ))}
        </div>

        <div className="p-8 bg-blue-600 text-white text-center">
          <p className="text-sm font-bold tracking-tight">ESTÁS RESPALDADO. LOCALIZANDO TALLERES DISPONIBLES EN TU ZONA...</p>
        </div>
      </motion.div>
    </div>
  );
};


// --- AUTO CAROUSEL BENTO (Mobile Tab Switcher) ---
const AutoCarouselBento = ({ isInView }: { isInView: boolean }) => {
  const [activeTab, setActiveTab] = useState<0 | 1>(0);
  const timerRef = useRef<any>(null);

  const resetTimer = (tab: 0 | 1) => {
    if (timerRef.current) clearInterval(timerRef.current);
    timerRef.current = setInterval(() => {
      setActiveTab(t => t === 0 ? 1 : 0);
    }, 4000);
    setActiveTab(tab);
  };

  useEffect(() => {
    timerRef.current = setInterval(() => {
      setActiveTab(t => t === 0 ? 1 : 0);
    }, 4000);
    return () => clearInterval(timerRef.current);
  }, []);

  const tabs = [
    {
      key: 0,
      icon: Car,
      accent: 'cyan',
      bg: 'bg-cyan-500/20',
      border: 'border-cyan-500/30',
      text: 'text-cyan-400',
      glow: 'bg-cyan-500/10',
      title: 'Para Conductores',
      desc: <>Tu <strong>Garage Digital</strong>. Toma el control absoluto de la vida de tu vehículo. Transparencia que da tranquilidad.</>,
      items: [
        { icon: Clock, text: 'Historial histórico inmutable de mantenciones' },
        { icon: ShieldCheck, text: 'Fotos del proceso en vivo directo a tu WhatsApp' },
        { icon: FileSignature, text: 'Firma de contratos y presupuestos desde el celular' },
      ],
      cta: <Link href="/mi-garage" className="inline-flex items-center gap-2 text-cyan-400 font-bold hover:text-cyan-300 transition-colors group/link">Entrar a mi Garage <ArrowRight className="w-4 h-4 group-hover/link:translate-x-1 transition-transform" /></Link>,
    },
    {
      key: 1,
      icon: Building,
      accent: 'blue',
      bg: 'bg-blue-500/20',
      border: 'border-blue-500/30',
      text: 'text-blue-400',
      glow: 'bg-blue-500/10',
      title: 'Para Talleres y Flotas',
      desc: <>Software de gestión de última generación. <strong>Digitaliza el 100%</strong> de tus operaciones y blinda tu rentabilidad.</>,
      items: [
        { icon: Activity, text: 'Control de inventario y cálculo de rentabilidad exacta' },
        { icon: FileSignature, text: 'Generación de contratos automáticos y firma digital' },
        { icon: Wrench, text: 'Gestión eficiente de elevadores y tiempos de mecánicos' },
      ],
      cta: <button onClick={() => document.getElementById('planes')?.scrollIntoView({ behavior: 'smooth' })} className="inline-flex items-center gap-2 text-blue-400 font-bold hover:text-blue-300 transition-colors group/link">Ver planes y potenciar negocio <ArrowRight className="w-4 h-4 group-hover/link:translate-x-1 transition-transform" /></button>,
    },
  ];

  return (
    <>
      {/* Desktop: grid de 2 columnas */}
      <div className="hidden md:grid md:grid-cols-2 gap-6 items-stretch">
        {tabs.map((tab) => (
          <motion.div
            key={tab.key}
            className={`bg-slate-900 border border-slate-800 rounded-[2.5rem] p-10 shadow-2xl relative overflow-hidden group hover:border-${tab.accent}-500/30 transition-colors`}
            initial={{ opacity: 0, y: 20 }}
            animate={isInView ? { opacity: 1, y: 0 } : { opacity: 0, y: 20 }}
            transition={{ duration: 0.6, delay: tab.key * 0.2 }}
          >
            <div className={`absolute top-0 right-0 w-64 h-64 ${tab.glow} rounded-full blur-[80px] -mr-20 -mt-20`} />
            <div className="relative z-10">
              <div className={`w-14 h-14 ${tab.bg} rounded-2xl flex items-center justify-center mb-8 border ${tab.border}`}>
                <tab.icon className={`w-8 h-8 ${tab.text}`} />
              </div>
              <h3 className="text-3xl font-black text-white mb-4 tracking-tight">{tab.title}</h3>
              <p className="text-slate-300 text-lg mb-8 leading-relaxed">{tab.desc}</p>
              <ul className="space-y-4">
                {tab.items.map((item, i) => (
                  <li key={i} className="flex items-start gap-3">
                    <div className={`mt-1 bg-slate-800 p-1.5 rounded-lg border border-slate-700 ${tab.text} shrink-0`}>
                      <item.icon className="w-4 h-4" />
                    </div>
                    <span className="text-slate-300 font-medium">{item.text}</span>
                  </li>
                ))}
              </ul>
              <div className="mt-10">{tab.cta}</div>
            </div>
          </motion.div>
        ))}
      </div>

      {/* Mobile: tabs con auto-rotación */}
      <div className="md:hidden">
        {/* Tab Switcher Pills */}
        <div className="flex gap-3 mb-6">
          {tabs.map((tab) => (
            <button
              key={tab.key}
              onClick={() => resetTimer(tab.key as 0 | 1)}
              className={`flex-1 py-3 rounded-2xl font-black text-sm transition-all active:scale-95 border-2 ${activeTab === tab.key ? `bg-slate-800 ${tab.border} ${tab.text}` : 'bg-transparent border-slate-800 text-slate-500'}`}
            >
              {tab.key === 0 ? '🚗 Conductor' : '🏭 Taller'}
            </button>
          ))}
        </div>

        {/* Progress bar */}
        <div className="h-0.5 bg-slate-800 rounded-full mb-6 overflow-hidden">
          <motion.div
            key={activeTab}
            className={`h-full ${activeTab === 0 ? 'bg-cyan-400' : 'bg-blue-400'}`}
            initial={{ width: '0%' }}
            animate={{ width: '100%' }}
            transition={{ duration: 4, ease: 'linear' }}
          />
        </div>

        {/* Card Content */}
        <AnimatePresence mode="wait">
          {tabs.filter(tab => activeTab === tab.key).map((tab) => (
            <motion.div
              key={tab.key}
              initial={{ opacity: 0, x: tab.key === 0 ? -20 : 20 }}
              animate={{ opacity: 1, x: 0 }}
              exit={{ opacity: 0, x: tab.key === 0 ? 20 : -20 }}
              transition={{ duration: 0.3 }}
              className={`bg-slate-900 border-2 ${tab.border} rounded-[2rem] p-6 shadow-2xl relative overflow-hidden`}
            >
              <div className={`absolute top-0 right-0 w-48 h-48 ${tab.glow} rounded-full blur-[60px] -mr-10 -mt-10`} />
              <div className="relative z-10">
                <div className={`w-12 h-12 ${tab.bg} rounded-xl flex items-center justify-center mb-5 border ${tab.border}`}>
                  <tab.icon className={`w-6 h-6 ${tab.text}`} />
                </div>
                <h3 className="text-2xl font-black text-white mb-3">{tab.title}</h3>
                <p className="text-slate-300 text-sm mb-6 leading-relaxed">{tab.desc}</p>
                <ul className="space-y-3">
                  {tab.items.map((item, i) => (
                    <li key={i} className="flex items-start gap-3">
                      <div className={`mt-0.5 bg-slate-800 p-1.5 rounded-lg border border-slate-700 ${tab.text} shrink-0`}>
                        <item.icon className="w-3.5 h-3.5" />
                      </div>
                      <span className="text-slate-300 font-medium text-sm">{item.text}</span>
                    </li>
                  ))}
                </ul>
                <div className="mt-8">{tab.cta}</div>
              </div>
            </motion.div>
          ))}
        </AnimatePresence>
      </div>
    </>
  );
};

// --- SECTION BENTO DUAL ---
const SectionBentoDual = () => {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-50px" });

  return (
    <section ref={ref} className="py-16 md:py-24 bg-slate-950 relative overflow-hidden border-b border-white/5 z-20">
      <div className="absolute inset-0 bg-slate-950 z-0"></div>
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center mb-16">
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={isInView ? { opacity: 1, y: 0 } : { opacity: 0, y: 20 }}
            transition={{ duration: 0.6 }}
          >
            <h2 className="text-3xl md:text-5xl font-black text-white tracking-tight mb-4">
              Dos mundos. <span className="text-cyan-400">Una sola plataforma.</span>
            </h2>
            <p className="text-slate-400 text-lg max-w-2xl mx-auto">
              Diseñado para empoderar al conductor y multiplicar la rentabilidad de los negocios automotrices.
            </p>
          </motion.div>
        </div>

        {/* Mobile: Tab Switcher | Desktop: grid */}
        <AutoCarouselBento isInView={isInView} />
      </div>
    </section>
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

        </motion.div>
      </div>
    </section>
  );
};

// --- DRIVER BENEFITS SECTION ---
const DriverBenefitsSection = () => {
  return (
    <section className="py-24 md:py-32 bg-slate-900 border-y border-slate-800 relative overflow-hidden">
      <div className="absolute inset-0 opacity-10 pointer-events-none">
        <div className="absolute top-1/4 left-1/4 w-[500px] h-[500px] bg-cyan-500/30 rounded-full blur-[120px]" />
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="text-center max-w-3xl mx-auto mb-16 md:mb-24">
          <h2 className="text-4xl md:text-6xl font-black text-white tracking-tight leading-tight mb-6">
            Por qué usar <span className="text-cyan-400">Flusize</span>
          </h2>
          <p className="text-xl text-cyan-400 font-bold mb-4 tracking-tight">El copiloto digital definitivo para tu vehículo.</p>
          <p className="text-lg text-slate-400 leading-relaxed font-medium">
            No más llamadas interminables, presupuestos dudosos ni papeleos perdidos. Todo lo que tu auto necesita en un solo ecosistema, y lo mejor: 100% gratis para ti.
          </p>
        </div>

        <div className="flex overflow-x-auto snap-x snap-mandatory scrollbar-hide gap-4 md:grid md:grid-cols-2 lg:grid-cols-3 md:gap-8 pb-8 px-4 md:px-0 -mx-4 md:mx-0">
          {[
            {
              icon: Clock,
              title: "Trazabilidad en Tiempo Real",
              desc: "Dejar tu auto en el taller ahora es tan transparente como pedir un delivery. Revisa exactamente en qué etapa está tu vehículo en tiempo real y recibe notificaciones paso a paso desde el diagnóstico hasta que está \"Listo para retiro\".",
              delay: 0.1
            },
            {
              icon: MessageSquare,
              title: "Transparencia y Evidencia Visual",
              desc: "Recibe fotos y reportes en alta resolución directo a tu celular para que veas el repuesto dañado con tus propios ojos. Aprueba o rechaza trabajos adicionales con un clic. Se acabó el \"yo no autoricé eso\".",
              delay: 0.2
            },
            {
              icon: AlertTriangle,
              title: "Tu Compañero en Emergencias",
              desc: "¿Quedaste en pana? Nuestro mapa interactivo te conecta con asistencia VIP 24/7. Encuentra grúas, cerrajeros móviles o vulcanizaciones a domicilio en segundos cuando más lo necesitas.",
              delay: 0.3
            },
            {
              icon: MapPin,
              title: "Red de Servicios de Confianza",
              desc: "Explora nuestro mapa para encontrar servicios automotrices certificados que operan con el estándar de transparencia Flusize en tu zona. Calidad garantizada, sin sorpresas en la boleta.",
              delay: 0.4
            },
            {
              icon: FileSignature,
              title: "El Carnet de Salud de tu Auto",
              desc: "Olvídate de guardar boletas en la guantera. Mantén el historial inmutable de servicios y contratos digitales de tu vehículo siempre a mano. Ideal para llevar el control y mantener el valor de reventa de tu auto intacto.",
              delay: 0.5
            }
          ].map((benefit, i) => (
            <motion.div
              key={i}
              className={`bg-slate-950 p-8 rounded-3xl border border-slate-800 hover:border-cyan-500/50 transition-colors shadow-xl group flex-shrink-0 snap-center min-w-[85vw] md:min-w-0 ${i === 3 ? 'lg:col-span-1 lg:col-start-1 md:col-span-1' : ''} ${i === 4 ? 'lg:col-span-2 md:col-span-1' : ''}`}
              initial={{ opacity: 0, y: 30 }}
              whileInView={{ opacity: 1, y: 0 }}
              viewport={{ once: true }}
              transition={{ duration: 0.5, delay: benefit.delay }}
            >
              <div className="w-14 h-14 bg-cyan-500/10 rounded-2xl flex items-center justify-center mb-6 group-hover:scale-110 group-hover:bg-cyan-500/20 transition-all">
                <benefit.icon className="w-7 h-7 text-cyan-400" />
              </div>
              <h3 className="text-xl md:text-2xl font-black text-white mb-4 tracking-tight">{benefit.title}</h3>
              <p className="text-sm md:text-base text-slate-400 leading-relaxed font-medium">{benefit.desc}</p>
            </motion.div>
          ))}
        </div>

        <div className="mt-12 md:mt-20 flex justify-center px-4 md:px-0">
          <Link href="/mi-garage" className="w-full sm:w-auto">
            <button className="w-full sm:w-auto px-8 py-4 bg-white text-slate-950 rounded-full font-black active:scale-95 hover:scale-105 transition-transform flex items-center justify-center gap-3 shadow-2xl shadow-white/20">
              Crear mi Garage Digital - ¡Es 100% Gratis! <ArrowRight className="w-5 h-5" />
            </button>
          </Link>
        </div>
      </div>
    </section>
  );
};

// --- SECTION INTERACTIVE SHOWCASE (Dual B2B/B2C) ---
const SectionInteractiveShowcase = ({ activeTab, setActiveTab }: { activeTab: 'conductor' | 'taller', setActiveTab: (tab: 'conductor' | 'taller') => void }) => {
  const ref = useRef(null);
  const isInView = useInView(ref, { once: true, margin: "-100px" });

  const trackingSteps = [
    { label: "Recibido", active: true, done: true },
    { label: "En Taller", active: true, done: false },
    { label: "Listo", active: false, done: false }
  ];

  return (
    <section ref={ref} className="py-24 md:py-32 bg-slate-950 relative overflow-hidden border-y border-white/5 min-h-screen">
      {/* Background Glow */}
      <div className="absolute inset-0 opacity-20 pointer-events-none transition-colors duration-1000">
        <div className={`absolute top-0 right-1/4 w-96 h-96 rounded-full blur-[120px] transition-colors duration-1000 ${activeTab === 'taller' ? 'bg-blue-600/30' : 'bg-cyan-500/30'}`} />
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10 w-full">
        
        {/* Toggle Switch */}
        <div className="flex justify-center mb-16 md:mb-24">
          <div className="bg-slate-900 p-1.5 rounded-2xl border border-slate-800 shadow-xl inline-flex relative">
            {/* Animated Highlight Background */}
            <div 
              className="absolute top-1.5 bottom-1.5 w-[calc(50%-6px)] bg-slate-800 rounded-xl border border-slate-700 shadow-sm transition-all duration-300 ease-in-out"
              style={{ left: activeTab === 'conductor' ? '6px' : 'calc(50% + 1.5px)' }}
            />
            
            <button
              onClick={() => setActiveTab('conductor')}
              className={`relative z-10 flex items-center justify-center gap-2 px-4 md:px-8 py-3 w-40 md:w-48 rounded-xl font-bold transition-all duration-300 ${activeTab === 'conductor' ? 'text-white' : 'text-slate-500 hover:text-slate-300'}`}
            >
              <Car className="w-5 h-5" /> <span className="hidden sm:inline">Para</span> Conductores
            </button>
            <button
              onClick={() => setActiveTab('taller')}
              className={`relative z-10 flex items-center justify-center gap-2 px-4 md:px-8 py-3 w-40 md:w-48 rounded-xl font-bold transition-all duration-300 ${activeTab === 'taller' ? 'text-white' : 'text-slate-500 hover:text-slate-300'}`}
            >
              <Building className="w-5 h-5" /> <span className="hidden sm:inline">Para</span> Talleres
            </button>
          </div>
        </div>

        {/* Dynamic Content Container */}
        <div className="relative">
          
          {/* CONDUCTOR CONTENT */}
          <div 
            className={`transition-all duration-500 transform ${activeTab === 'conductor' ? 'opacity-100 translate-y-0 relative z-10' : 'opacity-0 translate-y-8 absolute inset-0 pointer-events-none z-0'}`}
          >
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 lg:gap-24 items-center">
              {/* Visual: Phone Mockup Abstraction */}
              <motion.div
                className="relative w-full max-w-[360px] mx-auto h-[600px] bg-slate-950 rounded-[3.5rem] border-[12px] border-slate-800 shadow-[0_0_80px_rgba(34,211,238,0.15)] p-5 overflow-hidden flex flex-col order-2 lg:order-1"
                initial={{ opacity: 0, rotateY: 20, x: -50 }}
                animate={isInView ? { opacity: 1, rotateY: 0, x: 0 } : { opacity: 0, rotateY: 20, x: -50 }}
                transition={{ duration: 1, type: "spring" }}
              >
                {/* Status bar mock */}
                <div className="w-full flex justify-between items-center mb-6 px-2">
                  <span className="text-white text-xs font-black">09:41</span>
                  <div className="flex gap-1.5 items-center">
                    <div className="w-4 h-3 rounded-sm bg-white border border-white/20 relative overflow-hidden">
                      <div className="absolute inset-0 bg-white w-2/3"></div>
                    </div>
                  </div>
                </div>

                {/* Garage Header */}
                <div className="bg-slate-900 rounded-3xl p-5 mb-4 border border-slate-800 shadow-md">
                  <div className="flex justify-between items-start mb-2">
                    <div>
                      <h4 className="text-white font-black text-xl mb-0.5">Audi A3 Sportback</h4>
                      <p className="text-slate-400 text-xs font-bold uppercase">Patente: XX-YY-99</p>
                    </div>
                    <div className="w-10 h-10 bg-cyan-500/20 rounded-full flex items-center justify-center text-cyan-400">
                      <Car className="w-5 h-5" />
                    </div>
                  </div>
                </div>

                {/* Tracking Progress Bar */}
                <div className="bg-white rounded-[2rem] p-5 mb-4 shadow-xl">
                  <div className="flex justify-between items-center mb-4">
                    <h4 className="font-black text-slate-900 text-sm">Estado Actual</h4>
                    <span className="bg-blue-100 text-blue-700 text-[10px] font-bold px-2 py-1 rounded-full uppercase">En Progreso</span>
                  </div>
                  
                  <div className="relative">
                    <div className="absolute left-4 top-2 bottom-2 w-0.5 bg-slate-100 z-0"></div>
                    <div className="absolute left-4 top-2 h-1/2 w-0.5 bg-blue-500 z-0"></div>
                    
                    <div className="space-y-6 relative z-10">
                      {trackingSteps.map((step, i) => (
                        <div key={i} className="flex items-center gap-4">
                          <div className={`w-8 h-8 rounded-full flex items-center justify-center shadow-sm ${step.done ? 'bg-blue-500 text-white' : step.active ? 'bg-white border-2 border-blue-500 text-blue-500' : 'bg-white border-2 border-slate-200 text-slate-300'}`}>
                            {step.done ? <CheckCircle2 className="w-4 h-4" /> : <div className={`w-2.5 h-2.5 rounded-full ${step.active ? 'bg-blue-500' : 'bg-slate-200'}`}></div>}
                          </div>
                          <div>
                            <p className={`text-sm font-bold ${step.active || step.done ? 'text-slate-900' : 'text-slate-400'}`}>{step.label}</p>
                            {step.active && !step.done && <p className="text-[10px] text-blue-500 font-bold mt-0.5">Mecánico trabajando...</p>}
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                </div>

                {/* Contrato Digital */}
                <div className="bg-slate-900 rounded-[2rem] p-5 border border-slate-800 relative overflow-hidden group mt-auto">
                  <div className="absolute inset-0 bg-gradient-to-br from-cyan-500/5 to-transparent"></div>
                  <div className="flex justify-between items-start mb-3 relative z-10">
                    <div className="flex items-center gap-2 text-cyan-400">
                      <FileSignature className="w-4 h-4" />
                      <span className="text-xs font-black uppercase tracking-wider">Contrato de Servicio</span>
                    </div>
                    <div className="w-2 h-2 bg-red-500 rounded-full animate-pulse"></div>
                  </div>
                  
                  <div className="bg-slate-950 p-3 rounded-xl border border-slate-800 mb-3 relative z-10">
                    <p className="text-slate-300 text-xs mb-1">Presupuesto Mantención 50.000km</p>
                    <p className="text-white font-black text-lg">$145.000 <span className="text-[10px] text-slate-500 font-normal">CLP</span></p>
                  </div>
                  
                  <button className="w-full py-3 bg-cyan-600 text-white text-xs font-black rounded-xl hover:bg-cyan-500 transition-colors relative z-10">
                    Firmar y Autorizar
                  </button>
                </div>
              </motion.div>

              {/* Content side */}
              <motion.div
                className="order-1 lg:order-2"
                initial={{ opacity: 0, x: 50 }}
                animate={isInView ? { opacity: 1, x: 0 } : { opacity: 0, x: 50 }}
                transition={{ duration: 0.8, ease: "easeOut" }}
              >
                <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-slate-800 border border-slate-700 text-slate-300 mb-8 shadow-sm">
                  <Car className="h-4 w-4" />
                  <span className="text-sm font-bold tracking-wide">Para el Conductor</span>
                </div>

                <h2 className="text-5xl md:text-7xl font-black text-white tracking-tight leading-[0.9] mb-8 uppercase">
                  TU GARAGE <br />
                  <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-cyan-400">DIGITAL.</span>
                </h2>

                <p className="text-xl md:text-2xl text-slate-400 mb-8 leading-relaxed font-medium">
                  Sabemos lo importante que es tu auto para ti. Despídete de la incertidumbre al dejarlo en el taller. Tu historial y el estado de tus reparaciones en la palma de tu mano.
                </p>

                <ul className="space-y-6 mb-10">
                  {[
                    { title: "Seguimiento en Vivo", desc: "Observa en qué etapa está tu vehículo, paso a paso." },
                    { title: "Contratos a un Toque", desc: "Firma y aprueba presupuestos directamente desde tu celular." },
                    { title: "Evidencia Visual", desc: "Recibe fotos del estado de tus piezas. Nada de sorpresas." }
                  ].map((item, i) => (
                    <li key={i} className="flex gap-4 group">
                      <div className="flex-shrink-0 w-8 h-8 rounded-lg bg-cyan-500/10 border border-cyan-500/20 flex items-center justify-center">
                        <CheckCircle2 className="w-5 h-5 text-cyan-400" />
                      </div>
                      <div>
                        <h4 className="text-white font-bold text-lg mb-1">{item.title}</h4>
                        <p className="text-slate-400 leading-relaxed text-sm">{item.desc}</p>
                      </div>
                    </li>
                  ))}
                </ul>

                <Link href="/mi-garage">
                  <button className="px-10 py-5 bg-blue-600 text-white rounded-2xl font-black hover:scale-105 transition-all flex items-center justify-center gap-3 shadow-2xl shadow-blue-600/20 text-lg group uppercase tracking-tight w-full md:w-auto">
                    <Car className="w-6 h-6" />
                    Acceder a mi Garage
                    <ArrowRight className="w-5 h-5 group-hover:translate-x-2 transition-transform" />
                  </button>
                </Link>
              </motion.div>
            </div>
          </div>
          
          {/* TALLER CONTENT */}
          <div 
            className={`transition-all duration-500 transform ${activeTab === 'taller' ? 'opacity-100 translate-y-0 relative z-10' : 'opacity-0 translate-y-8 absolute inset-0 pointer-events-none z-0'}`}
          >
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 lg:gap-24 items-center">
              {/* Content side */}
              <motion.div
                initial={{ opacity: 0, x: -50 }}
                animate={activeTab === 'taller' ? { opacity: 1, x: 0 } : { opacity: 0, x: -50 }}
                transition={{ duration: 0.8, ease: "easeOut" }}
              >
                <div className="inline-flex items-center gap-2 px-4 py-2 rounded-full bg-slate-800 border border-slate-700 text-slate-300 mb-8 shadow-sm">
                  <Building className="h-4 w-4" />
                  <span className="text-sm font-bold tracking-wide">Para Talleres y Flotas</span>
                </div>

                <h2 className="text-4xl md:text-6xl font-extrabold text-white tracking-tight leading-tight mb-8 uppercase">
                  TUS MANOS EN EL MOTOR. <br />
                  <span className="text-transparent bg-clip-text bg-gradient-to-r from-blue-400 to-cyan-400">
                    SU CONFIANZA EN EL CELULAR.
                  </span> <br />
                  CIERRA PRESUPUESTOS EN SEGUNDOS.
                </h2>
                <p className="text-lg md:text-xl text-slate-300 mb-10 leading-relaxed font-medium">
                  En la nueva era digital, la desconfianza detiene tus elevadores y cada minuto de espera es dinero que no vuelve. Rompe el ciclo y <span className="text-cyan-400 font-bold italic text-nowrap">deja que tu taller fluya</span>: entrega evidencias fotográficas inmutables que eliminan las dudas y aceleran las aprobaciones directamente en el WhatsApp del cliente.
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
                className="relative h-[450px] md:h-[600px] w-full rounded-[3rem] bg-slate-900 border border-white/10 shadow-2xl flex items-center justify-center overflow-hidden"
                initial={{ opacity: 0, scale: 0.9 }}
                animate={activeTab === 'taller' ? { opacity: 1, scale: 1 } : { opacity: 0, scale: 0.9 }}
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

