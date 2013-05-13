#!/bin/bash

source ../set-cpp

$CC main.cxx Bases.cxx MCnucl.cxx GlueDensity.cxx MakeDensity.cxx KLNModel.cxx OverLap.cxx Largex.cxx Regge96.cxx rcBKfunc.cxx MathBasics.cpp ParameterReader.cpp arsenal.cpp EOS.cpp GaussianNucleonsCal.cpp NBD.cpp RandomVariable.cpp TableFunction.cpp Table.cpp -o superMC $CFLAGS
