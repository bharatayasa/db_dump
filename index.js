const { exec } = require('child_process');
const fs = require('fs');
const path = require('path');

// Konfigurasi URL database dan output
const config = {
    databaseUrl: "postgresql://postgres:postgres@192.168.199.8:5432/rabbitmq_pod",
    outputDir: './dumps',
    outputFile: 'dump.sql',
};

// Buat direktori output jika belum ada
if (!fs.existsSync(config.outputDir)) {
    fs.mkdirSync(config.outputDir, { recursive: true });
}

// Lokasi output file
const outputPath = path.resolve(config.outputDir, config.outputFile);

// Perintah pg_dump menggunakan DATABASE_URL dengan format plain text dan opsi --inserts
const command = `pg_dump -Fp --inserts "${config.databaseUrl}" -f "${outputPath}"`;

console.log(`Menjalankan perintah: ${command}`);

// Jalankan perintah
exec(command, (error, stdout, stderr) => {
    if (error) {
        console.error(`Error saat dump database: ${error.message}`);
        return;
    }

    if (stderr) {
        console.error(`Stderr: ${stderr}`);
        return;
    }

    console.log(`Dump database berhasil disimpan di: ${outputPath}`);
});
