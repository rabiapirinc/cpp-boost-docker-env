# C++ & Boost: Dockerized Development Environment

Bu proje, C++ ve Boost kütüphanesi kullanan projelerde karşılaşılan "bağımlılık karmaşasını" çözmek için 
geliştirilmiş bir **izole geliştirme ortamı** çalışmasıdır.

## Projenin Amacı
C++ projelerinde Boost gibi ağır kütüphanelerin yerel sisteme kurulması zahmetli ve kirletici olabilir. Bu projede:
- Tüm derleme ortamı **Docker** içine taşınmıştır.
- Yerel makinede hiçbir kütüphane kurulumu gerektirmez.
- Farklı işletim sistemlerinde aynı derleme sonucunu (binary) garanti eder.

## Teknik Altyapı
- **Dil:** C++
- **Kütüphane:** Boost (System, Filesystem, Regex vb.)
- **Konteyner:** Docker (Multi-stage build mimarisi)

## Algoritmik Yaklaşım: Boost Lambda
Uygulama katmanında C++'ın en güçlü kütüphanelerinden biri olan **Boost** kullanılmıştır.
- **Fonksiyon:** Kod, bir sayı dizisi (vector) içindeki elemanları tek tek gezerek her birini 3 ile çarpar.
- **Teknik Derinlik:** Klasik `for` döngüleri yerine `boost::lambda` kullanılarak "fonksiyonel programlama" yapılmıştır.
Bu, kodun hem daha okunabilir hem de daha performanslı olmasını sağlar.

## Konfigürasyon Dosyaları ve Görevleri

**A. Derleme Reçetesi (CMakeLists.txt):**
C++ kodunun hangi kütüphanelere ihtiyaç duyduğunu ve nasıl bir "çalıştırılabilir dosya" (executable) haline geleceğini belirleyen projenin yol haritasıdır.
- `find_package(Boost REQUIRED)` komutuyla sistemdeki Boost kütüphanesi dinamik olarak tespit edilir.
- `target_link_libraries` ile kod ve kütüphane birbirine mühürlenir.

**B. Konteyner Otomasyonu (Dockerfile):**
```dockerfile
# 1. Aşama: En güncel GCC derleyicisi içeren temel imaj seçildi.
FROM gcc:latest

# 2. Aşama: İşletim sistemi güncellendi ve Boost kütüphanesi kuruldu.
RUN apt-get update && apt-get install -y cmake libboost-all-dev

# 3. Aşama: Kaynak kodlar konteyner içine kopyalandı ve CMake ile derlendi.
WORKDIR /usr/src/app
COPY . .
RUN cmake . && make

# 4. Aşama: Derlenen programın çıktı vermesi sağlandı.
CMD ["./benim_programim"]
```

## Çalıştırma Talimatları

Projenin yerelinizde derlenmesi ve çalıştırılması için sadece Docker yüklü olması yeterlidir:

```bash
# Docker imajını oluşturun
docker build -t cpp-boost-app .

# Konteyneri çalıştırın
docker run --rm cpp-boost-app
```
