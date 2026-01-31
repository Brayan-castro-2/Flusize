import html2canvas from 'html2canvas';
import { jsPDF } from 'jspdf';
import { OrdenDB, VehiculoDB } from './storage-adapter';

interface PDFOptions {
    order: OrdenDB;
    vehicle?: VehiculoDB | null;
    checklist?: any;
    companyInfo?: {
        name: string;
        address?: string;
        phone?: string;
        logoUrl?: string;
    };
}

export const generateOrderPDF = async ({ order, vehicle, checklist, companyInfo }: PDFOptions) => {
    try {
        // Create a hidden container for the PDF content
        const container = document.createElement('div');
        container.style.position = 'absolute';
        container.style.left = '-9999px';
        container.style.top = '0';
        container.style.width = '210mm'; // A4 width
        container.style.minHeight = '297mm'; // A4 height
        container.style.padding = '20mm';
        container.style.backgroundColor = '#ffffff';
        container.style.color = '#1f2937'; // slate-800
        container.style.fontFamily = 'Arial, sans-serif';
        container.style.boxSizing = 'border-box';

        // Helper for currency
        const money = (n: number) => `$${(n || 0).toLocaleString('es-CL')}`;

        // Helper for dates
        const date = (d: string) => new Date(d).toLocaleString('es-CL');

        // Clean Description Helper
        const cleanDesc = (d: string) => d?.replace(/^Motor:.*?( - |$)/i, '').trim() || 'Sin descripción';

        // --- HTML TEMPLATE ---
        container.innerHTML = `
            <!-- HEADER -->
            <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 30px; border-bottom: 2px solid #2563eb; padding-bottom: 20px;">
                <div>
                    <h1 style="font-size: 28px; font-weight: bold; color: #1e3a8a; margin: 0;">${companyInfo?.name || 'TALLER MECÁNICO'}</h1>
                    <div style="font-size: 14px; color: #6b7280; margin-top: 5px;">
                        ${companyInfo?.address ? `<p style="margin: 2px 0;">${companyInfo.address}</p>` : ''}
                        ${companyInfo?.phone ? `<p style="margin: 2px 0;">Tel: ${companyInfo.phone}</p>` : ''}
                    </div>
                </div>
                <div style="text-align: right;">
                    <div style="font-size: 14px; font-weight: bold; color: #6b7280; text-transform: uppercase; letter-spacing: 1px;">Orden de Trabajo</div>
                    <div style="font-size: 32px; font-weight: bold; color: #2563eb;">#${order.id}</div>
                    <div style="font-size: 12px; color: #6b7280; margin-top: 5px;">${date(order.fecha_ingreso)}</div>
                </div>
            </div>

            <!-- INFO GRID -->
            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 30px; margin-bottom: 30px;">
                <!-- CLIENTE -->
                <div style="background-color: #f3f4f6; padding: 20px; border-radius: 12px;">
                    <h3 style="font-size: 14px; font-weight: bold; text-transform: uppercase; color: #4b5563; margin: 0 0 15px 0; border-bottom: 1px solid #d1d5db; padding-bottom: 8px;">Cliente</h3>
                    <div style="font-size: 15px;">
                        <div style="margin-bottom: 8px;"><strong>Nombre:</strong> ${order.cliente_nombre || (vehicle?.clientes?.nombre_completo) || 'No registrado'}</div>
                        <div style="margin-bottom: 8px;"><strong>Teléfono:</strong> ${order.cliente_telefono || (vehicle?.clientes?.telefono) || '-'}</div>
                        <div style="margin-bottom: 8px;"><strong>Email:</strong> ${order.cliente_email || (vehicle?.clientes?.email) || '-'}</div>
                    </div>
                </div>

                <!-- VEHÍCULO -->
                <div style="background-color: #f3f4f6; padding: 20px; border-radius: 12px;">
                    <h3 style="font-size: 14px; font-weight: bold; text-transform: uppercase; color: #4b5563; margin: 0 0 15px 0; border-bottom: 1px solid #d1d5db; padding-bottom: 8px;">Vehículo</h3>
                    <div style="font-size: 15px;">
                        <div style="margin-bottom: 8px; font-size: 18px; font-weight: bold;">${order.patente_vehiculo}</div>
                        <div style="margin-bottom: 8px;"><strong>Marca/Modelo:</strong> ${vehicle ? `${vehicle.marca} ${vehicle.modelo}` : 'No registrado'}</div>
                        <div style="display: grid; grid-template-columns: 1fr 1fr;">
                            <div><strong>Año:</strong> ${vehicle?.anio || '-'}</div>
                            <div><strong>Motor:</strong> ${vehicle?.motor || '-'}</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- DESCRIPCIÓN & TRABAJOS -->
            <div style="margin-bottom: 30px;">
                <h3 style="font-size: 16px; font-weight: bold; color: #1f2937; margin-bottom: 15px; background-color: #e5e7eb; padding: 10px; border-radius: 6px;">
                    DETALLES DEL SERVICIO
                </h3>
                <div style="padding: 0 10px;">
                    <div style="margin-bottom: 20px;">
                        <div style="font-size: 12px; font-weight: bold; color: #6b7280; text-transform: uppercase; margin-bottom: 5px;">Motivo de Ingreso</div>
                        <div style="font-size: 15px; line-height: 1.5;">${cleanDesc(order.descripcion_ingreso || '')}</div>
                    </div>
                    
                    ${order.detalle_trabajos ? `
                    <div style="margin-bottom: 20px;">
                        <div style="font-size: 12px; font-weight: bold; color: #6b7280; text-transform: uppercase; margin-bottom: 5px;">Detalle de Trabajos</div>
                        <div style="font-size: 15px; line-height: 1.5; white-space: pre-wrap;">${order.detalle_trabajos}</div>
                    </div>
                    `: ''}
                </div>
            </div>

            <!-- CHECKLIST SUMMARY (If exists) -->
            ${checklist ? `
            <div style="margin-bottom: 30px; page-break-inside: avoid;">
                <h3 style="font-size: 16px; font-weight: bold; color: #1f2937; margin-bottom: 15px; background-color: #e5e7eb; padding: 10px; border-radius: 6px;">
                    INSPECCIÓN DE INGRESO (CHECKLIST)
                </h3>
                
                <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 15px; font-size: 13px;">
                    <!-- Basic Items -->
                    <div style="border: 1px solid #e5e7eb; padding: 10px; border-radius: 8px;">
                        <strong>Básicos</strong>
                        <ul style="list-style: none; padding: 0; margin: 10px 0 0 0;">
                            <li style="margin-bottom: 5px;">${checklist.detalles?.gata ? '✅' : '❌'} Gata</li>
                            <li style="margin-bottom: 5px;">${checklist.detalles?.rueda_repuesto ? '✅' : '❌'} Rueda Repuesto</li>
                            <li style="margin-bottom: 5px;">${checklist.detalles?.radio ? '✅' : '❌'} Radio</li>
                            <li style="margin-bottom: 5px;">${checklist.detalles?.documentos ? '✅' : '❌'} Documentos</li>
                        </ul>
                    </div>

                    <!-- Luces -->
                    <div style="border: 1px solid #e5e7eb; padding: 10px; border-radius: 8px;">
                        <strong>Luces</strong>
                        <ul style="list-style: none; padding: 0; margin: 10px 0 0 0;">
                            <li style="margin-bottom: 5px;">${checklist.detalles?.luces_frontales ? '✅' : '❌'} Frontales</li>
                            <li style="margin-bottom: 5px;">${checklist.detalles?.luces_traseras ? '✅' : '❌'} Traseras</li>
                            <li style="margin-bottom: 5px;">${checklist.detalles?.luces_freno ? '✅' : '❌'} Freno</li>
                        </ul>
                    </div>

                    <!-- Estado -->
                    <div style="border: 1px solid #e5e7eb; padding: 10px; border-radius: 8px;">
                        <strong>Estado General</strong>
                        <div style="margin-top: 10px;">
                            <div style="margin-bottom: 5px;">Combustible: <strong>${checklist.detalles?.combustible || 0}%</strong></div>
                            ${checklist.detalles?.neumaticos ? `<div style="margin-bottom: 5px;">Neumáticos: <strong>${checklist.detalles.neumaticos}</strong></div>` : ''}
                        </div>
                    </div>
                </div>

                <!-- Comentarios Checklist -->
                ${checklist.detalles?.comentarios_generales ? `
                <div style="margin-top: 15px; background-color: #fffbeb; padding: 15px; border-radius: 8px; border: 1px solid #fcd34d;">
                    <div style="font-size: 12px; font-weight: bold; color: #b45309; text-transform: uppercase;">Observaciones del Checklist</div>
                    <div style="font-size: 14px; color: #78350f; margin-top: 5px;">${checklist.detalles.comentarios_generales}</div>
                </div>
                ` : ''}
            </div>
            ` : ''}

            <!-- IMÁGENES (Order + Checklist + Extras) -->
            <div style="page-break-inside: avoid;">
                 <h3 style="font-size: 16px; font-weight: bold; color: #1f2937; margin-bottom: 15px; background-color: #e5e7eb; padding: 10px; border-radius: 6px;">
                    REGISTRO FOTOGRÁFICO
                </h3>
                
                <div style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 15px;">
                    <!-- Fotos Orden -->
                    ${(order.fotos_urls || []).map((src, i) => `
                        <div style="border: 1px solid #e5e7eb; border-radius: 8px; overflow: hidden;">
                            <div style="height: 150px; overflow: hidden; background-color: #f3f4f6;">
                                <img src="${src}" style="width: 100%; height: 100%; object-fit: cover;" crossorigin="anonymous" />
                            </div>
                            <div style="padding: 8px; font-size: 11px; text-align: center; font-weight: bold; color: #6b7280; background-color: #f9fafb;">FOTO INGRESO ${i + 1}</div>
                        </div>
                    `).join('')}

                    <!-- Foto Kilometraje Checklist -->
                    ${checklist?.fotos?.kilometraje_url ? `
                        <div style="border: 1px solid #e5e7eb; border-radius: 8px; overflow: hidden;">
                            <div style="height: 150px; overflow: hidden; background-color: #f3f4f6;">
                                <img src="${checklist.fotos.kilometraje_url}" style="width: 100%; height: 100%; object-fit: cover;" crossorigin="anonymous" />
                            </div>
                            <div style="padding: 8px; font-size: 11px; text-align: center; font-weight: bold; color: #6b7280; background-color: #f9fafb;">KILOMETRAJE</div>
                        </div>
                    ` : ''}

                    <!-- Fotos Extras Checklist -->
                    ${(checklist?.detalles?.fotos_extra || []).map((src: string, i: number) => `
                        <div style="border: 1px solid #e5e7eb; border-radius: 8px; overflow: hidden;">
                            <div style="height: 150px; overflow: hidden; background-color: #f3f4f6;">
                                <img src="${src}" style="width: 100%; height: 100%; object-fit: cover;" crossorigin="anonymous" />
                            </div>
                            <div style="padding: 8px; font-size: 11px; text-align: center; font-weight: bold; color: #6b7280; background-color: #f9fafb;">DETALLE ADICIONAL ${i + 1}</div>
                        </div>
                    `).join('')}
                </div>
            </div>

            <!-- FOOTER TOTALS -->
            <div style="margin-top: 50px; border-top: 2px solid #2563eb; padding-top: 20px; page-break-inside: avoid;">
                <div style="text-align: right; margin-bottom: 50px;">
                    <span style="font-size: 18px; color: #6b7280; margin-right: 20px;">TOTAL A PAGAR:</span>
                    <span style="font-size: 32px; font-weight: bold; color: #1e3a8a;">${money(order.precio_total || 0)}</span>
                </div>

                <div style="display: flex; justify-content: space-between; margin-top: 80px;">
                    <div style="text-align: center; width: 40%;">
                        <div style="border-bottom: 1px solid #000; margin-bottom: 10px;"></div>
                        <div style="font-size: 14px; font-weight: bold;">FIRMA TALLER</div>
                    </div>
                    <div style="text-align: center; width: 40%;">
                        <div style="border-bottom: 1px solid #000; margin-bottom: 10px;"></div>
                        <div style="font-size: 14px; font-weight: bold;">FIRMA CLIENTE</div>
                    </div>
                </div>
            </div>
        `;

        document.body.appendChild(container);

        // Generate PDF
        const canvas = await html2canvas(container, {
            scale: 2,
            useCORS: true,
            allowTaint: true,
            backgroundColor: '#ffffff'
        });

        document.body.removeChild(container);

        const imgData = canvas.toDataURL('image/png');
        const pdf = new jsPDF('p', 'mm', 'a4');
        const pdfWidth = pdf.internal.pageSize.getWidth();
        const pdfHeight = pdf.internal.pageSize.getHeight();
        const imgWidth = pdfWidth;
        const imgHeight = (canvas.height * pdfWidth) / canvas.width;

        let heightLeft = imgHeight;
        let position = 0;

        pdf.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
        heightLeft -= pdfHeight;

        while (heightLeft > 0) {
            position = heightLeft - imgHeight;
            pdf.addPage();
            pdf.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
            heightLeft -= pdfHeight;
        }

        pdf.save(`Orden_${order.id}_${order.patente_vehiculo}.pdf`);
        return true;

    } catch (error) {
        console.error('Error in PDF generation:', error);
        throw error;
    }
};
