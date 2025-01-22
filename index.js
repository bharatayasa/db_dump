const { exec } = require('child_process');
const fs = require('fs');
const path = require('path');

// Konfigurasi URL database dan output
const config = {
    // databaseUrl: "postgresql://postgres:root@localhost:5432/local_regenesis_admin_dev",
    databaseUrl: "postgresql://recharge:gianyar2025@194.233.88.134:5432/regenesis_adm",
    // databaseUrl: "postgresql://postgres:postgres@192.168.199.8:5432/regenesis_admin_dev_be",
    outputDir: './dumps',
    outputFile: 'regenesis_adm_before_sound',
};

if (!fs.existsSync(config.outputDir)) {
    fs.mkdirSync(config.outputDir, { recursive: true });
}

const outputPath = path.resolve(config.outputDir, config.outputFile);

const command = `pg_dump -Fp --inserts "${config.databaseUrl}" -f "${outputPath}"`;

console.log(`Menjalankan perintah: ${command}`);

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
