set (LOCAL_NAME iSS)

add_subdirectory (src)

# install dependencies
install (FILES parameters.dat OSCAR_header.txt DESTINATION ${LOCAL_NAME})
install (DIRECTORY EOS results tables DESTINATION ${LOCAL_NAME})
