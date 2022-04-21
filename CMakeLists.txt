cmake_minimum_required(VERSION 3.13)

project(ipk-sniffer)

#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -pedantic -Wextra")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -L ./")

include_directories(libs)

link_directories(libs)

add_subdirectory(libs)

add_executable(${PROJECT_NAME} ipk-sniffer.cpp)

target_link_libraries(${PROJECT_NAME} -lstdc++ -lpcap cmd_params utils_fce)

target_include_directories(${PROJECT_NAME} PUBLIC "${PROJECT_BINARY_DIR}" "${PROJECT_SOURCE_DIR}/libs" )

