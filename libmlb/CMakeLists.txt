

find_package(Qt5Core REQUIRED)
find_package(Qt5Network REQUIRED)
set(CMAKE_AUTOMOC ON)

set(srcs
    src/engine.cpp
    src/downloader.cpp
)

set(hdrs
    src/engine.h
    src/engine_p.h
    src/downloader.h
    src/downloader_p.h
)

add_library(mlbcore ${srcs} ${hdrs})
qt5_use_modules(mlbcore Network Core)

add_subdirectory(tests)
