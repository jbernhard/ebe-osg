#!/usr/bin/env python3

import numpy as np

params = (
    "superMC.finalFactor",
    "superMC.lambda",
    "VISHNew.T0",
    "VISHNew.ViscousC",
    "VISHNew.VisBeta"
)

def rescale(X,oldmin,oldmax,newmin,newmax):
    return (X-oldmin)/(oldmax-oldmin)*(newmax-newmin) + newmin

def main():
    fname = 'lhs-design-glb-256.dat'
    design = np.loadtxt(fname,skiprows=1,unpack=True)

    design[0] = rescale(design[0],20,60,5,15)
    design[1] = rescale(design[1],.05,.3,.1,.3)

    np.savetxt(fname.replace('glb','kln'), design.T,
            fmt='%.15f', comments='',
            header=' '.join('"{}"'.format(p) for p in params))


if __name__ == "__main__":
    main()
