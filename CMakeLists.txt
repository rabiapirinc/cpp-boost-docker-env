cmake_minimum_required(VERSION 3.10)
project(BoostDeneme)

# Boost paketini bulmasını istiyoruz
find_package(Boost REQUIRED)

add_executable(benim_programim main.cpp)

# Programimizi Boost kütüphanesine bagliyoruz
target_link_libraries(benim_programim Boost::boost)