set (LOCAL_NAME superMC)

add_subdirectory (src)

# install dependencies
install (FILES parameters.dat DESTINATION ${LOCAL_NAME})
install (DIRECTORY data s95p-PCE DESTINATION ${LOCAL_NAME})
