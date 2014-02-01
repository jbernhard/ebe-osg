cmake_minimum_required (VERSION 2.6)
project (iSS CXX)

add_subdirectory (src)

# install dependencies
install (FILES parameters.dat OSCAR_header.txt DESTINATION ${PROJECT_NAME})
install (DIRECTORY EOS tables DESTINATION ${PROJECT_NAME} FILES_MATCHING PATTERN "*.dat")
install (DIRECTORY DESTINATION ${PROJECT_NAME}/results)
