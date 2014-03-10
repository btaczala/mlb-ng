
find_package(Qt5Core REQUIRED)
find_package(Qt5Network REQUIRED)
set(CMAKE_AUTOMOC ON)

set(srcs
    src/engine.cpp
    src/downloader.cpp
    src/article.cpp
    src/links.cpp
    src/parser.cpp
)

set(hdrs
    src/engine.h
    src/engine_p.h
    src/downloader.h
    src/downloader_p.h
    src/article.h
)

qt5_add_resources(mlbrsc rsc/mlb.qrc)

add_library(mlbcore ${srcs} ${hdrs} ${mlbrsc})
qt5_use_modules(mlbcore Network Core)
target_link_libraries(mlbcore -lhtmlcxx)

add_subdirectory(tests)
