#!/bin/bash

source ../set-cpp

$CC main.cpp arsenal.cpp ParameterReader.cpp RandomVariable1DArray.cpp RandomVariable2DArray.cpp RandomVariable.cpp NBD.cpp TableFunction.cpp emissionfunction.cpp Table.cpp readindata.cpp -o iSS $CFLAGS
