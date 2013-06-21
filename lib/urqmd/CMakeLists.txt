set (LOCAL_NAME urqmd)

add_subdirectory (src)

# install dependency
install (FILES uqmd.burner DESTINATION ${LOCAL_NAME})
