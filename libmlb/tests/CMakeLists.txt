
find_package(Qt5Core REQUIRED)
find_package(Qt5Network REQUIRED)
find_package(Qt5Test REQUIRED)

include_directories(${CMAKE_SOURCE_DIR}/libmlb/src)

function(do_test arg1)
    add_executable(${arg1} ${arg1}.h)
    target_link_libraries(${arg1} mlbcore)
    qt5_use_modules(${arg1} Network Core Test)
    add_test(NAME tst_${arg1} COMMAND ${arg1})
endfunction()

do_test(downloadertest)
do_test(enginetest)
