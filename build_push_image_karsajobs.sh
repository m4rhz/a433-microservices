#!/bin/sh

# Mendefinisikan variabel untuk nama image, versinya, dan akun registry
IMAGE_NAME="karsajobs"
IMAGE_VERSION="latest"
GITHUB_USER="m4rhz"

# Membuat Docker image dengan nama dan versi yang telah ditentukan
printf "\n🚀 Memulai proses build Docker image...\n"
docker build . -t $IMAGE_NAME:$IMAGE_VERSION

# Menampilkan daftar image yang ada di lokal sebagai verifikasi
printf "\n📜 Daftar image yang tersedia di sistem:\n"
docker images

# Memberikan tag baru sesuai format GitHub Container Registry (GHCR)
printf "\n🔖 Menandai ulang image agar sesuai dengan format GHCR...\n"
docker tag $IMAGE_NAME:$IMAGE_VERSION ghcr.io/$GITHUB_USER/$IMAGE_NAME:$IMAGE_VERSION

docker images

# Login ke GitHub Container Registry
printf "\n🔑 Login ke GHCR...\n"
docker login ghcr.io -u $GITHUB_USER

# Push image ke GHCR
printf "\n📤 Mengunggah image ke GHCR...\n"
docker push ghcr.io/$GITHUB_USER/$IMAGE_NAME:$IMAGE_VERSION

printf "\n✅ Proses selesai! Image telah berhasil dipublikasikan.\n"

