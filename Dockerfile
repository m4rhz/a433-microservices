# Menggunakan image Node.js versi 14.21 berbasis Alpine Linux sebagai base image dan menamainya "builder"
FROM node:14.21-alpine AS builder

# Menentukan direktori kerja di dalam container sebagai /app
WORKDIR /app

# Menyalin file package.json dan package-lock.json (jika ada) ke direktori kerja container
COPY package*.json ./

# Menjalankan npm install untuk menginstal semua dependensi yang didefinisikan di package.json
RUN npm install

# Menyalin semua file dari direktori proyek lokal ke dalam direktori kerja container
COPY . .

# Membuka port 3001 pada container agar bisa diakses dari luar (misalnya oleh Kubernetes atau Docker)
EXPOSE 3001

# Menetapkan perintah default yang dijalankan saat container start: menjalankan aplikasi dengan "npm start"
CMD [ "npm", "start" ]

