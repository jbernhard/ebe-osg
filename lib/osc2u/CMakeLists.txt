cmake_minimum_required (VERSION 2.6)
project (osc2u)

add_executable(osc2u
  osc2u.f
  pdg2ityp.f
  vni_procev.f
  blockres.f
  dectim.f
  gnuranf.f
  )
