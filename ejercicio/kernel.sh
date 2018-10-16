#!/bin/bash

if [ -d "linux-4.19-rc6" ]; then
	echo "Carpeta detectada."
elif [ -f "linux-4.19-rc6.tar.gz" ]; then
	echo "Fichero detectado."
else
	echo "Descargando y descomprimiendo archivo."
	wget https://git.kernel.org/torvalds/t/linux-4.19-rc6.tar.gz
	tar -xz --file=linux-4.19-rc6.tar.gz
fi

# find . -name '*.py'
