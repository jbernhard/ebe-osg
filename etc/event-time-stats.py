#!/usr/bin/env python3

root = '/var/phy/project/nukeserv/jeb65/ebe-events'

dirs = [
    '2013-03-28_092737_100jobs_glb_cent_00-05',
    '2013-03-28_113101_100jobs_glb_cent_05-10',
    '2013-03-28_143401_100jobs_glb_cent_10-15',
    '2013-03-28_165419_100jobs_glb_cent_15-20',
    '2013-03-28_171801_100jobs_glb_cent_20-25',
    '2013-03-28_224103_100jobs_glb_cent_25-30',
    '2013-03-29_105900_100jobs_glb_cent_30-35',
    '2013-03-29_110555_100jobs_glb_cent_35-40',
    '2013-03-29_111249_100jobs_glb_cent_40-45'
]

globpattern = 'outputs/*.app.stdouterr'



import re, os.path, glob, numpy as np, matplotlib.pyplot as plt, csv

timepattern = re.compile(r'real\s+([0-9]+)m([0-9\.]+)s')


def gettime(filename):
    time = 0

    with open(filename) as f:
        for l in f:
            t = timepattern.search(l)
            if t:
                time += 60 * int(t.group(1)) + float(t.group(2))

    return time



def getalltimes(dirname):
    alltimes = np.array([])

    for i in glob.glob(os.path.join(root, dirname, globpattern)):
        alltimes = np.append(alltimes, gettime(i))

    return alltimes



def main():
    makeplot = False
    perc = 90
    day = 24*3600

    stats = np.array(['cent', '90% time', 'ev / 24h', 'nice ev', 'jobs / 1000ev'])

    if makeplot:
        k = 1
        plt.figure()

    for d in dirs:

        t = getalltimes(d)

        cent = d[-5:] + '%'

        p = np.percentile(t, perc)

        nev = day/p
        nnev = int(nev)
        while 1000 % nnev != 0:
            nnev -= 1

        stats = np.vstack([stats, [cent, p, nev, nnev, int(1000/nnev)]])

        if makeplot:
            plt.subplot(len(dirs)/2+1,2,k)
            plt.hist(t,bins=40,range=(0,8000))
            plt.title(cent)
            k += 1


    if makeplot: 
        plt.show()

    with open('event-time-stats.dat','w') as f:
        writer = csv.writer(f, delimiter='\t')
        writer.writerows(stats)


if __name__ == "__main__":
    main()
