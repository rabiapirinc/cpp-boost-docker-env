# 1. Aşama: Derleme ortamı (Build Stage)
FROM gcc:latest AS build

# Gerekli sistem paketlerini ve Boost kütüphanesini kur
RUN apt-get update && apt-get install -y \
    libboost-all-dev \
    cmake \
    && rm -rf /var/lib/apt/lists/*

# Çalışma dizini oluştur
WORKDIR /app

# Kodları konteynere kopyala
COPY . .

# C++ kodunu derle (Boost kütüphanelerini bağlayarak)
RUN g++ -o my_boost_app main.cpp -lboost_system -lboost_filesystem

# 2. Aşama: Çalıştırma ortamı (Run Stage - İmajı hafifletmek için)
FROM debian:bookworm-slim

# Sadece gerekli çalışma zamanı kütüphanelerini kur
RUN apt-get update && apt-get install -y \
    libboost-system1.74.0 \
    libboost-filesystem1.74.0 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root/
COPY --from=build /app/my_boost_app .

# Uygulamayı çalıştır
CMD ["./my_boost_app"]