#!/bin/bash

# Leer los valores del archivo de configuración y asignarlos a variables
cn=$(grep '^cn=' config.txt | cut -d '=' -f 2-)
dc1=$(grep '^dc1=' config.txt | cut -d '=' -f 2-)
dc2=$(grep '^dc2=' config.txt | cut -d '=' -f 2-)

# Mostrar los valores almacenados en las variables
echo "cn: $cn"
echo "dc1: $dc1"
echo "dc2: $dc2"

# Resto del script...
