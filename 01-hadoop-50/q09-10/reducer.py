import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#

import csv
import re
from  operator import itemgetter,attrgetter
if __name__ == "__main__":
    file = sys.stdin.readlines()
    #file = sorted(file,key= itemgetter(2))
    patron = re.compile('\s+')
    datasub = [re.sub(patron,'~',x) for x in file]
    datasplit = [re.split('~',x) for x in datasub]
    
    for x in datasplit:
        x[2] =int(x[2])

    datasplit = sorted(datasplit,key= itemgetter(2))
    datasplit = datasplit[0:6]
    for x in datasplit:
        sys.stdout.write("{}\t{}\t{}\n".format(x[0],x[1],x[2]))