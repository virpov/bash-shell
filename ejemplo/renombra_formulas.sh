#! /bin/bash

fichero="cholesterol.pdb"
for fichero in pdb/*.pdb
do
formula=$(
awk '/ATOM/ {print $3}' ${fichero} \
| sort | uniq -c | awk '{print $2,$1}' \
| tr -d ' \n'
)
echo "$fichero $formula"
done