# Menggunakan image Node.js versi 14 berbasis Alpine untuk ukuran yang lebih ringan
FROM node:14-alpine

# Menetapkan direktori kerja aplikasi di dalam container
WORKDIR /app

# Menyalin seluruh file dari proyek lokal ke dalam direktori kerja container
COPY . .

# Menentukan bahwa aplikasi berjalan dalam mode production
# dan mendefinisikan item-db sebagai database host
ENV NODE_ENV=production \
    DB_HOST=item-db

# Menginstal dependensi yang diperlukan untuk production dan membangun aplikasi
RUN npm install --only=production --unsafe-perm && npm run build

# Mengekspos port 8080 untuk digunakan oleh container
EXPOSE 8080

# Menjalankan aplikasi ketika container mulai
CMD ["npm", "start"]
