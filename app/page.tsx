'use client';
// @ts-nocheck
import React, { useState, useEffect } from 'react';
import {
  MapPin,
  Search,
  Car,
  Wrench,
  MessageCircle,
  Star,
  CheckCircle,
  Clock,
  AlertCircle,
  Menu,
  X,
  Phone,
  ArrowRight,
  ShieldCheck,
  ChevronLeft,
  ChevronRight,
  Tag,
  Zap
} from 'lucide-react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import MapWrapper from '@/components/drivers/MapWrapper';


// --- DATOS MOCK ---

const regionsOfChile = [
  { id: 1, name: "Arica y Parinacota", communes: ["Arica", "Putre"] },
  { id: 2, name: "Tarapacá", communes: ["Iquique", "Alto Hospicio"] },
  { id: 5, name: "Valparaíso", communes: ["Valparaíso", "Viña del Mar", "Quilpué"] },
  { id: 13, name: "Metropolitana", communes: ["Santiago", "Providencia", "Las Condes", "Maipú", "Puente Alto"] },
  { id: 8, name: "Biobío", communes: ["Concepción", "Talcahuano", "Los Ángeles"] },
];

const mockWorkshops = [
  { id: 1, name: "Mecánica FullExpress", type: "Taller", region: "Metropolitana", commune: "Santiago", rating: 4.8, lat: 40, lng: 30, image: "https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?auto=format&fit=crop&q=80&w=400" },
  { id: 2, name: "Vulcanización El Rápido", type: "Vulcanización", region: "Metropolitana", commune: "Maipú", rating: 4.5, lat: 60, lng: 70, image: "https://images.unsplash.com/photo-1578844251758-2f71da645217?auto=format&fit=crop&q=80&w=400" },
  { id: 3, name: "Repuestos del Sur", type: "Repuestos", region: "Biobío", commune: "Concepción", rating: 4.9, lat: 20, lng: 50, image: "https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?auto=format&fit=crop&q=80&w=400" },
  { id: 4, name: "Frenos Santiago", type: "Taller", region: "Metropolitana", commune: "Providencia", rating: 4.7, lat: 45, lng: 40, image: "https://images.unsplash.com/photo-1487754180451-c456f719a1fc?auto=format&fit=crop&q=80&w=400" },
];

const mockPromotions = [
  { id: 1, title: "20% DSCTO Cambio de Aceite", shop: "Mecánica FullExpress", image: "https://images.unsplash.com/photo-1487754180451-c456f719a1fc?auto=format&fit=crop&q=80&w=800", expiry: "Solo por hoy" },
  { id: 2, title: "Revisión de Frenos GRATIS", shop: "Frenos Santiago", image: "https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&q=80&w=800", expiry: "Hasta agotar cupos" },
  { id: 3, title: "3x2 en Neumáticos", shop: "Vulcanización El Rápido", image: "https://images.unsplash.com/photo-1578844251758-2f71da645217?auto=format&fit=crop&q=80&w=800", expiry: "Todo el mes" },
];

const mockTrackingData = {
  "AB-1234": {
    found: true,
    plate: "AB-12-34",
    model: "Toyota Yaris 2018",
    status: "En Reparación",
    progress: 60, // porcentaje
    estimatedTime: "2 días",
    costs: {
      labor: 85000,
      parts: 120000,
      total: 205000
    },
    partsList: [
      { name: "Pastillas de freno", price: 45000 },
      { name: "Disco de freno", price: 75000 }
    ],
    mechanicNotes: "Discos rectificados. Instalando pastillas nuevas."
  }
};

const mockReviews = [
  { id: 1, user: "Juan Pérez", comment: "Excelente servicio, pude ver el costo antes de ir a buscar el auto.", rating: 5, date: "Hace 2 días" },
  { id: 2, user: "María González", comment: "Muy útil para encontrar vulcanizaciones abiertas un domingo.", rating: 4, date: "Hace 1 semana" },
  { id: 3, user: "Carlos Tapia", comment: "La app me avisó justo cuando mi auto estaba listo. Recomendado.", rating: 5, date: "Ayer" },
];

// --- COMPONENTES ---

const Logo = () => (
  <div className="flex items-center gap-2">
    {/* Logo simplificado basado en la imagen: Forma de F estilizada con degradado */}
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

const Navbar = ({ activeSection, setActiveSection }) => {
  const [isOpen, setIsOpen] = useState(false);
  const router = useRouter();

  return (
    <nav className="bg-slate-900 border-b border-slate-800 text-white fixed w-full z-50 shadow-lg backdrop-blur-sm bg-slate-900/95">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between h-20">
          <div className="cursor-pointer hover:opacity-90 transition-opacity" onClick={() => window.scrollTo(0, 0)}>
            <Logo />
          </div>

          <div className="hidden md:block">
            <div className="ml-10 flex items-baseline space-x-8">
              {['Inicio', 'Promociones', 'Buscar Taller', 'Mi Auto', 'Reseñas'].map((item) => (
                <button
                  key={item}
                  onClick={() => {
                    setActiveSection(item);
                    const element = document.getElementById(item.toLowerCase().replace(' ', '-'));
                    if (element) element.scrollIntoView({ behavior: 'smooth' });
                  }}
                  className="hover:text-cyan-400 transition-colors px-3 py-2 rounded-md text-sm font-medium tracking-wide"
                >
                  {item}
                </button>
              ))}
              <Link href="/login">
                <button className="bg-gradient-to-r from-cyan-500 to-blue-600 hover:from-cyan-400 hover:to-blue-500 px-5 py-2.5 rounded-full font-bold text-sm shadow-lg shadow-cyan-500/20 transition-all transform hover:scale-105">
                  Soy Taller
                </button>
              </Link>
              <Link href="/conductores/mapa">
                <button className="bg-white/10 hover:bg-white/20 border border-white/20 px-5 py-2.5 rounded-full font-bold text-sm transition-all transform hover:scale-105">
                  Soy Cliente
                </button>
              </Link>
            </div>
          </div>

          <div className="-mr-2 flex md:hidden">
            <button onClick={() => setIsOpen(!isOpen)} className="p-2 rounded-md text-gray-400 hover:text-white hover:bg-slate-800">
              {isOpen ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
            </button>
          </div>
        </div>
      </div>

      {isOpen && (
        <div className="md:hidden bg-slate-900 border-t border-slate-800">
          <div className="px-2 pt-2 pb-3 space-y-1 sm:px-3">
            {['Inicio', 'Promociones', 'Buscar Taller', 'Mi Auto', 'Reseñas'].map((item) => (
              <button
                key={item}
                onClick={() => {
                  setIsOpen(false);
                  const element = document.getElementById(item.toLowerCase().replace(' ', '-'));
                  if (element) element.scrollIntoView({ behavior: 'smooth' });
                }}
                className="text-gray-300 hover:text-cyan-400 block px-3 py-2 rounded-md text-base font-medium w-full text-left"
              >
                {item}
              </button>
            ))}
            <div className="flex flex-col gap-2 mt-4 p-2">
              <Link href="/login" className="block w-full">
                <button className="w-full bg-gradient-to-r from-cyan-500 to-blue-600 hover:from-cyan-400 hover:to-blue-500 px-5 py-2.5 rounded-full font-bold text-sm shadow-lg shadow-cyan-500/20 transition-all">
                  Soy Taller
                </button>
              </Link>
              <Link href="/conductores/mapa" className="block w-full">
                <button className="w-full bg-slate-800 hover:bg-slate-700 border border-slate-700 px-5 py-2.5 rounded-full font-bold text-sm text-white transition-all">
                  Soy Cliente
                </button>
              </Link>
            </div>
          </div>
        </div>
      )}
    </nav>
  );
};

const Hero = () => (
  <div id="inicio" className="relative bg-slate-900 pt-32 pb-20 md:pt-40 md:pb-32 overflow-hidden">
    {/* Fondo abstracto con gradientes Cyan/Azul */}
    <div className="absolute inset-0">
      <div className="absolute inset-0 bg-[url('https://images.unsplash.com/photo-1486006920555-c77dcf18193c?auto=format&fit=crop&q=80&w=2000')] bg-cover bg-center opacity-10 mix-blend-overlay"></div>
      <div className="absolute top-0 right-0 w-2/3 h-full bg-gradient-to-l from-cyan-900/20 to-transparent"></div>
      <div className="absolute bottom-0 left-0 w-1/2 h-2/3 bg-gradient-to-t from-slate-900 via-slate-900 to-transparent"></div>
    </div>

    <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 flex flex-col md:flex-row items-center z-10">
      <div className="md:w-1/2 mb-12 md:mb-0">
        <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-cyan-500/10 text-cyan-400 border border-cyan-500/20 mb-6 backdrop-blur-sm">
          <Zap className="h-4 w-4" />
          <span className="text-sm font-semibold">Plataforma líder en gestión automotriz</span>
        </div>
        <h1 className="text-4xl md:text-6xl font-extrabold text-white tracking-tight mb-6 leading-tight">
          Impulsa tu taller,<br />
          <span className="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-blue-500">conecta con el futuro.</span>
        </h1>
        <p className="text-lg text-slate-400 mb-8 max-w-lg leading-relaxed">
          Flusize ofrece orden y control para talleres que quieren crecer. Encuentra servicios, gestiona reparaciones y vende repuestos en un solo lugar.
        </p>
        <div className="flex flex-col sm:flex-row gap-4">
          <button onClick={() => document.getElementById('buscar-taller').scrollIntoView({ behavior: 'smooth' })} className="px-8 py-4 bg-gradient-to-r from-cyan-500 to-blue-600 hover:from-cyan-400 hover:to-blue-500 text-white rounded-xl font-bold transition-all shadow-lg shadow-cyan-500/25 flex items-center justify-center gap-2 transform hover:-translate-y-1">
            <Search className="h-5 w-5" /> Buscar Servicio
          </button>
          <button onClick={() => document.getElementById('mi-auto').scrollIntoView({ behavior: 'smooth' })} className="px-8 py-4 bg-slate-800 hover:bg-slate-700 text-white rounded-xl font-bold transition-all border border-slate-700 flex items-center justify-center gap-2">
            <Car className="h-5 w-5 text-cyan-400" /> Estado de mi Auto
          </button>
        </div>
      </div>

      {/* Visual Abstracto del Dashboard con Branding Nuevo */}
      <div className="md:w-1/2 w-full pl-0 md:pl-10 relative">
        <div className="absolute -top-10 -right-10 w-64 h-64 bg-cyan-500/20 rounded-full blur-3xl animate-pulse"></div>
        <div className="bg-slate-800/80 backdrop-blur-md rounded-2xl p-6 border border-slate-700 shadow-2xl transform rotate-1 hover:rotate-0 transition-all duration-500 relative z-10">
          <div className="flex items-center justify-between mb-6">
            <div className="flex items-center gap-3">
              <div className="h-12 w-12 bg-gradient-to-br from-cyan-400 to-blue-600 rounded-xl flex items-center justify-center shadow-lg">
                <CheckCircle className="text-white h-7 w-7" />
              </div>
              <div>
                <p className="text-white font-bold text-lg">Vehículo Listo</p>
                <p className="text-cyan-400 text-sm font-medium">Patente: JS-99-22</p>
              </div>
            </div>
            <div className="text-right">
              <p className="text-xs text-slate-400">Total a pagar</p>
              <span className="text-white font-bold text-xl">$180.000</span>
            </div>
          </div>
          <div className="space-y-4">
            <div className="relative pt-1">
              <div className="flex mb-2 items-center justify-between text-xs font-semibold text-slate-300">
                <span>Progreso</span>
                <span className="text-cyan-400">100%</span>
              </div>
              <div className="flex h-2 mb-4 overflow-hidden bg-slate-700 rounded-full">
                <div className="w-full bg-gradient-to-r from-cyan-400 to-blue-500"></div>
              </div>
            </div>
            <div className="flex justify-between text-xs text-slate-400 border-t border-slate-700 pt-3">
              <span className="flex items-center gap-1"><Clock className="w-3 h-3" /> Entregado hace 5min</span>
              <span className="text-cyan-400 font-bold cursor-pointer hover:underline">Ver detalle</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
);

const PromotionsCarousel = () => {
  const [currentSlide, setCurrentSlide] = useState(0);

  useEffect(() => {
    const timer = setInterval(() => {
      setCurrentSlide((prev) => (prev + 1) % mockPromotions.length);
    }, 5000);
    return () => clearInterval(timer);
  }, []);

  const nextSlide = () => setCurrentSlide((prev) => (prev + 1) % mockPromotions.length);
  const prevSlide = () => setCurrentSlide((prev) => (prev === 0 ? mockPromotions.length - 1 : prev - 1));

  return (
    <div id="promociones" className="bg-slate-50 py-16">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex items-center justify-between mb-8">
          <div>
            <h2 className="text-3xl font-bold text-slate-900 flex items-center gap-2">
              <Tag className="text-cyan-500" /> Promociones Destacadas
            </h2>
            <p className="text-gray-500 mt-2">Aprovecha ofertas exclusivas de nuestros talleres afiliados.</p>
          </div>
          <div className="flex gap-2">
            <button onClick={prevSlide} className="p-2 rounded-full bg-white border border-gray-200 hover:bg-cyan-50 text-slate-600 transition-colors">
              <ChevronLeft className="h-5 w-5" />
            </button>
            <button onClick={nextSlide} className="p-2 rounded-full bg-white border border-gray-200 hover:bg-cyan-50 text-slate-600 transition-colors">
              <ChevronRight className="h-5 w-5" />
            </button>
          </div>
        </div>

        <div className="relative overflow-hidden rounded-2xl shadow-xl h-[300px] md:h-[400px]">
          {mockPromotions.map((promo, index) => (
            <div
              key={promo.id}
              className={`absolute inset-0 transition-opacity duration-700 ease-in-out ${index === currentSlide ? 'opacity-100' : 'opacity-0'}`}
            >
              <div className="absolute inset-0 bg-gradient-to-r from-slate-900/90 via-slate-900/40 to-transparent z-10"></div>
              <img src={promo.image} alt={promo.title} className="w-full h-full object-cover" />

              <div className="absolute top-0 left-0 h-full flex flex-col justify-center p-8 md:p-16 z-20 max-w-2xl">
                <span className="inline-block px-3 py-1 bg-cyan-500 text-white text-xs font-bold rounded-full mb-4 w-fit uppercase tracking-wider">
                  {promo.expiry}
                </span>
                <h3 className="text-3xl md:text-5xl font-bold text-white mb-4 leading-tight">
                  {promo.title}
                </h3>
                <p className="text-xl text-cyan-300 font-medium mb-8 flex items-center gap-2">
                  <MapPin className="h-5 w-5" /> {promo.shop}
                </p>
                <button className="px-8 py-3 bg-white text-slate-900 font-bold rounded-lg hover:bg-cyan-50 transition-colors w-fit shadow-lg">
                  Canjear Oferta
                </button>
              </div>
            </div>
          ))}

          <div className="absolute bottom-6 left-0 right-0 flex justify-center gap-2 z-30">
            {mockPromotions.map((_, idx) => (
              <button
                key={idx}
                onClick={() => setCurrentSlide(idx)}
                className={`w-2 h-2 rounded-full transition-all ${idx === currentSlide ? 'bg-cyan-400 w-8' : 'bg-white/50 hover:bg-white'}`}
              />
            ))}
          </div>
        </div>
      </div>
    </div>
  );
};

const ServiceLocator = () => {
  const [selectedRegion, setSelectedRegion] = useState("");
  const [viewMode, setViewMode] = useState("list"); // 'list' or 'map'
  const [activePin, setActivePin] = useState(null);

  const regionData = regionsOfChile.find(r => r.name === selectedRegion);

  return (
    <div id="buscar-taller" className="py-20 bg-white">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-12">
          <h2 className="text-3xl font-bold text-slate-900">Encuentra tu servicio ideal</h2>
          <p className="mt-4 text-gray-600">Geolocalización en tiempo real de talleres y repuestos Flusize.</p>
        </div>

        <div className="flex flex-col md:flex-row gap-6 mb-8">
          <div className="bg-slate-50 rounded-2xl shadow-sm border border-slate-100 p-6 flex-1">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <label className="text-xs font-bold text-slate-500 uppercase mb-1 block">Región</label>
                <select
                  className="w-full p-3 bg-white border border-gray-200 rounded-lg outline-none focus:ring-2 focus:ring-cyan-500 transition-all"
                  onChange={(e) => setSelectedRegion(e.target.value)}
                  value={selectedRegion}
                >
                  <option value="">Todas las regiones</option>
                  {regionsOfChile.map(r => <option key={r.id} value={r.name}>{r.name}</option>)}
                </select>
              </div>
              <div>
                <label className="text-xs font-bold text-slate-500 uppercase mb-1 block">Comuna</label>
                <select
                  className="w-full p-3 bg-white border border-gray-200 rounded-lg outline-none focus:ring-2 focus:ring-cyan-500 transition-all"
                  disabled={!selectedRegion}
                >
                  <option value="">Selecciona Comuna</option>
                  {regionData?.communes.map(c => <option key={c} value={c}>{c}</option>)}
                </select>
              </div>
            </div>
          </div>

          <div className="flex items-center bg-slate-50 p-2 rounded-xl border border-slate-100">
            <button
              onClick={() => setViewMode("list")}
              className={`flex-1 flex items-center gap-2 px-6 py-3 rounded-lg font-bold transition-all ${viewMode === 'list' ? 'bg-white text-cyan-600 shadow-md' : 'text-gray-500 hover:text-gray-700'}`}
            >
              <Menu className="h-4 w-4" /> Lista
            </button>
            <button
              onClick={() => setViewMode("map")}
              className={`flex-1 flex items-center gap-2 px-6 py-3 rounded-lg font-bold transition-all ${viewMode === 'map' ? 'bg-white text-cyan-600 shadow-md' : 'text-gray-500 hover:text-gray-700'}`}
            >
              <MapPin className="h-4 w-4" /> Mapa
            </button>
          </div>
        </div>

        {viewMode === "list" ? (
          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {mockWorkshops.map((workshop) => (
              <div key={workshop.id} className="bg-white rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 border border-slate-100 group overflow-hidden">
                <div className="h-48 overflow-hidden relative">
                  <img src={workshop.image} alt={workshop.name} className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
                  <div className="absolute top-4 right-4 bg-white/95 backdrop-blur px-3 py-1 rounded-full text-sm font-bold text-slate-900 flex items-center gap-1 shadow-sm">
                    <Star className="h-4 w-4 text-yellow-400 fill-yellow-400" /> {workshop.rating}
                  </div>
                  <div className="absolute bottom-4 left-4 bg-cyan-600 px-3 py-1 rounded-full text-xs font-bold text-white shadow-md">
                    {workshop.type}
                  </div>
                </div>
                <div className="p-6">
                  <h3 className="text-xl font-bold text-slate-900 mb-1">{workshop.name}</h3>
                  <p className="text-gray-500 text-sm mb-4 flex items-center gap-1">
                    <MapPin className="h-4 w-4 text-cyan-500" /> {workshop.commune}, {workshop.region}
                  </p>
                  <button className="w-full py-2 bg-slate-50 hover:bg-slate-100 text-cyan-700 font-bold rounded-lg transition-colors border border-slate-200">
                    Ver Detalles
                  </button>
                </div>
              </div>
            ))}
          </div>
        ) : (
          <div className="relative w-full h-[500px] rounded-2xl overflow-hidden shadow-2xl border border-slate-200">
            {/* Real Map Component */}
            <MapWrapper />

            {/* Overlay with CTA */}
            <div className="absolute bottom-6 right-6 bg-white/95 backdrop-blur p-4 rounded-xl shadow-lg max-w-xs z-10">
              <p className="text-sm font-semibold text-slate-900 mb-2">¿Te gusta lo que ves?</p>
              <Link href="/conductores/mapa">
                <button className="w-full py-2 bg-gradient-to-r from-cyan-500 to-blue-600 hover:from-cyan-400 hover:to-blue-500 text-white font-bold rounded-lg transition-all shadow-lg">
                  Ver Mapa Completo
                </button>
              </Link>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

const VehicleTracker = () => {
  const [searchPlate, setSearchPlate] = useState("");
  const [result, setResult] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");

  const handleSearch = (e) => {
    e.preventDefault();
    setLoading(true);
    setError("");
    setResult(null);

    setTimeout(() => {
      setLoading(false);
      if (mockTrackingData[searchPlate] || searchPlate === "AB-1234") {
        setResult(mockTrackingData["AB-1234"]);
      } else {
        setError("No se encontró una orden activa con esa patente.");
      }
    }, 1500);
  };

  return (
    <div id="mi-auto" className="py-24 bg-gradient-to-b from-slate-900 to-slate-800 text-white relative overflow-hidden">
      {/* Elementos decorativos de fondo */}
      <div className="absolute top-0 right-0 w-96 h-96 bg-cyan-500/10 rounded-full blur-[100px]"></div>
      <div className="absolute bottom-0 left-0 w-96 h-96 bg-blue-600/10 rounded-full blur-[100px]"></div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-16 items-center">
          <div>
            <div className="inline-block px-4 py-1 rounded-full bg-cyan-500/10 text-cyan-400 font-bold text-sm mb-4 border border-cyan-500/20">
              Seguimiento 24/7
            </div>
            <h2 className="text-3xl md:text-5xl font-bold mb-6">
              Transparencia total <br /> <span className="text-cyan-400">en tiempo real.</span>
            </h2>
            <p className="text-slate-300 text-lg mb-8 leading-relaxed">
              Monitorea el progreso de tu vehículo, revisa los repuestos instalados y aprueba presupuestos directamente desde tu celular. Sin llamadas, sin esperas.
            </p>

            <form onSubmit={handleSearch} className="bg-white/5 backdrop-blur-sm p-6 rounded-2xl border border-white/10 shadow-xl">
              <label className="block text-sm font-medium text-cyan-100 mb-2">Ingresa tu Patente o N° de Orden</label>
              <div className="flex gap-4">
                <input
                  type="text"
                  placeholder="Ej: AB-1234"
                  className="flex-1 bg-slate-800/50 border border-slate-600 rounded-lg px-4 py-3 focus:ring-2 focus:ring-cyan-500 outline-none text-white placeholder-slate-500 uppercase tracking-widest"
                  value={searchPlate}
                  onChange={(e) => setSearchPlate(e.target.value.toUpperCase())}
                />
                <button type="submit" className="bg-cyan-500 hover:bg-cyan-600 text-white px-6 py-3 rounded-lg font-bold transition-all flex items-center justify-center shadow-lg shadow-cyan-500/20">
                  {loading ? <div className="animate-spin h-5 w-5 border-2 border-white border-t-transparent rounded-full"></div> : <ArrowRight />}
                </button>
              </div>
              {error && <p className="mt-3 text-red-400 text-sm flex items-center gap-2"><AlertCircle className="h-4 w-4" /> {error}</p>}
              {!result && !loading && !error && <p className="mt-3 text-slate-500 text-xs flex items-center gap-1"><ShieldCheck className="h-3 w-3" /> Datos encriptados. Prueba: AB-1234</p>}
            </form>
          </div>

          <div className="relative">
            {result ? (
              <div className="bg-white rounded-2xl p-6 md:p-8 text-slate-900 shadow-2xl animate-fade-in border-t-4 border-cyan-500">
                <div className="flex justify-between items-start mb-6 border-b border-gray-100 pb-4">
                  <div>
                    <h3 className="text-2xl font-bold text-slate-800">{result.model}</h3>
                    <p className="text-gray-500 font-mono tracking-wider bg-gray-100 px-2 rounded w-fit">{result.plate}</p>
                  </div>
                  <div className="bg-cyan-100 text-cyan-800 px-4 py-1 rounded-full text-sm font-bold border border-cyan-200">
                    {result.status}
                  </div>
                </div>

                <div className="mb-8 bg-slate-50 p-4 rounded-xl">
                  <div className="flex justify-between text-sm font-semibold text-slate-600 mb-2">
                    <span>Progreso de reparación</span>
                    <span className="text-cyan-600">{result.progress}%</span>
                  </div>
                  <div className="w-full bg-gray-200 rounded-full h-3 overflow-hidden shadow-inner">
                    <div className="bg-gradient-to-r from-cyan-400 to-blue-600 h-full rounded-full transition-all duration-1000 relative" style={{ width: `${result.progress}%` }}>
                      <div className="absolute top-0 right-0 bottom-0 w-full animate-pulse bg-white/20"></div>
                    </div>
                  </div>
                  <p className="text-xs text-gray-500 mt-3 flex items-center gap-1">
                    <Clock className="h-3 w-3 text-cyan-500" /> Entrega estimada: <span className="font-bold">{result.estimatedTime}</span>
                  </p>
                </div>

                <div className="space-y-4">
                  <h4 className="font-bold text-slate-700 flex items-center gap-2">
                    <Tag className="h-4 w-4 text-cyan-500" /> Detalle de Costos
                  </h4>
                  <div className="space-y-2">
                    {result.partsList.map((part, idx) => (
                      <div key={idx} className="flex justify-between text-sm text-gray-600 border-b border-dashed border-gray-200 pb-1">
                        <span>{part.name}</span>
                        <span>${part.price.toLocaleString('es-CL')}</span>
                      </div>
                    ))}
                    <div className="flex justify-between text-sm text-gray-600 pt-1">
                      <span>Mano de Obra</span>
                      <span>${result.costs.labor.toLocaleString('es-CL')}</span>
                    </div>
                    <div className="bg-slate-900 text-white p-3 rounded-lg mt-3 flex justify-between font-bold text-lg shadow-lg">
                      <span>Total</span>
                      <span>${result.costs.total.toLocaleString('es-CL')}</span>
                    </div>
                  </div>
                </div>
              </div>
            ) : (
              <div className="bg-white/5 backdrop-blur-sm rounded-2xl p-8 border border-white/10 flex flex-col items-center justify-center text-center h-full min-h-[400px]">
                <div className="bg-cyan-500/10 p-6 rounded-full mb-6">
                  <Car className="h-16 w-16 text-cyan-400" />
                </div>
                <h3 className="text-xl font-bold text-white">Visualiza tu estado</h3>
                <p className="text-slate-400 mt-2 max-w-xs">Ingresa tu patente para ver el detalle privado y en tiempo real de tu reparación en talleres Flusize.</p>
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
};

const CommunityReviews = () => {
  const [showModal, setShowModal] = useState(false);

  return (
    <div id="reseñas" className="py-20 bg-slate-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="text-center mb-16">
          <h2 className="text-3xl font-bold text-slate-900">Experiencias Reales</h2>
          <p className="mt-4 text-gray-600 max-w-2xl mx-auto">
            La comunidad Flusize crece cada día. Conoce las opiniones de quienes ya disfrutan de un servicio transparente.
          </p>
        </div>

        <div className="grid grid-cols-1 md:grid-cols-3 gap-8 mb-12">
          {mockReviews.map((review) => (
            <div key={review.id} className="bg-white rounded-2xl p-8 relative shadow-sm hover:shadow-md transition-shadow">
              <div className="flex items-center gap-1 mb-4">
                {[...Array(5)].map((_, i) => (
                  <Star
                    key={i}
                    className={`h-4 w-4 ${i < review.rating ? "text-cyan-400 fill-cyan-400" : "text-gray-200"}`}
                  />
                ))}
              </div>
              <p className="text-slate-600 italic mb-6 text-sm leading-relaxed">"{review.comment}"</p>
              <div className="flex items-center gap-3 pt-4 border-t border-gray-50">
                <div className="h-10 w-10 bg-gradient-to-br from-cyan-100 to-blue-100 rounded-full flex items-center justify-center font-bold text-cyan-700">
                  {review.user.charAt(0)}
                </div>
                <div>
                  <p className="font-bold text-slate-900 text-sm">{review.user}</p>
                  <p className="text-xs text-gray-400">{review.date}</p>
                </div>
              </div>
            </div>
          ))}
        </div>

        <div className="text-center">
          <button
            onClick={() => setShowModal(true)}
            className="inline-flex items-center gap-2 px-8 py-3 bg-white border border-slate-200 text-slate-700 rounded-xl font-bold hover:border-cyan-500 hover:text-cyan-600 transition-all shadow-sm"
          >
            <MessageCircle className="h-5 w-5" /> Compartir mi experiencia
          </button>
        </div>
      </div>

      {showModal && (
        <div className="fixed inset-0 bg-slate-900/80 backdrop-blur-sm z-50 flex items-center justify-center p-4">
          <div className="bg-white rounded-2xl p-8 max-w-md w-full relative animate-fade-in shadow-2xl">
            <button onClick={() => setShowModal(false)} className="absolute top-4 right-4 text-gray-400 hover:text-gray-600">
              <X className="h-6 w-6" />
            </button>
            <h3 className="text-2xl font-bold mb-4 text-slate-800">Tu opinión importa</h3>
            <form className="space-y-4">
              <div className="space-y-1">
                <label className="text-xs font-bold text-gray-500 uppercase">Nombre</label>
                <input type="text" className="w-full p-3 border border-gray-200 rounded-lg bg-gray-50 focus:ring-2 focus:ring-cyan-500 outline-none transition-all" />
              </div>
              <div className="space-y-1">
                <label className="text-xs font-bold text-gray-500 uppercase">Comentario</label>
                <textarea className="w-full p-3 border border-gray-200 rounded-lg bg-gray-50 h-32 focus:ring-2 focus:ring-cyan-500 outline-none transition-all"></textarea>
              </div>
              <button type="button" onClick={() => setShowModal(false)} className="w-full py-3 bg-gradient-to-r from-cyan-500 to-blue-600 text-white font-bold rounded-lg hover:shadow-lg transition-all">
                Publicar Reseña
              </button>
            </form>
          </div>
        </div>
      )}
    </div>
  );
};

const Footer = () => (
  <footer className="bg-slate-900 text-slate-300 py-16 border-t border-slate-800">
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 grid grid-cols-1 md:grid-cols-4 gap-12">
      <div className="col-span-1 md:col-span-2 space-y-4">
        <Logo />
        <p className="max-w-sm text-sm text-slate-400 leading-relaxed">
          Orden y control para talleres que quieren crecer. Conectamos conductores con servicios de calidad, garantizando transparencia, rapidez y confianza en cada reparación.
        </p>
      </div>

      <div>
        <h4 className="font-bold text-white mb-6">Plataforma</h4>
        <ul className="space-y-3 text-sm">
          <li><a href="#" className="hover:text-cyan-400 transition-colors">Buscar Taller</a></li>
          <li><a href="#" className="hover:text-cyan-400 transition-colors">Venta de Repuestos</a></li>
          <li><a href="#" className="hover:text-cyan-400 transition-colors">Promociones</a></li>
          <li><a href="#" className="hover:text-cyan-400 transition-colors">Seguimiento de Orden</a></li>
        </ul>
      </div>

      <div>
        <h4 className="font-bold text-white mb-6">Contacto</h4>
        <ul className="space-y-3 text-sm">
          <li className="flex items-center gap-2 group cursor-pointer hover:text-white">
            <div className="bg-slate-800 p-2 rounded-lg group-hover:bg-cyan-500 transition-colors"><MapPin className="h-4 w-4" /></div>
            Santiago, Chile
          </li>
          <li className="flex items-center gap-2 group cursor-pointer hover:text-white">
            <div className="bg-slate-800 p-2 rounded-lg group-hover:bg-cyan-500 transition-colors"><Phone className="h-4 w-4" /></div>
            +56 9 1234 5678
          </li>
          <li className="flex items-center gap-2 group cursor-pointer hover:text-white">
            <div className="bg-slate-800 p-2 rounded-lg group-hover:bg-cyan-500 transition-colors"><MessageCircle className="h-4 w-4" /></div>
            contacto@flusize.cl
          </li>
        </ul>
      </div>
    </div>
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mt-16 pt-8 border-t border-slate-800 flex flex-col md:flex-row justify-between items-center text-xs text-slate-600">
      <p>© 2024 Flusize App. Todos los derechos reservados.</p>
      <div className="flex gap-4 mt-4 md:mt-0">
        <a href="#" className="hover:text-cyan-400">Términos y Condiciones</a>
        <a href="#" className="hover:text-cyan-400">Privacidad</a>
      </div>
    </div>
  </footer>
);

const WhatsAppButton = () => (
  <a
    href="https://wa.me/56912345678"
    target="_blank"
    rel="noopener noreferrer"
    className="fixed bottom-6 right-6 bg-green-500 text-white p-4 rounded-full shadow-lg hover:bg-green-600 hover:scale-110 transition-all z-50 flex items-center justify-center group"
    title="Contactar por WhatsApp"
  >
    <div className="absolute inset-0 rounded-full border-2 border-white/20 animate-ping opacity-20 group-hover:opacity-40"></div>
    <svg
      xmlns="http://www.w3.org/2000/svg"
      width="32"
      height="32"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="2"
      strokeLinecap="round"
      strokeLinejoin="round"
    >
      <path d="M3 21l1.65-3.8a9 9 0 1 1 3.4 2.9L3 21" />
    </svg>
  </a>
);

export default function App() {
  const [activeSection, setActiveSection] = useState('Inicio');

  return (
    <div className="min-h-screen bg-slate-50 font-sans text-slate-900 selection:bg-cyan-200 selection:text-cyan-900">
      <Navbar activeSection={activeSection} setActiveSection={setActiveSection} />
      <Hero />
      <PromotionsCarousel />
      <ServiceLocator />
      <VehicleTracker />
      <CommunityReviews />
      <Footer />
      <WhatsAppButton />
    </div>
  );
}
