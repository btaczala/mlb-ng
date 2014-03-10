project(mlb-ng)
cmake_minimum_required(VERSION 2.8)

enable_testing()

add_definitions(-std=c++11)
add_subdirectory(libmlb)
add_subdirectory(app)
