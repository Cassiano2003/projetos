cmake_minimum_required(VERSION 3.5.0)
project(teste VERSION 1.0.0)

find_package(OpenGL REQUIRED)

add_executable(teste src/config.h src/main.cpp src/glad.c)

target_include_directories(teste PRIVATE dependencias)

target_link_libraries(teste glfw OpenGL::GL)