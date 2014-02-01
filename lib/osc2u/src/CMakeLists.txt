add_executable(${PROJECT_NAME}
  osc2u.f
  pdg2ityp.f
  vni_procev.f
  blockres.f
  dectim.f
  gnuranf.f
  )

# install compiled binary
install (TARGETS ${PROJECT_NAME} DESTINATION ${PROJECT_NAME})
