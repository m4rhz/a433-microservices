# Menggunakan image resmi Node.js versi 14.21 berbasis Alpine Linux (ringan) sebagai base image
FROM node:14.21-alpine AS builder

# Menetapkan direktori kerja di dalam container ke /app
WORKDIR /app

# Menyalin file package.json dan package-lock.json (jika ada) ke dalam container
COPY package*.json ./

# Menjalankan perintah npm install untuk menginstall semua dependensi proyek
RUN npm install

# Menyalin semua file dari direktori kerja lokal ke direktori kerja container (/app)
COPY . .

# Memberitahu Docker bahwa container akan menggunakan port 3000 (port tempat aplikasi berjalan)
EXPOSE 3000

# Menentukan perintah yang dijalankan saat container mulai: menjalankan aplikasi menggunakan npm start
CMD [ "npm", "start" ]

