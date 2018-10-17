#! /bin/bash

destdir="nuevos_ficheros"
mkdir ${destdir}
for fichero in pdb/*.pdb
do
formula=$(
awk '/ATOM/ {print $3}' ${fichero} \
| sort | uniq -c | awk '{print $2,$1}' \
| tr -d ' \n'
)
cp ${fichero} "${destdir}/$(basename ${fichero} .pdb)_${formula}.pdb"
done