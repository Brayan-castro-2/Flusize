export interface Workshop {
    id: number;
    name: string;
    manager: string;
    location: string;
    basePrice: number; // Precio base revisión
    rating: number;
    reviews: number;
    distance: string;
    image: string;
    coordinates: { lat: number; lng: number };
    services: string[]; // Servicios ofrecidos
    description: string;
    availability: string;
    specialties: string[]; // Especialidades (Frenos, Motor, etc)
    availableSlots: number; // Cupos disponibles hoy
}

export const workshops: Workshop[] = [
    // --- PUERTO VARAS (5) ---
    {
        id: 1,
        name: "Taller Mecánico Costanera PV",
        manager: "Roberto Mendez",
        location: "Costanera, Puerto Varas",
        basePrice: 25000,
        rating: 4.8,
        reviews: 45,
        distance: "12.5 km",
        image: "https://images.unsplash.com/photo-1619642751034-765dfdf7c58e?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.3215, lng: -72.9840 },
        services: ["Mantención Kilometraje", "Frenos", "Cambio de Aceite"],
        specialties: ["BMW", "Mercedes-Benz"],
        description: "Especialistas en vehículos de alta gama. Servicio premium frente al lago.",
        availability: "Lun-Vie 9:00 - 19:00",
        availableSlots: 3
    },
    {
        id: 2,
        name: "Servicio Automotriz Llanquihue",
        manager: "Andrés Soto",
        location: "Centro, Puerto Varas",
        basePrice: 15000,
        rating: 4.7,
        reviews: 38,
        distance: "12.8 km",
        image: "https://images.unsplash.com/photo-1487754180451-c456f719a1fc?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.3195, lng: -72.9855 },
        services: ["Diagnóstico General", "Suspensión", "Alineación"],
        specialties: ["Multimarca", "SUV"],
        description: "Taller integral en el centro de Puerto Varas. Diagnóstico computarizado.",
        availability: "Lun-Sab 8:00 - 20:00",
        availableSlots: 5
    },
    {
        id: 3,
        name: "Dreams Garage Custom",
        manager: "Carlos Ruiz",
        location: "Casino, Puerto Varas",
        basePrice: 35000,
        rating: 4.9,
        reviews: 67,
        distance: "12.6 km",
        image: "https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.3208, lng: -72.9870 },
        services: ["Tuning", "Detailing", "Electrónica"],
        specialties: ["Deportivos", "Modificaciones"],
        description: "Expertos en personalización y detailing automotriz.",
        availability: "Lun-Vie 10:00 - 18:00",
        availableSlots: 2
    },
    {
        id: 4,
        name: "Boch Car Service",
        manager: "Familia Müller",
        location: "Zona Alta, Puerto Varas",
        basePrice: 18000,
        rating: 4.5,
        reviews: 22,
        distance: "13.2 km",
        image: "https://images.unsplash.com/photo-1530046339160-ce3e530c7d2f?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.3150, lng: -72.9900 },
        services: ["Mecánica General", "Electricidad"],
        specialties: ["Volkswagen", "Audi"],
        description: "Servicio técnico autorizado especializado en marcas alemanas.",
        availability: "Lun-Vie 9:00 - 18:00",
        availableSlots: 4
    },
    {
        id: 5,
        name: "Frenos Ensenada",
        manager: "José Perez",
        location: "Ruta Ensenada, Puerto Varas",
        basePrice: 12000,
        rating: 4.2,
        reviews: 18,
        distance: "13.8 km",
        image: "https://images.unsplash.com/photo-1504222490345-c075b31df572?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.3230, lng: -72.9750 },
        services: ["Rectificado", "Pastillas", "Balatas"],
        specialties: ["Frenos", "Tren Delantero"],
        description: "Especialistas en sistemas de frenos para todo tipo de vehículos.",
        availability: "Lun-Sab 9:00 - 19:00",
        availableSlots: 8
    },

    // --- PUERTO MONTT CENTRO (10) ---
    {
        id: 6,
        name: "Centro Automotriz Plaza",
        manager: "Carlos Muñoz",
        location: "Centro, Puerto Montt",
        basePrice: 20000,
        rating: 4.6,
        reviews: 52,
        distance: "0.5 km",
        image: "https://images.unsplash.com/photo-1517524008697-84bbe3c3fd98?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.4717, lng: -72.9365 },
        services: ["Mantención 10k", "Revisión Pre-compra", "Escaner"],
        specialties: ["KIA", "Hyundai"],
        description: "A pasos de la Plaza. Servicio rápido y garantizado.",
        availability: "Lun-Vie 8:30 - 18:30",
        availableSlots: 6
    },
    {
        id: 7,
        name: "Taller Costanera Sur",
        manager: "Pedro Sanchez",
        location: "Costanera, Puerto Montt",
        basePrice: 22000,
        rating: 4.8,
        reviews: 89,
        distance: "0.8 km",
        image: "https://images.unsplash.com/photo-1486262715619-67b85e0b08d3?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.4735, lng: -72.9390 },
        services: ["Cambio Neumáticos", "Balanceo", "Alineación"],
        specialties: ["Neumáticos", "Suspensión"],
        description: "El mejor servicio de neumáticos de la costanera.",
        availability: "Lun-Sab 9:00 - 20:00",
        availableSlots: 10
    },
    {
        id: 8,
        name: "Lubricentro Municipal",
        manager: "Juan Diaz",
        location: "Sector Servicios, Puerto Montt",
        basePrice: 15000,
        rating: 4.3,
        reviews: 34,
        distance: "0.4 km",
        image: "https://images.unsplash.com/photo-1498889444388-e67ea62c464b?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.4700, lng: -72.9410 },
        services: ["Cambio Aceite", "Filtros", "Niveles"],
        specialties: ["Lubricación", "Baterías"],
        description: "Cambio de aceite rápido sin espera.",
        availability: "Lun-Vie 8:00 - 18:00",
        availableSlots: 15
    },
    {
        id: 9,
        name: "Varas Express Mechanic",
        manager: "Luis Torres",
        location: "Calle Varas, Puerto Montt",
        basePrice: 18000,
        rating: 4.0,
        reviews: 27,
        distance: "0.6 km",
        image: "https://images.unsplash.com/photo-1599481790250-4182626095fc?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.4725, lng: -72.9350 },
        services: ["Mecánica Rápida", "Luces", "Frenos"],
        specialties: ["City Cars", "Motos"],
        description: "Soluciones rápidas para problemas cotidianos.",
        availability: "Lun-Vie 9:00 - 19:00",
        availableSlots: 1
    },
    {
        id: 10,
        name: "Diesel Terminal",
        manager: "Jorge Ramírez",
        location: "Terminal, Puerto Montt",
        basePrice: 30000,
        rating: 3.9,
        reviews: 41,
        distance: "1.2 km",
        image: "https://images.unsplash.com/photo-1597762470488-387751f538c6?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.4750, lng: -72.9450 },
        services: ["Inyección Diesel", "Turbo", "Motor"],
        specialties: ["Diesel", "Camionetas"],
        description: "Especialistas en motores diesel y turbos.",
        availability: "Lun-Vie 8:00 - 18:00",
        availableSlots: 2
    },
    {
        id: 11,
        name: "Clínica del Automóvil",
        manager: "Dra. Motores",
        location: "Sector Salud, Puerto Montt",
        basePrice: 28000,
        rating: 4.5,
        reviews: 38,
        distance: "0.7 km",
        image: "https://images.unsplash.com/photo-1552519507-da3b142c6e3d?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.4680, lng: -72.9380 },
        services: ["Diagnóstico Completo", "Scanner Pro", "Electricidad"],
        specialties: ["Híbridos", "Eléctricos"],
        description: "Tecnología de punta para diagnóstico automotriz.",
        availability: "Lun-Vie 9:00 - 18:00",
        availableSlots: 0
    },
    {
        id: 12,
        name: "Taller Urmeneta",
        manager: "Hermanos Urmeneta",
        location: "Urmeneta, Puerto Montt",
        basePrice: 16000,
        rating: 4.2,
        reviews: 29,
        distance: "0.5 km",
        image: "https://images.unsplash.com/photo-1507413245164-6160d8298b31?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.4710, lng: -72.9330 },
        services: ["Latonería", "Pintura", "Desabolladura"],
        specialties: ["Carrocería", "Pintura"],
        description: "Dejamos tu auto como nuevo. Expertos en pintura.",
        availability: "Lun-Vie 8:00 - 18:00",
        availableSlots: 2
    },
    {
        id: 13,
        name: "Mecánica Angelmó",
        manager: "Don Tito",
        location: "Angelmó, Puerto Montt",
        basePrice: 14000,
        rating: 4.7,
        reviews: 76,
        distance: "2.1 km",
        image: "https://images.unsplash.com/photo-1517524285303-d6fc683dddf8?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.4820, lng: -72.9550 },
        services: ["Mecánica General", "Ajuste Motor"],
        specialties: ["Viejos Clásicos", "Restauración"],
        description: "Experiencia y tradición en mecánica.",
        availability: "Lun-Sab 9:00 - 19:00",
        availableSlots: 4
    },
    {
        id: 14,
        name: "Intendencia Service",
        manager: "Gobierno Regional",
        location: "Intendencia, Puerto Montt",
        basePrice: 20000,
        rating: 4.1,
        reviews: 19,
        distance: "0.6 km",
        image: "https://images.unsplash.com/photo-1532581140115-3e355d1ed1de?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.4705, lng: -72.9375 },
        services: ["Revisión Técnica", "Gases"],
        specialties: ["Certificaciones"],
        description: "Preparamos tu auto para la revisión técnica.",
        availability: "Lun-Vie 8:30 - 17:30",
        availableSlots: 6
    },
    {
        id: 15,
        name: "Taller Seminario",
        manager: "Familia González",
        location: "Seminario, Puerto Montt",
        basePrice: 12000,
        rating: 4.8,
        reviews: 31,
        distance: "0.7 km",
        image: "https://images.unsplash.com/photo-1580273916550-e323be2ed5fa?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.4690, lng: -72.9340 },
        services: ["Bicicletas", "Motos", "Mecánica Ligera"],
        specialties: ["Motos", "Bicys"],
        description: "Pequeño taller familiar para reparaciones rápidas.",
        availability: "Lun-Dom 10:00 - 20:00",
        availableSlots: 8
    },

    // --- ALERCE (3) ---
    {
        id: 26,
        name: "Alerce Motors",
        manager: "Pedro Alerce",
        location: "Centro Alerce, Puerto Montt",
        basePrice: 10000,
        rating: 4.4,
        reviews: 37,
        distance: "8.2 km",
        image: "https://images.unsplash.com/photo-1625047902702-8a9d15024225?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.3980, lng: -72.9090 },
        services: ["Mecánica General", "Vulcanización"],
        specialties: ["Taxi", "Colectivos"],
        description: "Atención preferencial a taxis y colectivos.",
        availability: "24/7 (Emergencias)",
        availableSlots: 5
    },
    {
        id: 28,
        name: "Outlet Automotriz",
        manager: "Outlet Alerce",
        location: "Outlet, Alerce",
        basePrice: 5000,
        rating: 3.5,
        reviews: 91,
        distance: "8.0 km",
        image: "https://images.unsplash.com/photo-1494976388531-d1058494cdd8?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.3900, lng: -72.9100 },
        services: ["Repuestos", "Instalación", "Baterías"],
        specialties: ["Repuestos", "Accesorios"],
        description: "Venta e instalación de repuestos y accesorios.",
        availability: "Lun-Dom 9:00 - 21:00",
        availableSlots: 10
    },
    {
        id: 30,
        name: "Satélite Service",
        manager: "Condominio Ciudad Satélite",
        location: "Ciudad Satélite, Alerce",
        basePrice: 15000,
        rating: 4.9,
        reviews: 36,
        distance: "8.8 km",
        image: "https://images.unsplash.com/photo-1542282088-72c9c27ed0cd?auto=format&fit=crop&q=80&w=600",
        coordinates: { lat: -41.4050, lng: -72.9150 },
        services: ["Lavado", "Aspirado", "Pulido"],
        specialties: ["Car Wash", "Detailing"],
        description: "Car wash premium en Alerce.",
        availability: "Lun-Dom 9:00 - 19:00",
        availableSlots: 3
    }
];

export const getRandomCode = () => {
    const letters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    return `${letters.charAt(Math.floor(Math.random() * letters.length))}${letters.charAt(Math.floor(Math.random() * letters.length))}-${numbers.charAt(Math.floor(Math.random() * numbers.length))}${numbers.charAt(Math.floor(Math.random() * numbers.length))}${numbers.charAt(Math.floor(Math.random() * numbers.length))}`;
};
