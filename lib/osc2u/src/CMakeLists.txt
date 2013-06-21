add_executable(${LOCAL_NAME}
  osc2u.f
  pdg2ityp.f
  vni_procev.f
  blockres.f
  dectim.f
  gnuranf.f
  )

# install compiled binary
install (TARGETS ${LOCAL_NAME} DESTINATION ${LOCAL_NAME})
