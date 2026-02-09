// Utility functions for managing client appointments in localStorage

export interface ClientAppointment {
    id: number;
    workshopId: number;
    workshopName: string;
    workshopLocation: string;
    workshopImage: string;
    serviceType: string;
    date: string;
    time: string;
    status: 'pending' | 'confirmed' | 'completed' | 'cancelled';
    estimatedPrice: number;
    clientNotes?: string;
    createdAt: string;
}

const STORAGE_KEY = 'flusize_client_appointments';

// Get all appointments
export const getAppointments = (): ClientAppointment[] => {
    if (typeof window === 'undefined') return [];

    try {
        const stored = localStorage.getItem(STORAGE_KEY);
        return stored ? JSON.parse(stored) : [];
    } catch (error) {
        console.error('Error reading appointments:', error);
        return [];
    }
};

// Add new appointment
export const addAppointment = (appointment: Omit<ClientAppointment, 'id' | 'createdAt' | 'status'>): ClientAppointment => {
    const appointments = getAppointments();

    const newAppointment: ClientAppointment = {
        ...appointment,
        id: Date.now(),
        status: 'pending',
        createdAt: new Date().toISOString(),
    };

    appointments.push(newAppointment);
    localStorage.setItem(STORAGE_KEY, JSON.stringify(appointments));

    return newAppointment;
};

// Update appointment status
export const updateAppointmentStatus = (id: number, status: ClientAppointment['status']): void => {
    const appointments = getAppointments();
    const updated = appointments.map(apt =>
        apt.id === id ? { ...apt, status } : apt
    );
    localStorage.setItem(STORAGE_KEY, JSON.stringify(updated));
};

// Cancel appointment
export const cancelAppointment = (id: number): void => {
    updateAppointmentStatus(id, 'cancelled');
};

// Delete appointment
export const deleteAppointment = (id: number): void => {
    const appointments = getAppointments();
    const filtered = appointments.filter(apt => apt.id !== id);
    localStorage.setItem(STORAGE_KEY, JSON.stringify(filtered));
};

// Get appointments by status
export const getAppointmentsByStatus = (status: ClientAppointment['status']): ClientAppointment[] => {
    return getAppointments().filter(apt => apt.status === status);
};

// Get pending appointments count
export const getPendingCount = (): number => {
    return getAppointmentsByStatus('pending').length;
};
