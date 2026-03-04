const sharp = require('sharp');
const path = require('path');
const fs = require('fs');

async function generateIcons() {
    const inputPath = path.join(__dirname, 'imagenes', 'logo celular.png');
    const outDir = path.join(__dirname, 'public');

    // Ensure public folder exists
    if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });

    // PWA Sizes
    const sizes = [192, 512];

    for (const size of sizes) {
        await sharp(inputPath)
            .resize(size, size, {
                fit: 'contain',
                background: { r: 0, g: 0, b: 0, alpha: 0 } // Transparent background mask
            })
            .toFile(path.join(outDir, `logo-celular-${size}x${size}.png`));
        console.log(`✅ Generated logo-celular-${size}x${size}.png`);
    }

    // App favicon
    await sharp(inputPath)
        .resize(32, 32, { fit: 'contain', background: { r: 0, g: 0, b: 0, alpha: 0 } })
        .toFile(path.join(outDir, 'favicon.png'));
    console.log(`✅ Generated favicon.png`);

    // Open Graph standard share image (1200x630) - centered
    await sharp(inputPath)
        .resize(1200, 630, {
            fit: 'contain',
            background: { r: 255, g: 255, b: 255, alpha: 1 } // White bg for OG image
        })
        .toFile(path.join(outDir, 'og-image.png'));
    console.log(`✅ Generated og-image.png`);

    // Apple touch icon
    await sharp(inputPath)
        .resize(180, 180, { fit: 'contain', background: { r: 255, g: 255, b: 255, alpha: 1 } })
        .toFile(path.join(outDir, 'apple-touch-icon.png'));
    console.log(`✅ Generated apple-touch-icon.png`);
}

generateIcons().catch(console.error);
