#!/usr/bin/env python3

from sys import argv
import csv
import configparser


def main():

    if 'glb' in argv[1]:
        glb = True
    elif 'kln' in argv[1]:
        glb = False
    else:
        print("could not determine IC model [looking for 'glb' or 'kln' in design filename]")
        exit(1)

    prefix = argv[2]


    with open(argv[1]) as f:

        # read design file as a dictionary
        design = csv.DictReader(f, delimiter=' ')


        #
        # create ini object
        #

        ini = configparser.ConfigParser()

        # makes keys case-sensitive
        ini.optionxform = str

        # specify the IC model
        if glb:
            # glb
            ini['superMC'] = { 'which_mc_model' : 5, 'sub_model' : 1 }
        else:
            # kln
            ini['superMC'] = { 'which_mc_model' : 1, 'sub_model' : 7 }


        # initialize ini sections and values
        # use header of design file
        for a in design.fieldnames:
            s, k = a.split('.')

            if not ini.has_section(s):
                ini.add_section(s)

            ini[s][k] = str()


        #
        # write a file for each line of the design
        #

        for i in design:

            for x,y in i.items():
                s, k = x.split('.')

                ini[s][k] = y

            with open(prefix + str(design.line_num - 2), 'w') as out:
                ini.write(out)




if __name__ == "__main__":
    if len(argv) != 3:
        print('usage: ' + argv[0] + ' design_file output_file_prefix')
        exit(1)

    main()
