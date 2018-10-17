#!/bin/bash

# Ver artículo 33.

if [ -d "data-shell" ]; then
    echo "Carpeta detectada: descarga omitida."
elif [ -f "data-shell.zip" ]; then
    echo "Fichero detectado: descarga omitida. Iniciando descompresión."
    unzip -qq data-shell.zip
else
    echo "Descargando y descomprimiendo archivo."
    wget http://swcarpentry.github.io/shell-novice/data/data-shell.zip -q
    unzip -qq data-shell.zip
    rm data-shell.zip
fi



if [ ! -d "elements_by_atomic_number" ]; then
    echo "Creando directorio"
    mkdir ./elements_by_atomic_number
fi

files2copy=$(find data-shell/data/elements -type f -name "*.xml")
echo "Seleccionando elements"

cp $files2copy ./elements_by_atomic_number
echo "Copiando archivos a nuevo directorio"

rm -rd ./data-shell
echo "Borrando el directorio data-shell"

# Aquí me falta, tomar los archivos de la carpeta elements_by_atomic_number y renombrarlos.

echo "Comprimiendo los archivos con el nuevo nombre"
tar -cf elements_by_atomic_number.tar ./elements_by_atomic_number

rm -rd ./elements_by_atomic_number
echo "Borrando la carpeta elements"