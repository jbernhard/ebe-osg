set (LOCAL_NAME VISHNew)

add_subdirectory (src)

# install dependencies
install (FILES Vishydro.inp extraParas.inp DESTINATION ${LOCAL_NAME})
install (DIRECTORY EOS Initial results DESTINATION ${LOCAL_NAME})
