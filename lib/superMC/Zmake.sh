#!/bin/bash

source ../set-cpp

$CC main.cpp Bases.cpp MCnucl.cpp GlueDensity.cpp MakeDensity.cpp KLNModel.cpp OverLap.cpp Largex.cpp Regge96.cpp rcBKfunc.cpp MathBasics.cpp ParameterReader.cpp arsenal.cpp EOS.cpp GaussianNucleonsCal.cpp NBD.cpp RandomVariable.cpp TableFunction.cpp Table.cpp -o superMC $CFLAGS
