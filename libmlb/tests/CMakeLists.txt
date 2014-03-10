
find_package(Qt5Core REQUIRED)
find_package(Qt5Network REQUIRED)
add_executable(downloader_test downloader_test.cpp)
target_link_libraries(downloader_test mlbcore)
qt5_use_modules(downloader_test Network Core)
