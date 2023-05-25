#!/bin/bash

# Actualizar la lista de paquetes disponibles
sudo apt-get update

# Actualizar los paquetes instalados
sudo apt-get -y upgrade

# Imprimir el código de salida
echo $?
