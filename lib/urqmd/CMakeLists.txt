set (LOCAL_NAME urqmd)

add_subdirectory (src)

# install dependency
install (FILES afterburner DESTINATION ${LOCAL_NAME})
