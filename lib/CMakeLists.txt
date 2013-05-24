cmake_minimum_required (VERSION 2.6)
project (ebe-osg)

# add custom dir to cmake module path -- the FindGSL script is located here
# then load GSL
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/CMake")
find_package(GSL REQUIRED)

# add subprojects
add_subdirectory (superMC)
add_subdirectory (iSS)
